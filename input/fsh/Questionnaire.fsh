Profile: SHAPESurvey
Parent: Questionnaire
Id: ibm-fda-shape-survey
Title: "SHAPE Survey"
Description: "The fields needed to send a Survey via SHAPE."

* identifier 1..1 MS
* title 1..1 MS
* date 1..1 MS
* status 1..1 MS
* description 1..1 MS
* name 1..1 MS
* item 0..0
* extension contains LockedQuestionnaire named locked 1..1 MS and
	ArchivedQuestionnaire named archived 1..1 MS and
	InformedConsentText named informedConsentText 1..1 MS

Profile: SHAPEQuestionnaire
Parent: Questionnaire
Id: ibm-fda-shape-questionnaire
Title: "SHAPE Questionnaire"
Description: "The fields needed to send a Questionnaire via SHAPE."

* identifier 1..1 MS
* title 1..1 MS
* date 1..1 MS
* status 1..1 MS
* description 1..1 MS
* name 1..1 MS
* item 0..* MS
* item.linkId 1..1 MS
* item.type 1..1 MS
* item.required 1..1 MS
* item.text 1..1 MS
* item.answerOption 0..* MS
* item.answerOption.extension contains AnswerIdentifier named answerIdentifier 0..1 MS and AnswerValue named valueText 0..1 MS
* item.extension contains ItemTitle named title 1..1 MS and
	ItemSASVariableName named sasVariableName 1..1 MS and
	ItemRequiredText named requiredText 0..1 MS and
	http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl named itemControl 0..1 MS and
	ItemRule named itemRule 0..* MS
* extension contains LockedQuestionnaire named locked 1..1 MS and
	ArchivedQuestionnaire named archived 1..1 MS and
	ParentSurvey named parentSurvey 1..1 MS

* item ^slicing.discriminator[0].type = #value
* item ^slicing.discriminator[0].path = "type"
* item ^slicing.rules = #closed
* item ^slicing.description = "Slice based on type to restrict the different types of answers allowed."
* item contains SingleLine 0..* and TextArea 0..* and DateTime 0..* and Choices 0..* and Integers 0..*

* item[SingleLine].type = #string (exactly)
* item[SingleLine].initial 0..1 MS
* item[SingleLine].initial.value[x] only string
* item[SingleLine].initial.valueString MS

* item[TextArea].type = #text (exactly)
* item[TextArea].initial 0..1 MS
* item[TextArea].initial.value[x] only string
* item[TextArea].initial.valueString MS

* item[DateTime].type from DateTimeItemTypes (required)
* item[DateTime].extension contains http://hl7.org/fhir/StructureDefinition/regex named regex 1..1 MS

* item[Choices].type = #choice (exactly)
* item[Choices] ^slicing.discriminator.type = #value
* item[Choices] ^slicing.discriminator.path = "extension('http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl').value"
* item[Choices] ^slicing.rules = #closed
* item[Choices] ^slicing.description = "Slice based on type to restrict the different types of answers allowed."
* item[Choices] contains RadioGroup 0..* MS and Checkbox 0..* MS and Dropdown 0..* MS

* item[Choices][RadioGroup].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
* item[Choices][Checkbox].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
* item[Choices][Dropdown].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down

* item[Integers].type = #integer (exactly)
* item[Integers] ^slicing.discriminator.type = #value
* item[Integers] ^slicing.discriminator.path = "extension('http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl').value"
* item[Integers] ^slicing.rules = #closed
* item[Integers] ^slicing.description = "Slice based on type to restrict the different types of answers allowed."
* item[Integers] contains Slider 0..* MS and Range 0..* MS

* item[Integers][Slider].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#slider
* item[Integers][Slider].extension contains http://hl7.org/fhir/StructureDefinition/minValue  named minValue 1..1 MS and
	http://hl7.org/fhir/StructureDefinition/maxValue named maxValue 1..1 MS and
	http://hl7.org/fhir/StructureDefinition/questionnaire-sliderStepValue named stepValue 1..1 MS and
	SliderShowPin named showPin 1..1 MS and
	SliderShowTicks named showTicks 1..1 MS

