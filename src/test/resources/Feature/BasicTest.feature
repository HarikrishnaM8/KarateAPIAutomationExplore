@BasicTest
  Feature: Test
    @UserAPI
    Scenario: Verify user GET response
      Given url 'https://reqres.in/api/users?page=2'
      When method GET
      Then status 200

      Scenario: Different operation on userResponse
        * def getUserResponse =  callonce read('classpath:Feature/BasicTest.feature@UserAPI')
        * def getResponse = getUserResponse.response
#        Match with a value
          * def getDataObjects = getResponse.data[0].id
        And match getDataObjects == 7
#        Get All the Id's and data in the nested array
          * def getIdData = getResponse.data
        * print getIdData
#        Get only Id's from the nested array
        * def getIdCount = getResponse.data.length
        * print getIdCount






