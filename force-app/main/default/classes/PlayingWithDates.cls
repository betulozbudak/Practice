public class PlayingWithDates {
    public void printDateOutput() {
        date today = date.today();
        system.debug('Today\'s date is '+ today);
        date nov = date.newInstance(2789, 11, 5);
        system.debug('First date is '+ nov);
        date march= date.newInstance(1459, 3,4);
        system.debug('Second date is ' + march);
        integer dayInt= 25;
        integer monthInt=7;
        integer yearInt=1966;
        date newVar= date.newInstance(yearInt, monthInt, dayInt);
        System.debug('New date is ' + newVar);
    }
}

