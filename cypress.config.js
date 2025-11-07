const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const {
  addCucumberPreprocessorPlugin,
} = require("@badeball/cypress-cucumber-preprocessor");
const { createEsbuildPlugin } = require("@badeball/cypress-cucumber-preprocessor/esbuild");

module.exports = defineConfig({
  e2e: {
    // Node event setup
    async setupNodeEvents(on, config) {
      // Cucumber preprocessor plugin
      await addCucumberPreprocessorPlugin(on, config);

      // Esbuild bundler for Cypress
      on(
        "file:preprocessor",
        createBundler({
          plugins: [createEsbuildPlugin(config)],
        })
      );

      return config;
    },

    // Feature dosyalarının yolu
    specPattern: "cypress/e2e/features/**/*.feature",

    // Support dosyası (custom commands vb.)
    supportFile: "cypress/support/e2e.js",

    // Video ve ekran ayarları
    video: true,
    screenshotOnRunFailure: true,
    viewportWidth: 1280,
    viewportHeight: 720,

    // 🔹 Frontend URL’si (Cypress cy.visit('/') kullanır)
    baseUrl: "http://localhost:8080",

    // Chrome güvenlik engelini kaldır
    chromeWebSecurity: false,
  },
});
