list<account> var1 = AccConAndOppOperations.takeInfo();

system.debug(var1);

AccConAndOppOperations.oppWon('Web', 'Closed Lost');

AccConAndOppOperations.annualRevenue();

decimal sum = AccConAndOppOperations.sumOfClosedWon();

system.debug(sum);

list<account> var2 = AccConAndOppOperations.AccountWonOpp('Closed Won');
system.debug(var2);

system.debug(AccConAndOppOperations.AccountWonOpp('Closed Won'));

list<account> var3 = AccConAndOppOperations.AccountContact();
system.debug(var3);

List<account> var3= AccConAndOppOperations.Accountcontact();
for(account eachAcc : var3){
    system.debug('----------------------');
    system.debug(eachAcc.Name);
    for(contact eachCon : eachAcc.Contacts){
        system.debug(eachcon.Name);
    }
}

AccConAndOppOperations.createcont('0016S00003GWPbgQAH');







