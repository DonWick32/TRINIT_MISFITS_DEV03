import React, { useState } from "react";
import { Login } from "../../components/LoginPopup/Login";
import { Navbar } from "../../components/NavBar/Navbar";
import { CropSuggestions } from "../CropSuggestions/CropSuggestions";

const Dashboard = () => {
	const [showLogin, setShowLogin] = useState(false);
	const [loogedIn, setLoggedIn] = useState(false);
	return (
		<>
			<div className="h-screen relative w-screen flex flex-col items-center landing-page-bg">
				<Navbar />
				{!loogedIn ? (
					<>
						<div className="basis-[90%] flex flex-row items-center justify-center">
							<span className="text-[55px] animate-bounce tracking-widest leading-[50px] ">
								Login to get your personalized feed
							</span>
						</div>
					</>
				) : (
					<>
						<CropSuggestions />
					</>
				)}
			</div>
			{showLogin && (
				<div className="w-full absolute top-0 left-0 h-full">
					<Login />
				</div>
			)}
		</>
	);
};

export default Dashboard;
