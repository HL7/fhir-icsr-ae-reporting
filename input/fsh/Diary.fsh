Profile: WithdrawalDiaryEntry
Parent: SHAPEParticipantResponse
* extension[questionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier" (exactly)
* extension[questionnaire].valueIdentifier.value = "Withdrawal" (exactly)
* status = #completed (exactly)
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.description = "Defines the specific questions in a withdrawal diary entry."
* item contains reason 1..1 MS and date 1..1 MS
* item[reason].linkId = "withdrawalReason"
* item[reason].answer 1..1 MS
* item[reason].answer.value[x] only string
* item[date].linkId = "withdrawalDate"
* item[date].answer 1..1 MS
* item[date].answer.value[x] only dateTime

Profile: ClinicalVisitDiaryEntry
Parent: SHAPEParticipantResponse
* extension[ParentQuestionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier" (exactly)
* extension[ParentQuestionnaire].valueIdentifier.value = "ClinicalVisit" (exactly)
* status = #completed (exactly)
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.description = "Defines the specific questions in a clinical visit diary entry."
* item contains reason 1..1 MS and date 1..1 MS and prescription 1..1 MS and device 1..1 MS and gmfcType 1..1 MS and gmfcScore 0..1 MS and assessers 1..1 MS and assesserText 0..1 MS
* item[reason].linkId = "visitReason"
* item[reason].answer 1..1 MS
* item[reason].answer.value[x] only string
* item[date].linkId = "eventDate"
* item[date].answer 1..1 MS
* item[date].answer.value[x] only date
* item[prescription].linkId = "prescription"
* item[prescription].answer 1..1 MS
* item[prescription].answer.value[x] only Coding
* item[prescription].answer.valueCoding from ClinicalVisitPrescriptionAnswer (required)
* item[device].linkId = "device"
* item[device].answer 1..* MS
* item[device].answer.value[x] only Coding
* item[device].answer.valueCoding from ClinicalVisitDeviceAnswer (required)
* item[gmfcType].linkId = "GMFCType"
* item[gmfcType].answer 1..1 MS
* item[gmfcType].answer.value[x] only Coding
* item[gmfcType].answer.valueCoding from ClinicalVisitGMFCTypeAnswer (required)
* item[gmfcScore].linkId = "GMFCScore"
* item[gmfcScore].answer 1..1 MS
* item[gmfcScore].answer.value[x] only string
* item[assessers].linkId = "assessers"
* item[assessers].answer 1..* MS
* item[assessers].answer.value[x] only Coding
* item[assessers].answer.valueCoding from ClinicalVisitAssessersAnswer (required)
* item[assesserText].linkId = "assesserText"
* item[assesserText].answer 1..1 MS
* item[assesserText].answer.value[x] only string

CodeSystem: ClinicalVisitPrescriptionAnswer
* #0 "None"
* #1 "Medication"
* #2 "Non-Medication"
* #3 "Both"
* #4 "Unsure"

ValueSet: ClinicalVisitPrescriptionAnswer
* codes from system ClinicalVisitPrescriptionAnswer

CodeSystem: ClinicalVisitDeviceAnswer
* #0 "None of these"
* #1 "Wheelchair"
* #2 "Walker"
* #3 "Stander"
* #4 "Orthotic braces for hands"
* #5 "Orthotic braces for legs"
* #6 "Other orthotic braces"
* #7 "Eye gaze communication device"
* #8 "DynaVox communication device"
* #9 "Other"
* #10 "Not sure"
* #11 "Not applicable"

ValueSet: ClinicalVisitDeviceAnswer
* codes from system ClinicalVisitDeviceAnswer

CodeSystem: ClinicalVisitGMFCTypeAnswer
* #0 "GMFC-MLD (0-6 scale)"
* #1 "GMFM 88 (0-100 scale)"
* #2 "GMFM 66 (0-100 scale)"
* #3 "Assessment not performed"
* #4 "Not applicable"

ValueSet: ClinicalVisitGMFCTypeAnswer
* codes from system ClinicalVisitGMFCTypeAnswer

CodeSystem: ClinicalVisitAssessersAnswer
* #0 "Medical doctor"
* #1 "Physician assistant"
* #2 "Nurse practitioner"
* #3 "Physical therapist"
* #5 "Other"
* #6 "Not applicable"

ValueSet: ClinicalVisitAssessersAnswer
* codes from system ClinicalVisitAssessersAnswer

Profile: HealthEventDiaryEntry
Parent: SHAPEParticipantResponse
* extension[ParentQuestionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier" (exactly)
* extension[ParentQuestionnaire].valueIdentifier.value = "HealthEvent" (exactly)
* status = #completed (exactly)
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.description = "Defines the specific questions in a health event diary entry."
* item contains healthEvent 1..1 MS and onsetDate 1..1 MS and endDate 1..1 MS and healthEventSpecification 0..1 MS and outcome 1..1 MS and outcomeSpecification 0..1 MS and ongoingStatus 1..1 MS and eventTreatment 1..1 MS and postEventTreatment 1..1 MS and descriptionData 0..1 MS
* item[healthEvent].linkId = "healthEvent"
* item[healthEvent].answer 1..1 MS
* item[healthEvent].answer.value[x] only Coding
* item[healthEvent].answer.valueCoding from HealthEventTypeAnswer (required)
* item[onsetDate].linkId = "onsetDate"
* item[onsetDate].answer 1..1 MS
* item[onsetDate].answer.value[x] only date
* item[endDate].linkId = "endDate"
* item[endDate].answer 1..1 MS
* item[endDate].answer.value[x] only date
* item[healthEventSpecification].linkId = "healthEventSpecification"
* item[healthEventSpecification].answer 1..1 MS
* item[healthEventSpecification].answer.value[x] only string
* item[outcome].linkId = "outcome"
* item[outcome].answer 1..1 MS
* item[outcome].answer.value[x] only Coding
* item[outcome].answer.valueCoding from HealthEventOutcomeAnswer (required)
* item[outcomeSpecification].linkId = "outcomeSpecification"
* item[outcomeSpecification].answer 1..1 MS
* item[outcomeSpecification].answer.value[x] only string
* item[ongoingStatus].linkId = "ongoingStatus"
* item[ongoingStatus].answer 1..1 MS
* item[ongoingStatus].answer.value[x] only Coding
* item[ongoingStatus].answer.valueCoding from HealthEventOngoingStatusAnswer (required)
* item[eventTreatment].linkId = "eventTreament"
* item[eventTreatment].answer 1..1 MS
* item[eventTreatment].answer.value[x] only Coding
* item[eventTreatment].answer.valueCoding from HealthEventTreatmentAnswer (required)
* item[postEventTreatment].linkId = "postEventTreatment"
* item[postEventTreatment].answer 1..1 MS
* item[postEventTreatment].answer.value[x] only Coding
* item[postEventTreatment].answer.valueCoding from HealthEventPostEventTreatmentAnswer (required)
* item[descriptionData].linkId = "descriptionData"
* item[descriptionData].answer 1..1 MS
* item[descriptionData].answer.value[x] only string

CodeSystem: HealthEventTypeAnswer
* #0 "Urinary tract infection (UTI)"
* #1 "Pneumonia"
* #2 "Feeding tube"
* #3 "Ventilator"
* #4 "Seizure"
* #5 "Emergency department visit"
* #6 "Initial or prolonged hospitalization"
* #7 "Persistent or significant disability"
* #8 "Death"
* #10 "Other"

ValueSet: HealthEventTypeAnswer
* codes from system HealthEventTypeAnswer

CodeSystem: HealthEventOutcomeAnswer
* #0 "Recovered"
* #1 "Recovered but with some medical complications"
* #2 "Recovering"
* #3 "Not recovered"
* #4 "Fatal"
* #5 "Unknown"
* #7 "Other"

ValueSet: HealthEventOutcomeAnswer
* codes from system HealthEventOutcomeAnswer

CodeSystem: HealthEventOngoingStatusAnswer
* #0 "Yes"
* #1 "No"

ValueSet: HealthEventOngoingStatusAnswer
* codes from system HealthEventOngoingStatusAnswer

CodeSystem: HealthEventTreatmentAnswer
* #0 "None"
* #1 "Medication"
* #2 "Non-medication"
* #3 "Both"
* #4 "Unsure"

ValueSet: HealthEventTreatmentAnswer
* codes from system HealthEventTreatmentAnswer

CodeSystem: HealthEventPostEventTreatmentAnswer
* #0 "None"
* #1 "Medication"
* #2 "Non-medication"
* #3 "Both"
* #4 "Unsure"

ValueSet: HealthEventPostEventTreatmentAnswer
* codes from system HealthEventPostEventTreatmentAnswer

Instance: GriffWithdrawalDiaryExample
InstanceOf: WithdrawalDiaryEntry
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "1XCSzhgOmp9vP7rzF7NM"
* extension[questionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[questionnaire].valueIdentifier.value = "Withdrawal"
* extension[survey].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[survey].valueIdentifier.value = "N5j9Q997ySvKTNvwjbuh"
* source.identifier.system = "http://ibm.com/fhir/fda/SHAPE/participantId"
* source.identifier.value = "101"
* authored = "2020-10-09T11:11:38-04:00"
* item[reason].answer.valueString = "Done"
* item[date].answer.valueDateTime = "2020-10-09T11:11:30.297-04:00"

Instance: GriffHealthEventDiaryExample
InstanceOf: HealthEventDiaryEntry
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "5jSN6hBGwFK8OX7OZ6wm"
* extension[questionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[questionnaire].valueIdentifier.value = "HealthEvent"
* extension[survey].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[survey].valueIdentifier.value = "N5j9Q997ySvKTNvwjbuh"
* source.identifier.system = "http://ibm.com/fhir/fda/SHAPE/participantId"
* source.identifier.value = "101"
* authored = "2020-10-21T11:49:12-04:00"
* item[healthEvent].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/HealthEventTypeAnswer#6
* item[onsetDate].answer.valueDate = "2020-10-21"
* item[endDate].answer.valueDate = "2020-10-21"
* item[outcome].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/HealthEventOutcomeAnswer#2
* item[ongoingStatus].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/HealthEventOngoingAnswer#1
* item[eventTreatment].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/HealthEventTreatmentAnswer#3
* item[postEventTreatment].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/HealthEventPostEventTreatmentAnswer#4
* item[descriptionData].answer.valueString = "I broke my arm"

Instance: GriffClinicalVisitDiaryExample
InstanceOf: ClinicalVisitDiaryEntry
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "cPHjkrd9rRAPL9oJo5Ar"
* extension[questionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[questionnaire].valueIdentifier.value = "ClinicalVisit"
* extension[survey].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[survey].valueIdentifier.value = "N5j9Q997ySvKTNvwjbuh"
* source.identifier.system = "http://ibm.com/fhir/fda/SHAPE/participantId"
* source.identifier.value = "101"
* authored = "2020-10-09T11:11:22-04:00"
* item[reason].answer.valueString = "Wellness check"
* item[date].answer.valueDate = "2020-09-10"
* item[prescription].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/ClinicalVisitPrescriptionAnswer#1
* item[device].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/ClinicalVisitDeviceAnswer#10
* item[gmfcType].answer.valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/ClinicalVisitGMFCTypeAnswer#1
* item[gmfcScore].answer.valueString = "1"
* item[assessers].answer[0].valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/ClinicalVisitAssessersAnswer#0
* item[assessers].answer[1].valueCoding = http://ibm.com/fhir/fda/icsr/CodeSystem/ClinicalVisitAssessersAnswer#3
