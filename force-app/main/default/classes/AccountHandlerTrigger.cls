public class AccountHandlerTrigger {
    
    public void foobar(List<Account> accountList, Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountMap){
        
        List<Contact> conList = [select id, FirstName, Account.Name from contact where AccountId in :accountList];
        
        
        for(Contact con : conList) {
            
            if(oldAccountMap.get(con.AccountId).Name != newAccountsMap.get(con.AccountId).Name){
                con.FirstName = con.Account.Name;
            }
            
        }
        update conList;
    }
}