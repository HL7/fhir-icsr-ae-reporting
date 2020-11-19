Profile: ICSRAdverseEvent
Parent: AdverseEvent
Id: ibm-fda-icsr-adverseevent
Title: "ICSR Adverse Event"
Description: "The fields needed to submit an AdverseEvent for a ICSR Report."

* extension contains AgeAtTimeOfOnset named ageAtTimeOfOnset 0..1
* identifier MS
* actuality MS
* actuality = #actual (exactly)
* category 1..* MS
* encounter MS
* encounter only Reference(USCoreEncounter)
* event 1..1 MS // Restrict the system to MedDRA
* event.coding.system = MedDRA (exactly)
* subject MS
* subject only Reference(ICSRPatient)
* date 0..1 MS
* date.extension contains EventDuration named eventDuration 0..1
* date.extension contains EventEndDate named endDate 0..1
* recorder MS
* recorder only Reference(AuthorPractitioner)
* seriousness 1..1 MS
* seriousness from ICSRSeriousness (required)
* outcome 1..1 MS
* location MS
* location only Reference(USCoreLocation)
* suspectEntity 1..* MS
* suspectEntity.instance MS
* suspectEntity.instance only Reference(ICSRImmunization or ICSRMedicationAdministration)
* suspectEntity.instance.extension contains DeviceUse named deviceUse 0..1 MS
* suspectEntity.causality 1..1 MS
* suspectEntity.causality.productRelatedness 1..1 MS

Profile: VAERSAdverseEvent
Parent: ICSRAdverseEvent
Id: ibm-fda-vaers-adverseevent
Title: "VAERS Adverse Event"
Description: "ICSR Adverse Event with a value set of vaccination-related events"

* event from MedDRAVaccinationAdverseEventVS (extensible)

Profile: FAERSAdverseEvent
Parent: ICSRAdverseEvent
Id: ibm-fda-faers-adverseevent
Title: "FAERS Adverse Event"
Description: "ICSR Adverse Event with a value set of transfusion-related events"

* event from MedDRATransfusionAdverseEventVS (extensible)

// Extension: duration of event
Extension: EventDuration
Id: ibm-fda-icsr-ext-eventduration
Description: "The duration of the adverse event."
* value[x] only Duration

// Extension: end of event
Extension: EventEndDate
Id: ibm-fda-icsr-ext-eventenddate
Description: "When the event ended."
* value[x] only dateTime

Extension: AgeAtTimeOfOnset
Id: ibm-fda-icsr-ext-ageattimeofonset
Description: "The age of the patient when the event occurred."
* value[x] only Age

Extension: DeviceUse
Id: ibm-fda-icsr-ext-deviceuse
Description: "The use of a device that was suspected to cause the adverse event."
* value[x] only Reference(DeviceUseStatement)

// ValueSet: seriousness
ValueSet: ICSRSeriousness
Title: "ICSR Seriousness Codes"
Description: "The set of codes that are used to describe seriousness in ICSR submissions."
* Seriousness#34 "resultsInDeath"
* Seriousness#21 "isLifeThreatening"
* Seriousness#33 "requiresInpatientHospitalization"
* Seriousness#35 "resultsInPersistentOrSignificantDisability"
* Seriousness#12 "congenitalAnomalyBirthDefect"
* Seriousness#26 "otherMedicallyImportantCondition"
* NCIMeta#C53513 "Emergency Room"
* NCIMeta#C16988 "Physician Office"
* NCIMeta#C50414 "Hospitalization Required"
* NCIMeta#C102450 "Prolongation of Hospitalization"
* NCIMeta#C17649 "Other"
