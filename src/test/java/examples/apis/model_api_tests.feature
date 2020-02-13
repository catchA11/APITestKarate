Feature: Model API

  Background:
    * url 'https://www.volkswagen.co.uk/api/accessory/1.0'
    * path 'model'
    * header Accept = 'application/json'

  Scenario: Get Model
    When request {label: 'Arteon'}
    And method get
    Then match response == read('expected-arteon.json')

