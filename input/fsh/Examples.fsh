Instance: ConnectathonFAERSMessageHeader
InstanceOf: FAERSMessageHeader
Title: "Sample MessageHeader for FAERS report for Connecathon"
Description: "MessageHeader for Connectathon FAERS ICSR submission."
* id = "beafb541-3eab-eb9e-1bf1-5fa477d56e77"
* meta.lastUpdated = 2021-01-05T14:14:39+06:00
* destination.endpoint = "http://example.org/ZZFDA"
* destination.receiver = Reference(FDA)
* source.endpoint = "http://example.org/BEST-Pilot"
* sender = Reference(BESTPrototype)
* eventCoding = HL7ActCode#PAT_ADV_EVNT "Patient Adverse Event"
* focus = Reference(FAERSExample)

Instance: FDA
InstanceOf: MessageOrganization
Title: "FAERS FDA Organization"
Description: "How to represent FDA in ICSR FAERS submissions."
* extension[departmentName].valueString = "Office of Surveillance and Epidemiology"
* type = OrgType#2 "Regulatory Authority"
* active = true
* name = "FDA"
* telecom[Email].value = "faersesub@fda.hhs.gov"
* address.line = "10903 New Hampshire Avenue"
* address.city = "Silver Spring"
* address.state = "MD"
* address.postalCode = "20993"
* address.country = "US"
* contact.name.given = "FAERS"

Instance: BESTPrototype
InstanceOf: MessageOrganization
Title: "FAERS BEST Prototype"
Description: "The BEST organization that is sending ICSR submissions."
* active = true
* name = "BEST-Prototype"

Instance: FAERSExample
InstanceOf: ICSRComposition
Title: "FAERS Sample ICSR Report"
Description: "Connectathon FAERS Sample Report."
* category = ReportType#1 "Spontaneous report"
* identifier.value = "BEST_beafb541-3eab-eb9e-1bf1-5fa477d56e77"
* subject = Reference(BESTSamplePatient)
* date = 2021-01-05
* author = Reference(BESTAuthorRole)
* author.extension[primarySource].valueBoolean = true
* extension[firstReceiveDate].valueDateTime = 2021-01-05
* extension[mostRecentInfoDate].valueDateTime = 2021-01-05
* extension[additionalDocuments].extension[availableFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaFlag].valueBoolean = false
* extension[otherCaseIdentifier].valueIdentifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.2"
* extension[otherCaseIdentifier].valueIdentifier.value = "BEST_beafb541-3eab-eb9e-1bf1-5fa477d56e77"
* extension[firstSenderType].valueCodeableConcept = SenderType#2 "Other"
* extension[combinationProductReport].valueBoolean = false
* section[PatientInformation].entry = Reference(BESTPatientAgeGroup)
* section[RelevantMedicalHistory].text.status = #generated
* section[RelevantMedicalHistory].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>NI</div>"
* section[ReactionEvent].text.status = #generated
* section[ReactionEvent].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Allergic transfusion reaction</div>"
* section[ReactionEvent].entry = Reference(FAERSExampleEvent)
* section[DrugInformation].text.status = #generated
* section[DrugInformation].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Description code for blood products: N/A,
Blood group and type: N/A
Blood processing type: N/A
Product available for evaluation: 2
Volume of transfusion: NI</div>"
* section[DrugInformation].entry[0] = Reference(FAERSExampleTransfusion)
* section[CaseNarrative].text.status = #generated
* section[CaseNarrative].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Header: FDA CBER BEST Automated AE Reporting Prototype Case
BEST Detection Phenotype Algorithm: Phenotype link: rules-cd
BEST Certainty: Definite
BEST Severity: Non-Severe
BEST Imputability: Probable
Form Type: 3500
Contact Method: Email
Adverse Event: 1
Center to which the case is being routed to: CBER
Whether the case is being sent to DQRS: false
Whether the report is related to drugs or food/cosmetics: 1
Whether the blood report is of type Transfusion or Collection: 2
Patient Race Code: 2f,
Blood group of patient: N/A,
Onset location for reaction: MedStar Location
Description code for blood products: N/A,
Blood group and type: N/A
Blood processing type: N/A
Product available for evaluation: 2
Volume of transfusion: NI
NHSN Workup: NI
Preliminary investigation results: Developed rash &amp;#38; stridor following transfusion prbc for anemia. Tx with benadryl &amp;#38; epinephrine &amp;#38; sx improved., Adverse Event Type Imputability: Blood Transfusion - Certainty: Definite;
Notes: 
	1. notes, Eval+Plan Note, For admission to Hosp with Dx Anemia.  Transfuse PRBC now., Date 20020109;
	2. notes, Eval+Plan Note, Patient has developed a new maculopapular rash following transfusion. Will give Benadryl 25 mg., Date 20020109;
	3. notes, Eval+Plan Note, New onset Stridor following transfusion. Will give Epinephrine .5mg, and do transfusion Rxn workup, Date 20020109;
	4. notes, Eval+Plan Note, RN note - Administered Benadryl 25mg IV for skin sx. After 30 min pt. reports some improvement in  skin symptoms, Date 20020109
