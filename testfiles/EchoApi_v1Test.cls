@IsTest
public with sharing class EchoApi_v1Test {
    private static RestRequest req = new RestRequest();
    private static RestResponse res = new RestResponse();
    private static String baseRoute = ApiBase.BASE_URL + '/v1/' + ApiBase.PATH_ENTITY_ECHO;

    @IsTest
    private static void ctor() {
        Test.startTest();
        EchoApi_v1 echoApi = new EchoApi_v1();
        Test.stopTest();

        System.assert(echoApi != null, 'Expected the class to be initialized.');
    }

    @IsTest
    private static void get501NotImplemented() {
        RestContext.request = req;
        RestContext.response = res;
        req.requestURI = baseRoute;
        req.httpMethod = 'GET';

        Test.startTest();
        ApiBase.BaseResponse response = EchoApi_v1.get();
        Test.stopTest();

        System.assert(response.errors.contains('Not implemented'), 'Expected a different error.');
    }

    @IsTest
    private static void post200OK() {
        RestContext.request = req;
        RestContext.response = res;
        req.requestURI = baseRoute;
        req.httpMethod = 'POST';

        Test.startTest();
        ApiBase.PostResponse postResponse = (ApiBase.PostResponse) EchoApi_v1.post('Echo Me!');
        Test.stopTest();

        System.assert(postResponse.records.contains('Echo Me!'), 'Expected the response to equal the input.');
    }

    @IsTest
    private static void post400BadRequest() {
        RestContext.request = req;
        RestContext.response = res;
        req.requestURI = baseRoute;
        req.httpMethod = 'POST';

        Test.startTest();
        ApiBase.ErrorResponse errorResponse = (ApiBase.ErrorResponse) EchoApi_v1.post('');
        Test.stopTest();

        System.assert(
            errorResponse.errors.contains('You must include a value for the input.'),
            'Expected a different error.'
        );
    }
}
