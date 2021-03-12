public class TouristService {
    public static void markDuplicates(List<Tourist__c> newTourists) {
        newTourists = [
            SELECT Last_Name__c, Email__c, IsDuplicate__c 
            FROM Tourist__c
        ];
        
        for (Tourist__c Tourist1: newTourists) {
            Integer duplication = 0;
            
            for (Tourist__c Tourist2: newTourists) {
                
                if (Tourist1.Email__c == Tourist2.Email__c && Tourist1.Last_Name__c == Tourist2.Last_Name__c) {
                    duplication++;
                    
                    if (duplication > 1) {
                        Tourist1.IsDuplicate__c = false;
                        Tourist2.IsDuplicate__c = true;
                        update Tourist1;
                        update Tourist2;
                    }
                }
            }
        }
    }
}