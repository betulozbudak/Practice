public class CaseQueueable implements Queueable{
    //
    public void execute(QueueableContext qc){
        Case cs = new Case();
        cs.Origin='Web';
        cs.Status='New';
        insert cs;
    }
}

