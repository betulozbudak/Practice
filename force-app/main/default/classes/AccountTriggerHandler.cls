/*1. Whenever a New Account Record is created, an associated Contact Record must be created
automatically. Contact record fields as below:
- Account name as Contact last name
- Account phone as contact phone
2. Write a trigger on the Account when the Account is updated, check all opportunities related to
the account. Update all Opportunity Stage to close lost if stage name not already set to closed
won.
3. Whenever an Account phone number is modified, update all the contacts of the Account as
follows:
- Contacts otherPhone as Old phone no of account
- Contacts mobilePhone as New phone no of Account.*/

public class AccountTriggerHandler {
    public static void accountCreateContact(list<account> triggerNew) {
        list<contact> listCon= new list<contact>();
        for(account acc : triggerNew){
            contact c = new contact();
            c.AccountId = acc.id;
            c.LastName = acc.Name;
            c.Phone =acc.Phone;
            listCon.add(c);
        }
        insert listCon;
    }

    public static void accountUpdatedOpp(list<account> triggerNew ){
        /*set<id> accId = new set<id>();
        for(account eachacc: triggerNew){
            accId.add(eachacc.id);
        }*/
        //set<id> accId2 = triggerNewMap.keyset();
        list<Opportunity> listOpp = [select id, StageName from Opportunity where AccountId in: triggerNew AND StageName!='Closed Won'];
        if(!listOpp.isEmpty()){
            List<Opportunity> listUpdate = new List<Opportunity>();

            for(Opportunity eachOpp : listOpp){
                eachOpp.StageName ='Closed Lost';
                listUpdate.add(eachOpp);
            }
            update listUpdate;
        }
    }

    public static void accountUpdateCon(list<Account> triggerNew, map<id,account> TriggerNewMap,map<id,account> TriggerOldMap ){
        set<id> accId= new set<id>();
        for(account eachacc : triggerNew){
            if(eachacc.Phone !=TriggerOldMap.get(eachacc.id).Phone){
                accId.add(eachacc.Id);             
            }
        }

        list<contact> listCon =[select id, OtherPhone, MobilePhone, AccountId from Contact where AccountId in : accId ];
        if(!listCon.isEmpty()){
            list<contact> listUpdate = new list<contact>();
            for(contact con : listCon){
                con.OtherPhone = TriggerOldMap.get(con.AccountId).Phone;
                con.MobilePhone = TriggerNewMap.get(con.AccountId).Phone;
                listUpdate.add(con);
            }
        update listUpdate;
        }
    }
    /*When the Annual revenue value of an Account is reduced from the previous value then show the
    following message:
    ‘Annual Revenue for an account cannot be reduced’. And do not allow the user to save the record.*/
    public static void accAnnualRevenue(list<account> triggerNew, map<id,account> TriggerOldMap){
        for(Account eachAcc : triggerNew){
            if(eachAcc.AnnualRevenue < TriggerOldMap.get(eachAcc.id).AnnualRevenue || eachAcc.AnnualRevenue == null){
                //eachAcc.AnnualRevenue.addError('Annual Revenue for an account cannot be reduced.');
                eachAcc.AnnualRevenue.addError(label.Annual_Rev);//Custom Label ile yaptik.
            }
        }
    }

    
}





