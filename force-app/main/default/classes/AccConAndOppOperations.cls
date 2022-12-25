public class AccConAndOppOperations {
    /*public static list<account> takeInfo() {
         List<account> listAcc = new List<Account>();
         listAcc = [select id, name, AnnualRevenue, Type, AccountSource FROM Account];
         return listAcc;
    }

    public static void oppWon(string leadSource, string stageName){
        list<Opportunity> listOpp = [select id, name, LeadSource, StageName from Opportunity Where LeadSource = :leadSource AND StageName = :stageName];
        system.debug(listOpp);
    
    }

    public static void annualRevenue(){
        list<account> annualR = [select id, name, AnnualRevenue,(select id, name, amount from Opportunities where StageName= 'Closed Won') from Account WHERE Type ='Customer - Direct' ];
        //system.debug(annualR);
        for(account eachAcc : annualR){
            system.debug('=========');
            system.debug(eachAcc.name + '======' + eachAcc.AnnualRevenue );
            
            //system.debug(eachAcc.Opportunities);
            
        for(Opportunity eachOpp : eachAcc.Opportunities){
                system.debug(eachOpp.name + '====' + eachOpp.amount);
            }
        }
    }

    public static decimal sumOfClosedWon(){
        List<Opportunity> oppList= new List<Opportunity>();
        oppList = [select id, name, StageName, amount from Opportunity where StageName ='Closed Won' AND amount != null];

        decimal sum = 0;
        for(opportunity eachOpp : oppList){
            sum += eachOpp.Amount;
        }
        return sum;
    }
    public static list<account> AccountWonOpp(string stageName){
        list<account> accList= [select id, name from Account where id IN (select Accountid from Opportunity where StageName=: stageName)];
        return accList;
    }
    public static list<account> AccountContact(){
        list<account> accListcont= [select id, name,(select name from Contacts) from Account where id in (select Accountid from Contact)];
        return accListCont;
    }

    public static void createCont(id accId){
        account acc= [select id, name from account where id=: accId];
        contact con1 = new contact();
        con1.LastName=  acc.name;
        con1.AccountId= acc.id;
        insert con1;
        system.debug(con1);
    }
    public static void updateTenOpp(){
        list<opportunity> oppList = [select id, name, amount from Opportunity where amount > 0 order by amount desc limit 10];
        for(opportunity eachOpp: oppList){
            eachOpp.Description = 'This one of the top 10 opp';
        }
        update oppList;
    }
    */
    public static List<Opportunity>  oppCheck(integer n, id accId){
        account accLimit1=[select id,name, Annaualrevenue from account where id =: accId];
        List<Opportunity> oppList = new List<Opportunity>();
            if(n>0){
                for(Integer i=0; i<n; i++){
                    Opportunity opp1 = new <opportunity>();
                    opp1.StageName ='Prospecting';
                    opp1.CloseDate = Date.today().addYears(3);
                    opp1.AccountId=accId;
                    opp1.Name = accLimit1.Name;
                    if(accLimit1.AnnualRevenue != null){
                        opp1.Amount = accLimit1.AnnualRevenue / n;
                    }
                    oppList.add(opp1);
                }
                insert oppList; 
            }else{
                system.debug('Please tell us how mny opportunities needs to be created');
            }
            
            return oppList;
        }
    }    








