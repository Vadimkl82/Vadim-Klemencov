public with sharing class TouristTriggerHandler {
    
    public static void onBeforeInsert(List<Tourist__c> newTourists) {
        newTourists = [
            SELECT Last_Name__c, Email__c 
            FROM Tourist__c
        ];
        List<Tourist__c> updateTourists = new List<Tourist__c>();
        
        for (Tourist__c Tourist1: newTourists) {
            for (Tourist__c Tourist2: newTourists) {
                if (Tourist1.Email__c == Tourist2.Email__c && Tourist1.Last_Name__c == Tourist2.Last_Name__c) {                        
                    Tourist2.IsDuplicate__c = true;
                }
            }
        }
    }
}