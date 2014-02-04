#!/usr/bin/env node
var net = require('net');
var levelup = require('levelup');
var leveldown = require('leveldown');
var multilevel = require('multilevel');

var db = levelup(process.env.NODE_DB_PATH, {db: leveldown});

net.createServer(function (conn) {
  conn.pip(multilevel.server(db).pipe(conn));
}).listen(parseInt(process.env.NODE_PORT));
