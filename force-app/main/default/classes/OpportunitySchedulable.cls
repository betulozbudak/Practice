/*Write a schedulable class to schedule the batch class written in question 1 and schedule the
class to run at 3pm daily.*/
/*Write a schedulable class to schedule the batch class written in question 3 and schedule the
class to run at 1am every Monday.*/
public  class OpportunitySchedulable implements Schedulable {
    public void execute(SchedulableContext sc) {
        //any method and any class can be called.
        Database.executeBatch(new OpportunityBatch2());
      }
}


