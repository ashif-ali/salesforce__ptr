public class YoutubeSearchController {
    
    public String body{set; get;}
    public String data{set; get;}
    public List<MyOwnDataType> dataList{set; get;}
    
    public void search(){
        dataList = new List<MyOwnDataType>();
        //1. Instantiate Http Class
        Http http = new Http();
        
        //2. Instantiate HttpRequest Class and frame the request
        HttpRequest req = new HttpRequest();
        //2.1 Endpoint
        
        req.setEndpoint('https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCO1cgjhGzsSYb1rsB4bFe4Q&q=react&key=AIzaSyAXn9wpSn4eEZMeyQLy8ubToFk3paTOZeQ');
        //req.setEndpoint('https://api.ipgeolocation.io/ipgeo?apiKey=52dbc28f2b5d47cb9eaee646c01b068b');
        //2.2 Method
        req.setMethod('GET');
        
        //2.3 What's the response type
        req.setHeader('Accept', 'application/json');
        //3. Instantiate HttpResponse Class and handle the response
        HttpResponse response = http.send(req);
        body = response.getBody();
        
        fromJSON d = (fromJSON)JSON.deserialize(body, fromJSON.class);
        for(Integer i = 0; i< d.items.size(); i++){
        	dataList.add(new MyOwnDataType(d.items[i].snippet.title,d.items[i].snippet.description,d.items[i].snippet.thumbnails.medium.url,d.items[i].snippet.publishedAt, d.items[i].id.videoId));
        }
        
    }
    
    public class MyOwnDataType{
        public String title{set;get;}
        public String description{set; get;}
        public String publishedAt{set; get;}
        public String thumbnail{set;get;}
        public String videoId{set; get;}
        
        public MyOwnDataType(String title, String description,String thumbnail, String publishedAt,  String videoId){
 			this.title=title;
            this.description = description;
            this.publishedAt = publishedAt;
            this.thumbnail = thumbnail;
            this.videoId = videoId;
        }
    }
    
    public class fromJSON{
        public String kind;	//youtube#searchListResponse
        public String etag;	//AIhKCNQ4q0GFhIF5fHn8wghGlGY
        public String nextPageToken;	//CAUQAA
        public String regionCode;	//US
        public cls_pageInfo pageInfo;
    	public cls_items[] items;
        
    }
    
    
    class cls_pageInfo {
        public Integer totalResults;	//184
        public Integer resultsPerPage;	//5
    }
    
    class cls_items {
        public String kind;	//youtube#searchResult
        public String etag;	//xrgd_Tt8-DcRmOwOsga60agT3cY
        public cls_id id;
        public cls_snippet snippet;
    }
    
    class cls_id {
        public String kind;	//youtube#video
        public String videoId;	//G-aO5hzo1aw
    }
    
    class cls_snippet {
        public String publishedAt;	//2019-04-05T06:00:00Z
        public String channelId;	//UCO1cgjhGzsSYb1rsB4bFe4Q
        public String title;	//Trying React Hooks for the first time with Dan Abramov
        public String description;	//CircleCI (Show sponsor) Robust and sleek Docker-based Continuous Integration as a service. I used CircleCI prior to them becoming a sponsor and I love that ...
        public cls_thumbnails thumbnails;
        public String channelTitle;	//Fun Fun Function
        public String liveBroadcastContent;	//none
        public String publishTime;	//2019-04-05T06:00:00Z
    }
    
    class cls_thumbnails {
        public cls_default default_x;
        public cls_medium medium;
        public cls_high high;
    }
    
    class cls_default {
        public String url;	//https://i.ytimg.com/vi/G-aO5hzo1aw/default.jpg
        public Integer width;	//120
        public Integer height;	//90
    }
    
    class cls_medium {
        public String url;	//https://i.ytimg.com/vi/G-aO5hzo1aw/mqdefault.jpg
        public Integer width;	//320
        public Integer height;	//180
    }
    
    class cls_high {
        public String url;	//https://i.ytimg.com/vi/G-aO5hzo1aw/hqdefault.jpg
        public Integer width;	//480
        public Integer height;	//360
    }
}