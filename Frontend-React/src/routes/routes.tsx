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
		path: "/dashboard",
		element: <ChatPage />,
		title: "Dashboard",
		description: "Dashboard Page",
	},
];
