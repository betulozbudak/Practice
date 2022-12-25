@isTest 
public class RankHendlerTest {
    @isTest 
    
    public static void rankPrizeTest(){
        RankHandler rh = new Rankhandler();
        string prz= rh.rankPrize(1);
        system.assertEquals('Gold', prz);
        prz= rh.rankPrize(2);
        system.assertEquals('Silver', prz);
        prz= rh.rankPrize(3);
        system.assertEquals('Bronz', prz);
        prz= rh.rankPrize(5);
        system.assertEquals('Top 10 certi', prz);
        prz= rh.rankPrize(11);
        system.assertEquals('Participation certificate', prz);
        prz= rh.rankPrize(-5);
        system.assertEquals('Top 10 certi', prz);
    }
    public static void rankPrizeSwitchTest(){
        RankHandler rh = new Rankhandler();
        string prz= rh.rankPrizeSwitch(1);
        system.assertEquals('Gold', prz);
        prz= rh.rankPrizeSwitch(2);
        system.assertEquals('Silver', prz);
        prz= rh.rankPrizeSwitch(3);
        system.assertEquals('Bronz', prz);
        prz= rh.rankPrizeSwitch(5);
        system.assertEquals('Top 10 congrats', prz);
        prz= rh.rankPrizeSwitch(11);
        system.assertEquals('Participation certificate', prz);
        
    }
}

