Feature: Model API

  Background:
    * url 'https://www.volkswagen.co.uk/api/accessory/1.0'
    * path 'model'
    * header Accept = 'application/json'

  Scenario: Verify get models
    When method get
    Then status 200

#    There are numerous tests that could be performed to verify the expected data
#    this is just an example
  Scenario: Get Model Arteon
    When request {label: 'Arteon'}
    And method get
    Then match response == read('expected-arteon.json')
    And print 'Response is: ', response

  Scenario Outline: invalid model request with text
    Given request <requestText>
    When method <methodType>
    Then status 405
    And print 'Response is: ', response
    Examples:
      | requestText                          | methodType |
      | {"id":"Arteon","label":"Test Label"} | put        |
      | {"label":"Test Label"}               | post       |
      | {"label":"Arteon"}                   | delete     |

  Scenario: verify invalid model path response
    Given path 'model/test'
    When method get
    Then status 404
    And print 'Response is: ', response