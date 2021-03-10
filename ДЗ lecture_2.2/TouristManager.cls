public class TouristManager {
    public static void chooseTourists(String firstName) {
        List<Tourist__c> listOfTourists = [
            SELECT Name, Age__c
            FROM Tourist__c
            WHERE Name = :firstName
        ];   
        system.debug(listOfTourists);
    }
    
    public static void chooseTourists1(Integer age) {
        List<Tourist__c> listOfTourists = [
            SELECT Name, Age__c
            FROM Tourist__c
            WHERE Age__c = :age
        ];   
        system.debug(listOfTourists);
	}
    
    public static void chooseTourists2(Integer startDate) {
        List<Flight__c> listOfTourists = [
            SELECT Tourist__r.Name, Tourist__r.Age__c
            FROM Flight__c
            WHERE Trip__r.Start_Date__c = :startDate
        ];   
        system.debug(listOfTourists);
	}
    
     public static void chooseTourists3() {
        List<Tourist__c> listOfTourists = [
            SELECT Name, Age__c, (SELECT Trip__r.Name, Trip__r.Start_Date__c FROM flying__r)
            FROM Tourist__c
        ];   
        system.debug(listOfTourists);
	}
     
     public static void chooseTourists4() {
        List<Flight__c> listOfTourists = [
            SELECT Tourist__r.Name, Tourist__r.Age__c
            FROM Flight__c
            WHERE Trip__r.Name = 'no trip'
        ];   
        system.debug(listOfTourists);
	}
}