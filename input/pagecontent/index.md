### Overview

This FHIR Implementation Guide details a process where adverse event (AE) individual case safety reports (ICSR) are generated from EHR data. There are two main components to this process: detection and reporting.  To support AE detection, this IG includes a set of Clinical Quality Language (CQL) algorithms which can be run on FHIR data.  To support AE reporting, this IG includes a set of profiles that enables the creation of a FHIR-based ICSR report and mappings to ICH ICSR specification (FAERS and VAERS implementation of those specifications).  This work was developed as part of the FDA's Center for Biologic Evaluation and Research (CBER) Biologics Effectiveness and Safety (BEST) initiatve. This IG currently focuses on post-vaccination and post-tranfusion AE reporting.

### Adverse Event Detection and Submission Process

{::options parse_block_html="false" /}
<figure>
  <img src="AE_Process.png" alt="Adverse Event Detection and Submission Process"/>
  <figcaption>Figure 1.1 - Adverse Event Detection and Submission Process</figcaption>
</figure>
{::options parse_block_html="true" /}


#### Detect Adverse Event Case
A system can detect AE cases automatically using the FHIR-based CQL <li><a href="Algorithms.html">algorithms</a></li> referenced in this IG or a practitioner can manually detect AE cases.

#### Generate FHIR AdverseEvent Resource
A system can generate an instance of the FHIR AdverseEvent resource - this action may be preceeded by a practitioner performing a clinical review of the AE case.

#### Generate FHIR-based ICSR Document
A system can generate a FHIR-based ICSR document using the <li><a href="profile_listing.html#common-profiles">Common Profiles</a></li> referenced in this IG.

#### Transform to Applicable VAERS/FAERS ICSR XML Format
A system can further transform the ICSR document to the appropriate XML formal for submission to the FDA FAERS and VAERS systems. This IG provides sample <li><a href="icsr_mappings.html">ICSR Mapping</a></li> XSL transformations.

### Authors

The development of this Implementation Guide was funded by FDA CBER BEST initiative.

* FDA CBER BEST IBM Project Team
* Jean Duteau (mailto: jean@duteaudesign.com)
* Shayan Hobbi (mailto: shayan.hobbi@ibm.com)
* Will Rosenfeld (mailto: wtrosenf@us.ibm.com)
