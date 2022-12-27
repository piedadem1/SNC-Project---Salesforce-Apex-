@isTest
Private class AccountManagerTest {
  
    //Test class to get contacts by acccount Id
    @isTest
    static void testGetContactsByAccountId() {
        
        //Start & stop of testing 
    Test.StartTest();
        Id recordId = CreateTestRecord();
    RestRequest request = new RestRequest();
        request.requestUri = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpmethod = 'GET';
        restContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        Test.stopTest();
        
        
        System.assert(thisAccount != null);
        System.Equals('Test record', thisAccount.Name);
    }

  //Helper Method to create test record
    Static Id createTestRecord() {
  
  Account accountTest = new Account(Name='Test record');
    insert accountTest;
    
    Contact contactTest = new Contact(FirstName = 'Joe', LastName = 'M', AccountId=accountTest.Id);
    insert contactTest;
    
  return accountTest.Id;
  }
}