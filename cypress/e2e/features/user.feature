Feature: User API & Frontend

  # ===== API Testleri =====
  Scenario: Get all users via API
    Given the API is reachable
    When I GET "/users"
    Then the response status should be 200
    And the response should contain a JSON array

  Scenario: Create a new user via API
    Given the API is reachable
    When I POST to "/users" with:
      | name      | email             | role     | department_id |
      | Test User | test@example.com  | Manager  | 1             |
    Then the response status should be 201
    And the response should contain a JSON object

  # ===== Frontend Testi =====
  Scenario: Users page loads in frontend
    # Bu adım artık opsiyonel çünkü Before hook frontend’i açıyor
    # Given the frontend is running
    When I visit "/"
    Then I should see "Kullanıcılar"
