Feature: Department API & Frontend

  # ===== API Testleri =====
  Scenario: Get all departments via API
    Given the API is reachable
    When I GET "/departments"
    Then the response status should be 200
    And the department list should contain at least 1 items
    And the response should contain a JSON array

  Scenario: Create a new department via API
    Given the API is reachable
    When I POST to "/departments" with:
      | name    | location  |
      | TestDep | Istanbul  |
    Then the response status should be 201
    And the response should contain "id"
    And the response should contain a JSON object

  # ===== Frontend Testi =====
  Scenario: Departments page loads in frontend
    # Opsiyonel: Before hook frontend’i açıyor
    # Given the frontend is running
    When I visit "/departments"
    Then I should see "Departmanlar"
