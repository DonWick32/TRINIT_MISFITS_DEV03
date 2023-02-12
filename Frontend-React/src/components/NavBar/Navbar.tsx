import React, { useState } from "react";
import { Button } from "@mantine/core";
import { useNavigate } from "react-router-dom";

export const Navbar = (props: {
	handleLogin: (arg: boolean) => void;
	showsignup: boolean;
}) => {
	const navigate = useNavigate();
	const [showLogin, setShowLogin] = useState(false);
	return (
		<div className=" w-[85%] h-full basis-[10%] flex flex-row justify-between items-center">
			<div className="basis-[15%] flex flex-row items-center justify-center">
				<span
					onClick={() => {
						navigate("/");
					}}
					className="text-[32px] font-mono font-extrabold not-italic cursor-pointer tracking-wide"
				>
					Agriculture
				</span>
			</div>
			<div className="flex flex-row gap-5 font-mono basis-[25%] items-center justify-between">
				<Button
					variant="light"
					onClick={() => {
						props.handleLogin(!props.showsignup);
					}}
					className="text-[20px] font-bold text-black"
				>
					<span className="text-[20px] text-black">SIGNUP</span>
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
				<Button
					variant="light"
					onClick={() => {
						navigate("/schemes");
					}}
				>
					<span className="text-[20px] font-bold text-black">SCHEMES</span>
				</Button>
				<Button
					variant="light"
					onClick={() => {
						navigate("/crops");
					}}
				>
					<span className="text-[20px] font-bold text-black">CROPS</span>
				</Button>
				<Button
					variant="light"
					onClick={() => {
						navigate("/tech");
					}}
				>
					<span className="text-[20px] font-bold text-black">
						ADV TECH
					</span>
				</Button>
			</div>
		</div>
	);
};
