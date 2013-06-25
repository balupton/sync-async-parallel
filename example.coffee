fsUtil = require('fs')
{TaskGroup} = require('taskgroup')
file = '/Users/balupton/Downloads/opera.dmg'

tasks = new TaskGroup().setConfig(concurrency:0).once 'complete', ->
	console.log('completed')

tasks.addTask ->
	console.log('synchronous read start')
	data = fsUtil.readFileSync(file)
	console.log('synchronous read finish', data.toString().substr(0,10))

tasks.addTask (complete) ->
	console.log('asynchronous read start')
	fsUtil.readFile file, (err,data) ->
		console.log('asynchronous read finish', data.toString().substr(0,10))

tasks.addTask (complete) ->
	console.log('asynchronous read start')
	fsUtil.readFile file, (err,data) ->
		console.log('asynchronous read finish', data.toString().substr(0,10))

tasks.run()