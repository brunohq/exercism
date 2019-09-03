export const value = (colors) => {
	let code = colors.map(color => COLORS.indexOf(color)).join('');
	return Number(code);
};

const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];