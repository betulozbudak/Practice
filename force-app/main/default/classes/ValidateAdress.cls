public class ValidateAdress {
    public void validaeteHomeAddress() {
        string HouseName = 'White House';
        string StreetName = 'White House Main Street';
        string CityName= 'San Francisco';
        string StateName= 'CA';
        string StateIsoCode = '94178abc';
        string CountryName ='u.s';
        string CountryIsoCode = '3166ca';
  
        system.debug('The number of characters in the street name.'+StreetName.length());
        boolean contain = StreetName.contains(HouseName);
        system.debug('is the street name contains a house name'+ contain);
        system.debug('if the street name contains a house name' + StreetName.contains(StateIsoCode));
        system.debug('We are converting uppercase and lowercase ' + CountryIsoCode.toUpperCase()+ ' '+ StateIsoCode.toUpperCase()+' '+ CountryName.toUpperCase()+' '+ CityName.toLowerCase()+' '+ StateName.toLowerCase()+ ' ');
        string fullAddress = HouseName + ' ' + StreetName + ' ' + stateName + ' ' + StateIsoCode + ' ' + CountryName + ' ' + CountryIsoCode;
        system.debug('Full address is' + fullAddress);
    }
}

