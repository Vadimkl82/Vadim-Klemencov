public with sharing class TouristTriggerHandler {
    public static Boolean recursionProtection = true;
    
    public static void onBeforeInsert(List<Tourist__c> newTourists) {
        TouristService.markDuplicates(newTourists);
    }
    
    public static void onAfterUpdate(Map<Id, Tourist__c> oldMap, Map<Id, Tourist__c> newMap) {
        List<Tourist__c> touristsWithActive = [
            SELECT Active__c,
            (SELECT Id,
            Condition__c,
            Trip__r.Start_Date__c
            FROM flying__r)
            FROM Tourist__c
            WHERE Id IN :newMap.keySet()    
        ];
        
        List<Flight__c> flightsToUpdate = new List<Flight__c>();
        
        for (Tourist__c voyager : touristsWithActive) {
            if (oldMap.get(voyager.Id).Active__c == true &&
                newMap.get(voyager.Id).Active__c == false) {
                    for (Flight__c flight : voyager.flying__r) {
                        if (flight.Trip__r.Start_Date__c > 2021) {
                            flight.Condition__c = 'Declined';
                            flightsToUpdate.add(flight);
                            
                    }
                }
            }
        }
        if (flightsToUpdate.size() > 0) {
            update flightsToUpdate;
        }
    }
}