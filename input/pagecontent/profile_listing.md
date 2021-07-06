### FHIR ICSR Profiles
This IG specifies two overlapping sets of profiles for formatting an ICSR submission using FHIR resources.  The first set is for a VAERS report that represents an ICSR R3 report as a Bundle of MessageHeaders pointing to a Composition.  The other set is for a FAERS report that represents an ICSR R2 report as just a MessageHeader pointing to a Composition.  Lastly, there is a set of common profiles applicable to both domains.

#### VAERS Profiles
* [VAERS Bundle](StructureDefinition-ibm-fda-icsr-vaers-bundle.html) - representing a set of ICSR report submissions
* [VAERS MessageHeader](StructureDefinition-ibm-fda-icsr-vaers-messageheader.html) - the specific constraints on a VAERS report submission
* [VAERS Adverse Event](StructureDefinition-ibm-fda-vaers-adverseevent.html) - the Adverse Event profile with a binding to Vaccination-related event codes
* [Immunization](StructureDefinition-ibm-fda-icsr-immunization.html)

#### FAERS Profiles
* [FAERS MessageHeader](StructureDefinition-ibm-fda-icsr-faers-messageheader.html) - the specific constraints on a FAERS report submission
* [FAERS Adverse Event](StructureDefinition-ibm-fda-faers-adverseevent.html) - the Adverse Event profile with a binding to Transfusion-related event codes
* [Transfusion](StructureDefinition-ibm-fda-icsr-transfusion.html) - the specific fields needed to represent a transfusion procedure
* [Blood Product](StructureDefinition-ibm-fda-icsr-bloodproduct.html) - information about the blood product that was used in a transfusion

For transfusions, we have three value sets to represent the specific transfusion and the specific blood product:

* [Transfusion Procedure Codes](ValueSet-TransfusionProcedureCodeVS.html)
* [Blood Product ISBT Codes](ValueSet-ISBTBloodProductCodeVS.html)
* [Convalescent Plasma ISBT Codes](ValueSet-ISBTConvalescentPlasmaCodeVS.html)

#### Common Profiles
* [Composition](StructureDefinition-ibm-fda-icsr-composition.html) - the header of an ICSR report
* ICSR Report Author
  * [Practitioner](StructureDefinition-ibm-fda-icsr-authorpractitioner.html)
  * [PractitionerRole](StructureDefinition-ibm-fda-icsr-authorpractitionerrole.html)
  * [RelatedPerson](StructureDefinition-ibm-fda-icsr-authorrelatedperson.html)
* [Patient](StructureDefinition-ibm-fda-icsr-patient.html)
  * [Patient Age Group Observation](StructureDefinition-ibm-fda-icsr-patientagegroup.html)
  * [Patient Height (in cm) Observation](StructureDefinition-ibm-fda-icsr-patientheight.html)
  * [Patient Weight (in kg) Observation](StructureDefinition-ibm-fda-icsr-patientweight.html)
  * [Patient Last Menstrual Period Start Date Observation](StructureDefinition-ibm-fda-icsr-patientlastmenstrualperiod.html)
* [Report Submission Organization](StructureDefinition-ibm-fda-icsr-messageorganization.html) - represents organizations that are senders/receivers of an ICSR report
* [Adverse Event](StructureDefinition-ibm-fda-icsr-adverseevent.html) - the common fields needed to represent an Adverse Event
* [Medication Administration](StructureDefinition-ibm-fda-icsr-medicationadministration.html) - the specific fields needed to provide the required detail to report a medication administration
* Algorithm Count Observations
  * [Adverse Event Count Observation](StructureDefinition-ibm-fda-icsr-aecountobservation.html) - conveys the number of adverse events detected by the algorithm
  * [Exposure Count Observation](StructureDefinition-ibm-fda-icsr-exposurecountobservation.html) - conveys the number of exposures detected by the algorithm

#### Additional Notes
The FHIR profiles conform to the [HL7 FHIR US Core Implementation Guide]({{site.data.fhir.hl7_fhir_us_core}}) where applicable and is subject to change with subsequent releases.  See [Relationship to US-Core](relationship_to_us-core.html) for more information.

### Phenotype Algorithm Value Sets
In order to support the detection adverse event cases for reporting, this IG includes a curated list of value sets. These value sets are comprised of ICD-10-CM and SNOMED codes related to adverse event conditions and symptoms.

| Adverse Event        | Value Set |
| ------------- |:---------:|
| Guillain-Barre Syndrome |[Diagnosis Codes](ValueSet-GBSDiagnosisCodes.html) |
| Immune Thrombocytopenia (ITP) |[Diagnosis Codes](ValueSet-ThrombocytopenicPurpuraDiagnosisCodes.html) |
| Bell's Palsy | [Diagnosis Codes](ValueSet-BellsPalsyDiagnosisCodes.html) |
| Anaphylaxis | [Diagnosis Codes](ValueSet-AnaphylaxisDiagnosisCodes.html) |
| Appendicitis | [Diagnosis Codes](ValueSet-AppendicitisDiagnosisCodes.html) |
| Encephalomyelitis | [Diagnosis Codes](ValueSet-EncephalomyelitisDiagnosisCodes.html) |
| Narcolepsy | [Diagnosis Codes](ValueSet-NarcolepsyDiagnosisCodes.html) |
| Disseminated Intravascular Coagulation (DIC) |[Diagnosis Codes](ValueSet-DICDiagnosisCodes.html) |
| Transverse Myelitis| [Diagnosis Codes](ValueSet-TransverseMyelitisDiagnosisCodes.html) |
| Multisystem Inflammatory Syndrome (MIS)| [Diagnosis Codes](ValueSet-MISDiagnosisCodes.html) |
| Febrile Seizures| [Diagnosis Codes](ValueSet-FebrileSeizureDiagnosisCodes.html) |
| Kawasaki Disease| [Diagnosis Codes](ValueSet-KawasakiDiseaseDiagnosisCodes.html) |
| Non-hemorrhagic Stroke| [Diagnosis Codes](ValueSet-NonhemorrhagicStrokeDiagnosisCodes.html) |
| Hemorrhagic Stroke| [Diagnosis Codes](ValueSet-HemorrhagicStrokeDiagnosisCodes.html) |
| Acute Myocardial Infarction| [Diagnosis Codes](ValueSet-MyocardialInfarctionDiagnosisCodes.html) |
| Myocarditis/Pericarditis| [Diagnosis Codes](ValueSet-MyocarditisDiagnosisCodes.html) |
| Deep Vein Thrombosis| [Diagnosis Codes](ValueSet-DeepVeinThrombosisDiagnosisCodes.html) |
| Pulmonary Embolism| [Diagnosis Codes](ValueSet-PulmonaryEmbolismDiagnosisCodes.html) |
| Influenza Preventable Outcome| [Diagnosis Codes](ValueSet-InfluenzaDiagnosisCodes.html) |
| Covid-19 Preventable Outcome| [Diagnosis Codes](ValueSet-COVID19DiagnosisCodes.html) |
