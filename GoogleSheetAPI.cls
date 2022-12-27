public class GoogleSheetAPI {
    
    public static HttpResponse makeGetCallout() {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://sheets.googleapis.com/v4/spreadsheets/1q7UWebB4YxpoRzHEIiZChBSE-mt-g4RzW330ZCpLfGc/values/range=A2:A7');
          request.setHeader('Accept', 'application/json');
      request.setHeader('Content-Type', 'application/json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                // Deserializes the JSON string into collections of primitive data types.
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                // Cast the values in the 'athletes' key as a list
                List<Object> Contacts = (List<Object>) results.get('athletestest');
                System.debug('Received the following athletes:201');
                for(Object Contact: Contacts) {
                    System.debug(Contacts);
                }
            }
        return Response;
    }
    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://sheets.googleapis.com/v4/spreadsheets/1q7UWebB4YxpoRzHEIiZChBSE-mt-g4RzW330ZCpLfGc/values/range=A8');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"Name":"nameteststreamingtest"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 401) {
            System.debug('The status code returned was not expected: 401' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }  
}