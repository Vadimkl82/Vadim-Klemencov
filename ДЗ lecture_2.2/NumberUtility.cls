public class NumberUtility {
    
    public static List<Integer> getPrimeNumbers(Integer n) {
        List<Integer> primeNumbers = new List<Integer>();
        for (Integer i = 2; i <= n; i++) {
            boolean a = true;
            for (Integer divisor = 2; divisor < i; divisor++) {
                if (math.mod(i,divisor) == 0) {
                    a = false;
                    break;
                }
            }
            if (a) {
                primeNumbers.add (i);
            }
        }
        return primeNumbers;
    }
    
    public static Boolean isPalindrom(Long n) {
        Boolean result;
        Long numToCheck = n;
        Long palindrome = numToCheck;
        Long reversenumToCheck = 0;
                   
        While (numToCheck > 0) {
            Long remainder = math.mod(palindrome,10);
            reversenumToCheck = reversenumToCheck*10+remainder;
            palindrome = palindrome/10;   
            
            if (numToCheck == reversenumToCheck) {
                result = true;
                break;
            } else {
                result = false;
            }
        }
        return result;
    } 
    
    public static List<Integer> getFibinacciNumbers(Integer n) {
        List<Integer> fibinacciNumbers = new List<Integer>();
        
        Integer fibo1 = 1;
        Integer fibo2 = 1;
        Integer fibonacci;
        fibinacciNumbers.add(fibo1);
        fibinacciNumbers.add(fibo2);
        
        for (Integer i = 3; i <= n; i++) {
            fibonacci = fibo1 + fibo2;
            fibo1 = fibo2;
            fibo2 = fibonacci;
            fibinacciNumbers.add(fibonacci);
        }
        return fibinacciNumbers;
    }
}
