@CallJavaClass
  Feature: Javaclass
    Scenario: call java class from feature file
      * def storeData = Java.type('org.testkarate.getDetails')
      * def data = storeData.multiplication()
      * print data
