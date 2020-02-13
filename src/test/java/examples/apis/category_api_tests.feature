Feature: Category API

  Background:
    * url 'https://www.volkswagen.co.uk/api/accessory/1.0'
    * path 'category'
    * header Accept = 'application/json'
    * def expectedCategories = [{"id":"14","label":"Accessories"},{"id":"12","label":"Child Safety"},{"id":"11","label":"Exterior Protection"},{"id":"9","label":"Exterior Styling"},{"id":"5","label":"Infotainment"},{"id":"8","label":"Interior Protection"},{"id":"6","label":"Interior Styling"},{"id":"2","label":"Journey"},{"id":"10","label":"Mudflaps"},{"id":"15","label":"Safety and Security"},{"id":"1","label":"Towing Master"},{"id":"3","label":"Vehicle Care"},{"id":"7","label":"Vehicle Technology"},{"id":"4","label":"Wheels and Accessories"},{"id":"13","label":"Wind Deflectors"}]
    * def newCategory = [{"id":"16", "label":"Test Label"}]

#    Note: Depending on the requirements, I would in reality check the categories against a database or the response
#    from another API rather than a hard coded list like this.
  Scenario: Find Category in Categories
    When method get
    Then status 200
    And assert response.numberFound == 15
    And match response.categories[*].label contains "Accessories"

#    Another potential format dor testing the JSON response could be like this:
  Scenario: Verify all Categories
    When method get
    Then status 200
    And match response.categories == expectedCategories

  Scenario Outline: invalid category request with text
    Given request <requestText>
    When method <methodType>
    Then status 405
    And print 'Response is: ', response
    Examples:
      | requestText                      | methodType |
      | {"id":"15","label":"Test Label"} | put        |
      | {"label":"Test Label"}           | post       |
      | {"label":"Accessories"}          | delete     |

  Scenario: verify invalid category path response
    Given path 'category/test'
    When method get
    Then status 404
    And print 'Response is: ', response






