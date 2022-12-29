/*
   Copyright 2022 - 2022 Silvio Wangler

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
package ch.silviowangler.oms;

import jakarta.inject.Singleton;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;
import lombok.extern.slf4j.Slf4j;

@Singleton
@Slf4j
public class DefaultLibreOfficePdfProducer implements PdfProducer {

  private static final String OS_MSG = "PDF builder currently supports only macOS, Linux and Unix";
  private static final String LIBRE_OFFICE_EXEC_FOR_LINUX_UNIX_PLATFORM = "libreoffice";
  private static final String LIBRE_OFFICE_EXEC_FOR_MACOS_PLATFORM =
      "/Applications/LibreOffice.app/Contents/MacOS/soffice";

  private static final String OS_NAME_MACOS = "mac os";
  private static final String OS_NAME_LINUX = "linux";

  @Override
  public ByteArrayOutputStream producePdf(byte[] content) {
    try {
      return buildPdfFile(content, File.createTempFile("oms", ".fodt"));
    } catch (IOException | InterruptedException e) {
      log.error("Cannot produce PDF", e);
      throw new RuntimeException(e);
    }
  }

  private ByteArrayOutputStream buildPdfFile(byte[] content, File fileIn)
      throws IOException, InterruptedException {
    File fileOut =
        new File(
            fileIn.getParentFile(),
            String.format("%s.pdf", fileIn.getName().replaceAll("\\.fodt", "")));

    Files.write(fileIn.toPath(), content);

    log.info(
        "Converting '{}' to '{}' (directory: '{}')",
        fileIn.getName(),
        fileOut.getName(),
        fileOut.getParentFile().getAbsolutePath());

    final String operatingSystem = System.getProperty("os.name", OS_NAME_LINUX).toLowerCase();
    final String exec = getPlatformSpecificExecutable(operatingSystem);
    log.trace("Libre Office executable program '{}' is used", exec);

    File libreOfficeInstallationDirectory = createUniqueLibreOfficeInstallationDirectory();
    log.trace(
        "Created Libre Office installation directory {}",
        libreOfficeInstallationDirectory.getAbsolutePath());

    final String[] args =
        getPlatformSpecificProcessStartArguments(
            operatingSystem, exec, libreOfficeInstallationDirectory, fileIn, fileOut);
    log.trace("About to use Libre Office args {}", List.of(args));

    ProcessBuilder processBuilder = new ProcessBuilder(args);
    Process p = processBuilder.start();
    int exitCode = p.waitFor();
    log.info("Process exited with code {}", exitCode);

    try (Stream<Path> walk = Files.walk(libreOfficeInstallationDirectory.toPath())) {
      walk.sorted(Comparator.reverseOrder()).map(Path::toFile).forEach(File::delete);
    }

    if (libreOfficeInstallationDirectory.exists()) {
      log.warn(
          "Unable to delete Libre Office installation directory {}",
          libreOfficeInstallationDirectory.getAbsolutePath());
    }

    log.debug("Deleting files: '{}' and '{}'", fileIn.getPath(), fileOut.getPath());

    byte[] buffer = new byte[4096];
    BufferedInputStream bis = new BufferedInputStream(new FileInputStream(fileOut));
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    int bytes = 0;
    while ((bytes = bis.read(buffer, 0, buffer.length)) > 0) {
      baos.write(buffer, 0, bytes);
    }
    baos.close();
    bis.close();

    Files.deleteIfExists(fileIn.toPath());
    Files.deleteIfExists(fileOut.toPath());

    return baos;
  }

  /**
   * Creates a command link according to a post at Stack Overflow.
   *
   * @see <a href="https://stackoverflow.com/a/67870597/960875">Post</a>
   */
  private String[] getPlatformSpecificProcessStartArguments(
      final String operatingSystem,
      final String exec,
      final File libreOfficeInstallationPath,
      final File fileIn,
      final File fileOut) {
    if (operatingSystem.contains(OS_NAME_MACOS) || operatingSystem.contains(OS_NAME_LINUX)) {
      return new String[] {
        exec,
        "-env:UserInstallation=file://" + libreOfficeInstallationPath.getAbsolutePath(),
        "--headless",
        "--convert-to",
        "pdf:writer_pdf_Export:SelectPdfVersion=1",
        "--outdir",
        fileOut.getParentFile().getAbsolutePath(),
        fileIn.getAbsolutePath()
      };
    }
    throw new IllegalArgumentException(OS_MSG);
  }

  private String getPlatformSpecificExecutable(final String operatingSystem) {
    if (operatingSystem.contains(OS_NAME_LINUX)) {
      return LIBRE_OFFICE_EXEC_FOR_LINUX_UNIX_PLATFORM;
    } else if (operatingSystem.contains(OS_NAME_MACOS)) {
      return LIBRE_OFFICE_EXEC_FOR_MACOS_PLATFORM;
    }
    throw new IllegalArgumentException(OS_MSG);
  }

  private File createUniqueLibreOfficeInstallationDirectory() throws IOException {
    File libreOfficeInstallation =
        new File(System.getProperty("java.io.tmpdir"), UUID.randomUUID().toString());

    Files.createDirectory(libreOfficeInstallation.toPath());
    return libreOfficeInstallation;
  }
}
