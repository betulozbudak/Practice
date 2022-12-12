trigger LeadTrigger on Lead (before insert,after insert) {
    if(trigger.isBefore && trigger.isInsert){
         for(lead eachlead : trigger.new){
            if(eachLead.LeadSource == 'Web'){
                system.debug('Rating should be cold');
            }else{
                system.debug('Rating should be hot');
            }
            }
        }
    }


