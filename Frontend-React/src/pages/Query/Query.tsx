import React from "react";
import { SideBarButton } from "./SideBarButton";
import { PostPage } from "../../components/Post";
// import { CropSuggestions } from "../CropSuggestions/CropSuggestions";

export const Query = () => {
	return (
		<div className="flex w-full h-full flex-row items-center bg-green-300 justify-start">
			<div
				className="basis-[20%] relative h-full flex flex-col
             w-full border-solid border-r-white border-[1px]"
			>
				<div className="basis-[20%] w-full flex flex-row items-center justify-center hover:cursor-pointer">
					<span className="font-poppins text-[40px] font-extrabold tracking-wide text-black">
						Agro
					</span>
				</div>
				<SideBarButton field="HOME" active={true} />
				<SideBarButton field="CHAT" active={false} />
				<SideBarButton field="CALL" active={false} />
			</div>
			<PostPage />
			{/* <CropSuggestions /> */}
		</div>
	);
};
