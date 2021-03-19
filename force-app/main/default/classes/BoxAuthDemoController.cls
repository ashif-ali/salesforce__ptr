public class BoxAuthDemoController {
    
    public String body{set; get;}
    public List<MyDataType> dataList{set; get;}
    public Integer total_records{set;get;}
    
    public PageReference authenticate(){
        
        return new PageReference('https://account.box.com/api/oauth2/authorize/?client_id=44kb4gwpspalvuyp1od2gtkosvtlbzio&response_type=code');
    }
    
    public void getAccessToken(){
       
        String authCode = apexpages.currentPage().getParameters().get('code');
        
        System.debug(authCode);
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://api.box.com/oauth2/token/');
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setBody('grant_type=authorization_code&code='+authCode+'&client_id=44kb4gwpspalvuyp1od2gtkosvtlbzio&client_secret=NWlNXBW4HF1FjEFPrFh2EI7Iue2mer5C');
        
        HttpResponse res = http.send(req);
        body = res.getBody();
         fromJSON d = (fromJSON)JSON.deserialize(body, fromJSON.class);
       // System.debug(body);
        //AccessToken = d.access_token;
        body = getFolders(d.access_token);
        AccessKey t = (AccessKey)JSON.deserialize(body, AccessKey.class);
        total_records = t.total_count;
        dataList = new List<MyDataType>();
        
        for(Integer i=0; i<t.entries.size();i++){
            dataList.add(new MyDataType(i+1, t.entries[i].id, t.entries[i].name));
        }
        
    }
    
    public class MyDataType{
        public String iDn{set;get;}
        public String name{set; get;}
        public Integer num{set;get;}
        
        
        public MyDataType(Integer num, String Idn, String name){
 			this.Idn = Idn;
            this.name = name;
            this.num=num;
        }
    }
    
    public String getFolders(String access_token){
        Http http = new Http();
        HttpRequest reqNew = new HttpRequest();
        reqNew.setEndpoint('https://api.box.com/2.0/folders/133342485904/items');
        reqNew.setMethod('GET');
        reqNew.setHeader('Accept', 'application/json');
        reqNew.setHeader('Authorization', 'Bearer '+access_token);
        HttpResponse resNew = http.send(reqNew);
        
        return resNew.getBody();
    }
    
    public class fromJSON{
        public String access_token;	//9z8VDy4VLMbOVdPA8sP6qXN8Pb44vOa5
        public Integer expires_in;	//3668
        public cls_restricted_to[] restricted_to;
        public String refresh_token;	//1CuX3r2f5hja2q5FBDp8wNXgfIj3iXYLPJXxLgNgYgdcrgyCZbOLSTZoOzB628wM
        public String token_type;	//bearer
        
    }
    class cls_restricted_to {
    }
    
    public class AccessKey{
	public Integer total_count;	//1
	public cls_entries[] entries;
	public Integer offset;	//0
	public Integer limit_x;	//100
	public cls_order[] order;
}
    class cls_entries {
		public String type;	//file
		public String id;	//786234287783
		public cls_file_version file_version;
		public String sequence_id;	//0
		public String etag;	//0
		public String sha1;	//3712f2b17c3f72df37c7bdf48745b00c2fc46ec0
		public String name;	//Presentation.pptx
	}
	class cls_file_version {
		public String type;	//file_version
		public String id;	//840161314583
		public String sha1;	//3712f2b17c3f72df37c7bdf48745b00c2fc46ec0
	}
	class cls_order {
		public String by_x;	//type
		public String direction;	//ASC
	}
    
    
}