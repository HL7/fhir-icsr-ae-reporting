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
* subject = Reference(BESTPatient)
* date = 2021-01-05
* author = Reference(BESTAuthorRole)
* author.extension[primarySource].valueBoolean = true
* extension[firstReceiveDate].valueDateTime = 2021-01-05
* extension[mostRecentInfoDate].valueDateTime = 2021-01-05
* extension[additionalDocuments].extension[availableFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaReportType].valueCodeableConcept = LocalCriteriaReportType#2 "Non-Expedited AE"
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
* section[DrugInformation].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Description code for blood products: E7003,
Blood group and type: N/A
Blood processing type: Apheresis PLATELETS|ACD-A&gt;PAS-C/XX/20-24C|ResLeu:&amp;lt;5E6|2nd container
</div>"
* section[DrugInformation].entry[0] = Reference(FAERSExampleTransfusion)
* section[DrugInformation].entry[1] = Reference(FAERSEpinephrine)
* section[DrugInformation].entry[2] = Reference(FAERSDiphenhydramine)
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
* telecom[0].system = #email
* telecom[0].value = "admin@admin.com"

Instance: BESTAuthor
InstanceOf: AuthorPractitioner
* name.family = "NI"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "NI"

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
* status = #final

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
* suspectEntity[Transfusion].instance = Reference(FAERSExampleTransfusion)
* suspectEntity[Transfusion].causality.productRelatedness = "Suspect"
* suspectEntity[1].instance = Reference(FAERSEpinephrine)
* suspectEntity[1].causality.productRelatedness = "Concomitant"
* suspectEntity[2].instance = Reference(FAERSDiphenhydramine)
* suspectEntity[2].causality.productRelatedness = "Concomitant"

Instance: FAERSExampleTransfusion
InstanceOf: ICSRTransfusion
Title: "FAERS Suspect Transfusion"
Description: "Sample FAERS Transfusion for Connectathon."
* performedDateTime = 2002-01-09
* subject = Reference(BESTPatient)
* status = #completed
* code = CPT4#36430

Instance: FAERSBloodProduct
InstanceOf: ICSRBloodProduct
* productCode = ISBT#E7003 "Apheresis PLATELETS|ACD-A>PAS-C/XX/20-24C|ResLeu:<5E6|2nd container"

Instance: FAERSEpinephrine
InstanceOf: ICSRMedicationAdministration
Title: "FAERS Epinephrine Administration"
Description: "Epinephrine Administration for Connectathon FAERS report."
* subject = Reference(BESTPatient)
* status = #completed
* medicationCodeableConcept = RxNorm#3992 "Epinephrine"
* effectiveDateTime = 2002-01-09

Instance: FAERSDiphenhydramine
InstanceOf: ICSRMedicationAdministration
Title: "FAERS Diphenhydramine Administration"
Description: "Diphenhydramine Administration for Connectathon FAERS report."
* subject = Reference(BESTPatient)
* status = #completed
* medicationCodeableConcept = RxNorm#3498 "Diphenhydramine"
* effectiveDateTime = 2002-01-09

Instance: ConnectathonFAERSBundle
InstanceOf: FAERSBundle
Title: "FAERS Bundle for Connectathon Sample"
Description: "The FAERS Bundle for the Connecathon sample."
* entry[Message].fullUrl = "MessageHeader/beafb541-3eab-eb9e-1bf1-5fa477d56e77"
* entry[Message].resource = ConnectathonFAERSMessageHeader
* entry[1].fullUrl = "Composition/FAERSExample"
* entry[1].resource = FAERSExample
* entry[2].fullUrl = "Organization/FDA"
* entry[2].resource = FDA
* entry[3].fullUrl = "Organization/BESTPrototype"
* entry[3].resource = BESTPrototype
* entry[4].fullUrl = "PractitionerRole/BESTAuthorRole"
* entry[4].resource = BESTAuthorRole
* entry[5].fullUrl = "Practitioner/BESTAuthor"
* entry[5].resource = BESTAuthor
* entry[6].fullUrl = "Patient/BESTPatient"
* entry[6].resource = BESTPatient
* entry[7].fullUrl = "Observation/BESTPatientAgeGroup"
* entry[7].resource = BESTPatientAgeGroup
* entry[8].fullUrl = "AdverseEvent/FAERSExampleEvent"
* entry[8].resource = FAERSExampleEvent
* entry[9].fullUrl = "Procedure/FAERSExampleTransfusion"
* entry[9].resource = FAERSExampleTransfusion
* entry[10].fullUrl = "BiologicallyDerivedProduct/FAERSBloodProduct"
* entry[10].resource = FAERSBloodProduct
* entry[11].fullUrl = "MedicationAdministration/FAERSEpinephrine"
* entry[11].resource = FAERSEpinephrine
* entry[12].fullUrl = "MedicationAdministration/FAERSDiphenhydramine"
* entry[12].resource = FAERSDiphenhydramine