* item[Integers][Range].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
* item[Integers][Range].extension contains http://hl7.org/fhir/StructureDefinition/minValue named minValue 1..1 MS and
	http://hl7.org/fhir/StructureDefinition/maxValue named maxValue 1..1 MS 

Profile: SHAPEParticipantResponse
Parent: QuestionnaireResponse
Id: ibm-fda-shape-response
Title: "SHAPE Participant Response"
Description: "The fields needed to convey a participant's response to a SHAPE questionnaire."

* identifier 1..1 MS
* status 1..1 MS
* authored 1..1 MS
* source 1..1 MS
* item 1..* MS
* item.linkId 1..1 MS
* item.answer 1..* MS
* item.answer.value[x] 1..1 MS
* extension contains ParentSurvey named survey 1..1 MS and ParentQuestionnaire named questionnaire 1..1 MS

ValueSet: DateTimeItemTypes
Title: "Item DateTime Types"
* http://hl7.org/fhir/item-type#date
* http://hl7.org/fhir/item-type#dateTime
* http://hl7.org/fhir/item-type#time


Extension: LockedQuestionnaire
Id: extension-lockedQuestionnaire
Description: "Indicates whether a survey or questionnaire has been locked."
* value[x] only boolean

Extension: ArchivedQuestionnaire
Id: extension-archivedQuestionnaire
Description: "Indicates whether a survey or questionnaire has been archived."
* value[x] only boolean

Extension: InformedConsentText
Id: extension-informedConsentText
Description: "The informed consent that a participant has to agree to to be involved in a survey."
* value[x] only markdown

Extension: ParentSurvey
Id: extension-parentSurvey
Description: "The parent survey for the questionnaire or questionnaire response."
* value[x] only Identifier

Extension: ParentQuestionnaire
Id: extension-parentQuestionnaire
Description: "The questionnaire that this response is answering."
* value[x] only Identifier

Extension: ItemTitle
Id: extension-itemTitle
Description: "A title for this item."
* value[x] only string

Extension: ItemSASVariableName
Id: extension-itemSASVariableName
Description: "The variable that this question is mapped to."
* value[x] only string

Extension: ItemRequiredText
Id: extension-itemRequiredText
Description: "Any text that should be displayed about the item being required."
* value[x] only markdown

Extension: AnswerIdentifier
Id: extension-answerIdentifier
Description: "A GUID associated with the answer choice."
* value[x] only string

Extension: AnswerValue
Id: extension-answerValue
Description: "The value associated with this answer choice."
* value[x] only string

Extension: SliderShowPin
Id: extension-sliderShowPin
Description: "Indicates whether the slider control should show a pin or not."
* value[x] only boolean

Extension: SliderShowTicks
Id: extension-sliderShowTicks
Description: "Indicates whether the slider control should show tick marks or not."
* value[x] only boolean

Extension: ItemRule
Id: extension-itemRule
Description: "Provides a set of rules that provide logic on which questions should be navigated to"
* extension contains ruleType 1..1 MS and rule 1..* MS and skipTo 1..1 MS
* extension[ruleType].value[x] only code
* extension[ruleType].valueCode from ItemRuleType (required)
* extension[skipTo].value[x] only string
* extension[rule].extension contains operator 1..1 MS and value 1..1 MS and fact 1..1 MS
* extension[rule].extension[operator].value[x] only code
* extension[rule].extension[operator].valueCode from ItemRuleOperatorType (required)
* extension[rule].extension[value].value[x] only string
* extension[rule].extension[fact].value[x] only string

CodeSystem: ItemRuleType
Title: "Item Rule Type Code System"
* #and "and" "All rules must be true."
* #or "or" "Any rule can be true."

ValueSet: ItemRuleType
Title: "Item Rule Type Value Set"
* codes from system ItemRuleType

