public class TouristService {
    
    public static void markDuplicates(List<Tourist__c> newTourists) {
        List<Tourist__c> recordsOfExistingTourists = TouristManager.getByEmailLastName();
        List<Tourist__c> listOfNewTourists = new List<Tourist__c> ();
       
        for (Tourist__c existingTourist: recordsOfExistingTourists) {
            for (Tourist__c newTourist: newTourists) {
                Boolean isSameEmail = (existingTourist.Email__c == newTourist.Email__c);
                Boolean isSameLastName = (existingTourist.Last_Name__c == newTourist.Last_Name__c);
                if (isSameEmail && isSameLastName) {
                    newTourist.IsDuplicate__c = true;
                }
            }
        }
    }
}