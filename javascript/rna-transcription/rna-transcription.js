export const toRna = (dna) => {
	const COMPLEMENTS = {
		"G": "C",
		"C": "G",
		"T": "A",
		"A": "U",
	};

  	return dna.split("").map( (nucleotide) => COMPLEMENTS[nucleotide] ).join("");
};