CodeSystem: ItemRuleOperatorType
Title: "Item Rule Operator Type Code System"
* #equals "equals"
* #greaterthan "greater than"
* #lessthan "less than"

ValueSet: ItemRuleOperatorType
Title: "Item Rule Operator Type Value Set"
* codes from system ItemRuleOperatorType

Instance: GriffsMustKnowSurvey
InstanceOf: SHAPESurvey
* extension[locked].valueBoolean = true
* extension[archived].valueBoolean = false
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "N5j9Q997ySvKTNvwjbuh"
* title = "test"
* date = "2020-08-26T18:35:56.436Z"
* description = "test"
* name = "Griff's Must Know Survey"
* status = #active
* extension[informedConsentText].valueMarkdown = "test"

Instance: GriffsQuestionnaire
InstanceOf: SHAPEQuestionnaire
* extension[locked].valueBoolean = true
* extension[archived].valueBoolean = false
* date = "2020-09-25T14:55:39.531Z"
* extension[parentSurvey].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/SurveyIdentifier"
* extension[parentSurvey].valueIdentifier.value = "N5j9Q997ySvKTNvwjbuh"
* title = "One Each"
* description = "sdfds"
* name = "A Questionnaire with one Each type of Question"
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "eeHjsy5knYHv4306tp5o"
* status = #active
* item[0].type = #string
* item[0].linkId = "d635f126-e754-3f5b-2cff-f713a3b2e42d"
* item[0].extension[title].valueString = "Single Line Text"
* item[0].required = true
* item[0].text = "Enter some text"
* item[0].extension[requiredText].valueMarkdown = "Please answer this"
* item[0].extension[sasVariableName].valueString = "SLT"
* item[0].initial.valueString = "initial"
* item[0].extension[itemRule][0].extension[rule][0].extension[operator].valueCode = #equals
* item[0].extension[itemRule][0].extension[rule][0].extension[value].valueString = "M"
* item[0].extension[itemRule][0].extension[rule][0].extension[fact].valueString = "profile.gender"
* item[0].extension[itemRule][0].extension[rule][1].extension[operator].valueCode = #greaterThan
* item[0].extension[itemRule][0].extension[rule][1].extension[value].valueString = "2"
* item[0].extension[itemRule][0].extension[rule][1].extension[fact].valueString = "profile.age"
* item[0].extension[itemRule][0].extension[ruleType].valueCode = #and
* item[0].extension[itemRule][0].extension[skipTo].valueString = "338de24c-a7f7-dc10-a314-04e67d4ee839"
* item[0].extension[itemRule][1].extension[rule][0].extension[operator].valueCode = #equals
* item[0].extension[itemRule][1].extension[rule][0].extension[value].valueString = "1"
* item[0].extension[itemRule][1].extension[rule][0].extension[fact].valueString = "currentValue"
* item[0].extension[itemRule][1].extension[rule][1].extension[operator].valueCode = #equals
* item[0].extension[itemRule][1].extension[rule][1].extension[value].valueString = "2"
* item[0].extension[itemRule][1].extension[rule][1].extension[fact].valueString = "currentValue"
* item[0].extension[itemRule][1].extension[ruleType].valueCode = #or
* item[0].extension[itemRule][1].extension[skipTo].valueString = "9249609e-910b-bd25-e041-7ba0514e8cd5"
* item[1].type = #choice
* item[1].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
* item[1].linkId = "1a0ae85b-610e-b782-60de-c6e6b8e5590d"
* item[1].extension[title].valueString = "This is a Radio Group"
* item[1].required = true
* item[1].extension[requiredText].valueMarkdown = "Please select all that apply"
* item[1].extension[sasVariableName].valueString = "RADGRP"
* item[1].text = "Select all that apply"
* item[1].answerOption[0].valueString = "One"
* item[1].answerOption[0].extension[valueText].valueString = "1"
* item[1].answerOption[0].extension[answerIdentifier].valueString = "84d9e19b-6a77-cdbd-a15c-48d8ed9f4e63"
* item[1].answerOption[1].valueString = "Two"
* item[1].answerOption[1].extension[valueText].valueString = "2"
* item[1].answerOption[1].extension[answerIdentifier].valueString = "860f5250-659b-6eb3-21f4-e388d7602b88"
* item[1].answerOption[2].valueString = "Three"
* item[1].answerOption[2].extension[valueText].valueString = "3"
* item[1].answerOption[2].extension[answerIdentifier].valueString = "1f2e203d-7cea-eb06-ffd4-e3560b958f73"
* item[1].answerOption[3].valueString = "Blue"
* item[1].answerOption[3].extension[valueText].valueString = "Blue"
* item[1].answerOption[3].extension[answerIdentifier].valueString = "79e3081c-da79-4da4-9bcc-63cd039df90c"
* item[2].type = #date
* item[2].text = "pick a date"
* item[2].linkId = "a03a6a2c-9218-f00d-91c9-dd03ced47622"
* item[2].required = true
* item[2].extension[requiredText].valueMarkdown = "please answer"
* item[2].extension[sasVariableName].valueString = "DTEPICK"
* item[2].extension[title].valueString = "This is a date picker"
// * item[2].extension[regex].valueString = "[a-zA-Z]{3} \\d{1-2}, \\d{4}"
* item[2].extension[3].url = "http://hl7.org/fhir/StructureDefinition/regex"
* item[2].extension[3].valueString = "[a-zA-Z]{3} \\d{1-2}, \\d{4}"
* item[3].type = #choice
* item[3].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
* item[3].linkId = "9249609e-910b-bd25-e041-7ba0514e8cd5"
* item[3].extension[title].valueString = "This is a multi-select"
* item[3].required = true
* item[3].extension[requiredText].valueMarkdown = "Please select all that apply"
* item[3].extension[sasVariableName].valueString = "CHKBOX"
* item[3].text = "Check all that apply"
* item[3].answerOption[0].valueString = "One"
* item[3].answerOption[0].extension[valueText].valueString = "1"
* item[3].answerOption[0].extension[answerIdentifier].valueString = "989c9b60-6be3-e666-e748-39dbb5b7a2be"
* item[3].answerOption[1].valueString = "Two"
* item[3].answerOption[1].extension[valueText].valueString = "2"
* item[3].answerOption[1].extension[answerIdentifier].valueString = "e14f4ed4-663b-3302-1a62-25c40593f1f8"
* item[3].answerOption[2].valueString = "Not Specified"
* item[3].answerOption[2].extension[valueText].valueString = "NA"
* item[3].answerOption[2].extension[answerIdentifier].valueString = "cc8aa4ee-7667-e3aa-d411-73402e32c9c9"
* item[4].type = #choice
* item[4].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[4].linkId = "f096ad61-7e1a-3494-6660-2292c268bea5"
* item[4].extension[title].valueString = "This is a drop down question"
* item[4].required = true
* item[4].extension[sasVariableName].valueString = "DRPDOWN"
* item[4].text = "Please provide an answer"
* item[4].answerOption[0].valueString = "One"
* item[4].answerOption[0].extension[valueText].valueString = "1"
* item[4].answerOption[0].extension[answerIdentifier].valueString = "e4d6f71b-a1aa-d730-abb1-f28f3a2ba479"
* item[4].answerOption[1].valueString = "Two"
* item[4].answerOption[1].extension[valueText].valueString = "2"
* item[4].answerOption[1].extension[answerIdentifier].valueString = "147e874d-9d0d-98d6-339e-8d5eb0ab392d"
* item[5].type = #integer
* item[5].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#slider
* item[5].linkId = "338de24c-a7f7-dc10-a314-04e67d4ee839"
* item[5].extension[title].valueString = "This is a slider"
* item[5].extension[sasVariableName].valueString = "SLIDE"
* item[5].text = "Please answer this question"
* item[5].required = false
// * item[5].extension[minValue].valueInteger = 1
// * item[5].extension[maxValue].valueInteger = 100
// * item[5].extension[stepValue].valueInteger = 5
// * item[5].extension[showPin].valueBoolean = true
// * item[5].extension[showTicks].valueBoolean = true
* item[5].extension[3].url = "http://hl7.org/fhir/StructureDefinition/minValue"
* item[5].extension[3].valueInteger = 1
* item[5].extension[4].url = "http://hl7.org/fhir/StructureDefinition/maxValue"
* item[5].extension[4].valueInteger = 100
* item[5].extension[5].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-sliderStepValue"
* item[5].extension[5].valueInteger = 5
* item[5].extension[6].url = "http://ibm.com/fhir/fda/icsr/StructureDefinition/extension-sliderShowPin"
* item[5].extension[6].valueBoolean = true
* item[5].extension[7].url = "http://ibm.com/fhir/fda/icsr/StructureDefinition/extension-sliderShowTicks"
* item[5].extension[7].valueBoolean = true
* item[6].type = #text
* item[6].linkId = "3d51b7d8-0fb2-4ab5-6bd1-bdd9842e0f21"
* item[6].extension[title].valueString = "Text Area"
* item[6].required = true
* item[6].text = "Large Text Response"
* item[6].extension[sasVariableName].valueString = "TA"
* item[6].initial.valueString = "Please answer this"
* item[7].type = #integer
* item[7].extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
* item[7].linkId = "338de24c-a7f7-dc10-a314-04e67d4ee839"
* item[7].extension[title].valueString = "This is a range question"
* item[7].extension[sasVariableName].valueString = "RANGE"
* item[7].text = "Guess a number between 1 and 10"
* item[7].required = true
// * item[7].extension[minValue].valueInteger = 1
// * item[7].extension[maxValue].valueInteger = 10
* item[7].extension[3].url = "http://hl7.org/fhir/StructureDefinition/minValue"
* item[7].extension[3].valueInteger = 1
* item[7].extension[4].url = "http://hl7.org/fhir/StructureDefinition/maxValue"
* item[7].extension[4].valueInteger = 100

