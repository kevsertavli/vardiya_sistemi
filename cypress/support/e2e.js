// support file
// Her Cypress komutu arasında gecikme ekle
const COMMAND_DELAY = 1000; // 3 saniye

for (const command of [
  "visit",
  "click",
  "type",
  "request",
  "intercept",
  "wait",
]) {
  Cypress.Commands.overwrite(command, (originalFn, ...args) => {
    const result = originalFn(...args);
    return new Promise((resolve) => {
      setTimeout(() => resolve(result), COMMAND_DELAY);
    });
  });
}
