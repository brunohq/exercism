export class Triangle {
  constructor(...sides) {
    this.sides = sides.sort((a, b) => a - b);
  }

  kind() {
    let uniq = new Set(this.sides);

  	if (!this.is_triangle()) throw new Error("Not a triangle");
  	if (uniq.size === 1) return 'equilateral';
	if (uniq.size === 2) return 'isosceles';
 	if (uniq.size === 3) return 'scalene';
  }

  is_triangle() {
  	const [a, b, c] = this.sides;
	if (a <= 0) return false;
	if (a + b < c) return false;

	return true;
  }
}
