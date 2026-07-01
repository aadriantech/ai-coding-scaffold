/** Greet a user by name; defaults to "world" when empty. */
export function greet(name?: string): string {
	const who = name?.trim() || 'world';
	return `Hello, ${who}!`;
}