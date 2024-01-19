# Openvibe Assignment

Objective: Develop a basic Flutter-based social media app with two primary interfaces - a message list and a detailed view of a selected message.

**First Interface: Message List**
This screen will display an array of messages with the following details for each:
- Icon: Representing a user's profile picture, simplified to an emoji.
- Nickname: The user's chosen nickname who posted the message.
- CreatedAt: The timestamp of when the message was posted, formatted similarly to Twitter (e.g., '3m' for three minutes ago).
- Message: The actual content of the message.

**Second Interface: Message Detail**
Upon selecting a message from the list, this screen will present the same information but with enhanced formatting. The creation time will be displayed in its full format.

**Data Handling:**
Messages are fetched from a locally hosted server using a websocket connection, employing a format akin to Nostr. 
To request messages, send a request in the format: ['get', '$id', $amount], where the server will respond with the specified number of messages. Each message received is an individual response.

**Caching:**
All messages should be cached. The detailed message view should retrieve data from this cache.

## Server Setup 

The server is based on dart_frog. You'll need to install necessary dependencies and serve it locally using the command `dart_frog dev`. For detailed information, visit [Dart Frog Documentation](https://dartfrog.vgv.dev/docs/overview).

## Task Completion

To submit your work, fork the given repository and implement your solution in the app folder.