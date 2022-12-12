trigger CaseTrigger on Case (before insert, after insert, before update, after update) {
  /*system.debug('We are in the triggers');
  if(trigger.isAfter){
     system.debug('We are in the after triggers');
  }
  if(trigger.isBefore){
     system.debug('We are in the before triggers');
  }
  if(trigger.isUpdate&& trigger.isBefore){
    system.debug('We are in the before-update triggers');
  }
  if(trigger.isUpdate && trigger.isAfter){
    system.debug('We are in the after-update triggers');
  }
  if(trigger.isInsert && trigger.isBefore){
    system.debug('We are in the before-insert triggers');
  }
  if(trigger.isInsert && trigger.isAfter){
    system.debug('We are in the after-insert trigger');
  }
*/
list<case> listCase = trigger.new;
if(trigger.isAfter && trigger.isInsert){
    for(case cs: listCase){
       system.debug(cs.CaseNumber + ' ' + cs.id + ' ' + cs.CreatedDate);
    }
}
}

