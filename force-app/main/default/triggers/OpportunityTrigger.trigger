trigger OpportunityTrigger on Opportunity (before insert, after insert, before update,after update) {
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


}




