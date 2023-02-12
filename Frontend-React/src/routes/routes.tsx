import React from "react";
import "./types.d";
import { Dashboard, Login } from "../pages";
import { ChatPage } from "../pages/Chat/ChatPage";
import { Query } from "../pages/Query/Query";

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
];
