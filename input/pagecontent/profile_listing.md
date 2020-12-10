<h3><a name="Profiles"></a>FHIR ICSR Profiles</h3>
<p>This IG specifies two overlapping sets of profiles for formatting an ICSR submission using FHIR resources.  The first set is for a VAERS report that represents an ICSR R3 report as a Bundle of MessageHeaders pointing to a Composition.  The other set is for a FAERS report that represents an ICSR R2 report as just a MessageHeader pointing to a Composition.  Lastly, there is a set of common profiles applicable to both domains.</p>

<h4>VAERS Profiles</h4>
<ul>
	<li><a href="StructureDefinition-ibm-fda-icsr-vaers-bundle.html">VAERS Bundle</a> - representing a set of ICSR report submissions</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-vaers-messageheader.html">VAERS MessageHeader</a> - the specific constraints on a VAERS report submission</li>
	<li><a href="StructureDefinition-ibm-fda-vaers-adverseevent.html">VAERS Adverse Event</a> - the Adverse Event profile with a binding to Vaccination-related event codes</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-immunization.html">Immunization</a></li>
</ul>

<h4>FAERS Profiles</h4>
<ul>
	<li><a href="StructureDefinition-ibm-fda-icsr-faers-messageheader.html">FAERS MessageHeader</a> - the specific constraints on a VAERS report submission</li>
	<li><a href="StructureDefinition-ibm-fda-faers-adverseevent.html">FAERS Adverse Event</a> - the Adverse Event profile with a binding to Transfusion-related event codes</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-transfusion.html">Transfusion</a> - the specific fields needed to represent a transfusion procedure</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-bloodproduct.html">Blood Product</a> - information about the blood product that was used in a transfusion</li>
</ul>
<p>For transfusions, we have three value sets to represent the specific transfusion and the specific blood product: <a href="ValueSet-TransfusionProcedureCodeVS.html">Transfusion Procedure Codes</a>, <a href="ValueSet-ISBTBloodProductCodeVS.html">Blood Product ISBT Codes</a>, and <a href="ValueSet-ISBTConvalescentPlasmaCodeVS.html">Convalescent Plasma ISBT codes</a>.</p>

<h4>Common Profiles</h4>
<ul>
	<li><a href="StructureDefinition-ibm-fda-icsr-composition.html">Composition</a> - the header of an ICSR report</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-patient.html">Patient</a>
		<ul>
			<li><a href="StructureDefinition-ibm-fda-icsr-patientagegroup.html">Patient Age Group Observation</a></li>
			<li><a href="StructureDefinition-ibm-fda-icsr-patientheight.html">Patient Height (in cm) Observation</a></li>
			<li><a href="StructureDefinition-ibm-fda-icsr-patientweight.html">Patient Weight (in kg) Observation</a></li>
			<li><a herf="StructureDefinition-ibm-fda-icsr-patientlastmenstrualperiod.html">Patient Last Menstrual Period Start Date Observation</a></li>
		</ul>
    </li>
	<li><a href="StructureDefinition-ibm-fda-icsr-messageorganization.html">Report Submission Organization</a> - represents organizations that are senders/receivers of an ICSR report</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-adverseevent.html">Adverse Event</a> - the common fields needed to represent an Adverse Event</li>
	<li><a href="StructureDefinition-ibm-fda-icsr-medicationadministration.html">Drug Administration</a> - the specific fields needed to represent a drug administration</li>
</ul>

<h4>Additional Notes</h4>
<p>The FHIR profiles conform to the <a href="{{site.data.fhir.hl7_fhir_us_core}}">HL7 FHIR US Core Implementation Guide</a> where applicable and is subject to change with subsequent releases.  See <a href="relationship_to_us-core.html">Relationship to US-Core</a> for more information.</p>

