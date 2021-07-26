/* 
	MAIN PROFILE 
*/
Profile: ICSRComposition
Parent: Composition
Id: ibm-fda-icsr-composition
Title: "ICSR Composition"
Description: "The fields needed to represent the document metadata of a ICSR Report."

/*
	FIXED FIELDS 
*/
* status = #final
* type = LOINC#85893-6 "Adverse event note"
* title = "ICSR Submission"

/* 
	CONSTRAINTS ON FIELDS 
*/
* date MS
* category 1..1 MS
* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.1"
* subject 1..1 MS
* subject only Reference(ICSRPatient)
* author 1..1 MS
* author only Reference(PractitionerRole or ICSRPatient or RelatedPerson)
* author.extension contains AuthorPrimarySource named primarySource 1..1

/* 
	EXTENSIONS - SEE BELOW FOR DEFINITIONS 
*/
* extension contains FirstReceiveDate named firstReceiveDate 0..1
* extension contains MostRecentDate named mostRecentInfoDate 0..1
* extension contains AdditionalDocumentInformation named additionalDocuments 1..1
* extension contains ExpeditedReport named expeditedReport 1..1
* extension contains CaseIdentifier named otherCaseIdentifier 0..*
* extension contains FirstSenderType named firstSenderType 1..1
* extension contains PreviousCaseIdentifier named previousCaseIdentifier 0..*
* extension contains ReportAmendment named reportAmendment 0..1
* extension contains CombinationProductReport named combinationProductReport 1..1

/* 
	SECTION SLICES 
*/
* section 3..13 MS
* section.code 1..1 MS
* section.title 1..1 MS
* section.text MS
* section.entry MS
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.description = "Slice based on the different sections that are needed in an ICSR document."
* section contains PatientInformation 0..1 and RelevantMedicalHistory 0..1 and RelevantPastDrugHistory 0..1 and 
	InCaseOfDeath 0..1 and ParentInformation 0..1 and ReactionEvent 1..1 and RelevantLabTestResults 0..1 and 
	DrugInformation 1..1 and VAERSVaccines 0..1 and CaseNarrative 1..1 and
	CaseReporterComments 0..1 and CaseSenderDiagnosis 0..1 and CaseSenderComments 0..1 and
	DataSourceInformation 0..1
