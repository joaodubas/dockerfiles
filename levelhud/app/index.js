#!/usr/bin/env node
var net = require('net');
var multilevel = require('multilevel');
var levelHUD = require('levelhud');

var db = multilevel.client();
var conn = net.connect({
  port: parseInt(process.env.DB_PORT_3001_TCP_PORT),
  host: process.env.DB_PORT_3001_TCP_ADDR
});

console.log('Connect to multilevel through ' + process.env.DB_PORT_3001_TCP_ADDR + ':' + process.env.DB_PORT_3001_TCP_PORT);
conn.pipe(db.createRpcStream()).pipe(conn);

new levelHUD().use(db).listen(parseInt(process.env.NODE_PORT));
