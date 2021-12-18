Profile: ICSRBundle
Parent: USPublicHealthReportingBundle
Id: icsr-bundle
Title: "ICSR Bundle"
Description: "The fields needed to create a Bundle for an ICSR Report."
* identifier 0..1 MS
* identifier.system = "urn:oid:2.16.840.1.113883.3.989.2.1.3.22"
* entry.resource 1..1 MS
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains Message 1..1 MS and Document 1..1 MS
* entry[Message].resource only ICSRMessageHeader
* entry[Document].resource only ICSRComposition

Instance: MinimumVAERSBundle
InstanceOf: ICSRBundle
Title: "Minimum VAERS Bundle"
Description: "The VAERS Bundle with the minimum set of values."
* identifier.value = "BATCH20200210171800-05006510d41d-281d-7610-cd0d-4b07dcc8f49d"
* timestamp = 2020-02-10T17:18:00.000-05:00
* entry[Message].fullUrl = "Bundle/SampleVAERSMessageHeader"
* entry[Message].resource = SampleVAERSMessageHeader
* entry[1].fullUrl = "Composition/SampleVAERSReport"
* entry[1].resource = SampleVAERSReport

Instance: MinimumFAERSBundle
InstanceOf: ICSRBundle
Title: "Minimum FAERS Bundle"
Description: "The FAERS Bundle with the minimum set of values."
* entry[Message].fullUrl = "Bundle/SampleFAERSMessageHeader"
* entry[Message].resource = SampleFAERSMessageHeader
* entry[1].fullUrl = "Composition/SampleFAERSReport"
* entry[1].resource = SampleFAERSReport
