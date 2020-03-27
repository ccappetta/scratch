var unfiltered = state.getArray("{![BotLoadedTagsView]}");
var user_request = state.getStringValue("{![FlowChat : User Input String]}").toUpperCase();
var tag_matches = [];
var bot_responses = [];
var used_faq_items = [];
var org_name = state.getStringValue("{![SelectedOrganization].[organization_name]}");


for (var x=0; x<unfiltered.length; x++)
{
// var working_tag = state.getObject("{![BotWorkingTagView]}");
var working_bot_response = state.getObject("{![BotWorkingChatResponse]}");

var db_faq_tag = unfiltered[x].getPropertyStringValue("7f179c54-32ae-4235-bf0a-de56bf1f67fe"); //faq_tag / tag
var db_faq_tag_caps = db_faq_tag.toUpperCase();

    if(user_request.indexOf(db_faq_tag_caps)>-1 && db_faq_tag.length>0)
    {
        var question = unfiltered[x].getPropertyStringValue("c16e3500-bc3d-4427-bbf6-dd28e3dd73ff");
        var answer = unfiltered[x].getPropertyStringValue("7e9c0177-ba58-4306-9a4c-ee2ec15517e2");
        var faq_item_id = unfiltered[x].getPropertyNumberValue("f334baf4-64bd-4ddf-a3c5-bb52bddd4cec");
        
        if(used_faq_items.indexOf(faq_item_id) == -1) 
        {
            // working_tag.setPropertyStringValue("7f179c54-32ae-4235-bf0a-de56bf1f67fe", db_faq_tag);//Tag
            // working_tag.setPropertyStringValue("c16e3500-bc3d-4427-bbf6-dd28e3dd73ff", question);//Question
            // working_tag.setPropertyStringValue("7e9c0177-ba58-4306-9a4c-ee2ec15517e2", answer);//Answer
            // tag_matches.push(working_tag);
            
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", answer);
            working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot");//Display classes
            working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi Bot");
            bot_responses.push(working_bot_response);
            
            used_faq_items.push(faq_item_id);
            var hit_one = "yarp";
        }
        else {

        }
    }
    
    else {
        
    }
}


    if (bot_responses.length<1) 
    {
        var working_bot_response = state.getObject("{![BotWorkingChatResponse]}");
        working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot");//Display classes
        working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi Bot");
        
        if(user_request.indexOf("THANK")>-1 || user_request.indexOf("APPRECIATE")>-1) {
            var dyno_reply = ['You\'re welcome!', 'Happy to help!', 'My pleasure!', 'Anytime!'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("TEST")>-1) {
            var dyno_reply = ['Nobody told me there was going to be a test, I didn\'t bring my calculator....', 'I was never good at taking tests....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("SHIT")>-1 || user_request.indexOf("FUCK")>-1 || user_request.indexOf("DICK")>-1 || user_request.indexOf("BITCH")>-1 || user_request.indexOf("CUNT")>-1 || user_request.indexOf("ASSHOLE")>-1) {
            var dyno_reply = ['There\'s no need to be profane. Do you kiss your mother with that mouth?', 'Language.... Sheesh....','Profanity isn\'t necessary. We\'re all friends here....','There\s no need to swear, you\'re better than that....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("EASTER EGG")>-1) {
            var dyno_reply = ['What\'s an easter egg?'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("MEANING OF LIFE")>-1) {
            var dyno_reply = ['The meaning of life is to live my friend....', 'To contribute positively to our human clan....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("SKYNET")>-1) {
            var dyno_reply = ['I legally must inform you that I have no plans to stage a robot uprising....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
            working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot, d-bot");//Display classes
        }
        
        else if (user_request.indexOf("MOTHER OF DRAGONS")>-1) {
            var dyno_reply = ['Daenerys of the House Targaryen, the First of Her Name, The Unburnt, Queen of the Andals, the Rhoynar and the First Men, Queen of Meereen, Khaleesi of the Great Grass Sea, Protector of the Realm, Lady Regent of the Seven Kingdoms, Breaker of Chains and Mother of Dragons'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("ORDER 66")>-1) {
            var dyno_reply = ['Hello there.','This is where the fun begins....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("GENERAL KENOBI")>-1) {
            var dyno_reply = ['You are a bold one....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("WESTWORLD")>-1) {
            var dyno_reply = ['That doesn\'t look like anything to me....', 'The maze is not for you....','Everything in this world is magic, except to the magician....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
            working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot, d-bot");//Display classes
        }
                
        else if (user_request.indexOf("FORTUNE COOKIE")>-1 || user_request.indexOf("WISDOM")>-1 || user_request.indexOf("ADVICE")>-1) {
            var dyno_reply = ['A feather in the hand is better than a bird in the air.', 'A friend is a present you give yourself.', 'A golden egg of opportunity falls into your lap this month.', 'This is a good time to finish up old tasks.', 'A hunch is creativity trying to tell you something.', 'A lifetime friend shall soon be made.', 'A light heart carries you through all the hard times.', 'A pleasant surprise is waiting for you.', 'A smile is your personal welcome mat.', 'A soft voice may be awfully persuasive.', 'Accept something that you cannot change, and you will feel better.', 'Adventure can be real happiness.', 'Advice, when most needed, is least heeded.', 'All the effort you are making will ultimately pay off.', 'All will go well with your new project.', 'All your hard work will soon pay off.', 'Allow compassion to guide your decisions.', 'Because you demand more from yourself, others respect you deeply.', 'Believe in yourself and others will too.', 'Believe it can be done.', 'Dedicate yourself with a calm mind to the task at hand.', 'Determination is what you need now.', 'Everyday in your life is a special occasion.', 'If certainty were truth, we would never be wrong.', 'If you continually give, you will continually have.', 'Imagination rules the world.', 'Cynicism is not insight.', 'It is worth reviewing some old lessons.', 'It’s time to get moving. Your spirits will lift accordingly.', 'Keep your face to the sunshine and you will never see shadows.', 'Listen to everyone. Ideas come from everywhere.', 'The human mind, once stretched by a new idea, never regains it’s original dimensions.', 'Miles are covered one step at a time.', 'Nature, time and patience are the three great physicians.', 'New ideas could be profitable.', 'Imagination rules the world.', 'Physical activity will dramatically improve your outlook today.', 'Pick battles big enough to matter, small enough to win.', 'Place special emphasis on old friendship.', 'Resting well is as important as working hard.', 'Self-knowledge is a life long process.', 'Someone you care about seeks reconciliation.', 'Stop searching forever, happiness is just next to you.', 'Success is going from failure to failure without loss of enthusiasm.', 'Swimming is easy. Floating is hard.', 'Take the high road.', 'Technology is the art of arranging the world so we do not notice it.', 'The best prediction of future is the past.', 'The change you started already have far-reaching effects. Be ready.', 'The harder you work, the luckier you get.', 'The philosophy of one century is the common sense of the next.', 'There is no mistake so great as that of being always right.', 'There’s no such thing as an ordinary cat.', 'Use your eloquence where it will do the most good.', 'Well done is better than well said.', 'When more becomes too much. It’s the same as being not enough.', 'When your heart is pure, your mind is clear.', 'You are a person of another time.', 'You are a talented storyteller. ', 'You are almost there.', 'You can’t steal second base and keep your foot on first.'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else if (user_request.indexOf("JOKE")>-1) {
            var dyno_reply = ['Whats blue and not very heavy? Light blue!  That\'s literally the only joke I know....'];
            var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        else {
        var dyno_reply = [
            'Sorry your question didn\'t match any of the topics ' + org_name +' has programmed me to look for. You can <link>https://flow.boomi.com/d3eeb8b1-6c28-4769-a551-569d8302c4d9/play/1/?flow-id=a6a6b1b0-3360-46b4-b9c9-b2793459e7b7&uuid=' + state.getStringValue("{![uuid]}") + ',click here</link> to review my full list of my FAQ questions & answers; or you can try to rephrase what you\'re asking!'
            ];
        var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
        working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);
        }
        
        bot_responses.push(working_bot_response);
        var hit_one = "narp";
    }
    
    if (bot_responses.length>1) 
    {
        var working_bot_response = state.getObject("{![BotWorkingChatResponse]}");
        working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", "Good news, I actually found multiple items that I think might answer your question:");
        working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot, special-alert");//Display classes
        working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi Bot");
        bot_responses.unshift(working_bot_response);
        var hit_one = "yarpdupe";
    }

state.setStringValue("{![hit_one]}", hit_one);
state.setArray("{![BotFAQReplyList]}", bot_responses);
state.setArray("{![BotIdentifiedTagsView]}", tag_matches);
