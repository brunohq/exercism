const ORBITAL_PERIOD = {
	'mercury': 0.2408467,
	'venus': 0.61519726,
	'earth': 1.0,
	'mars': 1.8808158,
	'jupiter': 11.862615,
	'saturn': 29.447498,
	'uranus': 84.016846,
	'neptune': 164.79132
}

const SECONDS_IN_YEAR = 31557600

export const age = (planet, seconds) => {
	return round(toYears(seconds) / ORBITAL_PERIOD[planet]);
};

const toYears = (seconds) => {
	return seconds / SECONDS_IN_YEAR;
}

const round = (number) => {
	return Math.round(number * 100) / 100;
}
