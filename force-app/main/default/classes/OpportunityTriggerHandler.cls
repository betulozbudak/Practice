public class OpportunityTriggerHandler {
    @future
    public static void updateHighestAmountOppName(set<id> accIds){
       list<Account> listAcc =[select id, Highest_Amount_Opportunity_Name__c, (select id, name , Amount from Opportunities where Amount != null order by Amount Desc ) from Account where id in: accIds ];
       list<account> upList = new list<account>();
       for(Account eachAcc : listAcc){
          if(!eachAcc.Opportunities.isEmpty()){
            eachAcc.Highest_Amount_Opportunity_Name__c = eachAcc.Opportunities[0].Name;
          }else{
            eachAcc.Highest_Amount_Opportunity_Name__c = null;
          }
          upList.add(eachAcc);
       }
       update upList;
    }

    @future
    public static void updateTargetAmountAchievedOpportunityName(set<id> accIds){
        list<account> listAcc= [select id, Target_Amount__c,Target_Amount_Achieved_Opportunity_Name__c	,(select id, StageName, Amount, Name from Opportunities where StageName ='Closed Won' AND Amount!= null ORDER BY Amount Desc) from Account where id in: accIds];
        list<account> upAcc = new list<account>();
        for(Account eachAcc : listAcc){
            if(!eachAcc.Opportunities.isEmpty() && eachAcc.Target_Amount__c < eachAcc.Opportunities[0].Amount){
               eachAcc.Target_Amount_Achieved_Opportunity_Name__c = eachAcc.Opportunities[0].Name;
            }else{
               eachAcc.Target_Amount_Achieved_Opportunity_Name__c = null;
            }
            upAcc.add(eachAcc);
        }
        update upAcc;
    }

    @future
    public static void updateTotalAmountGen(set<id> accIds){
        list<account> listAcc= [select id, Total_amount_Generated__c , (select id, Amount,StageName from Opportunities WHERE StageName ='Closed Won' AND Amount != null) from Account];
        list<account> upAcc = new List<Account>();
         for(Account eachAcc : listAcc){
           if(!eachAcc.Opportunities.isEmpty()){
              decimal sum = 0;
              for(Opportunity eachOpp : eachAcc.Opportunities){
                  sum += eachOpp.Amount;
              }
              eachAcc.Total_amount_Generated__c = sum ;
           }else{
              eachAcc.Total_amount_Generated__c = null;
           }
           upAcc.add(eachAcc);
        }
        update upAcc;
    }
}