* section[PatientInformation].code = ICSRSectionCodeCS#PatientInformation
* section[PatientInformation].title = "Patient Information"
* section[PatientInformation].entry only Reference(Observation)
* section[RelevantMedicalHistory].code = ICSRSectionCodeCS#RelevantMedicalHistory
* section[RelevantMedicalHistory].title = "Relevant Medical History"
* section[RelevantMedicalHistory].entry only Reference(Condition)
* section[RelevantPastDrugHistory].code = ICSRSectionCodeCS#RelevantPastDrugHistory
* section[RelevantPastDrugHistory].title = "Relevant Past Drug History"
* section[RelevantPastDrugHistory].entry only Reference(MedicationStatement)
* section[InCaseOfDeath].code = ICSRSectionCodeCS#InCaseOfDeath
* section[InCaseOfDeath].title = "In Case of Death"
* section[InCaseOfDeath].entry only Reference(Observation)
* section[ParentInformation].code = ICSRSectionCodeCS#ParentInformation
* section[ParentInformation].title = "Parent Information"
* section[ParentInformation].entry only Reference(Patient or Condition or MedicationStatement)
* section[ReactionEvent].code = ICSRSectionCodeCS#ReactionEvent
* section[ReactionEvent].title = "Reaction/Event"
* section[ReactionEvent].entry only Reference(VAERSAdverseEvent or FAERSAdverseEvent)
* section[RelevantLabTestResults].code = ICSRSectionCodeCS#RelevantLabTestResults
* section[RelevantLabTestResults].title = "Relevant Lab Test Results"
* section[RelevantLabTestResults].entry only Reference(Observation)
* section[DrugInformation].code = ICSRSectionCodeCS#DrugInformation
* section[DrugInformation].title = "Drug Information"
* section[DrugInformation].entry only Reference(ICSRMedicationAdministration or ICSRImmunization or DeviceUseStatement or ICSRTransfusion)
* section[VAERSVaccines].code = ICSRSectionCodeCS#VAERSVaccines
* section[VAERSVaccines].title = "VAERS Vaccines given within 4 weeks"
* section[VAERSVaccines].entry only Reference(ICSRImmunization)
* section[CaseNarrative].code = ICSRSectionCodeCS#CaseSummaryNarrative
* section[CaseNarrative].title = "Case Summary Narrative"
* section[CaseNarrative].entry 0..0
* section[CaseNarrative].text 1..1
* section[CaseReporterComments].code = ICSRSectionCodeCS#CaseReporterComments
* section[CaseReporterComments].title = "Case Reporter's Comments"
* section[CaseReporterComments].entry 0..0
* section[CaseReporterComments].text 1..1
* section[CaseSenderComments].code = ICSRSectionCodeCS#CaseSenderComments
* section[CaseSenderComments].title = "Case Sender's Comments"
* section[CaseSenderComments].entry 0..0
* section[CaseSenderComments].text 1..1
* section[CaseSenderDiagnosis].code = ICSRSectionCodeCS#CaseSenderDiagnosis
* section[CaseSenderDiagnosis].title = "Case Sender's Diagnosis"
* section[CaseSenderDiagnosis].entry only Reference(Condition)
* section[DataSourceInformation].code = ICSRSectionCodeCS#DataSourceInformation
* section[DataSourceInformation].title = "Information about the Data Source of the AE information"
* section[DataSourceInformation].entry only Reference(AECountObservation or ExposureCountObservation)

/* 
	SAMPLES 
*/
// Sample VAERS Report
Instance: SampleVAERSReport
InstanceOf: ICSRComposition
Title: "Sample ICSR VAERS Report"
Description: "A sample Composition that represents VAERS ICSR header information."
* date = 2020-02-10T17:18:00-05:00
* author = Reference(SampleAuthorRole)
* author.extension[primarySource].valueBoolean = true
* category = ReportType#1 "Spontaneous report"
* identifier.value = "US-IBM-94209fd1-9b0e-1adc-007a-4f5cecb8ce6a"
* subject = Reference(SampleICSRPatient)
* extension[firstReceiveDate].valueDateTime = 2020-02-10T17:18:00-05:00
* extension[mostRecentInfoDate].valueDateTime = 2020-02-10T17:18:00-05:00
* extension[additionalDocuments].extension[availableFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaReportType].valueCodeableConcept = LocalCriteriaReportType#C53578 "Non-Expedited AE"
* extension[otherCaseIdentifier].valueIdentifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.2"
* extension[otherCaseIdentifier].valueIdentifier.value = "US-IBM-aed059ac-ef25-6ded-cce2-a8912d6b76ee"
* extension[firstSenderType].valueCodeableConcept = SenderType#2 "Other"
* extension[previousCaseIdentifier].valueIdentifier.value = "Other-case-identifier"
* extension[previousCaseIdentifier].valueIdentifier.assigner.display = "Case identifier source name"
* extension[reportAmendment].extension[amendmentType].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.5#2
* extension[reportAmendment].extension[amendmentReason].valueString = "Fixed some identifiers"
* extension[combinationProductReport].valueBoolean = false

* section[ReactionEvent].text.status = #generated
* section[ReactionEvent].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No events</div>"
* section[DrugInformation].text.status = #generated
* section[DrugInformation].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No drugs taken</div>"
* section[CaseNarrative].text.status = #generated
* section[CaseNarrative].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><div>No adverse event happened.  Not sure why I'm sending this report.</div><div lang='fr'>il n'y a eu aucun événement indésirable</div></div>"

