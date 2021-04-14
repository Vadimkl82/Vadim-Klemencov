public class ExceptionsPlayground {
    
    public class CustomException extends Exception {
    }
        
    public static void generateCustomException() {
        throw new CustomException('Bad!');    
    }
    
    public static void generateRegularException() {
        Integer a = 1 / 0;
    }
    
    public static void stopExceptions() {
        try{
            ExceptionsPlayground.generateCustomException();
            ExceptionsPlayground.generateRegularException();
        } catch (Exception ex) {
            System.debug('All ok');
        }  
    }
}