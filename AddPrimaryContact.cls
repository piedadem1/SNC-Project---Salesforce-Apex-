public class AddPrimaryContact implements Queueable {
    private Contact con;
    private String State;
    
    public AddPrimaryContact(Contact con, String state) {
        this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext context) {
    List<Account> accounts = [Select Id, Name, BillingState, (Select Id, Firstname, Lastname from contacts)FROM Account WHERE BillingState = :state Limit 200];
        
        List<Contact> primaryContacts = new List<Contact>();
        for(Account acc:accounts) {
            Contact c = con.clone();
            c.AccountId = acc.Id;
            primaryContacts.add(c);
        }
        if(primaryContacts.Size() > 0) {
            insert primaryContacts;
        }
  }
    
}