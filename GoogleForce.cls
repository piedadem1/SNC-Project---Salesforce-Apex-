public class GoogleForce {
    public class ServiceAcctException extends Exception {}
    
    private GoogleSheetAPI__mdt serviceAcct;
    private Google_SA_Token__c serviceAcctToken;
    private Boolean updateToken;
    
    public GoogleForce(String serviceAcctName){
        List<GoogleSheetAPI__mdt> saQueryResult =[Select Id From GoogleSheetAPI__mdt Where Label =: serviceAcctName limit 1];
        
        if (saQueryResult.size() == 0) {
            saQueryResult =[Select Id From GoogleSheetAPI__mdt Where DeveloperName =: serviceAcctName limit 1];
        }
        
        if (saQueryResult.size() == 0) {
            throw new ServiceAcctException('No Service Account Found');
        }
        this.serviceAcct = saQueryResult.get(0);
        
        
        this.serviceAcctToken = Google_SA_Token__c.getValues(serviceAcct.Id);
        if (this.serviceAcctToken == null){
            this.serviceAcctToken = new Google_SA_Token__c(
            name = serviceAcct.Id,
            Value__c = Null,
            TimeStamp__c = null);
            
        }
        updateToken = false;
    }
        
        private class JwtHeader {
            public String alg;
            public String typ;
            
            public JwtHeader() {
            alg = 'RS256';
            typ = 'JWT';
        }
    }
    
    
    Private class JwtClaim {
            public String iss;
            public String scope;
            public String aud;
            public Long exp;
          public Long iat;
         
        // will expire in 60 minutes
        Public JwtClaim(GoogleSheetAPI__mdt sa) {
          Datetime currDt = Datetime.now();
            
            iss = sa.ClientEmail__c;
            Scope = sa.Scope__c;
            aud = 'https://www.googleapis.com/oauth/v4/token';
            iat = currDt.getTime()/1000;
            exp = iat + 60;
      }   
    }
    
    Private class JwtSignature {
        public Blob privateKeyBlob;
        
        public JwtSignature(GoogleSheetAPI__mdt sa){
            privateKeyBlob = EncodingUtil.base64Decode(
            sa.Private_Key__c.unescapeJava());
        }
 }
}