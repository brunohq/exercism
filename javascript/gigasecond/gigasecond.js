const GIGASECOND = 1e9
const MS_FACTOR = 1e3

export const gigasecond = (date) => {
	return new Date(date.getTime() + toMilliseconds(GIGASECOND))
};

const toMilliseconds = (seconds) => {
	return seconds * MS_FACTOR;
};
