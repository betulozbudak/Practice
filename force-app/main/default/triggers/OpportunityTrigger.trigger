trigger OpportunityTrigger on Opportunity (before insert, after insert, before update,after update) {
    /*if(trigger.isBefore && trigger.isInsert){
        for(opportunity eachOpp: trigger.new){
            system.debug(eachOpp.Name +' ' + eachOpp.CloseDate + ' ' + eachOpp.Amount);
            system.debug(trigger.new.size());
        }
      }*/

      if(trigger.isBefore && trigger.isInsert){
        for(opportunity eachOpp: trigger.new){
            system.debug(eachOpp.StageName + ' ' + eachOpp.Name +' ' + eachOpp.CloseDate);
            }
      }
}



