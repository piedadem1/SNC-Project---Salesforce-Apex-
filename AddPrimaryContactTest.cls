@IsTest
public class AddPrimaryContactTest {
  @testSetup
    static void Setup() {
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0;i<50;i++){
            testAccounts.add(new Account(Name='Account ' +i,
                                        BillingState='CA'));
        }
        for(integer j=0;j<50;j++){
            testAccounts.add(new Account(Name='Account '+j,
                                        BillingState='NY'));
        }
        insert testAccounts;
    }
    
    Static testmethod void testQueueable() {
        Contact testContact = new Contact(FirstName='John', LastName='Flow');
        insert testContact;
    // Create our Queueable instance
        AddPrimaryContact addit = new addPrimaryContact(testContact, 'NY');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(addit);
        Test.stopTest();
     // Validate the job ran. 
        System.assertEquals(2, [select count() from Contact where accountId in (Select Id From Account Where BillingState='NY')]); 
        }
    }
