import receiptType "./type";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Result "mo:base/Result";

actor {
  type Result <Ok, Err> = Result.Result<Ok,Err>;
  type Receipt = receiptType.receipt;
  type FtChargeItem = receiptType.ftChargeItem;
  type FtPayItem = receiptType.ftPayItem;
  type FtSignature = receiptType.ftSignature;

  var receiptId : Nat = 0;
  var receipts = HashMap.HashMap<Nat, Receipt>(0, Nat.equal, Hash.hash);

  public func createReceipt(ftCashBoxId: Text, ftQueueId: Text, ftQueueItemId: Text, ftQueueRow: Int, cbTerminalId: Text, cbReceiptReference: Text, ftCashBoxIdentification: Text, ftReceiptIdentification: Text, ftReceiptHeader: [Text], ftChargeLines: [Text], ftPayLines: [Text], ftReceiptFooter: [Text], ftState: Int, ftStateData: Text): async Receipt{
    let receipt : Receipt = {
      receiptId;
      ftCashBoxId;
      ftQueueId;
      ftQueueItemId;
      ftQueueRow;
      cbTerminalId;
      cbReceiptReference;
      ftCashBoxIdentification;
      ftReceiptIdentification;
      ftReceiptMoment = Time.now();
      ftReceiptHeader;
      ftChargeItems = [];//_createChargeItemsArray();
      ftChargeLines;
      ftPayItems = [];//_createPayItemsArray();
      ftPayLines;
      ftSignatures = [];//_createFtSignatureArray();
      ftReceiptFooter;
      ftState;
      ftStateData;
    };
    receipts.put(receiptId, receipt);
    receiptId+=1;
    return receipt;
  };

  public query func getReceipt (id : Nat): async Result<Receipt,Text>{
    switch (receipts.get(id)){
    case(null){
      return #err("There is no receipt with that id");
    }; 
    case(? receipt){
      return #ok(receipt);
    };
  }
  };


  
};