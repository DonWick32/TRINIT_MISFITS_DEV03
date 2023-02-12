import React, { useEffect, useState } from "react";
import axios from "axios";

export const CropSuggestions = () => {
	const [district, setDistrict] = useState("");
	const openCageAPIKey = "72ff223ae47c4b14ab8a5a9d92e0b8a3";
	const Location = async () => {
		const location = window.navigator && window.navigator.geolocation;
		location.getCurrentPosition(async (position) => {
			const resp = await axios.get(
				`https://api.opencagedata.com/geocode/v1/json?key=${openCageAPIKey}&q=${position.coords.latitude}+${position.coords.longitude}`
			);
			const district = await resp.data.results[0].components.county;
			setDistrict(district);
		});
	};
	console.log(district);
	useEffect(() => {
		Location();
	}, []);
	return (
		<div className="basis-[90%] w-full h-full items-center justify-around flex flex-col"></div>
	);
};
