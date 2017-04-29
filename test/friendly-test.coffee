Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/friendly.coffee')

describe 'friendly', ->
 beforeEach ->
    @room = helper.createRoom(httpd: false)

  it 'should say hello', ->
    @room.user.say('alice', 'hello friends! :)').then =>
      expect(@room.messages).to.eql [
        ['alice', 'hello friends! :)']
        ['hubot', 'Hi @alice!']
      ]

  it 'should say hi', ->
    @room.user.say('alice', 'hi').then =>
      expect(@room.messages).to.eql [
        ['alice', 'hi']
        ['hubot', 'Hi @alice!']
      ]

  it 'should say hi case sensitive', ->
    @room.user.say('alice', 'Hi').then =>
      expect(@room.messages).to.eql [
        ['alice', 'Hi']
        ['hubot', 'Hi @alice!']
      ]

  it 'should say good morning', ->
    @room.user.say('alice', 'good morning, everyone!').then =>
      expect(@room.messages).to.eql [
        ['alice', 'good morning, everyone!']
        ['hubot', 'Good morning, @alice!']
      ]

  it 'should talk back when instructed', ->
    @room.user.say('alice', 'say hello, @hubot!').then =>
      expect(@room.messages).to.eql [
        ['alice', 'say hello, @hubot!']
        ['hubot', 'hello, @hubot! :trollface:']
      ]

  it 'should talk back about a person when instructed', ->
    @room.user.say('alice', 'say hello to @mary, hubot!').then =>
      expect(@room.messages).to.eql [
        ['alice', 'say hello to @mary, hubot!']
        ['hubot', 'hello to @mary, hubot! :trollface:']
      ]
      
  it 'should say good night', ->
    @room.user.say('alice', 'good night, everyone!').then =>
      expect(@room.messages).to.eql [
        ['alice', 'good night, everyone!']
        ['hubot', 'Good night, @alice!']
      ]
      
  it 'should say goodnight if no space', ->
    @room.user.say('alice', 'goodnight folks').then =>
      expect(@room.messages).to.eql [
        ['alice', 'goodnight folks']
        ['hubot', 'Good night, @alice!']
      ]