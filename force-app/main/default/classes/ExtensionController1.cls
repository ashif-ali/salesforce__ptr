public class ExtensionController1 {

    public String message {set; get;}
    public List<Account> accountsList {set; get;}

    public ExtensionController1(ApexPages.StandardController controller) {
    
        message='Hey I am from message variable';

    }
    
    public void saveRecord(){
        accountsList = [SELECT Id, Name, Rating, Industry from Account];
        System.debug('In 1st extension'+ message);
    }
    
    public PageReference gotoHello2(){
        return new PageReference('/apex/helloworld2');
    }

}