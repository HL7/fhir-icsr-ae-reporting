### Phenotype Algorithm Overview 

A computable phenotype is a clinical condition or characteristic that can be ascertained by means of a computerized query to an electronic health record (EHR) system or clinical data repository using a defined set of data elements and logical expressions<sup>1</sup>. 

This implementation guide contains FHIR CQL queries for phenotypes that can be used to identify cases for review and reporting using data available in FHIR formats.  In addition, it includes code lists that are used by each algorithm to identify different pieces of evidence (conditons, immunizations, etc.) of adverse event or biologic product in the EHR's structured or unstructured data.

Reference:
 1. <a href="https://sites.duke.edu/rethinkingclinicaltrials/ehr-phenotyping/">EHR Phenotyping from Duke University</a>

#### Claims Comparable

These algorithms are named “claims comparable” because they are designed to mimic phenotypes built by epidemiologists on medical claim data sources. These phenotypes are limited to using data that would be available in those sources including condition diagnoses (ICD-10), immunizations (NDC, CPT, RxNorm), and encounter data. The algorithm consists of codelists to identify the adverse event and vaccine exposure combined with additional logic requiring the adverse event to occur during a post vaccination risk window and not have the adverse event diagnosis initially be made during a clean window prior to the vaccine exposure.

The claims comparable algorithms utilize interoperable codes and condition, encounter, and immunization data elements to identify potential adverse events following immunizations (AEFIs).  In a FHIR Server, these algorithms query the following resources: Condition, Immunization, Procedure, and Encounter. 

##### Logic Overview
These algorithms apply rules-based claims-comparable algorithm logic. These phenotypes are built using interoperable condition diagnoses (ICD-10, SNOMED-CT), immunization (NDC, CPT, RxNorm) data, and encounter type (Inpatient, Outpatient, etc.) data. These phenotypes can be used to find incident cases of adverse events or a case observed in the risk window of a vaccine exposure. 

The components of the phenotype algorithms include:

* **Vaccination** - Exposure is defined as receipt of a vaccination of interest, as identified interoperable codes (NDC, RxNorm, CPT).
* **Risk window** - The length of the period after an identified vaccine exposure to observe an adverse event outcome. Risk windows will be defined on an outcome-by-outcome basis.
* **Clean window** -  For each case observed within the risk window of interest, a clean window restriction will be implemented to identify incident cases more accurately. The clean window requirement is met if there are no condition diagnosis codes found prior to the vaccine exposure date, within the length of the clean window. Clean windows will also be defined on an outcome-by-outcome basis and are listed in the Algorithm Overview table. 
* **Care Setting** - For each diagnosis that meets risk/clean window requirements, a care setting filter will be applied to the encounter relating to the diagnosis. The included care setting types are defined in the Algortihm Overivew table, in the "Care Setting" column.  
* **Positive Diagnosis** - Phenotype algorithms will make a positive diagnoses when they find a code in the specified codelists in the vaccine risk windows. The clean window will be implemented to exclude cases with historical diagnoses prior to the exposure.

<p align="center"><img width="100%" src="phenotype_overview.png" /></p>

#### **FHIR CQL Queries**

Clinical Quality Language (CQL) is an HL7 language standard that is meant to be human readable and structured enough to run the logic specified in the file. For more information on CQL, you can visit the [HL7 CQL site](https://cql.hl7.org). 

There are many projects being developed for [CQL implementation](https://cql.hl7.org/10-c-referenceimplementations.html).

### Algorithms 

The following tables list the available phenotypes for each algorithm type. The tables include links to the relevant CQL file for that algorithm, as well as the location of codelists or termsets (if applicable) used to develop the algorithm. 

| Adverse Event        | FHIR CQL File| Codelists |
| ------------- |:-----:|:---------:|
| Guillain-Barre Syndrome | [CQL](cql_files/gbs.cql) |[Diagnosis Codes](ValueSet-GBSDiagnosisCodes.html) |
| Immune Thrombocytopenia (ITP) | [CQL](cql_files/thrombocytopenic_purpura.cql) |[Diagnosis Codes](ValueSet-ThrombocytopenicPurpuraDiagnosisCodes.html) |
| Bell's Palsy | [CQL](cql_files/bells_palsy.cql) |[Diagnosis Codes](ValueSet-BellsPalsyDiagnosisCodes.html) |
| Anaphylaxis | [CQL](cql_files/anaphylaxis.cql) |[Diagnosis Codes](ValueSet-AnaphylaxisDiagnosisCodes.html) |
| Appendicitis | [CQL](cql_files/appendicitis.cql) |[Diagnosis Codes](ValueSet-AppendicitisDiagnosisCodes.html) |
| Encephalomyelitis | [CQL](cql_files/encephalomyelitis.cql) |[Diagnosis Codes](ValueSet-EncephalomyelitisDiagnosisCodes.html) |
| Narcolepsy | [CQL](cql_files/narcolepsy.cql) |[Diagnosis Codes](ValueSet-NarcolepsyDiagnosisCodes.html) |
| Disseminated Intravascular Coagulation (DIC) | [CQL](cql_files/disseminated_intravascular_coagulation.cql) |[Diagnosis Codes](ValueSet-DICDiagnosisCodes.html) |
| Transverse Myelitis| [CQL](cql_files/transverse_myelitis.cql)|[Diagnosis Codes](ValueSet-TransverseMyelitisDiagnosisCodes.html) |
| Multisystem Inflammatory Syndrome (MIS)|  [CQL](cql_files/mis.cql) | [Diagnosis Codes](ValueSet-MISDiagnosisCodes.html) |
| Febrile Seizures| [CQL](cql_files/febrile_seizure.cql) | [Diagnosis Codes](ValueSet-FebrileSeizureDiagnosisCodes.html) |
| Kawasaki Disease| [CQL](cql_files/kawasaki_disease.cql)| [Diagnosis Codes](ValueSet-KawasakiDiseaseDiagnosisCodes.html) |
| Non-hemorrhagic Stroke| [CQL](cql_files/non_hemorrhagic_stroke.cql) | [Diagnosis Codes](ValueSet-NonhemorrhagicStrokeDiagnosisCodes.html) |
| Hemorrhagic Stroke| [CQL](cql_files/hemorrhagic_stroke.cql) | [Diagnosis Codes](ValueSet-HemorrhagicStrokeDiagnosisCodes.html) |
| Acute Myocardial Infarction| [CQL](cql_files/acute_myocardial_infarction.cql) | [Diagnosis Codes](ValueSet-MyocardialInfarctionDiagnosisCodes.html) |
| Myocarditis/Pericarditis| [CQL](cql_files/myocarditis.cql) | [Diagnosis Codes](ValueSet-MyocarditisDiagnosisCodes.html) |
| Deep Vein Thrombosis| [CQL](cql_files/deep_vein_thrombosis.cql) | [Diagnosis Codes](ValueSet-DeepVeinThrombosisDiagnosisCodes.html) |
| Pulmonary Embolism| [CQL](cql_files/pulmonary_embolism.cql) | [Diagnosis Codes](ValueSet-PulmonaryEmbolismDiagnosisCodes.html) |
| Influenza Preventable Outcome| [CQL](cql_files/influenza_effectiveness.cql)  | [Diagnosis Codes](ValueSet-InfluenzaDiagnosisCodes.html) |
| Covid-19 Preventable Outcome| [CQL](cql_files/covid_19_effectiveness.cql) | [Diagnosis Codes](ValueSet-COVID19DiagnosisCodes.html) |
