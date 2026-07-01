import { describe, expect, it } from 'vitest';
import { greet } from './greet';

describe('greet', () => {
	it('defaults to world', () => {
		expect(greet()).toBe('Hello, world!');
	});

	it('greets by name', () => {
		expect(greet('Ada')).toBe('Hello, Ada!');
	});

	it('trims whitespace', () => {
		expect(greet('  Ada  ')).toBe('Hello, Ada!');
	});

	it('falls back when name is blank', () => {
		expect(greet('   ')).toBe('Hello, world!');
	});
});