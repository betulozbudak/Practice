public class CaseTriggerHandler {
    /*public static void setStatusAndPriority(list<case> triggerNew){
        for(case eachCase: triggerNew){
            if(eachCase.Origin == 'Email'){
               eachCase.Status ='New';
               eachCase.Priority='Medium';
        }
      }
    }
}
/*When a case is created, check the description field of the newly created case - if the description
field contains the word ‘password’, then create a child case with the following field values
- subject = ‘Parent Case may contain secret info, do something NOW’
- parentId = _______ (newly create case id)
- priority = ‘High’
- Description = ‘Secret info not allowed in case’*/
      public static void checkCaseDescription(list<case> triggerNew){
          set<id> caseIds = new set<id>();
          for(case eachCase : triggerNew){
            
            if(eachCase.Description!= null && eachCase.Description.containsIgnoreCase('password')){
               caseIds.add(eachCase.id);
            }
          }

          if(!caseIds.isEmpty()){
             list<case> listCase= new list<case>();
             for(Id eachId : caseIds){
                case c1= new case();
                c1.subject = 'Parent Case may contain secret info, do something NOW';
                c1.ParentId = eachId;
                c1.Priority ='High';
                c1.Description='Secret info not allowed in case';
                listCase.add(c1);
             }
             insert listCase;
         }
         
      }
}


