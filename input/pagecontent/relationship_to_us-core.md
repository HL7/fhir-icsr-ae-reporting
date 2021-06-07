<p>The profiles in this IG conform to the HL7 FHIR US Core IG where applicable.  Note that the IG will also conform to the forthcoming US Public Health library where applicable.  Below is a summary of the differences between the IG's profiles and US-Core:</p>

<h3><a name="AE Reporting Profiles"></a>AE Reporting Profiles</h3>
<ul>
<li>Patient: Added militaryStatus extension</li>
<li>Practitioner: Added mustSupport to: telecom, address</li>
<li>PractitionerRole: Map from NUCC Provider Role Codes to ICSR codes</li>
<li>Organization:
	<ul>
		<li>Added DepartmentName extension</li>
		<li>Added mustSupport to: type, contact</li>
		<li>Made mandatory: type, contact, address</li>
		<li>Restricted telecom to 1 phone, 1 fax, and/or 1 email</li>
	</ul>
</li>
<li>RelatedPerson: Not in US-Core</li>
<li>MedicationAdministration: Not in US-Core</li>
<li>Medication: US-Core Medication profile is not referenced because it mandates RxNorm and we need to supply NDC codes for medication</li>
<li>Immunization:
	<ul>
		<li>Added ageAtVaccination extension</li>
		<li>Added mustSupport to: manufacturer, location, lotNumber, expirationDate, site, route, doseQuantity</li>
	</ul>
</li>
<li>Procedure: 
	<ul>
		<li>Added extension for BiologicallyDerivedProduct to usedReference</li>
		<li>Added extension for quantity of used item</li>
	</ul>
</li>
<li>BiologicallyDerivedProduct: Not in US-Core</li>
<li>Vital Signs: Used without change for Weight, Height, LastMenstrualPeriod, AgeGroup</li>
<li>AdverseEvent: Not in US-Core</li>
</ul>

<h3><a name="AE Detection Profiles"></a>AE Detection Profiles</h3>
<ul>
	<li>AdverseEvent: Not in US-Core</li>
	<li>Condition: Used without changes</li>
</ul>
