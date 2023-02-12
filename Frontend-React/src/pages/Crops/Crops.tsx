import React, { useEffect, useState } from "react";
import { CropTile } from "./CropTile";
import axios from "axios";

export const Crops = () => {
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
		<div className="w-full h-full flex flex-col items-center pt-10 justify-start gap-10 landing-page-bg">
			<div className="flex flex-col items-start justify-start">
				<div className="flex flex-row pl-5 items-start">
					<span className="text-[40px] font-medium ">Season</span>
				</div>
				<div className="flex p-10 gap-8 flex-row flex-wrap items-center">
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
					<CropTile />
				</div>
			</div>
		</div>
	);
};
