Feature: DB Validation

  Scenario: Call PostgresHelper
    # Karate way to load a Java class
    * def PostgresHelper = Java.type('org.testkarate.PostgresHelper')

    # Call your method
    * def result = PostgresHelper.runQuery('SELECT count(*)  as total FROM kovvur.egpt_basic_property')
    * print result
    * def dbCount = result[0].total
    * print 'DB count:', dbCount
