global class DailyLeadProcessor Implements Schedulable{
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = null];
        List<lead> leadstoupdate = new List<lead>();
        If(!leads.isEmpty()){
        for(Lead ld:leads){
            ld.LeadSource = 'Dreamforce';
      leadstoupdate.add(ld);       
        }
        update leadstoupdate;
        }
    }
}