public class Students {

    public string firstName = 'Burhan';
    public string lastName = 'Celik';
    public integer classYear = 2022;
    public string Major= 'Administrator';

    public string generateReport() {
        system.debug('Report Generated for '+ firstName +' ' +lastName + ' of ' + classYear);
        return Major;
    }
}

