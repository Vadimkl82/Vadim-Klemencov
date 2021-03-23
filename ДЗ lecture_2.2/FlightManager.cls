public class FlightManager {

    public static List<Flight__c> getByStartDate(Integer startDate) {
        if(startDate == null || startDate == 0) {
            return new List<Flight__c>();
        }
        return [
            SELECT Tourist__r.Name,
            Tourist__r.Age__c
            FROM Flight__c
            WHERE Trip__r.Start_Date__c = :startDate
        ];   
    }
    
    public static  List<Flight__c> getByNoTrip(String trip) {
        if(String.isBlank(trip)) {
            return new List<Flight__c>();
        }
         return [
            SELECT Tourist__r.Name,
            Tourist__r.Age__c
            FROM Flight__c
            WHERE Trip__r.Name = 'no trip'
        ];   
	}
}