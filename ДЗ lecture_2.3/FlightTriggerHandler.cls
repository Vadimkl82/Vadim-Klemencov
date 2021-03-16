public with sharing class FlightTriggerHandler {
    
    public static void onBeforeInsert(List<Flight__c> newFlights) {
        for (Flight__c flying : newFlights) {
            
            Tourist__c tourists = [
                SELECT id, Age__c
                FROM Tourist__c
                WHERE id = :flying.Tourist__c
            ];
            
            Trip__c trips = [
                SELECT id, Minimum_Age__c, Start_Date__c
                FROM Trip__c
                WHERE id = :flying.Trip__c
            ];
            
            if (Tourists.Age__c < Trips.Minimum_Age__c) {
                flying.Age__c.addError('Not suitable for age');
            }
            
            if (flying.Status__c == 'Past') {
                flying.Status__c.addError('Already flew');
            }
        }
    }
}