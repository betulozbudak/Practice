@isTest 
public class ContactTriggerHandlerTest {
    @isTest
    public static void updateAccountFaxTest() {
        account acc1 = new Account(Name='TestAcc',Fax ='12345');
        insert acc1;
        list<contact> lstC = new list<contact>();
        for(integer i=0; i<10; i++){
            contact c= new Contact();
            c.LastName='lastName' + i;
            c.AccountId =acc1.Id;
            if(i<8){
            c.Fax='1234567';
            }else{
            c.Fax='98765';
            }
            lstC.add(c);
        }
        insert lstC;

        for(integer i=0; i<lstC.size();i++){
            lstC[lstC.size()-1].Main_Contact_Person__c = true;
        }
        
      
        
        update lstC;
        
        test.startTest();
        list<account> checkAcc= [select Id,Fax from Account where Fax = '98765'];
        system.assertEquals(1, checkAcc.size());
        test.stopTest();
    }
}



