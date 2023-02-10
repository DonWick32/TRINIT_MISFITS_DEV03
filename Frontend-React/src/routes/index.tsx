import React from "react";
import { privateRoutes, publicRoutes } from "./routes";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { NotFoundPage } from "../pages";

const Router = () => {
	return (
		<BrowserRouter>
			<Routes>
				{publicRoutes.map((route) => {
					return (
						<Route
							key={route.path}
							path={route.path}
							element={route.element}
						/>
					);
				})}
				{privateRoutes.map((route) => {
					return (
						<Route
							key={route.path}
							path={route.path}
							element={route.element}
						/>
					);
				})}
				<Route path="*" element={<NotFoundPage />} />
			</Routes>
		</BrowserRouter>
	);
};

export default Router;
