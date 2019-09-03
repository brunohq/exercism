export const solve = (x, y) => {
	let r = radius(x, y);

	if (r <= 1) { return 10; }
	else if (r <= 5) { return 5; }
	else if (r <= 10) { return 1; }

	return 0;
};

export const radius = (x, y) => {
  return Math.sqrt(x ** 2 + y ** 2);
}