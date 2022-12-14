public class CaseTriggerHandler {
    public static void setStatusAndPriority(list<case> triggerNew){
        for(case eachCase: triggerNew){
            if(eachCase.Origin == 'Email'){
               eachCase.Status ='New';
               eachCase.Priority='Medium';
        }
      }
    }
}

