@IsTest
public with sharing class ApiBaseTest {
    @IsTest
    private static void statusCodes() {
        Test.startTest();
        System.assertEquals(200, ApiBase.HTTP_STATUS_CODE_OK, 'Expected different status code.');
        System.assertEquals(201, ApiBase.HTTP_STATUS_CODE_CREATED, 'Expected different status code.');
        System.assertEquals(204, ApiBase.HTTP_STATUS_CODE_NO_CONTENT, 'Expected different status code.');
        System.assertEquals(400, ApiBase.HTTP_STATUS_CODE_BAD_REQUEST, 'Expected different status code.');
        System.assertEquals(500, ApiBase.HTTP_STATUS_CODE_INTERNAL_SERVER_ERROR, 'Expected different status code.');
        System.assertEquals(409, ApiBase.HTTP_STATUS_CODE_DUPLICATE_REQUEST, 'Expected different status code.');
        System.assertEquals(501, ApiBase.HTTP_STATUS_CODE_NOT_IMPLEMENTED, 'Expected different status code.');
        Test.stopTest();
    }

    @IsTest
    private static void errorMessages() {
        Test.startTest();
        System.assertEquals(
            'Error parsing data. Please check your request.',
            ApiBase.ERROR_BAD_REQUEST,
            'Expected different error code.'
        );
        System.assertEquals('Duplicate request.', ApiBase.ERROR_DUPLICATE_REQUEST, 'Expected different error code.');
        System.assertEquals(
            'Internal error occurred while processing your request.',
            ApiBase.ERROR_INTERNAL_ERROR,
            'Expected different error code.'
        );
        System.assertEquals(
            'No records were found for your request.',
            ApiBase.ERROR_NO_CONTENT,
            'Expected different error code.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void entityPaths() {
        Test.startTest();
        System.assertEquals('echo', ApiBase.PATH_ENTITY_ECHO, 'Expected different entity path.');
        Test.stopTest();
    }

    @IsTest
    private static void getResponseCtor() {
        Test.startTest();
        ApiBase.GetResponse getResponse = new ApiBase.GetResponse();
        Test.stopTest();

        System.assert(getResponse != null, 'The response should not be null.');
        System.assertEquals(0, getResponse.count, 'Expected the response to be empty.');
    }

    @IsTest
    private static void getResponseCtorSingleRecord() {
        Test.startTest();
        ApiBase.GetResponse getResponse = new ApiBase.GetResponse(new RestResponse(), new List<String>{ 'Some Data' });
        Test.stopTest();

        System.assert(getResponse != null, 'The response should not be null.');
        System.assertEquals(1, getResponse.count, 'Expected the response to have a single item.');
        System.assert(getResponse.records.contains('Some Data'), 'Expected the response to contain some data.');
    }

    @IsTest
    private static void postResponseCtor() {
        Test.startTest();
        ApiBase.PostResponse postResponse = new ApiBase.PostResponse();
        Test.stopTest();

        System.assert(postResponse != null, 'The response should not be null.');
        System.assertEquals(0, postResponse.count, 'Expected the response to be empty.');
    }

    @IsTest
    private static void postResponseCtorSingleRecord() {
        Test.startTest();
        ApiBase.PostResponse postResponse = new ApiBase.PostResponse(
            new RestResponse(),
            new List<String>{ 'Some Data' }
        );
        Test.stopTest();

        System.assert(postResponse != null, 'The response should not be null.');
        System.assertEquals(1, postResponse.count, 'Expected the response to have a single item.');
        System.assert(postResponse.records.contains('Some Data'), 'Expected the response to contain some data.');
    }

    @IsTest
    private static void errorReponseCtorSingleError() {
        Test.startTest();
        ApiBase.ErrorResponse errorResponse = new ApiBase.ErrorResponse(new RestResponse(), 500, 'Error message');
        Test.stopTest();

        System.assert(errorResponse != null, 'The response should not be null.');
        System.assertEquals(
            'Error message',
            errorResponse.errorMessage,
            'Expected the error message to have a different value.'
        );
    }

    @IsTest
    private static void errorReponseCtorListOfErrors() {
        List<String> errors = new List<String>();
        errors.add('Error message');
        errors.add('Another error message');

        Test.startTest();
        ApiBase.ErrorResponse errorResponse = new ApiBase.ErrorResponse(new RestResponse(), 500, errors);
        Test.stopTest();

        System.assert(errorResponse != null, 'The response should not be null.');
        System.assertEquals(2, errorResponse.errors.size(), 'Expected 2 errors in the response.');
        System.assert(errorResponse.errors.contains('Error message'), 'Expected errors to contain this error message.');
        System.assert(
            errorResponse.errors.contains('Another error message'),
            'Expected errors to contain this error message.'
        );
    }

    @IsTest
    private static void errorReponseCtorListOfErrorsIsNull() {
        List<String> errors = null;

        Test.startTest();
        ApiBase.ErrorResponse errorResponse = new ApiBase.ErrorResponse(new RestResponse(), 500, errors);
        Test.stopTest();

        System.assert(errorResponse != null, 'The response should not be null.');
        System.assertEquals(0, errorResponse.errors.size(), 'Expected 0 errors in the response.');
    }
}