Instance: ConnectathonVAERSMessageHeader
InstanceOf: VAERSMessageHeader
Title: "Sample MessageHeader for VAERS report for Connecathon"
Description: "MessageHeader for Connectathon VAERS ICSR submission."
* id = "US-IBM-e380bc14-2a03-7b64-c3f5-22daea2aa495"
* meta.lastUpdated = 2021-01-05T14:24:44+05:00
* destination.endpoint = "http://example.org/CBERVAERS"
* source.endpoint = "http://example.org/BEST-Pilot"
* sender = Reference(VAERSSender)
* eventCoding = HL7ActCode#PAT_ADV_EVNT "Patient Adverse Event"
* focus = Reference(VAERSExample)

Instance: VAERSSender
InstanceOf: MessageOrganization
Title: "VAERS Sending Organization"
Description: "Connecathon VAERS Sender"
* extension[departmentName].valueString = "sender department"
* type = OrgType#1 "Pharmaceutical Company"
* active = true
* name = "sender organization"
* telecom[Phone].value = "+01 123 456 78"
* telecom[Fax].value = "+01 123 456 89"
* telecom[Email].value = "email@city.us"
* address.line = "street"
* address.city = "city"
* address.state = "CA"
* address.postalCode = "postcode"
* address.country = "US"
* contact.name.given = "sender gname"
* contact.name.family = "sender fname"
* contact.name.prefix = "sender title"

Instance: VAERSExample
InstanceOf: ICSRComposition
Title: "VAERS Sample ICSR Report"
Description: "Connectathon VAERS Sample Report."
* category = ReportType#1 "Spontaneous report"
* identifier.value = "US-IBM-e380bc14-2a03-7b64-c3f5-22daea2aa495"
* subject = Reference(VAERSPatient)
* date = 2021-01-05T14:24:44+05:00
* category = ReportType#1 "Spontaneous report"
* author = Reference(VAERSAuthorRole)
* author.extension[primarySource].valueBoolean = true
* extension[firstReceiveDate].valueDateTime = 2021-01-05
* extension[mostRecentInfoDate].valueDateTime = 2021-01-05
* extension[additionalDocuments].extension[availableFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaFlag].valueBoolean = false
* extension[expeditedReport].extension[localCriteriaReportType].valueCodeableConcept = LocalCriteriaReportType#2 "Non-Expedited AE"
* extension[otherCaseIdentifier].valueIdentifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.2"
* extension[otherCaseIdentifier].valueIdentifier.value = "US-IBM-e380bc14-2a03-7b64-c3f5-22daea2aa495"
* extension[firstSenderType].valueCodeableConcept = SenderType#1 "Regulator"
* extension[combinationProductReport].valueBoolean = false
* section[RelevantMedicalHistory].text.status = #generated
* section[RelevantMedicalHistory].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Long term (current) use of anticoagulants</div>"
* section[ReactionEvent].text.status = #generated
* section[ReactionEvent].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Developed acute facial nerve paralysis after ED administration of influenza vaccine</div>"
* section[ReactionEvent].entry = Reference(VAERSExampleEvent)

* section[DrugInformation].text.status = #generated
* section[DrugInformation].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ED administration of influenza vaccine</div>"
* section[DrugInformation].entry[0] = Reference(VAERSExampleImmunization)
* section[DrugInformation].entry[1] = Reference(VAERSHydrocortisoneAdministration)

* section[CaseNarrative].text.status = #generated
* section[CaseNarrative].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Header: FDA CBER BEST Automated AE Reporting Prototype Case
BEST Detection Phenotype Algorithm: sharepoint link
BEST Certainty: Definite
BEST Severity: Non-Severe
BEST Causality: Probable
Onset location for reaction:
Preliminary investigation results: Developed acute facial nerve paralysis after ED administration of influenza vaccine;
Reaction Type: vax_bells_palsy;
Illness at Time of Vaccination: 
	1. illness, Problem, Chronic systolic (congestive) heart failure, Date 20170430;
