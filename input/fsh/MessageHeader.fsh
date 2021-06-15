Profile: FAERSMessageHeader
Parent: USPublicHealthMessageHeader
Id: ibm-fda-icsr-faers-messageheader
Title: "FAERS MessageHeader"
Description: "The fields needed to create a MessageHeader for a FAERS ICSR Report."
* destination.receiver 1..1 MS
* destination.receiver only Reference(MessageOrganization)
* sender only Reference(MessageOrganization)
* focus 1..1 MS
* focus only Reference(ICSRComposition)

Profile: VAERSMessageHeader
Parent: USPublicHealthMessageHeader
Id: ibm-fda-icsr-vaers-messageheader
Title: "VAERS MessageHeader"
Description: "The fields needed to create a MessageHeader for a VAERS ICSR Report."
* sender only Reference(MessageOrganization)
* focus 1..1 MS
* focus only Reference(ICSRComposition)
