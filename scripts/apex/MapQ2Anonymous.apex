map <string,decimal> currISOCodeAndExchangeRateMap = new map <string,decimal> { 'AUD' => 0.78, 'CAD' => 0.78, 'EUR' => 1.13, 'NZD'=> 0.68, 'IND'=> 0.013};

system.debug(currISOCodeAndExchangeRateMap);

decimal iso1 = currISOCodeAndExchangeRateMap.get('AUD');
system.debug(iso1);

boolean check = currISOCodeAndExchangeRateMap.containsKey('SAD');
system.debug(check);

set<string> set1 = new set<string>();
set<string> set2 = new set<string>();



for (string eachIsoCode : currISOCodeAndExchangeRateMap.keySet()){
 
     decimal value1 = currISOCodeAndExchangeRateMap.get(eachIsoCode);

     //system.debug(eachIsoCode + '' + value1);

     if( value1 >=1){
        set1.add(eachIsocode);
     }else{
        set2.add(eachIsoCode);
     }

}

system.debug('Value is more than 1'+ set1 + 'value is less than 1' + set2);




