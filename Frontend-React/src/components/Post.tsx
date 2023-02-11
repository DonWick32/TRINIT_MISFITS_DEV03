import React, { useEffect, useState } from "react";
import { Input } from "@mantine/core";
import { IconSearch } from "@tabler/icons-react";
import { IconPlus } from "@tabler/icons-react";
import axios from "axios";
import { CreatePost } from "../pages/Query/CreatePost";
import { PostCard } from "../pages/Query/PostCard";

export const PostPage = () => {
	const [posts, setPosts] = useState(false);
	const [district, setDistrict] = useState("");
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
	console.log(district);
	useEffect(() => {
		Location();
	}, []);
	function handleCreatePost(arg0: boolean) {
		setPosts(arg0);
	}
	return (
		<div className="basis-[80%] w-full h-full flex flex-col items-center justify-start">
			<div className="basis-[10%] h-full w-full bg-[rgba(2,5,7,0.50)] flex flex-row items-center gap-12 justify-center">
				<Input
					icon={<IconSearch />}
					size="lg"
					classNames={{ input: "w-[350px] text-black rounded-[12px]" }}
					placeholder="Search Here"
				/>
				<div className="flex flex-row gap-2 items-center justify-center">
					<IconPlus
						onClick={() => {
							handleCreatePost(!posts);
						}}
						className="text-[30px] text-white hover:scale-125 cursor-pointer "
					/>
					<span className="text-white text-[20px]">Create Post</span>
				</div>
			</div>
			<div className="basis-[90%] max-h-[100%] overflow-y-scroll pt-10 h-full w-full gap-8 flex flex-col items-center justify-start">
				{posts && <CreatePost />}
				<PostCard />
				<PostCard />
				<PostCard />
				<PostCard />
				<PostCard />
				<PostCard />
			</div>
		</div>
	);
};
