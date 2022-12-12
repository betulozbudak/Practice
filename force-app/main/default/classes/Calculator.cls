public class Calculator {
    public static decimal dyanmicCalculationMethod(decimal a,decimal b, string c){
        
        decimal result;

        if (c=='Addition'){
            result = a+b;
            //system.debug('10 + 67.5 = ' + result);
        }else if(c=='subtraction'){
            result=a-b;
            //system.debug('90 - 60 = '+ result);
        }else if(c=='Division'){
            result =a/b;
            //system.debug('8/2 = '+ result);
        }else if(c=='Multipication'){
            result=a*b;
        }else{
            system.debug('Invalid Data');
        }
        
        return result;

    }
}

