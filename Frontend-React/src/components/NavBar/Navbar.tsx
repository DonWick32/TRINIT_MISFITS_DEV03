import React, { useState } from "react";
import { Button } from "@mantine/core";
import { useNavigate } from "react-router-dom";

export const Navbar = () => {
	const navigate = useNavigate();
	const [showLogin, setShowLogin] = useState(false);
	return (
		<div className=" w-[85%] h-full basis-[10%] flex flex-row justify-between items-center">
			<div className="basis-[15%] flex flex-row items-center justify-center">
				<span
					onClick={() => {
						navigate("/");
					}}
					className="text-[32px] font-mono font-extrabold not-italic tracking-wide"
				>
					Agriculture
				</span>
			</div>
			<div className="flex flex-row gap-5 font-mono basis-[25%] items-center justify-between">
				<Button
					variant="light"
					onClick={() => {
						setShowLogin(!showLogin);
					}}
					className="text-[20px] font-bold text-black"
				>
					<span className="text-[20px] text-black">LOGIN</span>
				</Button>
				<Button
					onClick={() => {
						navigate("/chat");
					}}
					variant="light"
				>
					<span className="text-[20px] font-bold text-black">CHAT</span>
				</Button>
				<Button
					variant="light"
					onClick={() => {
						navigate("/call");
					}}
				>
					<span className="text-[20px] font-bold text-black">CALL</span>
				</Button>
				<Button
					variant="light"
					onClick={() => {
						navigate("/query");
					}}
				>
					<span className="text-[20px] font-bold text-black">QUERY</span>
				</Button>
			</div>
		</div>
	);
};
