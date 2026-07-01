import { describe, expect, it } from 'vitest';
import { slugify } from './slug';

describe('slugify', () => {
	it('lowercases and hyphenates spaces', () => {
		expect(slugify('Hello World')).toBe('hello-world');
	});

	it('strips punctuation', () => {
		expect(slugify('Hello, World!')).toBe('hello-world');
	});

	it('collapses repeated hyphens', () => {
		expect(slugify('a   b')).toBe('a-b');
	});

	it('trims leading and trailing hyphens', () => {
		expect(slugify('  --Hello--  ')).toBe('hello');
	});
});