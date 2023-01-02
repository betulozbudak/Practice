list<account> listAcc =[select id,name,Active__c from account where Active__c ='Yes'];

ContactQueableApex cq = new ContactQueableApex(listAcc);
id jobId =system.enqueueJob(cq);