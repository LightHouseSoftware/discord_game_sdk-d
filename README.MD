# Discord Game SDK D Bindings

This library provides D language static `@nogc nothrow` bindings for the **Discord Game SDK v3.2.1**. For more details on what Discord Game SDK can do, refer to the official documentation: [Discord Game SDK Documentation](https://discord.com/developers/docs/developer-tools/game-sdk).

## Usage

To start using bindings in your D application, follow these steps:

### 1. Add the Library to Your Project

First, add the `discord_game_sdk.dll.lib` to your project's `dub.sdl` or `dub.json` file:

```
libs "discord_game_sdk.dll"
```

### 2. Ensure the Library is in Your Project's Path

Ensure that the `discord_game_sdk.dll` (or the appropriate shared library for your platform) is available in your project's library path. This typically involves placing the DLL or shared library in the same directory as your executable or ensuring it's in your system's library search paths.

### 3. Import the Bindings

Import the bindings into your D application by including the following line in your source code:

```D
import discord_game_sdk;
```

### 4. Example: Initializing the Discord SDK

Here’s a simple example of how to initialize the Discord Game SDK in your D application:

```D
import discord_game_sdk;
import std.stdio;

void main()
{
	// Create and set up the parameters for Discord initialization
	DiscordCreateParams params;
	DiscordCreateParamsSetDefault(&params);

	params.clientId = 123456789012345678; // Replace with your actual Discord Client ID (Application ID)
	params.flags = DiscordCreateFlags.Default;

	IDiscordCore* core;
	DiscordResult result = DiscordCreate(DISCORD_VERSION, &params, &core);

	if (result == DiscordResult.Ok)
	{
		writeln("Discord SDK initialized successfully.");

		// Example: Running callbacks in a loop
		while (true)
		{
			result = core.runCallbacks();
			if (result != DiscordResult.Ok)
			{
				writeln("Failed to run callbacks.");
				break;
			}

			// Sleep or perform other tasks...
		}

		// Cleanup
		core.destroy();
	}
	else
	{
		writeln("Failed to initialize Discord SDK. Error code: ", result);
	}
}
```