<h3><a name="AdverseEventValueSetProfiles"></a>Adverse Event Value Sets and Profiles</h3>
<p>In order to support the detection adverse event cases for reporting, this IG includes a curated list of value sets. These value sets are comprised of ICD-10-CM and SNOMED codes related to adverse event conditions and symptoms.  We have also created profiles on Condition and AdverseEvent that bind these value sets to the appropriate element.</p>
<p>Note that the FDA CBER BEST initiative is developing and validating portable computational phenotype algorithms to ensure robust detection of adverse events. Updated references to the value sets (and term sets) used by these algorithms will be added to this IG in the future.</p>

<p>Note that the FDA CBER BEST initiative is developing and validating portable computational phenotype algorithms to ensure robust detection of adverse events. Updated references to the value sets (and term sets) used by these algorithms will be added to this IG in the future.</p>

<h4><a name="Vaccine AE Valuesets"></a>Vaccine AEFI Value Sets</h4>
<ul>
    <li>Anaphylaxis - <a href="ValueSet-AnaphylaxisAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-anaphylaxisevent.html">AdverseEvent profile</a>) and <a href="ValueSet-AnaphylaxisSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-anaphylaxiscondition.html">Condition profile</a>)</li>
    <li>Bell's Palsy - <a href="ValueSet-BellsPalsyAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-bellspalsyevent.html">AdverseEvent profile</a>) and <a href="ValueSet-BellsPalsySymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-bellspalsycondition.html">Condition profile</a>)</li>
    <li>Febrile Seizure - <a href="ValueSet-FebrileSeizureAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-febrileseizureevent.html">AdverseEvent profile</a>) and <a href="ValueSet-FebrileSeizureSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-febrileseizurecondition.html">Condition profile</a>)</li>
    <li>Fever - <a href="ValueSet-FeverAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-feverevent.html">AdverseEvent profile</a>) and <a href="ValueSet-FeverSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-fevercondition.html">Condition profile</a>)</li>
    <li>Guillain-Barre Syndrome - <a href="ValueSet-GuillainBarreAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-guillainbarreevent.html">AdverseEvent profile</a>) and <a href="ValueSet-GuillainBarreSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-guillainbarrecondition.html">Condition profile</a>)</li>
    <li>Intussusception - <a href="ValueSet-IntussusceptionAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-intussusceptionevent.html">AdverseEvent profile</a>) and <a href="ValueSet-IntussusceptionSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-intussusceptioncondition.html">Condition profile</a>)</li>
    <li>Thrombocytopenia - <a href="ValueSet-ThrombocytopeniaAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-thrombocytopeniaevent.html">AdverseEvent profile</a>) and <a href="ValueSet-ThrombocytopeniaSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-thrombocytopeniacondition.html">Condition profile</a>)</li>
    <li>Vaccine Reaction - <a href="ValueSet-VaccineReactionAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-vaccinereactionevent.html">AdverseEvent profile</a>) and <a href="ValueSet-VaccineReactionSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-vaccinereactioncondition.html">Condition profile</a>)</li>
</ul>

<h4><a name="Transfusion AE Valuesets"></a>Transfusion AE Value Sets</h4>
<ul>
    <li>TACO - <a href="ValueSet-TACOAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-tacoevent.html">AdverseEvent profile</a>) and <a href="ValueSet-TACOSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-tacocondition.html">Condition profile</a>)</li>
    <li>TAD - <a href="ValueSet-TADAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-tadevent.html">AdverseEvent profile</a>) and <a href="ValueSet-TADSymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-tadcondition.html">Condition profile</a>)</li>
    <li>TRALI - <a href="ValueSet-TRALIAdverseEventVS.html">Adverse Event</a> (<a href="StructureDefinition-ibm-fda-tralievent.html">AdverseEvent profile</a>) and <a href="ValueSet-TRALISymptomVS.html">Symptoms</a> (<a href="StructureDefinition-ibm-fda-tralicondition.html">Condition profile</a>)</li>
</ul>

