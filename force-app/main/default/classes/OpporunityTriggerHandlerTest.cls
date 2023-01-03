@isTest 
public class OpporunityTriggerHandlerTest {
    @TestSetup
    static void makeData(){
        Account acc= new Account();
        acc.Name='acc';
        Set<Id> accId = new set<id>();
        accId.add(acc.id);

        insert acc;

        

        list<Opportunity> listOpp = new list<Opportunity>();
        
        for(integer i=0; i<10; i++){
            integer n =10000;
            Opportunity opp =new Opportunity();
            opp.Name ='Test' + i;
            opp.Amount= (n + i) ;
            opp.StageName='Closed Won';
            opp.AccountId= acc.Id;
            listOpp.add(opp);
        }
        insert listOpp;

               
        test.startTest();
        OpportunityTriggerHandler.updateHighestAmountOppName(accId);
        test.stopTest();

        list<account> listacc=[select id, Highest_Amount_Opportunity_Name__c from Account];

        system.assertEquals('Test10', listAcc[0].Name);

        
    }
    
}
