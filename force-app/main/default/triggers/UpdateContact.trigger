trigger UpdateContact on Account (after update) {
    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            //before insert
        }
        if(Trigger.isUpdate) {
            //before update
        }
    }
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            //after insert
        }
        if(Trigger.isUpdate) {
            //after update
            AccountHandlerTrigger a = new AccountHandlerTrigger();
            a.foobar(Trigger.New, Trigger.NewMap, Trigger.OldMap);
        }
    }
}