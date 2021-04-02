trigger TouristTrigger on Tourist__c (before insert, after update) {
    if (TouristTriggerHandler.recursionProtection) {
        TouristTriggerHandler.recursionProtection = false;
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                TouristTriggerHandler.onBeforeInsert(Trigger.new);
            }
            when AFTER_UPDATE {
                TouristTriggerHandler.onAfterUpdate(Trigger.oldMap, Trigger.newMap);
            }
        }
    }
}