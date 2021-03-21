public with sharing class TouristTriggerHandler {
    public static Boolean recursionProtection;
    
    public static void onBeforeInsert(List<Tourist__c> newTourists) {
        List<Tourist__c> recordsOfExistingTourists = TouristManager.getByEmailLastName();
        List<Tourist__c> listOfNewTourists = new List<Tourist__c> ();
       
        for (Tourist__c existingTourist: recordsOfExistingTourists) {
            for (Tourist__c newTourist: newTourists) {
                Boolean isSameEmail = (existingTourist.Email__c == newTourist.Email__c);
                Boolean isSameLastName = (existingTourist.Last_Name__c == newTourist.Last_Name__c);
                if (isSameEmail && isSameLastName) {
                    newTourist.IsDuplicate__c = true;
                    listOfNewTourists.add(newTourist);
                }
            }
        }
    }
    
    public static void onAfterUpdate(Map<Id, Tourist__c> oldMap, Map<Id, Tourist__c> newMap) {
        List<Tourist__c> touristsWithActive = [
            SELECT Active__c,
            (SELECT Id, Condition__c, Trip__r.Start_Date__c FROM flying__r)
            FROM Tourist__c
            WHERE Id IN :newMap.keySet()    
        ];
        
        List<Flight__c> touristsToUpdate = new List<Flight__c>();
        
        for (Tourist__c voyager : touristsWithActive) {
            if (oldMap.get(voyager.Id).Active__c == true &&
                newMap.get(voyager.Id).Active__c == false) {
                    for (Flight__c flight : voyager.flying__r) {
                        if (flight.Trip__r.Start_Date__c > 2021) {
                            flight.Condition__c = 'Declined';
                            touristsToUpdate.add(flight);
                            
                	}
            	}
        	}
        }
        if (touristsToUpdate.size() > 0) {
            update touristsToUpdate;
        }
    }
}