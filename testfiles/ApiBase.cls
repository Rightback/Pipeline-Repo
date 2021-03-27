@SuppressWarnings('PMD.ApexDoc, PMD.AvoidGlobalModifier')
global abstract class ApiBase {
    // Base URL
    public static final String BASE_URL = '/services/apexrest';

    // HTTP Status Codes
    public static final Integer HTTP_STATUS_CODE_OK = 200;
    public static final Integer HTTP_STATUS_CODE_CREATED = 201;
    public static final Integer HTTP_STATUS_CODE_NO_CONTENT = 204;
    public static final Integer HTTP_STATUS_CODE_BAD_REQUEST = 400;
    public static final Integer HTTP_STATUS_CODE_INTERNAL_SERVER_ERROR = 500;
    public static final Integer HTTP_STATUS_CODE_DUPLICATE_REQUEST = 409;
    public static final Integer HTTP_STATUS_CODE_NOT_IMPLEMENTED = 501;

    // Error Messages
    public static final String ERROR_BAD_REQUEST = 'Error parsing data. Please check your request.';
    public static final String ERROR_DUPLICATE_REQUEST = 'Duplicate request.';
    public static final String ERROR_INTERNAL_ERROR = 'Internal error occurred while processing your request.';
    public static final String ERROR_NO_CONTENT = 'No records were found for your request.';

    // URI PATH ENTITIES
    public static final String PATH_ENTITY_ECHO = 'echo';

    // Object Responses
    global abstract class BaseResponse {
        public List<String> errors { get; set; }
        public Boolean success { get; set; }

        public BaseResponse() {
            this.errors = new List<String>();
            this.success = true;
        }

        /*protected void log(LogType logType) {
            LogService.log(String.valueOf(this).split(':')[0], logType, this);
            LogService.publish();
        }*/
    }

    global virtual class GetResponse extends BaseResponse {
        public List<Object> records { get; set; }
        public Integer count {
            get {
                return this.records.size();
            }
        }

        public GetResponse() {
            this.records = new List<Object>();
            this.success = true;
            /*log(LogType.INFO);*/
        }

        public GetResponse(System.RestResponse res, List<Object> objs) {
            this.records = objs;
            res.statusCode = HTTP_STATUS_CODE_OK;
            /*log(LogType.INFO);*/
        }
    }

    global virtual class PostResponse extends BaseResponse {
        public List<Object> records { get; set; }
        public Integer count {
            get {
                return (this.records == null) ? 0 : this.records.size();
            }
        }

        public PostResponse() {
            this.records = new List<Object>();
            this.success = true;
            /*log(LogType.INFO);*/
        }

        public PostResponse(System.RestResponse res, List<Object> objs) {
            this.records = objs;
            res.statusCode = HTTP_STATUS_CODE_CREATED;
            /*log(LogType.INFO);*/
        }
    }

    global class ErrorResponse extends BaseResponse {
        global String errorMessage { get; set; }

        global ErrorResponse(System.RestResponse res, Integer errorCode, String errorMessage) {
            super();
            res.statusCode = errorCode;
            this.errors.add(errorMessage);
            this.errorMessage = String.join(this.errors, '|');
            this.success = false;
            /*log(LogType.ERROR);*/
        }

        global ErrorResponse(System.RestResponse res, Integer statusCode, List<String> errors) {
            super();
            res.statusCode = statusCode;
            this.errors = (errors != null && !errors.isEmpty()) ? errors : new List<String>();
            this.errorMessage = String.join(this.errors, '|');
            this.success = false;
            /*log(LogType.ERROR);*/
        }
    }
}
