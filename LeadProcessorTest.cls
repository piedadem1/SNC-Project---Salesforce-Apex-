@IsTest
public class LeadProcessorTest {
  @TestSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        //Insert 200
        for (Integer i=0; i<200;i++) {
            leads.add(new Lead(Lastname='Lead2'+i, Company='TestLeadRequired'));
        }
        insert leads;
    }
    static testmethod void test() {
        Test.startTest();
        LeadProcessor myLeads = new LeadProcessor();
        Id batchId = Database.executeBatch(myLeads);
        Test.stopTest();
        //after test assert records to condition accordingly
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}