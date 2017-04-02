# Description
#  Responds to greetings, i.e. 'hello' with 'hi @[user]!'
#
# Commands:
#   I like to say hi to people.
#
#
# Author:
#   grant.bowering@gmail.com

module.exports = (robot) ->

  robot.hear ///
            #^                       # this should be the start of the message
            (hey|hi|hello|(wh?at)?'?s'?up\??|greetings) # greeting word possibilities
            [\x20@]*                # optional space or @
            (every(one|body)|guys|people|ppl|folks|friends|channel|#{robot.name})? # optional targeting of everyone or the robot
            [\.\!\x20\:\)\(\-'DP]*  # punctuation and emoji and such
            $                       # end of the message
            ///i, (msg) ->
    msg.send "Hi @#{msg.message.user.name}!"

  robot.hear ///
            #^                   # this should be the start of the message
            (have\x20a\x20)?    # they could say "have a" at the start
            goo+d               # the word 'good', with as many o's as needed
            \x20                # a space 
            (morn(ing)?|morrow|afternoon|evening|day|night) # the time they said, captured as [2]
            ///i, (msg) ->
    msg.send "Good #{msg.match[2]}, @#{msg.message.user.name}!"

  robot.hear ///
            say                 # the word 'say'
            \x20                # a space
            ((hi|hello)(\x20to\x20@?\w+)?,?)      # either hi or hello, with an optional comma, captured as [1]
            \x20                # a space
            (@?#{robot.name}[\.\!]*)   # the robot's name, with an optional leading @
            ///i, (msg) ->
    msg.send "#{msg.match[1]} #{msg.match[4]} :trollface:"



