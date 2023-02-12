import React, { useEffect, useState } from "react";
import { IconPlus } from "@tabler/icons-react";
import axios from "axios";
import { CreatePost } from "../pages/Query/CreatePost";
import { PostCard } from "../pages/Query/PostCard";
import { useNavigate } from "react-router-dom";

export const PostPage = () => {
	const [posts, setPosts] = useState(false);
	const [data, setData] = useState([]);
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
		const postResponse = await axios.get("http://localhost:8000/queries");
		setData(postResponse.data);
	};
	console.log(district);
	useEffect(() => {
		Location();
	}, []);
	function handleCreatePost(arg0: boolean) {
		setPosts(arg0);
	}
	const navigate = useNavigate();
	return (
		<div className="basis-[100%] w-full h-full flex flex-col items-center justify-start">
			<div className="basis-[10%] h-full w-full bg-[rgba(2,5,7,0.50)] flex flex-row items-center gap-16 justify-center">
				<span
					onClick={() => {
						navigate("/");
					}}
					className="font-poppins text-[40px] font-extrabold tracking-wide text-white"
				>
					Agriculture
				</span>
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
				{data.map((post) => {
					return (
						// eslint-disable-next-line react/jsx-key
						<PostCard id={post.sender_id} query={post.query_string} />
					);
				})}
			</div>
		</div>
	);
};
