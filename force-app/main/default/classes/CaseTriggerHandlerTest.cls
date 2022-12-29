@isTest 
public class CaseTriggerHandlerTest {
    @isTest
    public static void checkCaseDescriptionTest(){
        list<case> listCase= new list<case>();
        for (Integer i = 0; i < 200; i++) {
            case cs1=new Case();
            cs1.Origin='Email';
            cs1.Status='New';
            if(i<100){
                cs1.Description='password';
            }else{
                cs1.Description='Yuzden buyuk';
            }
            listCase.add(cs1);
        }
        insert listCase;
        test.startTest();
        list<case> lstcase = [select id from Case];
        system.assertEquals(300, lstcase.size());
        list<case> lstcase1= [select id from Case WHERE Subject='Parent Case may contain secret info, do something NOW'];
        system.assertEquals(100,lstcase1.size());
        test.stopTest();
    }
}

