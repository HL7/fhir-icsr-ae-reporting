Profile: FAERSMessageHeader
Parent: MessageHeader
Id: ibm-fda-icsr-faers-messageheader
Title: "FAERS MessageHeader"
Description: "The fields needed to create a MessageHeader for a FAERS ICSR Report."

* source.endpoint MS
* destination 1..1 MS
* destination.endpoint 1..1 MS
* destination.receiver 1..1 MS
* destination.receiver only Reference(MessageOrganization)
* sender 1..1 MS
* sender only Reference(MessageOrganization or USCorePractitioner)
* focus 0..1 MS
* focus only Reference(ICSRComposition)

Profile: VAERSMessageHeader
Parent: MessageHeader
Id: ibm-fda-icsr-vaers-messageheader
Title: "VAERS MessageHeader"
Description: "The fields needed to create a MessageHeader for a VAERS ICSR Report."

* source.endpoint MS
* destination 1..1 MS
* destination.endpoint 1..1 MS
* sender 1..1 MS
* sender only Reference(MessageOrganization)
* focus 1..1 MS
* focus only Reference(ICSRComposition)


//MessageHeader example
Instance: SampleVAERSMessageHeader
InstanceOf: VAERSMessageHeader
Title: "Sample MessageHeader for VAERS"
Description: "A sample MessageHeader for VAERS ICSR submissions."
* id = "US-IBM-VAERS-fad94c04-29e7-5b37-e535-a8aad123cf9a"
* destination.endpoint = "CBERVAERS"
* source.endpoint = "SENDER-IDENTIFIER"
* sender = Reference(SenderOrganization)
* eventCoding = HL7ActCode#PAT_ADV_EVNT "Patient Adverse Event"
* focus = Reference(SampleVAERSReport)

//MessageHeader example
Instance: SampleFAERSMessageHeader
InstanceOf: FAERSMessageHeader
Title: "Sample MessageHeader for FAERS"
Description: "A sample MessageHeader for FAERS ICSR submissions."
* id = "US-IBM-FAERS-fad94c04-29e7-5b37-e535-a8aad123cf9a"
* destination.endpoint = "CBERVAERS"
* destination.receiver = Reference(ReceiverOrganization)
* source.endpoint = "SENDER-IDENTIFIER"
* sender = Reference(SenderOrganization)
* eventCoding = HL7ActCode#PAT_ADV_EVNT "Patient Adverse Event"
* focus = Reference(SampleVAERSReport)
