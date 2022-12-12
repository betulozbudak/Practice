public class DummyDataCreation {
    public static list<account> AccountcreationMethod(integer n) {
        list<account> accList = new list<account>();
        if(n>0 && n<10){
      
        for( integer i=1; i<=n; i++ ){
            account acc = new account();
            acc.name ='Acc Name Update ' + i;
            acc.rating ='Hot';
            acc.phone='123456787';
            acc.ShippingCity='Manhattan';
            acc.ShippingCountry= 'USA';
            acc.BillingCity = 'Long Island ';
            acc.BillingCountry = 'USA';
            accList.add(acc);
        }
        insert accList;
        }
        return accList;
    }

    public static list<contact> contactCreationMethod(integer n, list<account> listAcc){
        list<contact> conList = new list<contact>();
        if(n> 0 && n<150){
            for(account eachAcc: listAcc){

                for(integer i=1 ; i<=n ; i++){
                contact con = new contact();
                con.FirstName = 'Con Name' + i;
                con.LastName = 'Con LastName';
                con.AccountId = eachAcc.id;
                con.Phone = '435678908';
                con.MailingCity ='New Haven';
                con.MailingCountry = 'USA';
                con.Othercity='Milford';
                con.OtherCountry='USA';
                conList.add(con);
           }
        }
        insert conList;
    }
    return conList;
}
}

