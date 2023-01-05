public class OpportunityBatch implements Database.Batchable <SObject>, Database.stateful{
    /*1. Write a logic to Create tasks for all the opportunities other than the closed won or closed lost
and on which there was no activity since last 7 days. Implement using Batch APEX.
Populate the task field values as follows:
Field Value
Subject     Other
Due Date    Today if Opportunity close date is already passed otherwise
            Opportunity Close Date – 2 days.
Comments    Reminder – Please take action on the Opportunity
Related To  Opportunity Id
Assigned To Opportunity Owner Id
Status      In Progress
2. Write a logic to delete all the opportunities which were updated as closed Lost using BATCH
apex, also print total number of opportunities DELETED.*/
    

   
    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        Database.QueryLocator q1 = Database.getQueryLocator([select Id, OwnerId, StageName, LastModifiedDate, CloseDate from Opportunity where StageName NOT IN ('Closed Lost','Closed Lost') AND LastModifiedDate < LAST_N_DAYS:7 ]);
        
        return q1;
    }

    public void execute(Database.BatchableContext bc, list<Opportunity> scope){
        List<task> tskList = new List<Task>();
        for(Opportunity opp : scope){
            task newtsk = new task();
            newtsk.subject='Other';
            newtsk.Description='Reminder – Please take action on the Opportunity';
            newtsk.WhatId=opp.id;
            newtsk.OwnerId=opp.OwnerId;
            newtsk.Status='In Progress';
            if(opp.CloseDate!= date.today()){
                newtsk.ActivityDate = date.today();
            }else{
                newtsk.ActivityDate = opp.CloseDate.addDays(-2);
            }

            tskList.add(newtsk);
        }
        try {
            if(!tskList.isEmpty()){
                insert tskList;
            }
        } catch (Exception ex) {
            system.debug(ex);
        }
               
    }
        
    public void finish(Database.BatchableContext bc){
        system.debug('finish method called.');    
    }


    


}




