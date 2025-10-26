@postgres
Feature: DB Validation

  Scenario: Call PostgresHelper
    # Karate way to load a Java class
    * def PostgresHelper = Java.type('org.testkarate.PostgresHelper')

    # Call your method
    * def result = PostgresHelper.runQuery('select * from kovvur.egpt_basic_property where id in (13214,12830)')
    * def response = result
    * print response
    * def getCreatedDate = $response[*].createddate
    * print getCreatedDate

    * def getCreatedDateCount = response.length
    * print getCreatedDateCount

    * def electionwardWiseResultQuery = "select count(*) as totalcount, max(a.createddate) as maxcreateddate, min(a.createddate) as minCreateddate, electionwardid from egpt_basic_property as a join egpt_property as b on (a.id=b.id) join egpt_mv_propertyinfo as c on (a.id=c.basicpropertyid) where a.createddate>='2023-01-01 00:00:00.000' group by electionwardid"

    * def response =  PostgresHelper.runQuery(electionwardWiseResultQuery)
    * print response


