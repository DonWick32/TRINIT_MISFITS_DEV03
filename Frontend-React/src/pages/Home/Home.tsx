import React from "react";
import { Navbar } from "../../components/NavBar/Navbar";

const Home = () => {
	return (
		<>
			<div className="h-screen relative w-screen flex flex-col items-center landing-page-bg">
				<Navbar />
			</div>
		</>
	);
};

export default Home;
