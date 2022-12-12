list<account> ourList = DummyDataCreation.AccountcreationMethod(8);
system.debug(ourList.size());

list<contact> ourConList = DummyDataCreation.contactCreationMethod(3, ourList);
system.debug(ourConList.size());

list<account> dummyList = [select id from account where createdDate = TODAY];
delete dummyList;
