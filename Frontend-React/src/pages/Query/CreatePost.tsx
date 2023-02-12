import React from "react";
import { Textarea } from "@mantine/core";
import { useRef } from "react";
import axios from "axios";

export const CreatePost = () => {
	const handleSubmit = async () => {
		console.log(ref.current?.value);
		const data = {
			question: ref.current?.value,
			sender_id: localStorage.getItem("id"),
			sender_type: localStorage.getItem("type"),
		};
		const resp = await axios.post(
			`http://localhost:8000/query/${data.sender_type}?sender_id=${data.sender_id}&query_string=${data.question}`
		);
		console.log(resp);
		window.location.reload();
	};
	const ref = useRef(null);

	return (
		<div className="flex flex-col min-h-[350px] rounded-[15px] w-[50%] bg-white items-center justify-start">
			<div className="flex flex-row gap-3 pl-9 items-center justify-start w-full basis-[10%]">
				<span className="text-[20px] text-black font-semibold">
					Username
				</span>
			</div>
			<div className="basis-[70%] w-full flex flex-col items-center justify-start">
				<Textarea
					className="w-[90%] h-[100px] mt-2"
					classNames={{
						input: "text-black leading-[24px] text-[16px]",
						label: "text-black text-[16px] font-semibold",
					}}
					label="Write Something"
					placeholder="MAX-10 ROWS"
					autosize
					minRows={8}
					maxRows={9}
					ref={ref}
					onSubmit={() => {
						handleSubmit();
					}}
				/>
			</div>
			<div className="basis-[20%] w-full flex flex-row items-center justify-center">
				<button
					onClick={() => {
						handleSubmit();
					}}
					className="w-fit p-4 flex items-center justify-center h-fit bg-[rgba(0,0,0,0.5)] hover:bg-[rgba(0,0,0,0.8)] rounded-[10px]"
				>
					<span className="text-[14px] font-mono font-bold text-white">
						SUBMIT
					</span>
				</button>
			</div>
		</div>
	);
};
