public class AnimalLocator {

        public static String getAnimalNameById (Integer i) {
          Http http = new Http();
          HttpRequest request = new HttpRequest();
          request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
          request.setMethod('GET');
          HttpResponse response = http.send(request);
          Map<String, Object> animal1 = new Map<String, Object>();
          if(response.getStatusCode()== 200) {  
          
          Map<String, Object> result1 = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
          animal1 = (Map<String, Object>) result1.get('animal');
          }
        return string.valueOf(animal1.get('name'));
      }
  }