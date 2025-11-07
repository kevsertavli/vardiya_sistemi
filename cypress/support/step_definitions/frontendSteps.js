import {
  Given,
  When,
  Then,
  Before,
} from "@badeball/cypress-cucumber-preprocessor";

// 🔹 Tüm senaryolardan önce frontend’i aç
Before(() => {
  cy.visit("/"); // http://localhost:8080 açılır
});

// Frontend’in hazır olduğunu kontrol etme (opsiyonel bekleme)
Given("the frontend is running", () => {
  cy.wait(1000); // opsiyonel: frontend’in yüklenmesini bekler
});

// Sayfaya gitme
When("I visit {string}", (url) => {
  cy.visit(url); // baseUrl ile birleşir
});

// Sayfa içeriğini kontrol etme
Then("I should see {string}", (text) => {
  cy.contains(text).should("be.visible");
});
