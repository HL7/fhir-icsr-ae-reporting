### FHIR ICSR Profiles
This IG specifies two overlapping sets of profiles for formatting an ICSR submission using FHIR resources.  The first set is for a VAERS report that represents an ICSR R3 report as a Bundle of MessageHeaders pointing to a Composition.  The other set is for a FAERS report that represents an ICSR R2 report as just a MessageHeader pointing to a Composition.  Lastly, there is a set of common profiles applicable to both domains.

#### VAERS Profiles
* [VAERS Adverse Event](StructureDefinition-vaers-adverseevent.html) - the Adverse Event profile with a binding to Vaccination-related event codes
* [Immunization](StructureDefinition-icsr-immunization.html)

#### FAERS Profiles
* [FAERS Adverse Event](StructureDefinition-faers-adverseevent.html) - the Adverse Event profile with a binding to Transfusion-related event codes
* [Transfusion](StructureDefinition-icsr-transfusion.html) - the specific fields needed to represent a transfusion procedure
* [Blood Product](StructureDefinition-icsr-bloodproduct.html) - information about the blood product that was used in a transfusion

For transfusions, we have three value sets to represent the specific transfusion and the specific blood product:

* [Transfusion Procedure Codes](ValueSet-TransfusionProcedureCodeVS.html)
* [Blood Product ISBT Codes](ValueSet-ISBTBloodProductCodeVS.html)
* [Convalescent Plasma ISBT Codes](ValueSet-ISBTConvalescentPlasmaCodeVS.html)

#### Common Profiles
* [VAERS Bundle](StructureDefinition-icsr-bundle.html) - representing a minimum set of constraints on a ICSR Report submission - a MessageHeader and a Composition
* [ICSR MessageHeader](StructureDefinition-icsr-messageheader.html) - constraints on MessageHeader to allow for sending of ICSR sender and receiver information
* [Composition](StructureDefinition-icsr-composition.html) - the header of an ICSR report
* ICSR Report Author
  * [Practitioner](StructureDefinition-icsr-authorpractitioner.html)
  * [PractitionerRole](StructureDefinition-icsr-authorpractitionerrole.html)
  * [RelatedPerson](StructureDefinition-icsr-authorrelatedperson.html)
* [Patient](StructureDefinition-icsr-patient.html)
  * [Patient Age Group Observation](StructureDefinition-icsr-patientagegroup.html)
  * [Patient Height (in cm) Observation](StructureDefinition-icsr-patientheight.html)
  * [Patient Weight (in kg) Observation](StructureDefinition-icsr-patientweight.html)
  * [Patient Last Menstrual Period Start Date Observation](StructureDefinition-icsr-patientlastmenstrualperiod.html)
* [Report Submission Organization](StructureDefinition-icsr-messageorganization.html) - represents organizations that are senders/receivers of an ICSR report
* [Adverse Event](StructureDefinition-icsr-adverseevent.html) - the common fields needed to represent an Adverse Event
* [Medication Administration](StructureDefinition-icsr-medicationadministration.html) - the specific fields needed to provide the required detail to report a medication administration
* Algorithm Count Observations
  * [Adverse Event Count Observation](StructureDefinition-icsr-aecountobservation.html) - conveys the number of adverse events detected by the algorithm
  * [Exposure Count Observation](StructureDefinition-icsr-exposurecountobservation.html) - conveys the number of exposures detected by the algorithm

#### Additional Notes
The FHIR profiles conform to the [HL7 FHIR US Core Implementation Guide]({{site.data.fhir.hl7_fhir_us_core}}) where applicable and is subject to change with subsequent releases.  See [Relationship to US-Core](relationship_to_us-core.html) for more information.

#### Must Support Requirements
All of the Profiles include elements that are marked as 'Must Support'.  For the purposes of this guide, Must Support is intended to represent those fields that will be present in the ICSR submission, if applicable to the specific submission instance.  When sending information to the PLR server, client applications SHOULD be able to send any fields marked as Must Support, with the additional expectation that they SHALL send any fields that they collect if they are applicable to the specific submission. 
