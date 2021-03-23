public class TouristManager {
    
    public static List<Tourist__c> getByFirstName(String firstName) {
        if(String.isBlank(firstName)) {
            return new List<Tourist__c>();
        }
        return [
            SELECT Name,
            Age__c
            FROM Tourist__c
            WHERE Name = :firstName
        ];   
    }
    
    public static List<Tourist__c> getByAge(Set<Integer> ages) {
        if(ages == null || ages.isEmpty()) {
            return new List<Tourist__c>();
        }
        return [
            SELECT Name,
            Age__c
            FROM Tourist__c
            WHERE Age__c IN :ages
        ];   
    }

    public static List<Tourist__c> getByFlightLists() {
        List<Tourist__c> listOfTourists = [
            SELECT Name,
            Age__c, 
            (SELECT Trip__r.Name,
            Trip__r.Start_Date__c
            FROM flying__r)
            FROM Tourist__c
        ];   
        return listOfTourists;
    }

    public static List<Tourist__c> getByEmailLastName() {
        List<Tourist__c> listOfTouristsByEmailLastName = [
            SELECT Last_Name__c,
            Email__c
            FROM Tourist__c
	];
        return listOfTouristsByEmailLastName;
    }
}
