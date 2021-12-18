### Scope

This FHIR Implementation Guide details a process where adverse event (AE) individual case safety reports (ICSR) are generated from EHR data. The ICSR data elements are detailed in the International Council for Harmonisation of Technical Requirements for Pharmaceuticals for Human Use (ICH) ICSR specifications and are used by the FDA in two systems: the FDA Adverse Event Reporting System (FAERS) and the Vaccine Adverse Event Reporting System (VAERS).
In this guide, there are two main components to the generation process: detection and reporting. To support AE detection, this IG includes a set of Clinical Quality Language (CQL) algorithms which can be run on FHIR data. To support AE reporting, this IG includes a set of profiles that enables the creation of a FHIR-based ICSR report and mappings to ICH ICSR specification (FAERS and VAERS implementation of those specifications). This work was developed as part of the FDA's Center for Biologic Evaluation and Research (CBER) Biologics Effectiveness and Safety (BEST) initiatve. This IG currently focuses on post-vaccination and post-tranfusion AE reporting.

### Rationale
Adverse events due to biological products are underreported to regulatory authorities and the data reported may not always contain adequate information for decision-making.  Use of EHR FHIR data could improve reporting of adverse events and minimize the burden of identification on practitioners.

### Dependencies
This IG depends on:
* <a href="{{site.data.fhir.hl7_fhir_us_core}}">US Core</a>
* <a href="{{site.data.fhir.hl7_fhir_us_medmorph}}/2021Jan/index.html">Making EHR Data More available for Research and Public Health (MedMorph)</a>

### Adverse Event Detection and Submission Workflow
We consider the AE Detection and Submission workflow to be a type of <a href="{{site.data.fhir.hl7_fhir_us_medmorph}}/2021Jan/usecases.html#data-submission-workflow">MedMorph's Data Submission Workflow</a>.

NOTE: The diagram below is a UML activity diagram.  The <<use>> stereotypes indicate data that is used by the associated activity.  If the arrow is pointing to the activity, then the activity is reading that data.  If the arrow is pointing away from the activity, then the activity is generating that data.
{::options parse_block_html="false" /}
<figure>
  <img src="AE_Process.png" alt="Adverse Event Detection and Submission Process"/>
  <figcaption>Figure 1.1 - Adverse Event Detection and Submission Process</figcaption>
</figure>
{::options parse_block_html="true" /}


#### Detect Adverse Event Case
A system can detect AE cases automatically using the FHIR-based CQL <a href="algorithms.html">algorithms</a> referenced in this IG.

#### Confirm Adverse Event
Once an Adverse Event has been detected, a practitioner can review the relevant data and confirm that it is an actual Adverse Event that should be reported.

#### Generate AdverseEvent Resource
Once an Adverse Event has been confirmed or if a practitioner manually determines there is an Adverse Event to report, a system can generate an instance of the FHIR AdverseEvent resource.

#### Generate FHIR-based ICSR Document
A system can generate a FHIR-based ICSR document using the <a href="profile_listing.html">profiles</a> referenced in this IG.

#### Transform to applicable ICSR XML format
A system can further transform the ICSR document to the appropriate XML formal for submission to the FDA FAERS and VAERS systems. This IG provides sample <a href="icsr_mappings.html">ICSR Mapping</a> XSL transformations.

### FHIR Safety Requirements
As with implementations of FHIR and FHIR Implementation Guides, implementers should consult the <a href="{{site.data.fhir.path}}/safety.html">FHIR Implementer's Safety Check List</a> in the core FHIR specification.

### Authors

The development of this Implementation Guide was funded by FDA CBER BEST initiative.

* FDA CBER BEST IBM Project Team
* Jean Duteau (mailto: jean@duteaudesign.com)
* Shayan Hobbi (mailto: shayan.hobbi@ibm.com)
* Will Rosenfeld (mailto: wtrosenf@us.ibm.com)