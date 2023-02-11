import React, { useState } from "react";
import {
	Box,
	Group,
	MultiSelect,
	PasswordInput,
	Select,
	TextInput,
} from "@mantine/core";
import { useForm } from "@mantine/form";

export const Login = () => {
	const form = useForm({
		initialValues: {
			name: "",
			job: "",
			email: "",
			favoriteColor: "",
			age: 18,
		},
	});
	const handleClick = (typeOfUser: string) => {
		if (typeOfUser === "farmer") {
			setEnth(false);
			setExpert(false);
			setFarmer(true);
		} else if (typeOfUser === "enth") {
			setEnth(true);
			setExpert(false);
			setFarmer(false);
		} else {
			setEnth(false);
			setExpert(true);
			setFarmer(false);
		}
	};
	const [farmer, setFarmer] = useState(true);
	const [enth, setEnth] = useState(false);
	const [expert, setExpert] = useState(false);

	const [searchValue, onSearchChange] = useState("");
	const data = [
		{ value: "english", label: "English" },
		{ value: "tamil", label: "Tamil" },
		{ value: "telugu", label: "Telugu" },
		{ value: "malayalam", label: "Malayalam" },
		{ value: "kannada", label: "Kannada" },
		{ value: "hindi", label: "Hindi" },
	];
	return (
		<>
			<div className="w-[60%]  absolute translate-x-[-50%] translate-y-[-50%] top-[50%] left-[50%] h-[80%] rounded-[18px] items-center justify-center flex-col opacity-85 bg-[rgb(101,211,172)]">
				<div className="basis-[17%] flex flex-row items-center justify-center gap-4">
					<button
						className={`w-fit p-4 flex items-center justify-center h-fit ${
							farmer ? "bg-[rgba(0,0,0,0.83)]" : "bg-[rgba(0,0,0,0.5)]"
						} rounded-[10px]`}
						onClick={() => {
							handleClick("farmer");
						}}
					>
						<span className="text-[20px] font-mono font-bold text-white">
							FARMER
						</span>
					</button>
					<button
						className={`w-fit p-4 flex items-center justify-center h-fit ${
							enth ? "bg-[rgba(0,0,0,0.83)]" : "bg-[rgba(0,0,0,0.5)]"
						} rounded-[10px]`}
						onClick={() => {
							handleClick("enth");
						}}
					>
						<span className="text-[20px] font-mono font-bold text-white">
							ENTHUSIAST
						</span>
					</button>
					<button
						className={`w-fit p-4 flex items-center justify-center h-fit ${
							expert ? "bg-[rgba(0,0,0,0.83)]" : "bg-[rgba(0,0,0,0.5)]"
						} rounded-[10px]`}
						onClick={() => {
							handleClick("expert");
						}}
					>
						<span className="text-[20px] font-mono font-bold text-white">
							EXPERT
						</span>
					</button>
				</div>
				<div className="basis-[80%] flex flex-col items-center justify-start mt-[25px] gap-4">
					<Box
						component="form"
						maw={600}
						onSubmit={(event) => {
							form.onSubmit(() => {
								event?.preventDefault();
							});
						}}
					>
						<TextInput
							label="Name"
							placeholder="Name"
							classNames={{
								input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[10px] rounded-[6.3px]",
							}}
							withAsterisk
							{...form.getInputProps("name")}
						/>
						<TextInput
							label="Phone Number"
							placeholder="+91 1234567890"
							classNames={{
								input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[10px] rounded-[6.3px]",
							}}
							withAsterisk
							mt="md"
							type="number"
							{...form.getInputProps("job")}
						/>
						<TextInput
							label="Your email"
							placeholder="Your email"
							classNames={{
								input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[10px] rounded-[6.3px]",
							}}
							withAsterisk
							mt="md"
							{...form.getInputProps("email")}
						/>
						{!expert && (
							<>
								<PasswordInput
									placeholder="Password"
									label="Password"
									withAsterisk
									className="mt-[10px]"
									classNames={{
										input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[5px] rounded-[6.3px]",
									}}
								/>
								<Select
									className="mt-[15px]"
									label="State"
									placeholder="Pick one"
									withAsterisk
									searchable
									onSearchChange={onSearchChange}
									searchValue={searchValue}
									nothingFound="No options"
									data={["React", "Angular", "Svelte", "Vue"]}
									classNames={{
										input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[4px] rounded-[6.3px]",
									}}
								/>
								<MultiSelect
									data={data}
									label="Your preffered languages"
									placeholder="Pick all that you like"
									className="mt-[15px]"
									withAsterisk
									classNames={{
										input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[8px] rounded-[6.3px]",
									}}
								/>
							</>
						)}
						<Group position="center" mt="md">
							<button className="w-fit p-4 flex items-center justify-center h-fit bg-[rgba(0,0,0,0.5)] hover:bg-[rgba(0,0,0,0.8)] rounded-[10px]">
								<span className="text-[20px] font-mono font-bold text-white">
									SUBMIT
								</span>
							</button>
						</Group>
					</Box>
				</div>
			</div>
		</>
	);
};
