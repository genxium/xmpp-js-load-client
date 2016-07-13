"use strict";

var xmpp = require('simple-xmpp');

var domain = process.argv[2];
var serverAddress = process.argv[3]
var port = process.argv[4];
let st = process.argv[5];
let ed = process.argv[6];

for (var i = st; i <= ed; ++i) {
	let uname = "test_" + i; 
	let password = "password";
	let jid = uname + '@' + domain;
	
	let client = new xmpp.SimpleXMPP();
	client.on('online', function(data) {
	    console.log('Connected with JID: ' + data.jid.user);
	});

	client.on('chat', function(from, message) {
	    xmpp.send(from, 'echo: ' + message);
	});

	client.on('error', function(err) {
	    console.error(err);
	});

	client.connect({
		jid                 : jid,
		password            : password,
		host                : serverAddress,
		port                : port 
	});
}