Instance: GriffsQuestionnaireResponse
InstanceOf: SHAPEParticipantResponse
* identifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* identifier.value = "bXhEuKd1fJXOX2eKuC0Q"
* extension[questionnaire].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[questionnaire].valueIdentifier.value = "eeHjsy5knYHv4306tp5o"
* extension[survey].valueIdentifier.system = "http://ibm.com/fhir/fda/SHAPE/identifier"
* extension[survey].valueIdentifier.value = "N5j9Q997ySvKTNvwjbuh"
* status = #completed
* source.identifier.system = "http://ibm.com/fhir/fda/SHAPE/participantId"
* source.identifier.value = "101"
* authored = "2020-09-25T14:55:39.531Z"
* item[0].linkId = "d635f126-e754-3f5b-2cff-f713a3b2e42d"
* item[0].answer.valueString = "This is a single line text response"
* item[1].linkId = "1a0ae85b-610e-b782-60de-c6e6b8e5590d"
* item[1].answer.valueString = "3"
* item[2].linkId = "a03a6a2c-9218-f00d-91c9-dd03ced47622"
* item[2].answer.valueDate = "2020-09-25"
* item[3].linkId = "9249609e-910b-bd25-e041-7ba0514e8cd5"
* item[3].answer[0].valueString = "One"
* item[3].answer[1].valueString = "Not Specified"
* item[4].linkId = "f096ad61-7e1a-3494-6660-2292c268bea5"
* item[4].answer.valueString = "1"
* item[5].linkId = "338de24c-a7f7-dc10-a314-04e67d4ee839"
* item[5].answer.valueInteger = 41
* item[6].linkId = "3d51b7d8-0fb2-4ab5-6bd1-bdd9842e0f21"
* item[6].answer.valueString = "Large text area.  "
* item[7].linkId = "f7c38dfb-74ce-0cdd-9964-afb91f0893be"
* item[7].answer.valueInteger = 10
