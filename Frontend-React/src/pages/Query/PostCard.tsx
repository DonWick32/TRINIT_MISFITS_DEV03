import React from "react";
import { IconArrowBigUpLineFilled } from "@tabler/icons-react";
import { IconArrowBigDownLineFilled } from "@tabler/icons-react";
import { CreatePost } from "./CreatePost";

export const PostCard = () => {
	const [reply, setReply] = React.useState(false);
	function handleReply() {
		setReply(!reply);
	}

	return (
		<>
			<div className="w-[50%] min-h-[200px] rounded-[13px] bg-white flex flex-row items-center justify-center">
				<div className="basis-[15%] w-full h-full flex flex-col items-center justify-around ">
					<IconArrowBigUpLineFilled className=" cursor-pointer" />
					<span className="text-[25px] text-black tracking-wider font-bold">
						25
					</span>
					<IconArrowBigDownLineFilled className=" cursor-pointer" />
				</div>
				<div className="basis-[85%] w-full h-full flex flex-col items-start justify-start">
					<div className="basis-[15%] flex items-center justify-start pl-3 h-full w-full ">
						<div className="flex flex-row items-center gap-4">
							<span className="text-[21px] font-sans text-black font-semibold">
								UserName
							</span>
							<span className="text-[14px] text-center">
								Posted {2} hours ago
							</span>
						</div>
					</div>
					<div className="basis-[70%] flex items-center justify-start pl-3 h-full w-full ">
						<div className="">
							<span className="text-[20px] font-serif font-medium text-black">
								Lorem ipsum dolor sit amet, consectetuer adipiscing
								elit. Aenean commodo ligula eget dolor. Aenean massa.
								Cum sociis natoque penatibus et magnis dis parturient
								montes, nascetur ridiculus mus.?
							</span>
						</div>
					</div>
					<div className="basis-[15%] flex items-center justify-start pl-3 h-full w-full ">
						<div className="flex flex-row items-center gap-4">
							<a
								href=""
								onClick={(event) => {
									event.preventDefault();
									handleReply();
								}}
								className="text-[14px] text-gray-400 font-semibold"
							>
								reply
							</a>
							<a
								href=""
								className="text-[14px] text-gray-400 font-semibold"
							>
								comments
							</a>
						</div>
					</div>
				</div>
			</div>
			{reply && <CreatePost />}
		</>
	);
};