Labs, Vitals, and Tests: 
	1. labs, Diastolic Blood Pressure, 75.918 mm[Hg], Date 20020109;
	2. labs, Systolic Blood Pressure, 123.08 mm[Hg], Date 20020109;
	3. labs, Physical findings of Skin, generalized rash, Date 20020109;
	4. labs, Respiratory status finding, Stridor, Date 20020109;
Illness at Time of Vaccination: 
	1. illness, Problem, Anemia, Date 20020109;</div>"

Instance: BESTAuthorRole
InstanceOf: AuthorPractitionerRole
Title: "BEST Author Role of ICSR reports"
Description: "The role of the reporter in an ICSR report"
* code = QualificationType#1 "Physician"
* practitioner = Reference(BESTAuthor)
* organization = Reference(BESTPrototype)

Instance: BESTAuthor
InstanceOf: AuthorPractitioner
* name.family = "NI"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "NI"
* telecom[0].system = #email
* telecom[0].value = "admin@admin.com"

Instance: BESTPatient
InstanceOf: ICSRPatient
Title: "BEST Patient for FAERS Sample"
Description: "A sample Patient for the FAERS Sample Report."
* name.family = "CM"
* gender = #female
* birthDate = "1999-06-24"
* identifier.system = "http://hl7.org/fhir/sid/us-ssn"
* identifier.value = "123456789"

Instance: BESTPatientAgeGroup
InstanceOf: PatientAgeGroup
Title: "BEST Patient Age Group"
Description: "The age group of the BEST Patient."
* valueCodeableConcept = AgeGroup#5 "Adult"
* subject = Reference(BESTPatient)
* status = #completed

Instance: FAERSExampleEvent
InstanceOf: FAERSAdverseEvent
Title: "FAERS Sample Event"
Description: "Sample FAERS Event created for Connectathon."
* extension[ageAtTimeOfOnset].valueAge = 1 'a'
* event = MedDRA#10066173 "Allergic transfusion reaction"
* subject = Reference(BESTPatient)
* date = 2000-01-01
* date.extension[endDate].valueDateTime = 2019-01-20
* date.extension[eventDuration].valueDuration = 19.05 'a'
* suspectEntity[0].instance = Reference(FAERSExampleTransfusion)
* suspectEntity[0].causality.productRelatedness = "Suspect"

Instance: FAERSExampleTransfusion
InstanceOf: ICSRTransfusion
Title: "FAERS Suspect Transfusion"
Description: "Sample FAERS Transfusion for Connectathon."
* performedDateTime = 2002-01-09
* subject = Reference(BESTPatient)
* status = #completed
* code = CPT4#36430

Instance: ConnectathonFAERSBundle
InstanceOf: FAERSBundle
Title: "FAERS Bundle for Connectathon Sample"
Description: "The FAERS Bundle for the Connecathon sample."
* entry[Message].fullUrl = "Bundle/ConnectathonFAERSMessageHeader"
* entry[Message].resource = ConnectathonFAERSMessageHeader
* entry[1].fullUrl = "Bundle/FAERSExample"
* entry[1].resource = FAERSExample
* entry[2].fullUrl = "Bundle/FDA"
* entry[2].resource = FDA
* entry[3].fullUrl = "Bundle/BESTPrototype"
* entry[3].resource = BESTPrototype
* entry[4].fullUrl = "Bundle/BESTAuthorRole"
* entry[4].resource = BESTAuthorRole
* entry[5].fullUrl = "Bundle/BESTAuthor"
* entry[5].resource = BESTAuthor
* entry[6].fullUrl = "Bundle/BESTPatient"
* entry[6].resource = BESTPatient
* entry[7].fullUrl = "Bundle/BESTPatientAgeGroup"
* entry[7].resource = BESTPatientAgeGroup
* entry[8].fullUrl = "Bundle/FAERSExampleEvent"
* entry[8].resource = FAERSExampleEvent
* entry[9].fullUrl = "Bundle/FAERSExampleTransfusion"
* entry[9].resource = FAERSExampleTransfusion
