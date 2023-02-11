import React, { useEffect, useState } from "react";

import { StreamChat } from "stream-chat";

import {
	Chat,
	Channel,
	Window,
	ChannelHeader,
	MessageList,
	MessageInput,
	Thread,
	LoadingIndicator,
} from "stream-chat-react";

import "stream-chat-react/dist/css/index.css";

// const apiKey = process.env.REACT_APP_STREAM_API_KEY || "";

const user = {
	id: "user-id",
	name: "User Name",
	image: "https://getstream.io/random_svg/?id=user-id&name=User+Name",
};

export const ChatPage = () => {
	// const client = streamChat.getInstance(apiKey);
	const [client, setClient] = useState(null);
	const [channel, setChannel] = useState(null);

	useEffect(() => {
		async function init() {
			const client = StreamChat.getInstance("2wskrgv4m3r7");
			await client.connectUser(user, client.devToken(user.id));

			const channel = client.channel("messaging", "general", {
				name: "General",
				image: "https://getstream.io/random_svg/?id=general-channel-id&name=General",
				members: [user.id],
			});

			const channel1 = client.channel("messaging", "travel", {
				name: "Awesome channel about traveling",
			});
			// Here, 'travel' will be the channel ID
			await channel1.create();
			await channel1.watch();
			await channel.create();
			await channel.watch();
			setChannel(channel);
			setClient(client);
		}
		init();
		if (client) {
			return client;
		}
	}, [client]);

	if (!client || !channel) {
		return <LoadingIndicator />;
	}

	return (
		<Chat client={client} theme="messaging light">
			<Channel channel={channel}>
				<Window>
					<ChannelHeader />
					<MessageList />
					<MessageInput />
				</Window>
				<Thread />
			</Channel>
		</Chat>
	);
};
