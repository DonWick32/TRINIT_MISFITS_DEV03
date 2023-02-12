import React from "react";
import Router from "./routes";
import { MantineProvider } from "@mantine/core";
import { Provider } from "react-redux";
import store from "./store";
import "./App.css";

const App = () => {
	return (
		<Provider store={store}>
			<MantineProvider withNormalizeCSS>
				<Router />
			</MantineProvider>
		</Provider>
	);
};

export default App;
