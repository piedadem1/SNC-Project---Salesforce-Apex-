public class GoogleSheets {

    
      private static final String rootUrl = 'https://www.googleapis.com/v4/spreadsheets';

    private GoogleForce gForce;
    
    public GoogleSheets(GoogleForce gForce) {
      this.gForce = gForce;
    }
    
    public class Spreadsheets {
      private GoogleSheets gSheet;
      
      public Spreadsheets(GoogleSheets gSheet) {
        this.gSheet = gSheet;
      }
      
      public Values values() {
        return new Values(this);
      }
    
    }
    
    public class values {
      private Spreadsheets gSpreadSheet;
      
      public Values(Spreadsheets gSpreadSheet) {
        this.gSpreadSheet = gSpreadSheet;
      }
      
      /*public BatchGet batchGet(String SpreadsheetId) {
        return new BatchGet(this, spreadsheetId);
      }
      public BatchUpdate BatchUpdate(String SpreadsheetId, BatchUpdateRequest content) {
        return new BatchUpdate(this, spreadsheetId, content);
      }
      public GetRange getRange(String SpreadsheetId, String range) {
        return new GetRange(this, spreadsheetId, range);
      }
      public UpdateRange updateRange(String SpreadsheetId, String range, ValueRange valueRange) {
        return new UpdateRange(this, spreadsheetId, range, valueRange);
      } */
    }
}