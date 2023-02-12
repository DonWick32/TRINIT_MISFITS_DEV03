import React from "react";
import "./types.d";
import { Dashboard, Login } from "../pages";
import { ChatPage } from "../pages/Chat/ChatPage";
import { Query } from "../pages/Query/Query";
import { Schemes } from "../pages/CropSuggestions/CropSuggestions";
import { Crops } from "../pages/Crops/Crops";

export const publicRoutes: RouteType[] = [
	{
		path: "/login",
		element: <Login />,
		title: "Login",
		description: "Login Page",
	},
];

export const privateRoutes: RouteType[] = [
	{
		path: "/call",
		element: <ChatPage />,
		title: "Dashboard",
		description: "Dashboard Page",
	},
	{
		path: "/chat",
		element: <ChatPage />,
		title: "Dashboard",
		description: "Dashboard Page",
	},
	{
		path: "/dashboard",
		element: <Dashboard />,
		title: "Dashboard",
		description: "Dashboard Page",
	},
	{
		path: "/query",
		element: <Query />,
		title: "Query",
		description: "Query Page",
	},
	{
		path: "/",
		element: <Dashboard />,
		title: "Home",
		description: "Home",
	},
	{
		path: "/schemes",
		element: <Schemes />,
		title: "Home",
		description: "Home",
	},
	{
		path: "/crops",
		element: <Crops />,
		title: "Crops",
		description: "Crops",
	},
];
