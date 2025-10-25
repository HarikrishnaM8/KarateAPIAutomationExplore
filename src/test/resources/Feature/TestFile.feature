@Test
  Feature: Print the name <Value>
    Scenario Outline: print value
      * def name = '<Value>'
      * print name
      Examples:
        | Value          |
        | Harikrishna    |
        | Vikramkrishna  |
        | kalyan krishna |