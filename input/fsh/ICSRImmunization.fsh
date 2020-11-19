Profile: ICSRImmunization
Parent: USCoreImmunization
Id: ibm-fda-icsr-immunization
Title: "ICSR Immunization"
Description: "The fields needed to submit an Immunization for a ICSR Report."

* extension contains AgeAtVaccination named ageAtVaccination 0..1
* status = #completed (exactly)
* patient only Reference(ICSRPatient)
* manufacturer MS
* location MS
* location only Reference(USCoreLocation)
* lotNumber MS
* expirationDate MS
* site MS
* route MS
* doseQuantity MS
* vaccineCode from VaccineCodeVS (extensible)


Extension: AgeAtVaccination
Id: ibm-fda-icsr-ext-ageatvaccination
Description: "The patient's age when the vaccination was given."
* value[x] only Age
