///Kyc Types
enum KYCType { aadhaar, passport, none }

///Medicine Request Journey Flow
enum QuotationRequestFlow { quotation, invoice, license, completed }

enum UploadStep {
  prescription, // step 1 — active on first load
  kyc, // step 2 — unlocks after prescription done
  done, // both completed
}
