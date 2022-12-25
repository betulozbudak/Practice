@isTest 
public class OperatinsHelperTest {
    @isTest
    public static void largestOutOfTwoNumbersTest() {
        OperationsHelper opt = new OperationsHelper();
        decimal rtmax= opt.largestOutOfTwoNumbers(6.2, 3.1);
        system.assertEquals(6.2, rtmax);
        rtmax= opt.largestOutOfTwoNumbers(2.1, 8.2);
        system.assertEquals(8.2, rtmax);
        rtmax= opt.largestOutOfTwoNumbers(4.1, 4.1);
        system.assertEquals(4.1, rtmax);
    }
    @isTest
    public static void smallestOutOfThreeNumbersTest(){
        OperationsHelper opt= new OperationsHelper();
        decimal min = opt.smallestOutOfThreeNumbers(1,2,3);
        system.assertEquals(1,min);
        min = opt.smallestOutOfThreeNumbers(4,2,3);
        system.assertEquals(2,min);
        min = opt.smallestOutOfThreeNumbers(3,3,3);
        system.assertEquals(3,min);
    }
    @isTest 
    public static void sumPositiveIntegerTest(){
        integer sum = OperationsHelper.sumOfPositiveInteger(5);
        System.assertEquals(15, sum);
        sum = OperationsHelper.sumOfPositiveInteger(-3);
        System.assertEquals(null, sum);
        system.assertEquals(55,OperationsHelper.sumOfPositiveInteger(10));

    }
}

