import Time "mo:base/Time"
module {

    public type receipt = {
        receiptId: Nat;
        ftCashBoxId : Text;
        ftQueueId: Text;
        ftQueueItemId: Text;
        ftQueueRow: Int;
        cbTerminalId : Text;
        cbReceiptReference: Text;
        ftCashBoxIdentification: Text;
        ftReceiptIdentification: Text;
        ftReceiptMoment: Time.Time;
        ftReceiptHeader : [Text];
        ftChargeItems: [ftChargeItem];
        ftChargeLines: [Text];
        ftPayItems: [ftPayItem];
        ftPayLines: [Text];
        ftSignatures: [ftSignature];
        ftReceiptFooter: [Text];
        ftState: Int;
        ftStateData: Text;
    };

    public type ftChargeItem = {
        position: Int;
        quantity: Int;
        description : Text;
        amount: Int;
        vatRate: Int;
        ftChargeItemCase: Int;
        ftChargeItemCaseData: Text;
        vatAmount: Float;
        accountNumber: Text;
        costCenter: Text;
        productGroup: Text;
        productNumber : Text;
        productBarcode: Text;
        unit: Text;
        unitQuantity : Int;
        unitPrice: Float;
        moment: Time.Time;
    };

    public type ftPayItem ={
        position: Int;
        quantity: Int; 
        description: Text; 
        amount: Float; 
        ftPayItemCase: Int;
        ftPayItemCaseData: Text;
        accountNumber: Text;
        costCenter : Text;
        moneyGroup : Text;
        moneyNumber: Text; 
        moment: Time.Time;
    };

    public type ftSignature = {
        ftSignatureFormat: Int;
        ftSignatureType: Int;
        caption: Text;
        data: Text;
    };

}