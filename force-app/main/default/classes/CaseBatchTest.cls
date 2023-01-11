@istest 
public class CaseBatchTest {
    @TestSetup
    public static void makeData(){
        list<case> caseList= new list<Case>();
        for(integer i=0;i<200;i++){
            case cs= new Case();
            cs.Origin='Web';
            if(i<150){
            cs.Status='New';
            }else{
            cs.Status='Closed';
            }
            caseList.add(cs);
        }
        insert caseList;
    }

    @istest
    public static void testBatchCase(){
        test.startTest();
        CaseBatch cb= new CaseBatch();
        Database.executeBatch(cb);
        test.stopTest();

        list<task> listtsk=[select id,subject,description from task];
        system.assertEquals(150, listtsk.size());
        system.assertEquals('Critical action needed.', listtsk[0].Subject);
        
    }
}

