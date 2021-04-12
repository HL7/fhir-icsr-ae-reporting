### Overview

This FHIR Implementation Guide details a process where EHR FHIR data is analyzed to detect Adverse Events due to biologic products, such as vaccines and blood products.  There are a set of profiles that allow the creation of a FHIR-based ICSR report.  This FHIR-based ICSR report has been mapped to the ICH ICSR specifications, specifically FDA's FAERS and VAERS implementation of those specifications.  To facilitate the detection of Adverse Events, a number of algorithms developed for FDA's Center for Biologic Evaluation and Research (CBER) Biologics Effectiveness and Safety (BEST) initiatve.  A subset of those algorithms are presented in this guide.

### Adverse Event Detection and Submission Process

{::options parse_block_html="false" /}
<figure>
  <img src="AE_Process.png" alt="Adverse Event Detection and Submission Process"/>
  <figcaption>Figure 1.1 - Adverse Event Detection and Submission Process</figcaption>
</figure>
{::options parse_block_html="true" /}


#### Detect Adverse Event Case
Using EHR FHIR Data, a practitioner can manually detect or can use the algorithms defined in this guide to detect specific Adverse Event cases.

#### Generate FHIR AdverseEvent Resource
A practitioner can look at the detected Adverse Event case and confirm an actual Adverse Event and then create an instance of the AdverseEvent resource.

#### Generate FHIR-based ICSR Document
Using the profiles in this Implementation Guide, the a FHIR-based ICSR document can be generated.

#### Transform to applicable VAERS/FAERS ICSR XML format
A mapping document and sample XSL transforms are provided in this Implementation Guide that allows the FHIR-based ICSR document to be transformed into the appropriate XML format to allow for submission to FDA's VAERS or FAERS systems.

### Authors

The development of this Implementation Guide was funded by FDA Center for Biologic Evaluation and Research (CBER) as part of the Biologic Effectiveness and Safety (BEST) initiative.

* FDA CBER BEST IBM Project Team
* Jean Duteau (mailto: jean@duteaudesign.com)
* Shayan Hobbi (mailto: shayan.hobbi@ibm.com)
* Will Rosenfeld (mailto: wtrosenf@us.ibm.com)