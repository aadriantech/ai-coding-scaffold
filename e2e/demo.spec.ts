import { test, expect } from '@playwright/test';

test('demo page loads', async ({ page }) => {
	await page.goto('/');
	await expect(page.getByRole('heading', { name: 'AI Coding Scaffold' })).toBeVisible();
	await expect(page.getByTestId('tagline')).toHaveText('Plan before code.');
});

test('cta updates tagline', async ({ page }) => {
	await page.goto('/');
	await page.getByRole('button', { name: 'Get Started' }).click();
	await expect(page.getByTestId('tagline')).toHaveText('TDD next.');
});