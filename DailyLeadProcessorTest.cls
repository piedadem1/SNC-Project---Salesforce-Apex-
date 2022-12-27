@isTest
private class DailyLeadProcessorTest {
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    static testmethod void testScheduledJob() {
        // Create some out of date Lead records
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead ld = new Lead(FirstName = 'Leadtest0' + i,
                                    LastName = 'Leadtest1' ,
                                    Company = 'Leadtest inc'
                              );
            leads.add(ld);
        }
        insert leads;

        
        Test.startTest();
        // Schedule the test job
        String CRON_EXP = '0 0 18 18 * ? ';
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
    }
}