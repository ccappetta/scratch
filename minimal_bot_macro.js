var unfiltered = state.getArray("{![BotLoadedTagsView]}");
var user_request = state.getStringValue("{![FlowChat : User Input String]}").toUpperCase();
var tag_matches = [];
var bot_responses = [];
var used_faq_items = [];
var org_name = state.getStringValue("{![SelectedOrganization].[organization_name]}");


for (var x=0; x<unfiltered.length; x++)
{
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
            
            working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", answer);
            working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot");//Display classes
            working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi™ Bot");
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
        working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi™ Bot");

        var dyno_reply = [
            'Sorry your question didn\'t match any of the topics ' + org_name +' has programmed me to look for. You can <link>https://flow.boomi.com/d3eeb8b1-6c28-4769-a551-569d8302c4d9/play/1/?flow-id=a6a6b1b0-3360-46b4-b9c9-b2793459e7b7&uuid=' + state.getStringValue("{![uuid]}") + ',click here</link> to review my full list of my FAQ questions & answers; or you can try to rephrase what you\'re asking!'
            ];
        var chosenReply = dyno_reply[Math.floor(Math.random() * dyno_reply.length)];
        working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", chosenReply);

        
        bot_responses.push(working_bot_response);
        var hit_one = "narp";
    }
    
    if (bot_responses.length>1) 
    {
        var working_bot_response = state.getObject("{![BotWorkingChatResponse]}");
        working_bot_response.setPropertyStringValue("17ae5b10-c82a-4c52-92b8-bca9afd487e2", "Good news, I actually found multiple items that I think might answer your question:");
        working_bot_response.setPropertyStringValue("d5db216e-3a54-4396-8ed8-0f032edae177", "chat-bot, special-alert");//Display classes
        working_bot_response.setPropertyStringValue("5485ae04-5b3e-40e9-8be1-7dc84537bb35", "Boomi™ Bot");
        bot_responses.unshift(working_bot_response);
        var hit_one = "yarpdupe";
    }

state.setStringValue("{![hit_one]}", hit_one);
state.setArray("{![BotFAQReplyList]}", bot_responses);
state.setArray("{![BotIdentifiedTagsView]}", tag_matches);
