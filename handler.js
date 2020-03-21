"use strict";

const serverless = require("serverless-http");
const express = require("express");
const mysql = require("mysql");
const app = express();
app.use(express.json());
const cors = require("cors");
app.use(cors());

const connection = mysql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	password: process.env.DB_PASSWORD,
	database: process.env.DB_SCHEMA
});

app.get("/Thoughts", function(req, res) {
	connection.query("SELECT * FROM `Mood_table`", function(
		error,
		results,
		fields
	) {
		// error will be an Error if one occurred during the query
		if (error) {
			console.error(
				"Your query had a problem with fetching your logged thoughts",
				error
			);
			res.status(500).json({ errorMessage: error });
		} else {
			// Query was successful
			res.json({
				thoughts: results
			});
		}
	});
});

app.post("/Thoughts", function(req, res) {
	const thoughtToInsert = req.body;

	// Take that information and pre-populate an SQL INSERT statement and execute

	connection.query("INSERT INTO `Mood_table` SET ?", thoughtToInsert, function(
		error,
		results,
		fields
	) {
		if (error) {
			console.error("Your query had a problem with adding thoughts", error);
			res.status(500).json({ errorMessage: error });
		} else {
			res.json({
				newThought: thoughtToInsert
			});
		}
	});
});

app.get("/Users", function(req, res) {
	connection.query("SELECT * FROM `Users`", function(
		error,
		results,
		fields
	) {
		// error will be an Error if one occurred during the query
		if (error) {
			console.error(
				"user not found",
				error
			);
			res.status(500).json({ errorMessage: error });
		} else {
			// Query was successful
			res.json({
				users: results
			});
		}
	});
});

app.post("/Users", function(req, res) {
	const loginToAdd = req.body;

	// Take that information and pre-populate an SQL INSERT statement and execute

	connection.query("INSERT INTO `Users` SET ?", loginToAdd, function(
		error,
		results,
		fields
	) {
		if (error) {
			console.error("Your query had a problem with adding new user", error);
			res.status(500).json({ errorMessage: error });
		} else {
			res.json({
				newUser: loginToAdd
			});
		}
	});
});
// app.put('/Thoughts/:Id', function (req, res) {
//   //take the task to edit
//   connection.query(' UPDATE `Mood_table` SET `Timestamp` = ?, `Mood` = ?, `important` = ?  WHERE `uuid` = ?', [req.body.description, req.body.completed, req.body.important, req.body.taskId], function (error, results, fields) {
//     // error will be an Error if one occurred during the query
//     if (error) {
//       console.error("Your query had a problem with editing tasks", error);
//       res.status(500).json({ errorMessage: error });
//     }
//     else {
//       res.json({
//        message: 'Your task has been edited'
//       });
//     }
//   })
// });

app.delete("/Thoughts/:Id", function(req, res) {
	const thoughtToDelete = req.params.Id;
	// Run DELETE SQL command
	connection.query(
		"DELETE FROM `Mood_table` WHERE `uuid` = ?",
		thoughtToDelete,
		function(error, results, fields) {
			if (error) {
				console.error(
					"Your query had a problem with deleting your thought",
					error
				);
				res.status(500).json({ errorMessage: error });
			} else {
				// Return to client info about what has been deleted
				res.json({
					deletedThought: thoughtToDelete,
					message: "The above thought was deleted"
				});
			}
		}
	);
});

module.exports.thoughts = serverless(app);
