import React, { useState } from "react";
import { Button } from "@mantine/core";
import { Login } from "../../components/LoginPopup/Login";

const Dashboard = () => {
	const [showLogin, setShowLogin] = useState(false);
	return (
		<>
			<div className="h-screen relative w-screen flex flex-col items-center landing-page-bg">
				<div className=" w-[85%] h-full basis-[10%] flex flex-row justify-between items-center">
					<div className="basis-[15%] flex flex-row items-center justify-center">
						<span className="text-[32px] font-mono font-extrabold not-italic tracking-wide">
							Agriculture
						</span>
					</div>
					<div className="flex flex-row gap-5 font-mono basis-[25%] items-center justify-between">
						<Button
							variant="light"
							onClick={() => {
								setShowLogin(!showLogin);
							}}
						>
							<span className="text-[20px] text-black">LOGIN</span>
						</Button>
						<Button variant="light">
							<span className="text-[20px] font-bold text-black">
								CHAT
							</span>
						</Button>
						<Button variant="light">
							<span className="text-[20px] font-bold text-black">
								CALL
							</span>
						</Button>
					</div>
				</div>
			</div>
			{showLogin && <Login />}
		</>
	);
};

export default Dashboard;
