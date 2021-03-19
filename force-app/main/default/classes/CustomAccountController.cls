public with sharing class CustomAccountController {
  public CustomAccountController() {
  }

  @AuraEnabled(cacheable=true)
  public static Map<Id, Account> getAccounts() {
    Map<Id, Account> accountsMap = new Map<Id, Account>(
      [SELECT Id, Name FROM Account]
    );
    return accountsMap;
  }
}