// Sample FAERS Report
Instance: SampleFAERSReport
InstanceOf: ICSRComposition
Title: "Sample ICSR FAERS Report"
Description: "A sample Composition that represents FAERS ICSR header information."
* date = 2020-02-10T17:18:00-05:00
* author = Reference(SampleAuthorRole)
* author.extension[primarySource].valueBoolean = true
* category = ReportType#1 "Spontaneous report"
* identifier.value = "US-IBM-94209fd1-9b0e-1adc-007a-4f5cecb8ce6a"
* subject = Reference(SampleICSRPatient)
* extension[firstReceiveDate].valueDateTime = 2020-02-10T17:18:00-05:00
* extension[mostRecentInfoDate].valueDateTime = 2020-02-10T17:18:00-05:00
* extension[additionalDocuments].extension[availableFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaReportType].valueCodeableConcept = LocalCriteriaReportType#C53578 "Non-Expedited AE"
* extension[otherCaseIdentifier].valueIdentifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.2"
* extension[otherCaseIdentifier].valueIdentifier.value = "US-IBM-aed059ac-ef25-6ded-cce2-a8912d6b76ee"
* extension[firstSenderType].valueCodeableConcept = SenderType#2 "Other"
* extension[previousCaseIdentifier].valueIdentifier.value = "Other-case-identifier"
* extension[previousCaseIdentifier].valueIdentifier.assigner.display = "Case identifier source name"
* extension[reportAmendment].extension[amendmentType].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.5#2
* extension[reportAmendment].extension[amendmentReason].valueString = "Fixed some identifiers"
* extension[combinationProductReport].valueBoolean = false

* section[ReactionEvent].text.status = #generated
* section[ReactionEvent].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No events</div>"
* section[DrugInformation].text.status = #generated
* section[DrugInformation].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No drugs taken</div>"
* section[CaseNarrative].text.status = #generated
* section[CaseNarrative].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><div>No adverse event happened.  Not sure why I'm sending this report.</div><div lang='fr'>il n'y a eu aucun événement indésirable</div></div>"
* section[DataSourceInformation].entry[0] = Reference(SampleAECountObservation)
* section[DataSourceInformation].entry[1] = Reference(SampleExposureCountObservation)

Instance: SampleAECountObservation
InstanceOf: AECountObservation
Title: "Sample Adverse Event Count Observation"
Description: "An example of an Adverse Event Count Observation"
* valueInteger = 20

Instance: SampleExposureCountObservation
InstanceOf: ExposureCountObservation
Title: "Sample Exposure Count Observation"
Description: "An example of an Exposure Count Observation"
* valueInteger = 25432

Instance: SamplePatientHeight
InstanceOf: PatientHeight
Title: "Sample Patient Height Observation"
Description: "An example of a Patient's Height in cm"
* status = #final
* effectiveDateTime = "2020-02-10"
* valueQuantity = 150 'cm' "cm"
* subject = Reference(SampleICSRPatient)

Instance: SamplePatientWeight
InstanceOf: PatientWeight
Title: "Sample Patient Weight Observation"
Description: "An example of a Patient's Weight in kg"
* status = #final
* effectiveDateTime = "2020-02-10"
* valueQuantity = 120 'kg' "kg"
* subject = Reference(SampleICSRPatient)

Instance: SamplePatientLastMenstrualPeriod
InstanceOf: PatientLastMenstrualPeriod
Title: "Sample Patient Menstrual Period Date Observation"
Description: "An example of a Patient's Last Menstrual Period Date"
* status = #final
* effectiveDateTime = "2020-02-10"
* valueDateTime = "2020-01-25"
* subject = Reference(SampleICSRPatient)

/* 
	EXTENSION DEFINITIONS 
*/
Extension: AuthorPrimarySource
Id: ibm-fda-icsr-ext-authorprimarysource
Description: "Whether an author is the primary source of a composition"
* value[x] only boolean

Extension: FirstReceiveDate
Id: ibm-fda-icsr-ext-firstreceivedate
Description: "The date when the report was first received from the source"
* value[x] only dateTime

Extension: MostRecentDate
Id: ibm-fda-icsr-ext-mostrecentdate
Description: "The date of the most recent information for this report"
* value[x] only dateTime

