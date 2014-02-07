#!/usr/bin/env node
var net = require('net');
var multilevel = require('multilevel');
var levelHUD = require('levelhud');

var db = levelup(process.env.NODE_DB_PATH, {db: leveldown});
var conn = net.connect({
  port: parseInt(process.env.DB_PORT_3001_PORT),
  host: parseInt(process.env.DB_PORT_3001_HOST)
});

conn.pipe(db.createRpcStream()).pipe(conn);

new levelHUD().use(db).listen(parseInt(process.env.NODE_PORT));
