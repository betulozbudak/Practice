@isTest 
public class CaseTriggerTest {
    @isTest
    public static void CsTriggerTest() {
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
        list<case> listCase1= new list<case>();
        for(case c: listCase){
            c.Priority='High';
            listCase1.add(c);
        }
        update listCase1;
    }
}
