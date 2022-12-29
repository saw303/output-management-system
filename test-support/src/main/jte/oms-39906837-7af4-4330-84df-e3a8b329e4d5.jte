@import ch.silviowangler.oms.instructions.billing.Billing
@import ch.silviowangler.oms.instructions.billing.Billing.InvoiceLine
@import ch.silviowangler.oms.instructions.billing.Billing.Customer
@param Billing document

<?xml version="1.0" encoding="UTF-8"?>

<office:document xmlns:css3t="http://www.w3.org/TR/css3-text/" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:officeooo="http://openoffice.org/2009/office" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:rpt="http://openoffice.org/2005/report" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:drawooo="http://openoffice.org/2010/draw" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" office:version="1.3" office:mimetype="application/vnd.oasis.opendocument.text">
    <office:meta></office:meta>
    <office:settings>
        <config:config-item-set config:name="ooo:view-settings">
            <config:config-item config:name="ViewAreaTop" config:type="long">0</config:config-item>
            <config:config-item config:name="ViewAreaLeft" config:type="long">0</config:config-item>
            <config:config-item config:name="ViewAreaWidth" config:type="long">33322</config:config-item>
            <config:config-item config:name="ViewAreaHeight" config:type="long">18681</config:config-item>
            <config:config-item config:name="ShowRedlineChanges" config:type="boolean">true</config:config-item>
            <config:config-item config:name="InBrowseMode" config:type="boolean">false</config:config-item>
            <config:config-item-map-indexed config:name="Views">
                <config:config-item-map-entry>
                    <config:config-item config:name="ViewId" config:type="string">view2</config:config-item>
                    <config:config-item config:name="ViewLeft" config:type="long">11005</config:config-item>
                    <config:config-item config:name="ViewTop" config:type="long">5232</config:config-item>
                    <config:config-item config:name="VisibleLeft" config:type="long">0</config:config-item>
                    <config:config-item config:name="VisibleTop" config:type="long">0</config:config-item>
                    <config:config-item config:name="VisibleRight" config:type="long">33320</config:config-item>
                    <config:config-item config:name="VisibleBottom" config:type="long">18680</config:config-item>
                    <config:config-item config:name="ZoomType" config:type="short">0</config:config-item>
                    <config:config-item config:name="ViewLayoutColumns" config:type="short">1</config:config-item>
                    <config:config-item config:name="ViewLayoutBookMode" config:type="boolean">false</config:config-item>
                    <config:config-item config:name="ZoomFactor" config:type="short">100</config:config-item>
                    <config:config-item config:name="IsSelectedFrame" config:type="boolean">false</config:config-item>
                    <config:config-item config:name="KeepRatio" config:type="boolean">false</config:config-item>
                    <config:config-item config:name="AnchoredTextOverflowLegacy" config:type="boolean">false</config:config-item>
                </config:config-item-map-entry>
            </config:config-item-map-indexed>
        </config:config-item-set>
        <config:config-item-set config:name="ooo:configuration-settings">
            <config:config-item config:name="PrintBlackFonts" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintReversed" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintAnnotationMode" config:type="short">0</config:config-item>
            <config:config-item config:name="PrintGraphics" config:type="boolean">true</config:config-item>
            <config:config-item config:name="EmbeddedDatabaseName" config:type="string"/>
            <config:config-item config:name="ProtectForm" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintLeftPages" config:type="boolean">true</config:config-item>
            <config:config-item config:name="PrintProspect" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintHiddenText" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintRightPages" config:type="boolean">true</config:config-item>
            <config:config-item config:name="PrintFaxName" config:type="string"/>
            <config:config-item config:name="TabsRelativeToIndent" config:type="boolean">true</config:config-item>
            <config:config-item config:name="RedlineProtectionKey" config:type="base64Binary"/>
            <config:config-item config:name="PrintTextPlaceholder" config:type="boolean">false</config:config-item>
            <config:config-item config:name="Rsid" config:type="int">1280766</config:config-item>
            <config:config-item config:name="GutterAtTop" config:type="boolean">false</config:config-item>
            <config:config-item config:name="AddFrameOffsets" config:type="boolean">false</config:config-item>
            <config:config-item config:name="FrameAutowidthWithMorePara" config:type="boolean">false</config:config-item>
            <config:config-item config:name="MathBaselineAlignment" config:type="boolean">true</config:config-item>
            <config:config-item config:name="ProtectBookmarks" config:type="boolean">false</config:config-item>
            <config:config-item config:name="IgnoreTabsAndBlanksForLineCalculation" config:type="boolean">false</config:config-item>
            <config:config-item config:name="ContinuousEndnotes" config:type="boolean">false</config:config-item>
            <config:config-item config:name="FieldAutoUpdate" config:type="boolean">true</config:config-item>
            <config:config-item config:name="EmptyDbFieldHidesPara" config:type="boolean">true</config:config-item>
            <config:config-item config:name="ApplyParagraphMarkFormatToNumbering" config:type="boolean">false</config:config-item>
            <config:config-item config:name="AddParaTableSpacing" config:type="boolean">true</config:config-item>
            <config:config-item config:name="TabOverSpacing" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintEmptyPages" config:type="boolean">true</config:config-item>
            <config:config-item config:name="AddParaLineSpacingToTableCells" config:type="boolean">true</config:config-item>
            <config:config-item config:name="TabOverMargin" config:type="boolean">false</config:config-item>
            <config:config-item config:name="EmbedAsianScriptFonts" config:type="boolean">true</config:config-item>
            <config:config-item config:name="EmbedLatinScriptFonts" config:type="boolean">true</config:config-item>
            <config:config-item config:name="DisableOffPagePositioning" config:type="boolean">false</config:config-item>
            <config:config-item config:name="EmbedOnlyUsedFonts" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintControls" config:type="boolean">true</config:config-item>
            <config:config-item config:name="SaveThumbnail" config:type="boolean">true</config:config-item>
            <config:config-item config:name="EmbedFonts" config:type="boolean">false</config:config-item>
            <config:config-item config:name="MsWordCompMinLineHeightByFly" config:type="boolean">false</config:config-item>
            <config:config-item config:name="SurroundTextWrapSmall" config:type="boolean">false</config:config-item>
            <config:config-item config:name="BackgroundParaOverDrawings" config:type="boolean">false</config:config-item>
            <config:config-item config:name="ClippedPictures" config:type="boolean">false</config:config-item>
            <config:config-item config:name="FloattableNomargins" config:type="boolean">false</config:config-item>
            <config:config-item config:name="UnbreakableNumberings" config:type="boolean">false</config:config-item>
            <config:config-item config:name="EmbedSystemFonts" config:type="boolean">false</config:config-item>
            <config:config-item config:name="TabOverflow" config:type="boolean">true</config:config-item>
            <config:config-item config:name="PrintTables" config:type="boolean">true</config:config-item>
            <config:config-item config:name="PrintDrawings" config:type="boolean">true</config:config-item>
            <config:config-item config:name="ConsiderTextWrapOnObjPos" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintSingleJobs" config:type="boolean">false</config:config-item>
            <config:config-item config:name="SmallCapsPercentage66" config:type="boolean">false</config:config-item>
            <config:config-item config:name="CollapseEmptyCellPara" config:type="boolean">true</config:config-item>
            <config:config-item config:name="HeaderSpacingBelowLastPara" config:type="boolean">false</config:config-item>
            <config:config-item config:name="RsidRoot" config:type="int">476565</config:config-item>
            <config:config-item config:name="PrinterSetup" config:type="base64Binary"/>
            <config:config-item config:name="CurrentDatabaseCommand" config:type="string"/>
            <config:config-item config:name="AlignTabStopPosition" config:type="boolean">true</config:config-item>
            <config:config-item config:name="ClipAsCharacterAnchoredWriterFlyFrames" config:type="boolean">false</config:config-item>
            <config:config-item config:name="DoNotCaptureDrawObjsOnPage" config:type="boolean">false</config:config-item>
            <config:config-item config:name="SaveGlobalDocumentLinks" config:type="boolean">false</config:config-item>
            <config:config-item config:name="CurrentDatabaseCommandType" config:type="int">0</config:config-item>
            <config:config-item config:name="LoadReadonly" config:type="boolean">false</config:config-item>
            <config:config-item config:name="DoNotResetParaAttrsForNumFont" config:type="boolean">false</config:config-item>
            <config:config-item config:name="StylesNoDefault" config:type="boolean">false</config:config-item>
            <config:config-item config:name="LinkUpdateMode" config:type="short">1</config:config-item>
            <config:config-item config:name="DoNotJustifyLinesWithManualBreak" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PropLineSpacingShrinksFirstLine" config:type="boolean">true</config:config-item>
            <config:config-item config:name="TabAtLeftIndentForParagraphsInList" config:type="boolean">false</config:config-item>
            <config:config-item config:name="ProtectFields" config:type="boolean">false</config:config-item>
            <config:config-item config:name="UnxForceZeroExtLeading" config:type="boolean">false</config:config-item>
            <config:config-item config:name="CurrentDatabaseDataSource" config:type="string"/>
            <config:config-item config:name="UseFormerTextWrapping" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintPaperFromSetup" config:type="boolean">false</config:config-item>
            <config:config-item config:name="UseFormerLineSpacing" config:type="boolean">false</config:config-item>
            <config:config-item config:name="AllowPrintJobCancel" config:type="boolean">true</config:config-item>
            <config:config-item config:name="SubtractFlysAnchoredAtFlys" config:type="boolean">false</config:config-item>
            <config:config-item config:name="AddParaSpacingToTableCells" config:type="boolean">true</config:config-item>
            <config:config-item config:name="AddExternalLeading" config:type="boolean">true</config:config-item>
            <config:config-item config:name="AddVerticalFrameOffsets" config:type="boolean">false</config:config-item>
            <config:config-item config:name="TreatSingleColumnBreakAsPageBreak" config:type="boolean">false</config:config-item>
            <config:config-item config:name="IsLabelDocument" config:type="boolean">false</config:config-item>
            <config:config-item config:name="MsWordCompTrailingBlanks" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrinterPaperFromSetup" config:type="boolean">false</config:config-item>
            <config:config-item config:name="IgnoreFirstLineIndentInNumbering" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintPageBackground" config:type="boolean">true</config:config-item>
            <config:config-item config:name="OutlineLevelYieldsNumbering" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrinterName" config:type="string"/>
            <config:config-item config:name="IsKernAsianPunctuation" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrinterIndependentLayout" config:type="string">high-resolution</config:config-item>
            <config:config-item config:name="TableRowKeep" config:type="boolean">false</config:config-item>
            <config:config-item config:name="UpdateFromTemplate" config:type="boolean">true</config:config-item>
            <config:config-item config:name="FootnoteInColumnToPageEnd" config:type="boolean">true</config:config-item>
            <config:config-item config:name="EmbedComplexScriptFonts" config:type="boolean">true</config:config-item>
            <config:config-item config:name="UseOldPrinterMetrics" config:type="boolean">false</config:config-item>
            <config:config-item config:name="InvertBorderSpacing" config:type="boolean">false</config:config-item>
            <config:config-item config:name="PrintProspectRTL" config:type="boolean">false</config:config-item>
            <config:config-item config:name="ApplyUserData" config:type="boolean">true</config:config-item>
            <config:config-item config:name="AddParaTableSpacingAtStart" config:type="boolean">true</config:config-item>
            <config:config-item config:name="SaveVersionOnClose" config:type="boolean">false</config:config-item>
            <config:config-item config:name="CharacterCompressionType" config:type="short">0</config:config-item>
            <config:config-item config:name="UseOldNumbering" config:type="boolean">false</config:config-item>
            <config:config-item config:name="UseFormerObjectPositioning" config:type="boolean">false</config:config-item>
            <config:config-item config:name="ChartAutoUpdate" config:type="boolean">true</config:config-item>
        </config:config-item-set>
    </office:settings>
    <office:scripts>
        <office:script script:language="ooo:Basic">
            <ooo:libraries xmlns:ooo="http://openoffice.org/2004/office" xmlns:xlink="http://www.w3.org/1999/xlink"/>
        </office:script>
    </office:scripts>
    <office:font-face-decls>
        <style:font-face style:name="Arial Unicode MS" svg:font-family="&apos;Arial Unicode MS&apos;" style:font-family-generic="swiss"/>
        <style:font-face style:name="Arial Unicode MS1" svg:font-family="&apos;Arial Unicode MS&apos;" style:font-family-generic="swiss" style:font-pitch="variable"/>
        <style:font-face style:name="Overpass" svg:font-family="Overpass" style:font-pitch="variable"/>
        <style:font-face style:name="PingFang SC" svg:font-family="&apos;PingFang SC&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
        <style:font-face style:name="Songti SC" svg:font-family="&apos;Songti SC&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
    </office:font-face-decls>
    <office:styles>
        <style:default-style style:family="graphic">
            <style:graphic-properties svg:stroke-color="#3465a4" draw:fill-color="#729fcf" fo:wrap-option="no-wrap" draw:shadow-offset-x="0.3cm" draw:shadow-offset-y="0.3cm" draw:start-line-spacing-horizontal="0.283cm" draw:start-line-spacing-vertical="0.283cm" draw:end-line-spacing-horizontal="0.283cm" draw:end-line-spacing-vertical="0.283cm" style:flow-with-text="false"/>
            <style:paragraph-properties style:text-autospace="ideograph-alpha" style:line-break="strict" style:font-independent-line-spacing="false">
                <style:tab-stops/>
            </style:paragraph-properties>
            <style:text-properties style:use-window-font-color="true" loext:opacity="0%" style:font-name="Overpass" fo:font-size="10pt" fo:language="de" fo:country="CH" style:letter-kerning="true" style:font-name-asian="Songti SC" style:font-size-asian="10.5pt" style:language-asian="zh" style:country-asian="CN" style:font-name-complex="Arial Unicode MS" style:font-size-complex="12pt" style:language-complex="hi" style:country-complex="IN"/>
        </style:default-style>
        <style:default-style style:family="paragraph">
            <style:paragraph-properties fo:orphans="2" fo:widows="2" fo:hyphenation-ladder-count="no-limit" style:text-autospace="ideograph-alpha" style:punctuation-wrap="hanging" style:line-break="strict" style:tab-stop-distance="1.251cm" style:writing-mode="page"/>
            <style:text-properties style:use-window-font-color="true" loext:opacity="0%" style:font-name="Overpass" fo:font-size="10pt" fo:language="de" fo:country="CH" style:letter-kerning="true" style:font-name-asian="Songti SC" style:font-size-asian="10.5pt" style:language-asian="zh" style:country-asian="CN" style:font-name-complex="Arial Unicode MS" style:font-size-complex="12pt" style:language-complex="hi" style:country-complex="IN" fo:hyphenate="false" fo:hyphenation-remain-char-count="2" fo:hyphenation-push-char-count="2" loext:hyphenation-no-caps="false"/>
        </style:default-style>
        <style:default-style style:family="table">
            <style:table-properties table:border-model="collapsing"/>
        </style:default-style>
        <style:default-style style:family="table-row">
            <style:table-row-properties fo:keep-together="auto"/>
        </style:default-style>
        <style:style style:name="Standard" style:family="paragraph" style:class="text"/>
        <style:style style:name="Heading" style:family="paragraph" style:parent-style-name="Standard" style:next-style-name="Text_20_body" style:class="text">
            <style:paragraph-properties fo:margin-top="0cm" fo:margin-bottom="0cm" style:contextual-spacing="false" fo:keep-with-next="always"/>
            <style:text-properties style:font-name="Overpass" fo:font-family="Overpass" style:font-pitch="variable" fo:font-size="14pt" style:font-name-asian="PingFang SC" style:font-family-asian="&apos;PingFang SC&apos;" style:font-family-generic-asian="system" style:font-pitch-asian="variable" style:font-size-asian="14pt" style:font-name-complex="Arial Unicode MS1" style:font-family-complex="&apos;Arial Unicode MS&apos;" style:font-family-generic-complex="swiss" style:font-pitch-complex="variable" style:font-size-complex="14pt"/>
        </style:style>
        <style:style style:name="Text_20_body" style:display-name="Text body" style:family="paragraph" style:parent-style-name="Standard" style:class="text">
            <style:paragraph-properties fo:margin-top="0cm" fo:margin-bottom="0.247cm" style:contextual-spacing="false" fo:line-height="115%"/>
        </style:style>
        <style:style style:name="List" style:family="paragraph" style:parent-style-name="Text_20_body" style:class="list">
            <style:text-properties style:font-size-asian="12pt" style:font-name-complex="Arial Unicode MS" style:font-family-complex="&apos;Arial Unicode MS&apos;" style:font-family-generic-complex="swiss"/>
        </style:style>
        <style:style style:name="Caption" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
            <style:paragraph-properties fo:margin-top="0.212cm" fo:margin-bottom="0.212cm" style:contextual-spacing="false" text:number-lines="false" text:line-number="0"/>
            <style:text-properties fo:font-size="12pt" fo:font-style="italic" style:font-size-asian="12pt" style:font-style-asian="italic" style:font-name-complex="Arial Unicode MS" style:font-family-complex="&apos;Arial Unicode MS&apos;" style:font-family-generic-complex="swiss" style:font-size-complex="12pt" style:font-style-complex="italic"/>
        </style:style>
        <style:style style:name="Index" style:family="paragraph" style:parent-style-name="Standard" style:class="index">
            <style:paragraph-properties text:number-lines="false" text:line-number="0"/>
            <style:text-properties fo:language="zxx" fo:country="none" style:font-size-asian="12pt" style:language-asian="zxx" style:country-asian="none" style:font-name-complex="Arial Unicode MS" style:font-family-complex="&apos;Arial Unicode MS&apos;" style:font-family-generic-complex="swiss" style:language-complex="zxx" style:country-complex="none"/>
        </style:style>
        <style:style style:name="Table_20_Contents" style:display-name="Table Contents" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
            <style:paragraph-properties fo:orphans="0" fo:widows="0" text:number-lines="false" text:line-number="0"/>
        </style:style>
        <style:style style:name="Header_20_and_20_Footer" style:display-name="Header and Footer" style:family="paragraph" style:parent-style-name="Standard" style:class="extra">
            <style:paragraph-properties text:number-lines="false" text:line-number="0">
                <style:tab-stops>
                    <style:tab-stop style:position="8.5cm" style:type="center"/>
                    <style:tab-stop style:position="17cm" style:type="right"/>
                </style:tab-stops>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="Header" style:family="paragraph" style:parent-style-name="Header_20_and_20_Footer" style:class="extra">
            <style:paragraph-properties text:number-lines="false" text:line-number="0">
                <style:tab-stops>
                    <style:tab-stop style:position="8.5cm" style:type="center"/>
                    <style:tab-stop style:position="17cm" style:type="right"/>
                </style:tab-stops>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="Graphics" style:family="graphic">
            <style:graphic-properties text:anchor-type="paragraph" svg:x="0cm" svg:y="0cm" style:wrap="dynamic" style:number-wrapped-paragraphs="no-limit" style:wrap-contour="false" style:vertical-pos="top" style:vertical-rel="paragraph" style:horizontal-pos="center" style:horizontal-rel="paragraph"/>
        </style:style>
        <text:outline-style style:name="Outline">
            <text:outline-level-style text:level="1" loext:num-list-format="%1%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="2" loext:num-list-format="%2%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="3" loext:num-list-format="%3%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="4" loext:num-list-format="%4%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="5" loext:num-list-format="%5%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="6" loext:num-list-format="%6%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="7" loext:num-list-format="%7%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="8" loext:num-list-format="%8%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="9" loext:num-list-format="%9%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
            <text:outline-level-style text:level="10" loext:num-list-format="%10%" style:num-format="">
                <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
                    <style:list-level-label-alignment text:label-followed-by="listtab"/>
                </style:list-level-properties>
            </text:outline-level-style>
        </text:outline-style>
        <text:notes-configuration text:note-class="footnote" style:num-format="1" text:start-value="0" text:footnotes-position="page" text:start-numbering-at="document"/>
        <text:notes-configuration text:note-class="endnote" style:num-format="i" text:start-value="0"/>
        <text:linenumbering-configuration text:number-lines="false" text:offset="0.499cm" style:num-format="1" text:number-position="left" text:increment="5"/>
    </office:styles>
    <office:automatic-styles>
        <style:style style:name="Table1" style:family="table">
            <style:table-properties style:width="17cm" table:align="margins"/>
        </style:style>
        <style:style style:name="Table1.A" style:family="table-column">
            <style:table-column-properties style:column-width="5.667cm" style:rel-column-width="21845*"/>
        </style:style>
        <style:style style:name="Table1.A1" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0cm" fo:padding-bottom="0.101cm" fo:border="none"/>
        </style:style>
        <style:style style:name="P1" style:family="paragraph" style:parent-style-name="Header">
            <style:text-properties officeooo:rsid="0011989a" officeooo:paragraph-rsid="0011989a"/>
        </style:style>
        <style:style style:name="P2" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
            <style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P3" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
            <style:text-properties fo:font-weight="normal" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="fr1" style:family="graphic" style:parent-style-name="Graphics">
            <style:graphic-properties style:vertical-pos="from-top" style:vertical-rel="page" style:horizontal-pos="from-left" style:horizontal-rel="page" style:mirror="none" fo:clip="rect(0cm, 0cm, 0cm, 0cm)" draw:luminance="0%" draw:contrast="0%" draw:red="0%" draw:green="0%" draw:blue="0%" draw:gamma="100%" draw:color-inversion="false" draw:image-opacity="100%" draw:color-mode="standard"/>
        </style:style>
        <style:style style:name="fr2" style:family="graphic" style:parent-style-name="Graphics">
            <style:graphic-properties style:vertical-pos="top" style:vertical-rel="paragraph" style:mirror="none" fo:clip="rect(0cm, 0cm, 0cm, 0cm)" draw:luminance="0%" draw:contrast="0%" draw:red="0%" draw:green="0%" draw:blue="0%" draw:gamma="100%" draw:color-inversion="false" draw:image-opacity="100%" draw:color-mode="standard"/>
        </style:style>
        <style:page-layout style:name="pm1">
            <style:page-layout-properties fo:page-width="21.001cm" fo:page-height="29.7cm" style:num-format="1" style:print-orientation="portrait" fo:margin-top="2cm" fo:margin-bottom="2cm" fo:margin-left="2cm" fo:margin-right="2cm" style:writing-mode="lr-tb" style:layout-grid-color="#c0c0c0" style:layout-grid-lines="20" style:layout-grid-base-height="0.706cm" style:layout-grid-ruby-height="0.353cm" style:layout-grid-mode="none" style:layout-grid-ruby-below="false" style:layout-grid-print="false" style:layout-grid-display="false" style:footnote-max-height="0cm" loext:margin-gutter="0cm">
                <style:footnote-sep style:width="0.018cm" style:distance-before-sep="0.101cm" style:distance-after-sep="0.101cm" style:line-style="solid" style:adjustment="left" style:rel-width="25%" style:color="#000000"/>
            </style:page-layout-properties>
            <style:header-style>
                <style:header-footer-properties fo:min-height="0cm" fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-bottom="0.499cm" fo:background-color="transparent" draw:fill="none" draw:fill-color="#729fcf"/>
            </style:header-style>
            <style:footer-style/>
        </style:page-layout>
        <style:style style:name="dp1" style:family="drawing-page">
            <style:drawing-page-properties draw:background-size="full"/>
        </style:style>
    </office:automatic-styles>
    <office:master-styles>
        <style:master-page style:name="Standard" style:page-layout-name="pm1" draw:style-name="dp1">
            <style:header>
                <text:p text:style-name="Standard"/>
            </style:header>
        </style:master-page>
    </office:master-styles>
    <office:body>
        <office:text>
            <text:sequence-decls>
                <text:sequence-decl text:display-outline-level="0" text:name="Illustration"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Table"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Text"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Drawing"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Figure"/>
            </text:sequence-decls><draw:frame draw:style-name="fr1" draw:name="Image2" text:anchor-type="page" text:anchor-page-number="1" svg:x="14.7cm" svg:y="1.879cm" svg:width="4.12cm" svg:height="0.589cm" draw:z-index="1"><draw:image draw:mime-type="application/pdf">
                    <office:binary-data>JVBERi0xLjMKJcTl8uXrp/Og0MTGCjQgMCBvYmoKPDwgL0xlbmd0aCA1IDAgUiAvRmlsdGVy
                        IC9GbGF0ZURlY29kZSA+PgpzdHJlYW0KeAFtmDuyHDcMRfNeRa+AIvhn7MCxIi9gyrICyVWy
                        9l/lc/mbeSMleuIdEACBSwDsH/fn+8ft79ydL/n+fidfnbW9/rbX/v6GlP79ev91/zv+/0E0
                        Xf/9PX759MdPux8/b++s2Pk3WLh/Pu5Pf/LjPz/v0l22kO5kzlCD3ZJc7f0gVzEXEhKxu9ZD
                        vXPjb2RdXQqsHwdJ3oWYKq5l73xO6HhHLu+6L0MEwxk1vwAhu9byq0jozmqsdwloNSwHVy3W
                        q1SHhrPGk5pcifmJ1EwIa7oDvjbMnvWywY4p8fSroaKh4vi1gVBcCcP1jUT2ViJQm0upvETs
                        LaaP+8ttvpGGWm+OV6opweaTC7gn78zXDBCJCQoBekdmAxcRSKFlTrihO5KWmiSDF5FNRCUV
                        mIMql2t/Amwy4/xkd8lcZtE1pQot1lFsll0oAshYQq02FRQa3mA8ofgbECeNHILc156B0FRd
                        S6Qrcr6KJkkVF7wc6PBB58J8LxwUOtTQp4tFqjfwuHtHY6rXRnpy0cvj7Hrz+d5rcaERGnYs
                        iWDKuZSiPbIFJyNWLvOF/2BW/vR1Ji6D55iWXLcg17xrBW4RkJI+AJBNgAIxZVBIpBUsctky
                        ipureUS8ON+JwVorS+aqJykL6RXuICBNhPrqRLvKDZgc4zhNdFHxxzF8Vxg5XxlRdDkRRIDs
                        vO5ORIIIAEATtF4kd9JHRjmLdwkjGCN2Csha6yTRmWFlSwSPVdxMzpNE3JnrC79CI1Fs2SL8
                        hayKWIIynCVAVj8I+MbsQfdUFXO7msvdutiekCfphGQglgK+RLs7h2id39caHyMHl+0NzTLS
                        L7gFg0tvtipLF902hNPF0PQCZVQVdENO701FMPUkW9z/Ho1bP9Yyhb8VvUcCnvVRNokPO6ho
                        qXi7uXUZG+wA6dwPkOxt+JaNq5B0olzz8AOZGLFLTQ/4gWeJHxN2IEYiLpa4UTrPicrHuCmW
                        gTw382HLfAdRwsJBQufo/LNjedYrlteDLUtkxRJfQoNJxPgllgd6xvJAM5ZXaLhK2duRCp0y
                        4bF9Yil/qQ4HCbrbhrdeBbRTYohcLQHerlhGrksqMaxY4lv0QSzQiVYstasl7J5YCqFVKgqK
                        JUWSn2ysB8Pe4zZ42YyaEPqqPCZi1io1T4heA0VLv6hfPsBQq7iXkIjccws01Sc0w2lKLY0S
                        Qgw9tMFXaHaXgWxVo718QLhgtcInNG0hip33kMOqKllU6KgXxS5rRNvk0QTkESfLFUptyFqg
                        PXJUgBxEVAA6+AASWsYm+kCtHJXS1vow3gr3Umkia4XD4k8j99bHyXBnQlTfNCHOPJXzn74K
                        uIC3SA8q0y1mjaYAZsocXD6QmgTVNKgV0dAoHSlQ+Ggl5HdU27GGy5CDWqnquiSo1Z3KqCKe
                        KacSmMA0I/5vaCZs9CmuRO6o+Q1EkcuGJg6/pSimDAYX7ZLWiTHI52lMgXZbK71srTHF5Ult
                        1OEpQf/xCQkNUlRQyqiLrdcrci1Ya8dE0MF0JKsMVg6aSus78vT2hG5B1Mevqhe5uqh5iebe
                        saAgw02vyWJDoWBclV9jhE8NiUJv5lhwLnItFTLmq57pH4EbT5GSW4yLtastM2NQCRZkSW2J
                        KtXQJClmHO7qoFBv7ZJ5hp7V79kWcoF3HA/Pq/Rgjf4Q6szGgIJafyTvcDMSIRrOBC5uSg74
                        w6YtQ76qr5JpzDE4yMySM2taCExhaoV3c0viLhmmKTA54htVO5cRabrmi2u6YawVB93M3VeR
                        YEK2LLppHNW64CjzKBqp52MH82ZmBwTLfoYErorEjEJQY0LEgPlIEH10QhCYierC+6owYblD
                        MIje5L0yi89njW94X9lxJOhsWaeDgw0VV9jA6OPTuwORXx+llvQo94cd7wzi7l4RlcR7MlJ1
                        mcJEjWDCunlwfGFSU33XYBA27agQ+I93zGiBpN4CqC2MLFQ2mAEAtzTnUQU8t5zgMZYSF0HI
                        0pMHQNmZWgoyUSms4iqWmAbgatSsqTs3r4KCSemDtuh5gTg5TxfdqpDKEFKHVhImwg1iYHBN
                        U9TLNsJRSPALpHsW6XO590j86M+pcM8iRc8HfyDpo+qS+SgaM5oXAOU9AYxnDECHasmeAMeh
                        wXNzn9C0FaJeAnBMm96MaxMlKODPfMtNf1AtWxuKFYDRh4AxyVu5DjAvVVECtozaqRyuXHop
                        GRVOprkxFs9alukZqUb6HBVPErwVfZZEpaYTt6hOSlhINuvHQFLjgMQgx0K6Eq+hYiGKuYWH
                        DKFL1OymA+n5UtlHNKWZIVf8i1mWmD46u8b8pLVMEMu1xjealy89zkkUCVLE5I9S7lowARp6
                        2aJGZMs7ZtHEiTckX8ha1hFIJ+VruMe9VxyAagjzENB4HEsjBMrny1yEUEI56BNQPyG6Dzqm
                        HvrIUMx4Z+kQFIsCcLL2nln1UvjJVSqKV69EgC8GnAweXjRQcjS28zJCgukX4/p9rEk1T62o
                        NCwEKjZKgShJY8JLMpwbbGPmyrBtrdnBrEWbOMBO+Nq/lk8DC+BypqgUjCOrsmJ+K19LVXOK
                        OPdo/84t58XAkucO4pguhJQC6kmnap+uTYEK4zrRd5iKM+fV6K4NUIFJRqWRYnzMraVmfjLZ
                        C16N30dFQ33UcDoI1tiMk5UqzcnX7zTmEkWNuXuEDG5v9ZdCqDX+0cLl30b4y0cRVC4NZ31M
                        bITKR++PlFwKC6SBhk2FhnVspIOBovAhABuqQ+oRKsvcBYXOJ33fWW+nfFNxS770/hrvqzw/
                        KIms8+HEhDU+OX1AxqZXkVkMhSw1mvOYcoWogepV/xtEthEZU8l8gECdAeoRM14k5Trm51OD
                        8/6KbIeOyDG21Szzqrga9RI8ODJP5MWhGcw0g6naTQQrX5cgAG8I2BYIJd83aFQsxTU+gg2u
                        KbciI+tBRk4YoZ42w+AWKCl8KCAPFBRU4QYXFVXjoq6kff4fNNjpOwplbmRzdHJlYW0KZW5k
                        b2JqCjUgMCBvYmoKMjIzMAplbmRvYmoKMiAwIG9iago8PCAvVHlwZSAvUGFnZSAvUGFyZW50
                        IDMgMCBSIC9SZXNvdXJjZXMgNiAwIFIgL0NvbnRlbnRzIDQgMCBSIC9NZWRpYUJveCBbMCAw
                        IDQwNy4xOCA1OS4wNjU0XQo+PgplbmRvYmoKNiAwIG9iago8PCAvUHJvY1NldCBbIC9QREYg
                        XSAvQ29sb3JTcGFjZSA8PCAvQ3MxIDcgMCBSID4+IC9FeHRHU3RhdGUgPDwgL0dzMSA4IDAg
                        Ugo+PiA+PgplbmRvYmoKOCAwIG9iago8PCAvVHlwZSAvRXh0R1N0YXRlIC9PUE0gMSA+Pgpl
                        bmRvYmoKOSAwIG9iago8PCAvTGVuZ3RoIDEwIDAgUiAvTiAzIC9BbHRlcm5hdGUgL0Rldmlj
                        ZVJHQiAvRmlsdGVyIC9GbGF0ZURlY29kZSA+PgpzdHJlYW0KeAGdlndUU9kWh8+9N73QEiIg
                        JfQaegkg0jtIFQRRiUmAUAKGhCZ2RAVGFBEpVmRUwAFHhyJjRRQLg4Ji1wnyEFDGwVFEReXd
                        jGsJ7601896a/cdZ39nnt9fZZ+9917oAUPyCBMJ0WAGANKFYFO7rwVwSE8vE9wIYEAEOWAHA
                        4WZmBEf4RALU/L09mZmoSMaz9u4ugGS72yy/UCZz1v9/kSI3QyQGAApF1TY8fiYX5QKUU7PF
                        GTL/BMr0lSkyhjEyFqEJoqwi48SvbPan5iu7yZiXJuShGlnOGbw0noy7UN6aJeGjjAShXJgl
                        4GejfAdlvVRJmgDl9yjT0/icTAAwFJlfzOcmoWyJMkUUGe6J8gIACJTEObxyDov5OWieAHim
                        Z+SKBIlJYqYR15hp5ejIZvrxs1P5YjErlMNN4Yh4TM/0tAyOMBeAr2+WRQElWW2ZaJHtrRzt
                        7VnW5mj5v9nfHn5T/T3IevtV8Sbsz55BjJ5Z32zsrC+9FgD2JFqbHbO+lVUAtG0GQOXhrE/v
                        IADyBQC03pzzHoZsXpLE4gwnC4vs7GxzAZ9rLivoN/ufgm/Kv4Y595nL7vtWO6YXP4EjSRUz
                        ZUXlpqemS0TMzAwOl89k/fcQ/+PAOWnNycMsnJ/AF/GF6FVR6JQJhIlou4U8gViQLmQKhH/V
                        4X8YNicHGX6daxRodV8AfYU5ULhJB8hvPQBDIwMkbj96An3rWxAxCsi+vGitka9zjzJ6/uf6
                        Hwtcim7hTEEiU+b2DI9kciWiLBmj34RswQISkAd0oAo0gS4wAixgDRyAM3AD3iAAhIBIEAOW
                        Ay5IAmlABLJBPtgACkEx2AF2g2pwANSBetAEToI2cAZcBFfADXALDIBHQAqGwUswAd6BaQiC
                        8BAVokGqkBakD5lC1hAbWgh5Q0FQOBQDxUOJkBCSQPnQJqgYKoOqoUNQPfQjdBq6CF2D+qAH
                        0CA0Bv0BfYQRmALTYQ3YALaA2bA7HAhHwsvgRHgVnAcXwNvhSrgWPg63whfhG/AALIVfwpMI
                        QMgIA9FGWAgb8URCkFgkAREha5EipAKpRZqQDqQbuY1IkXHkAwaHoWGYGBbGGeOHWYzhYlZh
                        1mJKMNWYY5hWTBfmNmYQM4H5gqVi1bGmWCesP3YJNhGbjS3EVmCPYFuwl7ED2GHsOxwOx8AZ
                        4hxwfrgYXDJuNa4Etw/XjLuA68MN4SbxeLwq3hTvgg/Bc/BifCG+Cn8cfx7fjx/GvyeQCVoE
                        a4IPIZYgJGwkVBAaCOcI/YQRwjRRgahPdCKGEHnEXGIpsY7YQbxJHCZOkxRJhiQXUiQpmbSB
                        VElqIl0mPSa9IZPJOmRHchhZQF5PriSfIF8lD5I/UJQoJhRPShxFQtlOOUq5QHlAeUOlUg2o
                        btRYqpi6nVpPvUR9Sn0vR5Mzl/OX48mtk6uRa5Xrl3slT5TXl3eXXy6fJ18hf0r+pvy4AlHB
                        QMFTgaOwVqFG4bTCPYVJRZqilWKIYppiiWKD4jXFUSW8koGStxJPqUDpsNIlpSEaQtOledK4
                        tE20Otpl2jAdRzek+9OT6cX0H+i99AllJWVb5SjlHOUa5bPKUgbCMGD4M1IZpYyTjLuMj/M0
                        5rnP48/bNq9pXv+8KZX5Km4qfJUilWaVAZWPqkxVb9UU1Z2qbapP1DBqJmphatlq+9Uuq43P
                        p893ns+dXzT/5PyH6rC6iXq4+mr1w+o96pMamhq+GhkaVRqXNMY1GZpumsma5ZrnNMe0aFoL
                        tQRa5VrntV4wlZnuzFRmJbOLOaGtru2nLdE+pN2rPa1jqLNYZ6NOs84TXZIuWzdBt1y3U3dC
                        T0svWC9fr1HvoT5Rn62fpL9Hv1t/ysDQINpgi0GbwaihiqG/YZ5ho+FjI6qRq9Eqo1qjO8Y4
                        Y7ZxivE+41smsImdSZJJjclNU9jU3lRgus+0zwxr5mgmNKs1u8eisNxZWaxG1qA5wzzIfKN5
                        m/krCz2LWIudFt0WXyztLFMt6ywfWSlZBVhttOqw+sPaxJprXWN9x4Zq42Ozzqbd5rWtqS3f
                        dr/tfTuaXbDdFrtOu8/2DvYi+yb7MQc9h3iHvQ732HR2KLuEfdUR6+jhuM7xjOMHJ3snsdNJ
                        p9+dWc4pzg3OowsMF/AX1C0YctFx4bgccpEuZC6MX3hwodRV25XjWuv6zE3Xjed2xG3E3dg9
                        2f24+ysPSw+RR4vHlKeT5xrPC16Il69XkVevt5L3Yu9q76c+Oj6JPo0+E752vqt9L/hh/QL9
                        dvrd89fw5/rX+08EOASsCegKpARGBFYHPgsyCRIFdQTDwQHBu4IfL9JfJFzUFgJC/EN2hTwJ
                        NQxdFfpzGC4sNKwm7Hm4VXh+eHcELWJFREPEu0iPyNLIR4uNFksWd0bJR8VF1UdNRXtFl0VL
                        l1gsWbPkRoxajCCmPRYfGxV7JHZyqffS3UuH4+ziCuPuLjNclrPs2nK15anLz66QX8FZcSoe
                        Gx8d3xD/iRPCqeVMrvRfuXflBNeTu4f7kufGK+eN8V34ZfyRBJeEsoTRRJfEXYljSa5JFUnj
                        Ak9BteB1sl/ygeSplJCUoykzqdGpzWmEtPi000IlYYqwK10zPSe9L8M0ozBDuspp1e5VE6JA
                        0ZFMKHNZZruYjv5M9UiMJJslg1kLs2qy3mdHZZ/KUcwR5vTkmuRuyx3J88n7fjVmNXd1Z752
                        /ob8wTXuaw6thdauXNu5Tnddwbrh9b7rj20gbUjZ8MtGy41lG99uit7UUaBRsL5gaLPv5sZC
                        uUJR4b0tzlsObMVsFWzt3WazrWrblyJe0fViy+KK4k8l3JLr31l9V/ndzPaE7b2l9qX7d+B2
                        CHfc3em681iZYlle2dCu4F2t5czyovK3u1fsvlZhW3FgD2mPZI+0MqiyvUqvakfVp+qk6oEa
                        j5rmvep7t+2d2sfb17/fbX/TAY0DxQc+HhQcvH/I91BrrUFtxWHc4azDz+ui6rq/Z39ff0Tt
                        SPGRz0eFR6XHwo911TvU1zeoN5Q2wo2SxrHjccdv/eD1Q3sTq+lQM6O5+AQ4ITnx4sf4H++e
                        DDzZeYp9qukn/Z/2ttBailqh1tzWibakNml7THvf6YDTnR3OHS0/m/989Iz2mZqzymdLz5HO
                        FZybOZ93fvJCxoXxi4kXhzpXdD66tOTSna6wrt7LgZevXvG5cqnbvfv8VZerZ645XTt9nX29
                        7Yb9jdYeu56WX+x+aem172296XCz/ZbjrY6+BX3n+l37L972un3ljv+dGwOLBvruLr57/17c
                        Pel93v3RB6kPXj/Mejj9aP1j7OOiJwpPKp6qP6391fjXZqm99Oyg12DPs4hnj4a4Qy//lfmv
                        T8MFz6nPK0a0RupHrUfPjPmM3Xqx9MXwy4yX0+OFvyn+tveV0auffnf7vWdiycTwa9HrmT9K
                        3qi+OfrW9m3nZOjk03dp76anit6rvj/2gf2h+2P0x5Hp7E/4T5WfjT93fAn88ngmbWbm3/eE
                        8/sKZW5kc3RyZWFtCmVuZG9iagoxMCAwIG9iagoyNjEyCmVuZG9iago3IDAgb2JqClsgL0lD
                        Q0Jhc2VkIDkgMCBSIF0KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9NZWRpYUJv
                        eCBbMCAwIDQwNy4xOCA1OS4wNjU0XSAvQ291bnQgMSAvS2lkcyBbIDIgMCBSIF0gPj4KZW5k
                        b2JqCjExIDAgb2JqCjw8IC9UeXBlIC9DYXRhbG9nIC9QYWdlcyAzIDAgUiA+PgplbmRvYmoK
                        MTIgMCBvYmoKKG1hY09TIFZlcnNpb24gMTAuMTQgXChCdWlsZCAxOEEzOTFcKSBRdWFydHog
                        UERGQ29udGV4dCkKZW5kb2JqCjEzIDAgb2JqCihEOjIwMjAwNDA3MTE1OTM4WjAwJzAwJykK
                        ZW5kb2JqCjEgMCBvYmoKPDwgL1Byb2R1Y2VyIDEyIDAgUiAvQ3JlYXRpb25EYXRlIDEzIDAg
                        UiAvTW9kRGF0ZSAxMyAwIFIgPj4KZW5kb2JqCnhyZWYKMCAxNAowMDAwMDAwMDAwIDY1NTM1
                        IGYgCjAwMDAwMDU2MjMgMDAwMDAgbiAKMDAwMDAwMjM0NiAwMDAwMCBuIAowMDAwMDA1MzY4
                        IDAwMDAwIG4gCjAwMDAwMDAwMjIgMDAwMDAgbiAKMDAwMDAwMjMyNiAwMDAwMCBuIAowMDAw
                        MDAyNDU3IDAwMDAwIG4gCjAwMDAwMDUzMzMgMDAwMDAgbiAKMDAwMDAwMjU1MyAwMDAwMCBu
                        IAowMDAwMDAyNTk4IDAwMDAwIG4gCjAwMDAwMDUzMTIgMDAwMDAgbiAKMDAwMDAwNTQ1OCAw
                        MDAwMCBuIAowMDAwMDA1NTA4IDAwMDAwIG4gCjAwMDAwMDU1ODEgMDAwMDAgbiAKdHJhaWxl
                        cgo8PCAvU2l6ZSAxNCAvUm9vdCAxMSAwIFIgL0luZm8gMSAwIFIgL0lEIFsgPDBmZDhmNDUy
                        OWJiMmU0YWQwYjVlZWNlZjVhNDcyODVkPgo8MGZkOGY0NTI5YmIyZTRhZDBiNWVlY2VmNWE0
                        NzI4NWQ+IF0gPj4Kc3RhcnR4cmVmCjU2OTgKJSVFT0YK
                    </office:binary-data>
                </draw:image>
                <draw:image draw:mime-type="image/png">
                    <office:binary-data>iVBORw0KGgoAAAANSUhEUgAAAh4AAABOCAYAAABv0h+UAAAi30lEQVR4nO2dB7gVxRXH5wGK
                        RhFU1CgmYm9InthRrLErYsFoFIOJiDWCPbZI7B2JivgUEY0YC4LYoybWKIqigigWUBFRIaIU
                        ReCR/5+Zi/c9btkzO7v3vnvP7/vmW8qdmbO7sztnz5w5p4VRlCbM9F69j8HhLmG1Dm3rBo1P
                        Qh5FKSfwfLTAYb6w2uV4Ps5PQh5FIS1KLYCiKIqiKNWDKh6KoiiKoqSGKh6KoiiKoqSGKh6K
                        oiiKoqSGKh6KoiiKoqSGKh6KoiiKoqSGKh6KoiiKoqSGKh6KoiiKoqSGKh6KoiiKoqSGKh6K
                        oiiKoqSGKh6KoiiKoqSGKh5KNXLu9F69/yf4/bi2dYPqEpNGUcqLPfF8rCisczaekXmJSKNU
                        HKp4KNXI0cLfP4qiiodSLWzjioQLUVTxUCKhioeiKIqiKKmhioeiKIqiKKmhioeiKIqiKKmh
                        ioeiKIqiKKmhioeiKIqiKKmhioeiKIqiKKmhioeiKIqiKKmhioeiKIqiKKmhioeiKIqiKKkR
                        XPHYdNNtl8VhM5TfoNSidERpi7IcCv+vHuVHlLkoH6GMRXmbxwkTRk8LLU+pwfXgeW+IsjZK
                        S5TmKPNRfkD5hAXnvah0EiqKoijVjpu7N0dZ3dj5mnPVTyjfokzAPCVJM1GQIIoHBG6Hw7Eo
                        hxmrdCwTserWKEdktfMVDi+iDEZ5CidaH0K+KKBv5iZYXVDlG8g3K0c7vzL2nH6LsjEK/96s
                        QDtzUOc9HN9BGYXyGNpdIJAjcSAfrwvv1Sb8K8q6KMsbe14cmLNRPkb5wJX3cA5T05Bt+rz5
                        C1ov03yKpE7zmpoFzWpqJMqel0KM67aSsUq3hC9w7fKGnkab7XHYzhU+aysY+xxTkZ1k7PUf
                        h/JvtPNDBBlXw6GVREC0+4nk9xFk4AtvbWG1GZDju5BySIHcbXDoZOyzwQ+tlY19YbPw2eBz
                        PAeFz8IXrnCsjknr+QCL5tfXi56Pmpqa+hY1NQuF/aT2ro4C7g2fi18Kq83Cffk6CXkyQK71
                        cKgRVJlS6H0QU5Z1cNgPZStjx3EHU2Duxu95bcajvIXyMMrLvh/N3ooHhKA2tD9KL5R9jdWO
                        4rKGscoLy6fogwrIYJyc6MHxhH3eKfg9z/t2/gFyciD1cP+2o5ENLD4gmdwIf0L5Gu3di2Md
                        zvs9QTtBgQycMLujHI6ysymsPOWqzwnwKVeew7n8GFxIcPDr4ziGpZPW5ildWyrj/YV1qFCM
                        zv4H9xI9AeU0YxXZfOyW9efZqNcP53ltkf6uM3bsRgbttkC70ompEFRo3xbWORflqoAyFMUp
                        kszzw+eByoZ0EsluazIOr6C8hDIc1/OrQGI2oMtLnCPEz8flkOf8BMRpAK6BeNKCXFGvd2uU
                        941sjpsMmdZP6oMXbfPZflVQ5XuUtUzAHDhu3j4ApTfK3kb2Xl/dFb5nTkeZgvYexHEortlb
                        Ejm8FA909nscrkZp51M/ItTG+qFchP7uw7EvTu6bBPvzArLRNDXIWIUjBLyxfVBORds343hB
                        LstKUrhJ7hyUM1B+EaOpjV35M8q3aHcIjgNxLh/GFrJKwDXj0tzZxo6HVYTVacFbIbRM1Qju
                        w0Y4nIryByO0DhWgvSt8lw5AH0/gOARlFJ6R+YH6qFpoUcI1HYk/Hiqo1t5YC8CjiQhlzInC
                        39+F85gTomP3LjnDySBVRPPBdvqwoP2HcDwf8n4QpaJI8XDLCLcae3PSghraUSj7oP8+OLF7
                        Uuy7IJCHk8KlJvrSkgSeNyftw9DPKTjvhxPoowHo52AcqOysGbhpmqD7GjtA78bxzHJUIssJ
                        t7zFe945RjMvBRKnKsE92B2Hs4z9MvSybESE7+EDXZmGfi/HcRCekZ8S7LMauMXIFA9ykklA
                        8cA95TvwcGG1WwL13cXY7Nobh2gvD7zOB7lVCiog0wv9OJLi4ZYSeEOuMOE0fimrotztrC29
                        cWKfl0iODDR7d0ihH5rahuO8z8A5X59UJ2j/LzhcZpJ9wbLtY1C4VnhWgv00aXAv6JD9iLFW
                        P1/oXyAx6yoOXH9a+m5AOb4E3dMvYQDK6ZBjsyh+OkpucO2ewzXkcssmgmp70w8jtB8T6Gms
                        X1xU6KP1fpwO3dIgVyY4jpN8r2do4fqikeBgyP9moR8WhOu5OAwz1geiHKA/yduQay+c2Bsl
                        lCMNpSOb63DOrXDO/UI37JZ0TgrdbgFeTrGvpkZ7Y790Vo3ZzluhzLTVBJ4FOtr9wyT7dRiF
                        ZVXpCAIt9P0Fv6fPA/2pzg4sxwnC398cpzOMY24CoH9dIZ+wpPg1ysuQ4XiM4btz/aCg4uG8
                        zf+J0i28bLGg2eoZyLc3Tuy1UguTIhfjnOfhnK8M1SAHh0lX6aBDmS4B5CeE0kH0GgtwVl36
                        Nv3NJLN0KuX1UgtQIQxB4dKVxF/tjxgPF4VyiHdLdhsJqnD308gY/dXi8DTKar5tBIA7u4Zy
                        Fx6u4yWN/zOv4uGcUeixekCCwsWBXstPQ859cWKvlFqYFPkbzvnpQmasqLgBemN8kURMKLb+
                        V+WEUDqIKh4yuLRyWqmFyEIVjwBwy7XbJXicoBqfQfpjDA0khtSptM43pALOdXsc6Kjcxqd+
                        AnC++gjnMyz7H3MqHm55hY5t+6YhWQy4hvUU5N0TJ1Yt69n8GqMmuVWA/d182S4XQCYJL6bc
                        X7WiikdE+HVrykvpIKp4hINWRIniQWgFjq14YGzRUb+boAp3NN3m2ddOxiodK/rUT5DBkO1j
                        zFdLwgTks3hwj3y5Kx0ZeJGH4cS2wInNLrUwKcEtvBmzsBe4XowbsmsogQSo4pE8E5MOhFQp
                        4DngNtngflMBKKX/WkXBGBO4z1yS305QbTvU6RTAskyFR7J7dAT6/FLaCWSlleZ+U35KB+HH
                        7UjnLM0oqEtfEOdRf2HgjiejTDQ2uiL7ZEwCRvqLEycim/Yo1xi5SStpGGSJ3tFUiOi0xEGx
                        rhEG48rDibhXV8TY8396ABl8UMUjedTaEQE8P78z6S81RuGTkOGplcXQ6iFRPAitHlJLyRJc
                        sK5ewmq+TqWMJRUqDAK3cdPPhJGBaWFf38S3jHO3FuOIXMC/NFA8cKHYyRBjc6rEgZMhtS96
                        h7+ea03f3RR+ue9h7A3eIGafvRlFDX09G7OduExGuQtlhLH+DA2WQ1xodnrO87xPNvLAUBl4
                        Iw8x1vnXh7086lBxpJcyzXkTjL3PHCuMObG5KwykVpun/me4Hp959KvIUOWuCC5OykATfpsh
                        v+g+NTbaJD8w+HHFnQUrCdrQZZbw8D3JcAQSH6ojMU4Yc2imZ5+M7C3ZVTIefT0v7QQy9jTy
                        eCWN4budu2Do18kgdt9ntU+9oNbYeZqRe30jnp+GtvpTH2jcAMPkbunZKKFDDG9u/2LmIhdy
                        mflJ3oEw/OrgTWII5E09++YL5A635JJapM8saNXg9bupUMhdtxzEwfU8ZOUeay5rnWf8XoC0
                        8IgVD/TLpHVShYe5WLpB/nE5/o/7zV/Iap9Ws57GBn7Lzn+jE2I6qMWjOAwVv3KAdqhoPGDs
                        h8Y7eD6+yPUjF0CKIdZ3QdnH2LDrLfO0qYpHYPgB6IJbSeIHUWnsaeRpDzJILfADpR3gnGhB
                        HyCtlwV3GXL+vTCfq4KzqnNMHov+LjbWKrO/R1/86OY25bOXKB5okBPROR6NZWCm2R4+Tp5u
                        oh4FGZ4xdsnkZE8Z1nF1g203jQjNorvkmZTz4m70BS5JHB2ZpPludmKwI7QzV1hvG+HvySlR
                        zw+/o0LJAEgcT2ei0HmPpjpVPOLDRHBUXGlxymz3a2NsoLkdUNri+n9UGtGaBhiXtDYeHbMZ
                        3gd+aDwUJcKoW9se48r1zvLJ3EyM6Ns4UJwqHsnAmB58H0k+8rikfaM0GZpTCPYWVOHHso8z
                        K/38fIN60jLXE+f2n6gV8FvmUKOlfYTx8wM9gcEqsy0eTGjlu47DCWW/uM6dLmDOKRCMyguX
                        K3x8IY5H/atSTDVPk9TeUqUjG9S91zl79hFWpaJCX5n/CutJszZOhYxPCutkNOUrXCKhO4wq
                        Hr5w0qIlcWixpSpca0l0xKrDhQmIE4qayh7jElwXZ1eZe1fe6IL3MRozo0JTeeRHWOyt8srS
                        MBoprjeXE/YRVGP8DSqqzwi7YxI2iYJzj9RSj3NhUlVpGPYMjIx8tM/qABVtp3wwtPwewupU
                        kjotVjxc8BxpZLUM9L4+IOSOEuZjYZRO4/eCyGia4onSk0sDRVClQy/X6aSR5rg0JlU8pAGS
                        pBaVBjAxHO7nLikqg5UEfaV6Za+5FkKjXRblCCML5pQNfdW64hpLn7e8uHgN3B4/3FiFZvcq
                        2p1XCjinSBQPQt+GyIqHC7z5R2EfPnMd52wff0zOV0fEeVcwuJpzzmbqEunHTpeMxeO3xs+5
                        k34c+0R9KUpAmwOduconpwfX1tJQPPjFc2eIhviywfkykY90i2ytR3fSL7X1IdsGcUz4qnR4
                        wa/g8/XaBUU6IWTg7jSmafg4pDAZnLLRF89Z2yTaV5bwmLFLDJI8SF1xX9rl89/JAdOLSKKG
                        viC1mDuHTx9jAc/hoBAfKGhjhsscf6yw6s4ZxcPX2nEaO/esG4W/GmsFWE9Yb39ckLUh25QE
                        ZMpmeOAonD45THxeVNIYD7SIMVYKLVtfefSnyHkU1/q8UgtRSTin6p09qvIl3S0ppSMbjeqb
                        LPQnxDhggK7LBNW4pM2lk4si/l7qVOpj7eASi3TJnNBXb6pHvXz83cgVj61b4CbQj0LiBJPh
                        cZzAAx71IkOtDPLRzCW1XnCgcLvo4PBSNeCxwO0xyA13+0icTH38cnxMxVujjMH9oDn4Tk3Z
                        nSicfHy/zJX8+F7TkzHe3w0qiVJKbjf2o1ayTHEc333F4ibhN0weupOg3WkowwW/z3CwR52X
                        IP8Ij3p5ccHZJhsbSysqrWnxYBbGFTz6vMKjjhicGEOijzXyJYU424Kj8m3IxphNFOfKoC2S
                        ra7SnTDsZxL64TKZNOBMO2M9w89HfWq6d6OtadL+laLcgev6TamFqECO8ajzLO5FkOVUpTxg
                        VF+8vx7CH48UVOO7kpP9/UV+J109qPMMAumzM5G+kz5WkmLMFP5+eSoePhP0B7hYacYK4IMv
                        jTCYhuLhGzW0EHljgASGgdZ8txTSAZYxSLhjhVkQuQNpZKhsjlUO/TnqSi1EpcEsmcbuGpGS
                        9tZ8JR24vCFRPAit73kVD4wxfsD3ELRHx+JBQhnYD/1Hfi2tZ+xH460e9UJT76t43BVakiLc
                        g3Ktke3G+A2XkQoF86pyeD0Z4CtO5EZaW/Z1ZaZzjr1Gv9ZjMSYNX4IqpNajzpu4F9JtlEoT
                        gB/OeF9x+WwLQbVdXL6R9/L8P7dFSyLUjhI4rGaztUedcmKer+KRajwG5i3ADWfApI6CagzQ
                        w506E5ORqmmDa/o2rulII8ucWIg2xu5AOhntUqu+Wh1RvXin1AJUKLUedRL1YVNKDiOFSh07
                        afU4Jc//SZ1KffOyNHXFY3HI9M2ElWgKLsXL8W0jUzwIz00Vj/z8xdit1CEzGjLMMBPQMeJf
                        fxz7xQm0VIWML7UAFUqtR53XQguhlBXMO8U0HZLInz3wXju3cawV/Nu2RvYR/36MvGKdPOuV
                        Cx9Q8ZBOOpOTiNsRASoekvUzUo4pgssG3Mf38cBwK1QSX3YMKkPFphv7QF/6Eo/GhFILUKFI
                        P7C4RKup6SsYFzuJysdJgmpcSmHgrDsa/fvxwu7j+FpIYoSUI/dT8ZBux5TGgAiFj99A3FS+
                        FQ8evgfx8DFoWdQ96lKY9O9l9MH94+Xg2FTulCLBYTUgzWfxWYmSTSrpwqUWieJBjjNZiofL
                        u/M7Qf05xmaB96Upz2t98FwNpuIhTXFbqvgNPuZ63/S9VQUGwl/x8Mw01uHUJz9OMeiEyki0
                        a6GvpBScSkHjoyRDvkyw+ZiTiBRKWYH30Xi8l+iz2EVQbXvU2Zx13d8Zhl9iXb8Xdb8T/L4x
                        0rFcLvwZ580wDIsnZk7oEg1KmucjFD79qm9BRDAgbsDDxFDC3Los8cyWcCH6+Al9XZpQ+4qS
                        D+nuNg1TXz3Q6iFRPAiXqM/M+rMEX6fSDE1xbJ6K9/5Nmb9Q8WA4YInisWpwkaLhE/hEFQ8B
                        GBjDoRiMNtbb+4CEuumHPv4bw7FKUXyQxpjRLL/VA4OJcQfeGoI6h+M9xl18jGm0g6DeK9xR
                        KBEuB00pXhKVJC6zN9g9RMWDPhsrCxpiwrAVGGUzpHQR2Nyjjm7nFOLy2xyIe9wdx37G+miE
                        hEs59zpTpealUNJC+r76FcZoS92RVfkwcijuNcOony+ollE4WCSxkHzysjSmqSwDUulguoGB
                        jf+DisebxoZNjwonDgZdeTWMbJGReqWTuJpl1cI8PC6sMDMtXmBkgXaKsTrKn01yDq2K0pj3
                        UTYS/J55PLg9Mu33nFIaGEH0XCNLQUGHUom1gxskQuwgZACzXYV1nkNJOzAhs+7ek+s/qHiM
                        MfLQsZ1Nig8kJkBaZKR7l6foF3U8XNTX+3H9+bB0NTYPwZ7GIz9MDhho7KoSWM6U6oRLiF2F
                        dTipqOJRBeA99DneR0z6KRkjzP3TRvD72wMl1/TZ5v0q+pZYdBIlY/GQ0hPl+rCi5OfpHTp2
                        nfbjT6NvmvRFq9EzZ0X98h6bpEzVBAYsTWaMcjoSDycTxTGeCh2qJF+QjWEiPOaKEecqUBQP
                        XveocyDKDaEFUcoWLoNIFI82gt/yIy5UOAGfscxAkWWneHBikaxTbcFIbZiQRicjVkOWb968
                        17orLN/5ug4bmB8WLvxw+JfTp9312bROP9TXF8qqOzYN2aoNl1uAibOuxBjYx9hkcb7LMDsb
                        VTyUdPB5We+GMb4NxrxPXaXpwYSXHxmbaiM0j2EcfRaoLQYZpKVYklV+W4zl3SDDvwPJEIsW
                        3E8Mgbj+KXUiPAfl0ARkasD0Xr0PwmHHzN+hhGx41NprbHhku9Vnj58158UbP5nyyw9m/7Bh
                        jqoaKTNhMHaedNlpe6MMMPK4KduFl0oR4rM1j/d5YUAZJC9QLzBWv8VY9ZlUGH33kAREUsoM
                        WnZdnqlrE2g+7hbaJUDOhZCTBgPpFmB+MJbFOzczUTB2w9XCuofg5LviIjwSWKYlQOmgg1fO
                        QdCspmbFLVZascvttZuYWQsWvDv0869mPTj1m20WLFrEeB/fGqu9Ko3APeuJw0OhojI6P5CB
                        LgDZP4zMcsYdUqswCWAIWRQvFnjUoaP3WwFl8ElX7wPX8E8T1umW9HtOKSs4FzLOUMjooFR4
                        Q89HXPqWKh60enTnxoHAsojJKB6DURg2W3qxb8aJ0HN1ZlCpfoYyFf1CadWixRYnr9vOnNB+
                        rRmvffv9uNs+/fKNR994XiNA5qYW5Szct4Nw3z4K1SjaGoY26Xy6s7DqmihpKx4S5ajS8YkJ
                        QAtkSMXjmIBtFYJWuVONLDovx8pQjO2tQz4vZU7VPh8uE/o/8cc/BGx2oPOTCwlDtjPcgdRa
                        eCvObwzk+SSwPCIWKx4QYgaEuc9Yp1EJa6M8jrp7ht6dML1Xb05i50jqNK+pWbXzKq13Qenb
                        9o3nQ4pTSXCdkV+sr+O+9cB9ezRg208YueIR98tCGpGS/CJmn5XEpx51dke5qeivIoAxyHfI
                        /iHaKgZftuhvhJEvnbRGGeHec1+GlyxRfJ6Pag+eRifTUIoHA3TeGaitJfBjH+ORW1V7C6vS
                        qZ+bBHZMK9kr+mJSu1r096/Mv2WvyXMNqqdHu9xyNgqNH4CG58YT0QKl4/fG/8X2Qtu6QSG/
                        xiqNjINTG5RHXOCc80q49djH1J+NT4CnWuPnbFiJ+Oxq4/LDThgzLwXon/FcQmzPjgp34/n4
                        bDCA4WvuPfdOYJmWwOuKwwz0ESRLsfNbmG9kKSdqQ/TdVOGmCVwzblndOkBz99G/KEA7uaAF
                        T6p4kA4oL+Ic93cBIxMDfTBUB+W8HGVpxQMCvIEf0Uywi0f7u6G86b6gvV/oUDj49cvtayf4
                        tgGuiFG3Gvg86880qfZC6Y5791ccb8H981IEUJ9t+bzQZ/v0l4XPFyidouti9lsp+CgevNeD
                        cM+3jBOXAPX/aH7Od5EKkJeZkul47uNkx2iVL7tQ2XV08gshk3t29kNhu3z/bhui3Sz4jPxa
                        8Psu/ErF+flkBK8UGG3zjqK/Kk4wp9LG4P68h/v0jLFbZaV0RHkV9X+Pdl4ILBrH9CY43Iiy
                        l/un7HlnqV0InITGGj9TNKOfvoIO6QzaHycjClcOpYPmVioNcSJk3t22btCTMepXA7m2dLUx
                        dpCc5Swgt7ttsxI4gWwjrENT3yRhncaMNfLt4LvjPLfDOVb9zie3pj0Zf2wvrMrluidQ9xCf
                        TJuo9yccbjOl8SfgBM9thT6WFmYh5aR0Cs6BS8GP+67fu8CIjAzc1zTcVRj6K5QWYIniwety
                        trHXqVoZhnKdkcXqaMxojI0xYcTJyxnGWm+X9ajLmEzPYxzei+OZIZYR0RaX2jkXMNdX9rPd
                        YN5poHig4w9RkWFjB3j2y/ZY/3QX7ZJrUG/kMuPj//lbal07L1NT84eFixat3bympq1nv4QX
                        TeqxXo1MMzb1eq6ByvX2i43NIssdAPTZ4OT8bj5LCH5HhZPbtLp5yPKy2xXjDerPhgwfGlkw
                        M5qdn0W9I4r5uLj1Saa9vpN9xRC1nKEzncifykFfD1pKLzbWpFzUAoDf8pnneNnXo78gQE6a
                        mem43i9GM1x64diZ4pwRH0R5p9ByM363Dg47ucIdCVTeGitefM5C55iiVesgYZ0zIS99PU4v
                        ZNXCb/gsMZ7Pd0l8OZcKnMsPOLch+GOfGM2EyMtSEC77QU6mnrgyRjN0bTgU7YzC8S6UJ6Na
                        vt39p7vF3sb6av0mz08LWjwIfSu6GftS8YWT2lGuGJdufaKxHvTsc2Un4GInpvmLFplX/vfd
                        811WbeOzzJOhd9u6QUmtpVUMbs2XX1TrFfgZv3i6mp+j+M1FHX41MdY/naU4KNsY+wJdJ4Y4
                        L8aomw1feNIoqvQGp28SHwiaKxkMb27W/zGfzB7GPlT8ok3MZFoGMHYBv24luz0ycNcZPzD+
                        5sy+/Poaa+wSGscJryWVU64r8ytoywDyhoBbJnc1dpk4DlTWz3Cl3lmPuPuFzwmfIy4f8z1H
                        i8OvIrT3ZVxlPAe+CsHJKD25c9FYCxE/IKmE0CLeytjlKpr56bB4RAA5yw1atvgx62OVm2Gs
                        Qp8G1xj7bO0Uo42WxlrfWPgxNw7Hd1F4pGWa951zN+89x/K6rlB5blWkbdadlv0PSykebmJi
                        OGw6ULWOcSLZrGOKTFADPvliox1XaV3frKbG5+V3D5SOUX6iVSU0exVSPBrDwbajyQrkFgC+
                        XEcEaosT53GedTkZHOtKPj5NYDIoG3Buk/HM07oVZ3cJx9PxrpQ9vJ84Z34YMZHkaoGa5btr
                        PSN7thqThLMfffcYJHITj7pUHPc1xS1UiToplgKMkYkYI88aPx+KwaifSvp6N5a5JZ1juZgS
                        EAUuJ27vSgi+aLwcmTPSJEO74kToFPKUibfGFZlp835aE2X0Wsu1lDpWUcYm8bIrI0KF7o3D
                        PQE998dgvDKZV6gHpTGfF/9Jk4de55xcfBT/JgnXtOlcZ+ySSctSy+OQ+lYVxX1M0mL399Bt
                        Z1GpzwitHlLFI2RelkjgHk9yysf9RraDKQ2WGht5Q1y7LUU0NXMLzCpJSpVh4KSpLS7ZdF1J
                        FVo5uretG+SzpbKaKbXiQdPbRYHb5Jr944HbzFCpL9Ul4HmnYzh3lJ1RalnSBOf9DLcVGhsJ
                        MvHQ7RFIynIwxNjlNImTaVQ40U5NoN1ygOOCymA7QZ0nSxGgC30y1gx37NG/slwUaRJd8SA4
                        EW6R5Roo125DmSPz8p8ZMzv9VF8/adlmzaJoHw+hHAmlY37SclUgpVY8LsDY8glclRe094TL
                        sxBnK3Y+Kl7xcDB7JR0FNy+1IGmCsfOs+8jiJLNGicVJRPFwTtjMKk1fjdBWrS99t+GXOy4v
                        CndfSRyRE3cqzQfkpd8aHYkfNuUTCG6p+aZoUi/nNbursSacxF9Ij0yb8dlha61WTPFgiHc6
                        k1bkYE+BUk6kN2JMXZNQ26cbGzl1s8DtVtz6dS5wX+Zxp4+xk1OcHWZNDm6tZiZaY/2OOpVQ
                        lOBLLRm46wTnyN0P5wVuutKfD8b8ucBEW8JgeIAnkhWnMLjPTzkrHlcEysGKJ7N4ZHCBSvgw
                        nudKYmtIt386dctD1mw7t1lNTa5YIpNRTtRYHbEplcWDW7X6JtW42wLH9ViOj44Bm64Wiwev
                        4Ti3F59WzrSSt5UFOPfPce6djY1DwKy0pXhpJz2JcwLll3DI57Cinw/nCzQCf+we4ee3loMj
                        OmT4N2TmzlEqTXF3bsXFT/Egbi/3xTgZ7ldnRLfQ0fUWM2dh/Urvz5774matVsjOvEfLBkMd
                        94PSESQse5XDbbG8j4el1B+3Vp6GMTQ46Y7cS4ITJ7OJSvPG5KOiX6yNodMvriGfP/p3xdmh
                        ERX6aA0xfuGfg0KrDw6X4fypJNMyl/Y20cQsHsTtLmCcJcYKYcDGEAHcquH5oJNpMcWDu1hC
                        RDsNAu71x24JkTv+OJZD7VKVIl9qaYz7ImJsg54oJ5ow8ewb0P/jKWvcVsut/4udlmi2Og8K
                        R2L5EaoN93Lt7nYu0SnTJ3x0VDh5nZRmZk9G0nQP3EnGrs22idlkpZuSl8IlVKs1dnwwo2tS
                        +VQ+QGEUUzqwl1zxyOByWByJa8D1+kuMVWKTjrLKWEeJKh4ZcH5X4dwYR4dxm+LGVqn458NZ
                        ELgLb9MCP3uACVfTkikKTtGsg+x0vOeupm4mvWjB7JsfuEu9+8WKB3GmJH69Dma+BmO3s3Jb
                        2koxhPy5/dlzl5n647y/rLVcy2FQOII6ISo/g/v4NA5Pu7VtJus63PiF3m0MI1jSs/pq9FGS
                        hH3O2W0Azo2hj7mDhuPTZ3cWLX1fh5StqYBrOAuHvu7rnxPwDgGbp/LLLbxX0pqKPg4M2HYw
                        GOUUh10hX3sce7iyYcAuGJyJS4NDjN0NETp9el7cTiZ+OFLx4/PfwbOparB4EFo9CkX1Ltsg
                        gy4FxiG43xy7nK97muT8uDimqXDcQENFrh94KR7ZuInlRJwQ10WZ6GgrYzVolig7YThJMeQ1
                        o6TRqvEUE811nDA6rmhSGJVPmjAribTCDAKzsuD3H8bt0CX264F7SAsWTex7uMIXUdQxwpD1
                        tG4wrsq/yiXBlJPjVJwbHU+5Y+N3xlrp1jeFz41RcPmVcFOMyYDmbOmYmuPZV2Lg/Mfi0NlZ
                        QHoaq8T57nLj9bgPZVijzJgzjexaTSv+k3AwyJqxlo9LcB0YL4bOex1daR+xGY4jmp3HufIc
                        yn/iJNqLi/uIpB9AnQtnz2yijFrNL/tCwagoMzO4MrfTiITFLBeogHN5Kpfvz5imkPuJaVGM
                        zclFXx8m9WR+Nvo1xd1++z9jI1Ez78sjxYKnxVY8MqAjvjAfcGUxODk6p9UaG36aoYN5clQ0
                        KBR/TzPre2lFeCuEy9lRMG9HSnL4RMkL1Td9MZ5whfeP5nXew/bGRp5tY352LM6EweV+9Umo
                        OzNdaWVAPm67HuUKz42WHWr/7Y0dl3wW+BtOhh8zeVqAPjnB3he3nXLBKSB9XHZWhmfmRLWF
                        K7yWdFrkdaW1ieODsR0musJnnZPsxDxt86W1VcKnEATIymB1r2b+jutBSy+vAcPH8xrwXUcl
                        Y54rfL/xORlfzvl+uIPR2I+/xeC8GA6ea95UQHhfqaRwKYE+YlMC5FkqRYJAbyDv9y4vSucc
                        /z00bXni4JbbaQ0e5vKtUNHkBpKM0YDPMzd4cCzz3chnmnX4McX3Pj80aUXhx8Jr+Z7rfPwf
                        RNHnEjk4LCQAAAAASUVORK5CYII=
                    </office:binary-data>
                </draw:image>
            </draw:frame>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard">
                @for(String line : document.getCustomer().toLines())
                <text:span>${line}</text:span>
                @endfor
            </text:p>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Heading">Rechnung Nr. ${document.getInvoiceNumber()}</text:p>
            <text:p text:style-name="Heading">Leistungszeitraum: ${document.getServicePeriod()}</text:p>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard">Für unsere Arbeiten im Rahmen des Projekts CONSULTA stellen wir Ihnen vereinbarungsgemäss folgende Leistungen in Rechnung:</text:p>
            <text:p text:style-name="Standard"/>
            <table:table table:name="Table1" table:style-name="Table1">
                <table:table-column table:style-name="Table1.A" table:number-columns-repeated="3"/>
                <table:table-row table:style-name="TableLine11009323712">
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">Person</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">Ansatz</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="P2">Betrag in CHF</text:p>
                    </table:table-cell>
                </table:table-row>
                <table:table-row table:style-name="TableLine11009346800">
                    @for(InvoiceLine line : document.getInvoiceLines())
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">${line.getPerson()}</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">${line.getText()}</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">${line.getAmount().toString()}</text:p>
                    </table:table-cell>
                    @endfor
                </table:table-row>
                <table:table-row table:style-name="TableLine11009347520">
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Standard">Rechnungsbetrag inkl. MwSt.</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="Table_20_Contents"/>
                    </table:table-cell>
                    <table:table-cell table:style-name="Table1.A1" office:value-type="string">
                        <text:p text:style-name="P2">${document.grandTotal().toString()}</text:p>
                    </table:table-cell>
                </table:table-row>
            </table:table>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard">Zahlbar innert ${document.getPaymentUntil().getDays()} Tagen ab Rechnungsdatum, bis spätestens ${document.paymentDeadline().toString()}.</text:p>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"/>
            <text:p text:style-name="Standard"><draw:frame draw:style-name="fr2" draw:name="Image1" text:anchor-type="char" svg:width="17cm" svg:height="8.5cm" draw:z-index="0"><draw:image draw:mime-type="image/png">
                        <office:binary-data>${document.getEsrBase64()}</office:binary-data>
                    </draw:image>
                </draw:frame></text:p>
        </office:text>
    </office:body>
</office:document>
