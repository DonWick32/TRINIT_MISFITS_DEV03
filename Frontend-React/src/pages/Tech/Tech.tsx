import React, { useEffect } from "react";
import { Navbar } from "../../components/NavBar/Navbar";
import axios from "axios";
import { CropCard } from "../CropSuggestions/CropCard";

export const Tech = () => {
	const [techResp, setTechResp] = React.useState([]);
	const Tech = async () => {
		const techResp = await axios.get("http://localhost:8000/techniques");
		setTechResp(techResp.data);
	};
	useEffect(() => {
		Tech();
	}, []);
	return (
		<div className="w-full min-h-screen flex flex-col items-center pt-10 justify-start gap-10 landing-page-bg">
			<Navbar />
			<div className="w-full flex items-center justify-center">
				<span className="text-[45px] font-bold text-neutral-700">
					Advancements in Technology
				</span>
			</div>
			<div className="w-full flex items-center justify-center">
				<div className="w-full min-h-full bg-cover p-[60px] items-start gap-11 justify-start flex flex-col ">
					{techResp.map((tech, index) => {
						return (
							// eslint-disable-next-line react/jsx-key
							<div
								className={`w-full h-fit flex items-center  ${
									index % 2 == 0 ? "justify-start" : "justify-end"
								}`}
							>
								<CropCard
									title={tech.Name}
									description={tech.Description}
								/>
							</div>
						);
					})}
				</div>
			</div>
		</div>
	);
};
