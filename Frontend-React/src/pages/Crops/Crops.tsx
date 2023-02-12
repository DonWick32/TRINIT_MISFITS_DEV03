import React, { useEffect, useState } from "react";
import { CropTile } from "./CropTile";
import axios from "axios";
import { Navbar } from "../../components/NavBar/Navbar";

export const Crops = () => {
	const [district, setDistrict] = useState("");
	const [crops, setCrops] = useState({});
	const openCageAPIKey = "72ff223ae47c4b14ab8a5a9d92e0b8a3";
	const Location = async () => {
		const location = window.navigator && window.navigator.geolocation;
		location.getCurrentPosition(async (position) => {
			const resp = await axios.get(
				`https://api.opencagedata.com/geocode/v1/json?key=${openCageAPIKey}&q=${position.coords.latitude}+${position.coords.longitude}`
			);
			const district = await resp.data.results[0].components.county;
			setDistrict(district);
			const cropsResp = await axios.get(
				`http://localhost:8000/district?district=${district}`
			);
			console.log(cropsResp.data);
			setCrops(cropsResp.data);
		});
	};
	useEffect(() => {
		Location();
	}, []);
	return (
		<div className="w-full min-h-screen flex flex-col items-center pt-10 justify-start gap-10 landing-page-bg">
			<Navbar />
			<div className="">
				<span className="text-[45px] font-bold text-neutral-700">
					Your District :{district}
				</span>
			</div>
			<div className="flex flex-col items-start justify-start">
				{Object.keys(crops).map((crop) => {
					return (
						<>
							<div className="flex flex-row pl-5 items-start">
								<span className="text-[40px] font-bold text-neutral-700 ">
									{crop}
								</span>
							</div>
							<div className="flex p-10 gap-8 flex-row flex-wrap items-center">
								{[...new Set(crops[crop])].map((_crop) => {
									return <CropTile name={_crop} />;
								})}
							</div>
						</>
					);
				})}
			</div>
		</div>
	);
};
