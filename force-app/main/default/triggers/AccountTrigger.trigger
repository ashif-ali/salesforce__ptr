trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    //insert
    if(Trigger.isInsert) {
        if(Trigger.isAfter){
            System.debug('Record is being inserted via after event');
        }else {
            System.debug('Record is being inserted via before event');
        }
    }
    
    //update
    if(Trigger.isUpdate) {
        if(Trigger.isAfter){
            System.debug('Record is being updated via after event');
        }else {
            System.debug('Record is being updated via before event');
        }
    }
}