/*
. When I _update_ the account record, update the owner Id of the child Opportunity records to User 2 Id (_If the owner Id is already User 2 Id 
then dont update it again)_.
*/

trigger UpdateOpportunity on Account (after update) {
    List<Opportunity> listOfOpp = [SELECT OwnerId From Opportunity where AccountId in :Trigger.New AND OwnerId != '0055g000004gWtPAAU'];
    
    for(Opportunity opp : listOfOpp) {
        opp.OwnerId = '0055g000004gWtPAAU';
    }
    
    if(listOfOpp.size()>0){
        update listOfOpp;
    }
    
}