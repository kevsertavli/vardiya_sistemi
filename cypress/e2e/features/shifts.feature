Feature: Shifts API & Frontend

  # ===== API Testleri =====
  Scenario: Get all shifts via API
    Given the API is reachable
    When I GET "/shifts"
    Then the response status should be 200
    And the response should contain a JSON array

  Scenario: Create a new shift via API
    Given the API is reachable
    When I POST to "/shifts" with:
      | name      | start_time | end_time |
      | Morning   | 08:00      | 16:00    |
    Then the response status should be 201
    And the response should contain a JSON object

  # ===== Frontend Testi =====
  Scenario: Shifts page loads in frontend
    # Opsiyonel: Before hook frontend’i açıyor
    # Given the frontend is running
    When I visit "/shifts"
    Then I should see "Vardiyalar"
