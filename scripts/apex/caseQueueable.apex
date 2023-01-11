CaseQueueable cq= new CaseQueueable();
id jobid = system.enqueueJob(cq);
system.debug(jobid);