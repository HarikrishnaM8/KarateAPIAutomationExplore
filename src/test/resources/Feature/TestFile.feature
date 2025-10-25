@Test
  Feature: Print the name <Value>
    Background:
      Given def name = 'VimalKrishna'
    Scenario Outline: print value
      * print name
      Given def name = '<Value>'
      * def priceValue = 200
      * print name
      * print priceValue
      Examples:
        | Value          |
        | Harikrishna    |
        | Vikramkrishna  |
        | kalyan krishna |