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

import io.micronaut.http.MediaType;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Version;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Data
@Entity
public class Template {

  /** Unique identifier */
  @Id
  @GeneratedValue(generator = "system-uuid")
  @GenericGenerator(name = "system-uuid", strategy = "uuid2")
  @Column(updatable = false, nullable = false, length = 36)
  @Type(type = "ch.silviowangler.oms.hibernate.UuidUserType")
  private UUID id;

  @Version
  @Column(nullable = false)
  private Integer version;

  @Column(nullable = false, length = 80)
  private String name;

  @Column(nullable = false, length = 40)
  @Type(type = "ch.silviowangler.oms.hibernate.MediaTypeUserType")
  private MediaType mediaType;

  @Lob
  @Column(nullable = false)
  private String content;
}
