@IsTest
public class AccountProcessorTest {

    @IsTest
    private static void testCountContacts() {
        Account newAccount = new Account(name='Test Account');
        insert newAccount;
        
        Contact newContact1 = new Contact(FirstName='test1',
                                          LastName='test2',
                                          AccountId=newAccount.Id);
        insert newContact1;
        
        Contact newContact2 = new Contact(FirstName='testone',
                                          LastName='testtwo',
                                          AccountId=newAccount.Id);
        insert newContact2;
        
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(newAccount.Id);
        
        test.StartTest();
        AccountProcessor.countContacts(accountIds);
        Test.StopTest();
    }
}