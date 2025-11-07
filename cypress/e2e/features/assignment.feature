Feature: Assignment API & Frontend

  # ===== API Testleri =====
  Scenario: Get all assignments via API
    Given the API is reachable
    When I GET "/assignments"
    Then the response status should be 200
    And the response should contain a JSON array

  Scenario: Create a new assignment via API
    Given the API is reachable
    When I POST to "/assignments" with:
      | user_id | shift_id | role      |
      | 2       | 1        | Manager   |
    Then the response status should be 201
    And the response should contain a JSON object

  # ===== Frontend Testi =====
  Scenario: Assignments page loads in frontend
    When I visit "/assignments"
    Then I should see "Atamalar"
