public class ContactTriggerHandler {
    
    //27 ARALIK Assignment//
    public static void updateNoOfContacts(list<contact> triggerNew,map<id,contact> triggerNewMap){
         set<id> accIds = new set<id>();
         for(contact eachcon : triggerNew){
            accIds.add(eachcon.AccountId);
         }
         if(!accIds.isEmpty()){
            numberOfContacts(accIds);
         }
    }

    @future
    public static void numberOfContacts(set<id> accIds){

        List <Account> allAccount = [select Id, Number_of_Contacts__c,(select Id, LastName, AccountId from Contacts) from Account where Id in:accIds ];
        
        for (account eachacc : allAccount){
            eachacc.Number_of_Contacts__c = eachacc.Contacts.size();
            accIds.add(eachacc.Id);
                               
        }
        update allAccount;
    }
    
    /*public static void updateAccountFax(list<contact> triggerNew, map<id,Contact> triggerOldMap){
        set<id> accIds = new set<id>();
        for(contact eachcnt : triggerNew){
            if(eachcnt.Main_Contact_Person__c != triggerOldMap.get(eachcnt.Id).Main_Contact_Person__c && eachcnt.Main_Contact_Person__c == true){
                accIds.add(eachcnt.AccountId);
            }
        }

        if(!accIds.isEmpty()){
            List<Account> listAcc = [select Id, Fax, (select id,Fax from Contacts where Main_Contact_Person__c = true) from Account where Id in: accIds];
            list<account>  acclst = new List<Account>();
                for(account eachAcc: listAcc){
                    eachAcc.Fax = eachAcc.Contacts[0].Fax;
                    acclst.add(eachAcc);
                }
            update acclst;
        }
    }*/
}

    




