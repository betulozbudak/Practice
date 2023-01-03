trigger OpportunityTrigger on Opportunity (before insert, after insert, before update,after update,after delete, after undelete) {
    /*Create future methods which takes in the set of Account Ids and do the following tasks:
A. Update the "Highest Amount Opportunity Name" field at Account level with the
opportunity Name which have the Highest amount among the opportunities related to
the account.
B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
Closed Won Opportunity Name. Populate the opportunity name which have highest
value in Amount field, and it should be more than 'Target Amount' field value at account.
C. Update the 'Total Amount Generated' at Account with the total of Amount for all the
closed Won Opportunities related to an Account.
Please Note: Above updates should happen whenever any of the following event occurs:
i. Amount field is Updated at Opportunity level.
ii. Opportunity stageName is changed.
iii. Opportunity is reparented i.e AccountId field value is changed.
iv. A new Opportunity is created and tagged to an account.
v. An Opportunity is deleted or undeleted */

    set<id> accIds = new set<id>();
    if(trigger.isAfter){
        
        if(trigger.isInsert || trigger.isUndelete){
           for(Opportunity eachOpp : trigger.new){
              if(eachOpp.AccountId !=null){
                 accIds.add(eachOpp.AccountId);
              }
           }
        }

        if(trigger.isUpdate){
           for(Opportunity eachOpp : trigger.new){
                
                Opportunity oldRecord = trigger.oldMap.get(eachOpp.id);
               
                if(eachOpp.Amount != oldRecord.Amount || eachOpp.StageName != oldRecord.StageName || eachOpp.AccountId != oldRecord.AccountId){
                    accIds.add(eachOpp.AccountId);
                }
           }

        }   

        if(trigger.isDelete){
            for(Opportunity eachOpp: trigger.old){
                if(eachOpp.AccountId !=null){
                    accIds.add(eachOpp.AccountId);
                }
            }
        }
    }

    if(!accIds.isEmpty()){
        OpportunityTriggerHandler.updateHighestAmountOppName(accIds);
        OpportunityTriggerHandler.updateTargetAmountAchievedOpportunityName(accIds);
        OpportunityTriggerHandler.updateTotalAmountGen(accIds);
    }
}

            /*if(trigger.isBefore && trigger.isInsert){
        for(opportunity eachOpp: trigger.new){
            system.debug(eachOpp.Name +' ' + eachOpp.CloseDate + ' ' + eachOpp.Amount);
            system.debug(trigger.new.size());
        }
      }*/

    /*  if(trigger.isBefore && trigger.isInsert){
        for(opportunity eachOpp: trigger.new){
            system.debug(eachOpp.StageName + ' ' + eachOpp.Name +' ' + eachOpp.CloseDate);
            }
      }*/
    /*PART1-1 
        if(trigger.isBefore && trigger.isUpdate){
        list<opportunity> oppNew = trigger.new;
        map<id,opportunity> oppOldMap = trigger.oldMap;
             for(opportunity eachOpp: oppNew){
             system.debug('New name' + eachOpp.Name + 'New amount' + eachOpp.Amount);
             system.debug('Old name' + oppOldMap.get(eachOpp.Id).name + 'Old Amount=' + oppOldMap.get(eachOpp.Id).amount);
        }
    }
*/
    //PART1-1//

    /*if(trigger.isBefore && trigger.isUpdate){
        for(opportunity eachopp: trigger.new) {
        if(eachOpp.StageName!=trigger.oldMap.get(eachOpp.Id).StageName){
            system.debug('Description ' + eachOpp.Description + 'Opportnity Name' + eachOpp.name);
        }

       }
    }
    */







