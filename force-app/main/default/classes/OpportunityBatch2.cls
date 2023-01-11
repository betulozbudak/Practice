    public class OpportunityBatch2 implements Database.Batchable <SObject>, Database.stateful{
    /*Write a logic to delete all the opportunities which were updated as closed Lost using BATCH
    apex, also print total number of opportunities DELETED.*/
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        Database.QueryLocator q1 = Database.getQueryLocator([select id, StageName from Opportunity where StageName ='Closed Lost' ]);
        
        return q1;
    }

    public void execute(Database.BatchableContext bc, list<Opportunity> scope){
        
        if(!scope.isEmpty()){
            count+=scope.size();
            delete scope;
            
        }
    }
        
    public void finish(Database.BatchableContext bc){
        system.debug(count);
    }
}