Extension: CaseIdentifier
Id: ibm-fda-icsr-ext-caseidentifier
Description: "Other identifiers used to identify the ICSR report"
* value[x] only Identifier

Extension: CombinationProductReport
Id: ibm-fda-icsr-ext-combinationproductreport
Description: "A flag to indicate whether the ICSR report is for a combination product"
* value[x] only boolean

Extension: AdditionalDocumentInformation
Id: ibm-fda-icsr-ext-additionaldocumentinformation
Description: "A set of information to indicate what additional documentation exists."
* extension contains availableFlag 1..1 MS and document 0..* MS
* extension[availableFlag].value[x] only boolean
* extension[document].value[x] only Attachment
* extension[document].valueAttachment.contentType MS
* extension[document].valueAttachment.url 1..1 MS
* extension[document].valueAttachment.title 1..1 MS

Extension: ExpeditedReport
Id: ibm-fda-icsr-ext-expeditedreport
Description: "Information on whether the ICSR report meets criteria of an expedited report"
* extension contains localCriteriaFlag 1..1 MS and localCriteriaReportType 1..1 MS
* extension[localCriteriaFlag].value[x] only boolean
* extension[localCriteriaReportType].value[x] only CodeableConcept

Extension: FirstSenderType
Id: ibm-fda-icsr-ext-firstsendertype
Description: "Identifies the type of the first sender of the ICSR report"
* value[x] only CodeableConcept

Extension: PreviousCaseIdentifier
Id: ibm-fda-icsr-ext-previouscaseidentifier
Description: "Previous identifiers used to reference this case"
* value[x] only Identifier
* valueIdentifier.system 1..1
* valueIdentifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.3"
* valueIdentifier.value 1..1 MS
* valueIdentifier.assigner 1..1 MS

Extension: ReportAmendment
Id: ibm-fda-icsr-ext-reportamendment
Description: "Information about report amendments that have been made"
* extension contains amendmentType 1..1 MS and amendmentReason 1..1 MS
* extension[amendmentType].value[x] only CodeableConcept
* extension[amendmentReason].value[x] only string

/*
	COMPOSITION-SPECIFIC OBSERVATIONS
*/
Profile: AECountObservation
Parent: Observation
Id: ibm-fda-icsr-aecountobservation
Description: "Recording the number of Adverse Events that were detected by the algorithm"
* status = #final
* code = DataSourceObservationCodeCS#AdverseEventCount
* value[x] 1..1 MS
* value[x] only integer

Profile: ExposureCountObservation
Parent: Observation
Id: ibm-fda-icsr-exposurecountobservation
Description: "Recording the number of Exposures that were detected by the algorithm"
* status = #final
* code = DataSourceObservationCodeCS#ExposureCount
* value[x] 1..1 MS
* value[x] only integer

/* 
	TERMINOLOGY ARTIFACTS 
*/
CodeSystem: ICSRSectionCodeCS
Title: "ICSR Section Codes Code System"
Description: "Codes for each of the sections in an ICSR report"
* #PatientInformation
* #RelevantMedicalHistory
* #RelevantPastDrugHistory
* #InCaseOfDeath
* #ParentInformation
* #ReactionEvent
* #RelevantLabTestResults
* #DrugInformation
* #VAERSVaccines
* #CaseSummaryNarrative
* #CaseReporterComments
* #CaseSenderDiagnosis
* #CaseSenderComments
* #DataSourceInformation

ValueSet: ICSRSectionCodeVS
Title: "ICSR Section Codes Value Set"
Description: "Codes for each of the sections in an ICSR report"
* codes from system ICSRSectionCodeCS

CodeSystem: DataSourceObservationCodeCS
Title: "ICSR Data Source Observation Codes Code System"
Description: "Codes to describe information about the ICSR data source"
* #AdverseEventCount "Adverse Event Count (Algorithm Numerator)"
* #ExposureCount "Exposure Count (Algorithm Denominator)"
