public class ContactQueableApex implements Queueable{
    //class variable
    public List<Account> listCon;
    //Constructor
    public ContactQueableApex(list<Account> con) {
        listCon = con;//assign parameter
    }

    public void execute(QueueableContext qc){
        for(Account eachAcc : listCon){
            eachAcc.Name +='--FB';
            eachAcc.Description ='Updated with queueable method by FB';
        }
        update listCon;
    }
}
