import { test, expect } from '@playwright/test';

test.describe('SauceDemo E2E Checkout Flow', () => {

  test('User should be able to complete checkout successfully', async ({ page }) => {
    await page.goto('https://www.saucedemo.com/');
    await page.locator('[data-test="username"]').fill('standard_user');
    await page.locator('[data-test="password"]').fill('secret_sauce');
    await page.locator('[data-test="login-button"]').click();

    await expect(page.locator('.title')).toHaveText('Products');

    await page.locator('[data-test="add-to-cart-sauce-labs-onesie"]').click();

    await expect(page.locator('.shopping_cart_badge')).toHaveText('1');

    await page.locator('.shopping_cart_link').click();

    await expect(page.locator('.inventory_item_name')).toHaveText('Sauce Labs Onesie');

    await page.locator('[data-test="checkout"]').click();

    await page.locator('[data-test="firstName"]').fill('QA');
    await page.locator('[data-test="lastName"]').fill('Engineer');
    await page.locator('[data-test="postalCode"]').fill('12345');
    await page.locator('[data-test="continue"]').click();

    await expect(page.locator('.title')).toHaveText('Checkout: Overview');

    await page.locator('[data-test="finish"]').click();

    await expect(page.locator('.complete-header')).toHaveText('Thank you for your order!');

    await expect(page.locator('[data-test="back-to-products"]')).toBeVisible();
  });

});