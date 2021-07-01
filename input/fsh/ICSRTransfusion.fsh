Profile: ICSRTransfusion
Parent: USCoreProcedure
Id: ibm-fda-icsr-transfusion
Title: "ICSR Transfusion"
Description: "The common fields needed to represent a transfusion."
* status MS
* code 1..1 MS
* code from TransfusionProcedureCodeVS (extensible)
* subject MS 
* subject only Reference(ICSRPatient)
* reasonCode MS
* extension contains UsedProductAmount named usedProductAmount 0..1
* usedReference.extension contains UsedProduct named usedProduct 0..1

Profile: ICSRBloodProduct
Parent: BiologicallyDerivedProduct
Id: ibm-fda-icsr-bloodproduct
Title: "ICSR Blood Product"
Description: "The common fields needed to represent a blood product used in a transfusion."
* productCategory = #cells (exactly)
* productCode from ISBTBloodProductCodeVS (extensible)
* collection.extension contains DonationIdentificationNumber named donationIdentificationNumber 0..1
* processing MS
* processing.procedure MS

Profile: ICSRConvalescentPlasma
Parent: BiologicallyDerivedProduct
Id: ibm-fda-icsr-convalescentplasma
Title: "ICSR Convalescent Plasma"
Description: "The common fields needed to represent convalescent plasma used in a transfusion."
* productCategory = #fluid (exactly)
* productCode from ISBTConvalescentPlasmaCodeVS (extensible)
* collection.extension contains DonationIdentificationNumber named donationIdentificationNumber 0..1
* processing MS
* processing.procedure MS

Extension: UsedProduct
Id: ibm-fda-icsr-ext-usedproduct
Description: "Include Biologically Derived Product as something that is used in the procedure"
* value[x] only Reference(ICSRBloodProduct or ICSRConvalescentPlasma)

Extension: UsedProductAmount
Id: ibm-fda-icsr-ext-usedproductamount
Description: "Indicates the amount of product (listed in usedReference or usedCode) that was used in the procedure"
* value[x] only Quantity

Extension: DonationIdentificationNumber
Id: ibm-fda-icsr-ext-donationIdentificationNumber
Description: "Indicates the identifier for a donation"
* value[x] only Identifier
