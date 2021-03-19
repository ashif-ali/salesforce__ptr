public class SearchController {

      public String searchText {set;get;}
    public List<Account> accountsList{set;get;}
    public void search(){
        
        String q = '%'+searchText+'%';
        
		accountsList = [SELECT Id, Name, Industry, Rating FROM Account WHERE Name LIKE :q];
        
        if(false) {
            for(Integer i = 0; i< 10; i++){
                Integer j=i;
                j++;
            }
        }
    }
}