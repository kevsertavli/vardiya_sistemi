import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

// 🔹 Base URL
const baseUrl = "http://localhost:3000";

// 👇 API bağlantısını test et
Given("the API is reachable", () => {
  cy.request(baseUrl).its("status").should("be.oneOf", [200, 404, 302, 401]);
});

// 🔹 GET request
When("I GET {string}", (endpoint) => {
  cy.request("GET", baseUrl + endpoint).as("apiResponse");
});

// 🔹 POST request (DataTable veya JSON string destekli)
When("I POST to {string} with:", (endpoint, data) => {
  let body;

  // DataTable objesi kontrolü
  if (data && typeof data.hashes === "function") {
    body = data.hashes()[0]; // İlk satırı al, key-value format
  } else if (data) {
    try {
      body = JSON.parse(data);
    } catch (e) {
      throw new Error("Geçersiz JSON string: " + e.message);
    }
  }

  cy.request("POST", baseUrl + endpoint, body).as("apiResponse");
});

// 🔹 POST request (sadece JSON string - nested param kullanımı)
When("I POST to {string} with JSON:", (endpoint, jsonString) => {
  const body = JSON.parse(jsonString);  // JSON string'i JS objesine çevir
  cy.request("POST", baseUrl + endpoint, body).as("apiResponse");
});

// 🔹 Response status kontrolü
Then("the response status should be {int}", (statusCode) => {
  cy.get("@apiResponse").its("status").should("eq", statusCode);
});

// 🔹 Response body kontrolü
Then("the response should contain {string}", (key) => {
  cy.get("@apiResponse").its("body").should("have.property", key);
});

// 🔹 JSON tipi kontrolü (array)
Then("the response should contain a JSON array", () => {
  cy.get("@apiResponse").its("body").should("be.an", "array");
});

// 🔹 JSON tipi kontrolü (object)
Then("the response should contain a JSON object", () => {
  cy.get("@apiResponse").its("body").should("be.an", "object");
});

// 🔹 Department özel doğrulama
Then("the department list should contain at least {int} items", (count) => {
  cy.get("@apiResponse").its("body").should("have.length.gte", count);
});

// 🔹 User özel doğrulama
Then("the user list should include {string}", (userName) => {
  cy.get("@apiResponse")
    .its("body")
    .then((users) => {
      const names = users.map((u) => u.name);
      expect(names).to.include(userName);
    });
});
