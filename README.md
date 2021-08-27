# Quiz-Game-in-LAN
### This is my team's first Network project - an quiz game application played in LAN network.
It have been finished for 3 days so it has a lot of bugs need to fix, but overall, if you are lucky, it will run smoothly without any problems.

If you want to start playing, please create a database for the server connecting to. There is a query to create database and question in the file QuizDatabase.sql which is Vietnamese, you can make a new one in your language. In file Server/DoAn/Form1.cs, there is a code line:
sqlconnect = new SqlConnection(@"Data Source=... ;Initial Catalog=... ;Integrated Security=True");
Fill your server name and your database name to connect to the database.

Here is the database schema.
<p align="center">
  <img src="https://user-images.githubusercontent.com/72259594/131098004-5f8080c2-20d6-41fb-bed4-6c86cb03766b.png"/>
</p>

We forget to export the executable file, so you can run the Client file instead. When you run the Client file, it will open this form, you just fill in your name and click button "Let's go" to the next step.
<p align="center">
  <img src="https://user-images.githubusercontent.com/72259594/131098839-677f3419-4ed4-4600-8c53-d539d9e4f35b.png" />
</p>

In the next step, you have two options:
1. One player
2. Multiplayer (Up to 4 players)
<p align="center">
  <img src="https://user-images.githubusercontent.com/72259594/131099063-40363121-696f-4591-9b35-ae3049159eca.png" />
</p>

The rule is quite simple, actually we created this game rule based on hang man game. There are many questions for you to answer, you will get point if your answer is correct or get one part of the hang man if your answer is incorrect and you will lose if the hang man is finished. There are two types of question: multiple-choices and constructed-response. With the constructed-response question, the server will check sensitive-cases so you have to write the correct words. You can change it to easier by editing the file Server/DoAn/Form1.cs

That's it. Hope you enjoy the games, but I recommend you just use this as a reference.
