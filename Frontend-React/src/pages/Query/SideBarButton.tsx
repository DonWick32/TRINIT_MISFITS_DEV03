import React from "react";

export const SideBarButton = (props: { field: string; active: boolean }) => {
	return (
		<div
			className={`flex w-full h-[120px] border-solid ${
				props.active ? "bg-[rgba(0,0,0,0.4)]" : ""
			} hover:cursor-pointer items-center justify-center`}
		>
			<span className=" text-[25px] tracking-wide text-white font-bold">
				{props.field}
			</span>
		</div>
	);
};
