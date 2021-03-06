'use strict';

var con = require('./../../config/db');

// Item Object

var Item = function(item){
  this.item_id = item.idutilisateur;
  this.item_name = item.nom;
  this.item_desc = item.prenom;
  this.item_price = item.login;
};

// Define CRUD Operations Functions

Item.findById = function (id, result) {
	let sql = 'SELECT * FROM utilisateur WHERE idutilisateur = ?';
	
	con.query(sql, id, (err, row, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log(row);
		result(null, row);
	});
};

Item.findByName = function (name, result) {
	let sql = 'SELECT * FROM utilisateur WHERE nom = ?';
	
	con.query(sql, name, (err, rows, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log('rows: ', rows);
		result(null, rows);
	});
};

Item.findAll = function (result) {
	let sql = 'SELECT * FROM utilisateur';
	
	con.query(sql, (err, rows, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log(rows);
		result(null, rows);
	});
};

Item.create = function (newItem, result) {	
	let data = [newItem.nom, newItem.prenom, newItem.login,newItem.password];
	
	let sql = 'INSERT INTO utilisateur(nom, prenom,login,password) VALUES(?, ?, ?,?)';
	
	con.query(sql, data, (err, row, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log(row.insertId);
		result(null, row.insertId);
	});
};

Item.update = function(item, result){
	let data = [item.item_name, item.item_desc, item.item_price, item.item_id];
	
	let sql = 'UPDATE items SET item_name = ?, item_desc = ?, item_price = ? WHERE item_id = ?';
	
	con.query(sql, data, (err, row, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log(row.affectedRows);
		result(null, row.affectedRows);
	});
};

Item.delete = function(id, result){
	let sql = 'DELETE FROM items WHERE item_id = ?';
	
	con.query(sql, id, (err, row, fields) => {
		console.log("error: ", err);
		if (err) result(err, null);
		
		console.log(row.affectedRows);
		result(null, row.affectedRows);
	});
};

module.exports= Item;