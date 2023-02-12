import React from "react";

export const CropCard = (props: { title: string; description: string }) => {
	return (
		<div className="w-[65%] rounded-[15px] p-5 h-[280px] bg-emerald-400 flex flex-col items-center justify-center">
			<div className="basis-[20%] items-center flex flex-col justify-start">
				<span className="text-[28px] text-center tracking-wider font-bold text-stone-900">
					{props.title}
				</span>
			</div>
			<div className="basis-[80%] flex flex-col items-center justify-center">
				<p className="text-[16px] tracking-wide leading-7 font-semibold text-black">
					{props.description}
				</p>
			</div>
		</div>
	);
};
