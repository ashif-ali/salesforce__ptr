@isTest
private class SearchControllerTest {
    
    @isTest static void testSearch(){
        
        //create a record
        Account acc = new Account();
        acc.Name = 'Sk';
       insert acc;
        
        Test.startTest();
        
        SearchController a = new SearchController();
        a.searchText = 'Sk';
        a.search();
        
        Test.stopTest();
    }
}