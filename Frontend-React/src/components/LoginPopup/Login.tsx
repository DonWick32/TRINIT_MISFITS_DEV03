import React, { useState } from "react";
import axios from "axios";
import { Box, Group, PasswordInput, Select, TextInput } from "@mantine/core";
import { useForm } from "@mantine/form";

export const Login = (props: {
	handleClick: (arg: boolean) => void;
	showsignup: boolean;
}) => {
	const form = useForm({
		initialValues: {
			name: "",
			phone_number: "",
			email: "",
			region: "",
			language: "dvcdfx",
			password: "",
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
	const [langValue, onLangChange] = useState("");
	const [submittedValues, setSubmittedValues] = useState("");
	async function pushData() {
		console.log(submittedValues);
		const type = farmer ? "farmer" : enth ? "enthusiast" : "expert";
		const response = await axios.post(
			`http://localhost:8000/users/${type}`,
			JSON.parse(submittedValues)
		);
		console.log(response);

		localStorage.setItem("id", response.data.user_id);
		localStorage.setItem("type", type);
		props.handleClick(!props.showsignup);
	}

	return (
		<>
			<div className="w-full h-full flex flex-col items-center justify-center backdrop-blur-[5px] bg-[rgba(0,0,0,0.3)]">
				<div className="w-[60%] h-[83%] border-[rgba(0,0,0,0.7)] border-[1px] border-solid rounded-[22px] items-center justify-center flex flex-col bg-[rgb(60,186,131)]">
					<div className="basis-[17%] h-full flex flex-row items-center justify-center gap-4">
						<button
							className={`w-fit p-4 flex items-center justify-center h-fit ${
								farmer
									? "bg-[rgba(0,0,0,0.83)]"
									: "bg-[rgba(0,0,0,0.5)]"
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
								expert
									? "bg-[rgba(0,0,0,0.83)]"
									: "bg-[rgba(0,0,0,0.5)]"
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
								event.preventDefault();
								console.log("Form submitted");
								console.log(form.values);
								console.log(JSON.stringify(form.values, null, 2));

								setSubmittedValues(
									JSON.stringify(form.values, null, 2)
								);
								pushData();
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
								{...form.getInputProps("phone_number")}
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
							{
								<>
									<PasswordInput
										placeholder="Password"
										label="Password"
										withAsterisk
										className="mt-[10px]"
										classNames={{
											input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[5px] rounded-[6.3px]",
										}}
										{...form.getInputProps("password")}
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
										data={[
											"Andhra Pradesh",
											"Arunachal Pradesh",
											"Assam",
											"Bihar",
											"Chhattisgarh",
											"Goa",
											"Gujarat",
											"Haryana",
											"Himachal Pradesh",
											"Jharkhand",
											"Karnataka",
											"Kerala",
											"Madhya Pradesh",
											"Maharashtra",
											"Manipur",
											"Meghalaya",
											"Mizoram",
											"Nagaland",
											"Odisha",
											"Punjab",
											"Rajasthan",
											"Sikkim",
											"Tamil Nadu",
											"Telangana",
											"Tripura",
											"Uttarakhand",
											"Uttar Pradesh",
											"West Bengal",
										]}
										classNames={{
											input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[4px] rounded-[6.3px]",
										}}
										{...form.getInputProps("region")}
									/>
									<Select
										className="mt-[15px]"
										label="language"
										placeholder="Pick one"
										withAsterisk
										searchable
										onSearchChange={onLangChange}
										searchValue={langValue}
										nothingFound="No options"
										data={[
											"Hindi",
											"Bengali",
											"Telugu",
											"Marathi",
											"Tamil",
											"Urdu",
											"Gujarati",
											"Punjabi",
											"Malayalam",
											"Kannada",
											"Oriya",
											"Assamese",
											"English",
										]}
										classNames={{
											input: "w-[400px] h-[45px] font-mono box-border bg-new-white border-[0.25px] border-solid border-[rgba(255,255,255,0.403)] mt-[4px] rounded-[6.3px]",
										}}
										{...form.getInputProps("language")}
									/>
								</>
							}
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
			</div>
		</>
	);
};
