public class GSAPI {
  
    @AuraEnabled
  public static String appendRowbyID(string contactId) {
    Contact singleContact = [SELECT Id,firstname,lastname,Google_Sync__c,Email FROM contact WHERE id=:contactId];
    String returnBody;
    if(singleContact.Google_Sync__c != null) 
    {
    HttpRequest req = new HttpRequest();
    req.setEndpoint('GET Callout:GoogleSheetAPI/v4/spreadsheets/1q7UWebB4YxpoRzHEIiZChBSE-mt-g4RzW330ZCpLfGc/values/{A4:D4}:append');
  req.setHeader('Accept', 'application/json');
  req.setHeader('Content-Type', 'application/json');
  req.setMethod('POST');
  Map<String, Contact> con = (Map<String, Contact>) singleContact.get('id'+'firstname'+'lastname'+'Google_Sync__c'+'Email');
     //String jsonString = '@{''"ROWS":'['A' + Id + ':B' +firstname+ ':c' +lastname+ ':D' + Google_Sync__c'}';     
    String jsonString = '{'+
    '"majorDimension": "ROWS:, '+
    '"values":['+
    '["'+singleContact.Id+'","'+singleContact.FirstName+'","'+singleContact.LastName+'","'+singleContact.Google_Sync__c+'","'+singleContact.Email+'"]'+
    '],'+
        '"range": "GoogleSheetsAPI"'+
        '}';                         
        System.debug('JSON Request Body'+jsonString);
    req.SetBody(jsonString);
    Http https = new Http();
    HTTPResponse res = https.send(req);
    System.debug('JSON Request Body'+res.getBody());
      if (res.getStatusCode() == 200) {
    System.debug('Request Successfull');
    singleContact.Google_Sync__c = true;
    update singleContact;
    System.debug('Successfull Synced'+res.getBody());
    return returnBody = 'Contact Updated, Contact Successfully Synced';
    }
      else {
      System.debug('Sync Failed'+res.getBody());
      returnBody = 'Sync Failed';
    }
    }
    else {
      System.debug('Already Synced');
      returnBody = 'Already Synced';
    }
    System.debug('Returned Contact Body');
    return returnBody;
  }
 }