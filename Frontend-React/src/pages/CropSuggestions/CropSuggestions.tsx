import React, { useEffect, useState } from "react";
import axios from "axios";
import { CropCard } from "./CropCard";
import { Navbar } from "../../components/NavBar/Navbar";

export const Schemes = () => {
	const [district, setDistrict] = useState("");
	const [schemes, setSchemes] = useState([]);
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
	const fetchData = async () => {
		const schemes = await axios.get("http://localhost:8000/schemes");
		setSchemes(schemes.data);
	};
	console.log(district);
	useEffect(() => {
		Location();
		fetchData();
	}, []);
	return (
		<div className="flex flex-col items-center landing-page-bg pt-5">
			<Navbar />
			<div className="text-[45px] flex items-center justify-center h-[120px]">
				<span>Schemes</span>
			</div>
			<div className="w-full min-h-full bg-cover p-[60px] items-start gap-11 justify-start flex flex-col ">
				{schemes.map((scheme, index) => {
					return (
						// eslint-disable-next-line react/jsx-key
						<div
							className={`w-full h-fit flex items-center  ${
								index % 2 == 0 ? "justify-start" : "justify-end"
							}`}
						>
							<CropCard
								title={scheme.Name}
								description={scheme.Description}
							/>
						</div>
					);
				})}
			</div>
		</div>
	);
};
