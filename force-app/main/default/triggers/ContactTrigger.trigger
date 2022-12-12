trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if(trigger.isBefore && trigger.isInsert){
        for(contact eachContact : trigger.new){
            if(eachContact.AccountId != null){
                system.debug(eachContact.LastName + ' contact created with account');
            }else{
                system.debug(eachContact.LastName + 'contact created with account');
            }
        }
    }
}

