Feature: Petstore API Automation Tests

  Background:
    # Base URL dan data setup yang akan dieksekusi sebelum setiap skenario
    * url 'https://petstore.swagger.io/v2'
    * def petId = 12345999
    * def newPet =
    """
    {
      "id": #(petId),
      "category": { "id": 1, "name": "Dogs" },
      "name": "QA_Automation_Dog",
      "photoUrls": ["string"],
      "tags": [{ "id": 1, "name": "automation" }],
      "status": "available"
    }
    """

  Scenario: POST /pet - Add a new pet
    Given path '/pet'
    And request newPet
    When method post
    Then status 200
    # Validasi bahwa response mengembalikan data yang benar
    And match response.id == petId
    And match response.name == 'QA_Automation_Dog'

  Scenario: GET /pet/findByStatus - Find pets by status
    Given path '/pet/findByStatus'
    And param status = 'available'
    When method get
    Then status 200
    And match responseType == 'json'
    # Validasi bahwa response tidak kosong dan semua statusnya 'available'
    And assert response.length > 0
    And match each response[*].status == 'available'

  Scenario: DELETE /pet/{petId} - Delete a pet by ID
    # PRE-CONDITION: Kita buat data pet-nya dulu agar aman saat dihapus
    Given path '/pet'
    And request newPet
    When method post
    Then status 200

    # ACTION: Eksekusi Delete
    Given path '/pet', petId
    And header api_key = 'special-key'
    When method delete
    Then status 200
    # Response message dari Swagger biasanya mengembalikan ID yang dihapus dalam bentuk string
    And match response.message == '#(petId.toString())'