Notes: 
	1. notes, Progress Note - Nurse, Patient Care Documentation, Progress Note : Patient suffered  face weakness  from unknown cause. Patient had idiopathic facial nerve palsy and showed rapid progression. Palsy improved  lot facial paralysis identified., Date 20170423;</div>"

Instance: VAERSAuthorRole
InstanceOf: AuthorPractitionerRole
Title: "VAERS Author Role of ICSR reports"
Description: "The role of the reporter in an ICSR report"
* code = QualificationType#1 "Physician"
* practitioner = Reference(VAERSAuthor)
* organization = Reference(VAERSSender)
* telecom[0].system = #email
* telecom[0].value = "admin@admin.com"
* telecom[1].system = #phone
* telecom[1].value = "3333333333"

Instance: VAERSAuthor
InstanceOf: AuthorPractitioner
* name.given = "asdhj"
* name.family = "Admin"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "NI"
* address.country = "US"

Instance: VAERSPatient
InstanceOf: ICSRPatient
Title: "VAERS Patient for FAERS Sample"
Description: "A sample Patient for the VAERS Sample Report."
* name.family = "LNAME"
* name.given = "FNAME"
* gender = #male
* birthDate = "1955-07-22"
* identifier.system = "http://hl7.org/fhir/sid/us-ssn"
* identifier.value = "123456789"

Instance: VAERSExampleEvent
InstanceOf: VAERSAdverseEvent
Title: "VAERS Sample Event"
Description: "Sample VAERS Event created for Connectathon."
* event = MedDRA#10004223 "Bell's Palsy"
* subject = Reference(VAERSPatient)
* date = 2017-04-23
* seriousness = Seriousness#26
* outcome = http://terminology.hl7.org/CodeSystem/adverse-event-outcome#recovering
* suspectEntity[Immunization].instance = Reference(VAERSExampleImmunization)
* suspectEntity[Immunization].causality.productRelatedness = "Suspect"
* suspectEntity[1].instance = Reference(VAERSHydrocortisoneAdministration)
* suspectEntity[1].causality.productRelatedness = "Concomitant"

Instance: VAERSHydrocortisoneAdministration
InstanceOf: ICSRMedicationAdministration
Title: "VAERS Hydrocortisone Administration"
Description: "Hydrocortisone Administration for Connectathon VAERS report."
* subject = Reference(VAERSPatient)
* status = #completed
* medicationCodeableConcept = RxNorm#197782
* effectiveDateTime = 2017-04-23

Instance: VAERSExampleImmunization
InstanceOf: ICSRImmunization
Title: "VAERS Sample Immunization for Connectathon Sample"
* patient = Reference(VAERSPatient)
* status = #completed
* vaccineCode = NDC#7046101903
* occurrenceDateTime = 2017-04-23
* primarySource = false

Instance: ConnectathonVAERSBundle
InstanceOf: VAERSBundle
Title: "VAERS Bundle for Connectathon Sample"
Description: "The VAERS Bundle for the Connecathon sample."
* identifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.22"
* identifier.value = "BATCH20210105142444-0500533f2636-a404-13c5-10e3-7d293893227a"
* timestamp = 2021-01-05T14:24:44-05:00
* entry[Message].fullUrl = "MessageHeader/US-IBM-e380bc14-2a03-7b64-c3f5-22daea2aa495"
* entry[Message].resource = ConnectathonVAERSMessageHeader
* entry[1].fullUrl = "Composition/VAERSExample"
* entry[1].resource = VAERSExample
* entry[2].fullUrl = "Organization/VAERSSender"
* entry[2].resource = VAERSSender
* entry[3].fullUrl = "PractitionerRole/VAERSAuthorRole"
* entry[3].resource = VAERSAuthorRole
* entry[4].fullUrl = "Practitioner/VAERSAuthor"
* entry[4].resource = VAERSAuthor
* entry[5].fullUrl = "Patient/VAERSPatient"
* entry[5].resource = VAERSPatient
* entry[6].fullUrl = "AdverseEvent/VAERSExampleEvent"
* entry[6].resource = VAERSExampleEvent
* entry[7].fullUrl = "Immunization/VAERSExampleImmunization"
* entry[7].resource = VAERSExampleImmunization
* entry[8].fullUrl = "MedicationAdministration/VAERSHydrocortisoneAdministration"
* entry[8].resource = VAERSHydrocortisoneAdministration
