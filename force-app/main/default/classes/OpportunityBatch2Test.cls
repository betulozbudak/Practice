@istest 
public class OpportunityBatch2Test {
    @TestSetup
    public static void makeData(){
        list<opportunity> listopp= new List<Opportunity>();
        for(integer i=0; i<200; i++){
            Opportunity opp= new Opportunity();
              opp.Name= 'Batch Test' + i;
              opp.CloseDate= date.today();
              if(i<50){
                opp.StageName='Closed Lost';
              }else{
                opp.StageName='Closed Won';
              }
              listopp.add(opp);
        }
        insert listopp;
    }

    @istest 
    public static void textExecute(){
        OpportunityBatch2 oppBatch = new OpportunityBatch2();
        test.startTest();
        Database.executeBatch(oppBatch);
        test.stopTest();

        list<opportunity> oppList=[select id, StageName from Opportunity];
        system.assertEquals(150, oppList.size());
        system.assert(oppList[0].StageName=='Closed Won');

    }
    @istest
    public static void testSchedulable(){
         OpportunitySchedulable oppSch= new OpportunitySchedulable();
         test.startTest();
         id jobId = system.schedule('delClosedLost',' 0 0 15 1/1 * ? * ', oppSch);
         test.stopTest();
         CronTrigger ct= [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID];
         system.assertEquals('2023-01-12 15:00:00',string.valueOf(ct.NextFireTime));

    }
}

