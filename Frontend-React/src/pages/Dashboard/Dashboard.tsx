import React, { useEffect, useState } from "react";
import { Login } from "../../components/LoginPopup/Login";
import { Navbar } from "../../components/NavBar/Navbar";

const Dashboard = () => {
	const [showSignUp, setShowSignUp] = useState(false);
	const [loogedIn, setLoggedIn] = useState(false);
	useEffect(() => {
		const token = localStorage.getItem("id");
		if (token) {
			setLoggedIn(true);
		}
	}, []);
	const handleLogin = (arg: boolean) => {
		setShowSignUp(arg);
	};
	return (
		<>
			<div className="h-screen relative w-screen flex flex-col items-center landing-page-bg">
				<Navbar handleLogin={handleLogin} showsignup={showSignUp} />
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
						<div className="basis-[90%] flex flex-row items-center justify-center">
							<span className="text-[55px] animate-bounce tracking-widest leading-[50px] ">
								Welcome !!
							</span>
						</div>
					</>
				)}
			</div>
			{showSignUp && (
				<div className="w-full absolute top-0 left-0 h-full">
					<Login handleClick={handleLogin} showsignup={showSignUp} />
				</div>
			)}
		</>
	);
};

export default Dashboard;
