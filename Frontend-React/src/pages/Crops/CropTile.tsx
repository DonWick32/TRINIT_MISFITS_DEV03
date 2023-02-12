import React from "react";

export const CropTile = (props: { name: string }) => {
	return (
		<div className="w-[150px] rounded-[14px] h-[150px] bg-emerald-400 flex flex-col items-center justify-center">
			<span className="text-[18px] text-center text-black leading-4 tracking-normal ">
				{props.name}
			</span>
		</div>
	);
};
