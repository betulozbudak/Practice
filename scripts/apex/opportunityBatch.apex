OpportunityBatch opb =new OpportunityBatch();
id jobid = Database.executeBatch(opb, 10);
system.debug(jobid);

OpportunityBatch2 op= new OpportunityBatch2();
id jobid = Database.executeBatch(op,5);
system.debug(jobid);

OpportunityBatch3 op3= new OpportunityBatch3();
id jobid= Database.executeBatch(opp1, 10);

