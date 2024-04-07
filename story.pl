% Author: Michelle
%
% Present types of worlds
% needs fixing
startScene :- 
    write("What type of world would you like?"), nl,
    write("Swamp (dark and stormy)"), nl,
    write("Magical candy castle in the clouds (light and magical)"),
    write("Desert (dry and windy and sunny)"),
    write("Virtual world (futuristic, EDM music)").

% to suppress discontiguous warning messages
:- discontiguous start_desc/2.
:- discontiguous good_end/2.
:- discontiguous neutral_end/2.
:- discontiguous bad_end/2.
:- discontiguous probs/2.

% Initial world scenarios (represented as a series of facts).
% sample use below 
% show_desc(_) :- start_desc(start(studio), T),
%                    write(T).
% Studio start world facts
start_desc(start(studio), "You are sitting in your studio apartment, watching youtube videos of cats, when you see you've received an email. It's the results for your job interview last week.\nYou slowly reach your mouse towards the email. Your hands tremble.\nBam! You get hit by a truck."). 
good_end(start(studio), "The truck thing was your real interview. You get the job!").
neutral_end(start(studio), "It was actually a scam email").
bad_end(start(studio), "The truck thing was your real interview. You did not pass.").
probs(start(studio), [0.2, 0.2, 0.3, 0.3]). % not sure if we really need this tbh. 

% Countryside start world facts
start_desc(start(countryside), "You're in the countryside.\nThere's a barren feel to the place.\nYou stab your hoe at the ground, bored out of your mind.\nSuddenly, a truck comes up out of nowhere, and bam! You black out.").
good_end(start(countryside), "After your adventure, you come back to find your hoe has become magical. You become the best farmer in the galaxy").
neutral_end(start(countryside), "You realize after your long adventure that farming is your one true passion.").
bad_end(start(countryside), "Your crops have all dried up. Now you are penniless.").
probs(start(countryside), [0.2, 0.2, 0.5, 0.1]).

% Teddy start world facts
start_desc(start(teddy), "On a dark and stormy night, you hug your teddy bear tightly. Thunder crackles outside your window. 'Dear Teddy', you say. 'At least I have you.' \n All of a sudden, a truck hits you. In an instant, everything went dark. You grasp around for your teddy. But it was too late. Teddy's stitches had come undone, his stuffing spilling out like a river of memories. With trembling hands, you gather Teddy's broken body, holding him close one last time. Tears stream down your cheeks as you feel Teddy's whispered words of remorse and love. In that final moment, as the darkness of the truck engulfs you, you know that you have been truly loved, and that is all that matters.").
good_end(start(teddy), "A tailor poofs in front of you, and fixes up your teddy bear. Your face shines in happiness, as you bring your teddy in for a long bear hug.").
neutral_end(start(teddy), "You rise up in your kingdom, and order all trucks to be destroyed in your kingdom. You hold a funeral for your Teddy, and cry many buckets.").
bad_end(start(teddy), "You find out that your teddy hates you, and sent you on that adventure to take over your kingdom. Now you are a lowly subject, working for your cruel overlord, king Teddy.").
probs(start(teddy), [0.5, 0.1, 0.2, 0.2]).

% Jobsearch start world facts
start_desc(start(search), "One day after job searching, you are making your way back home when a truck sends you to another world. You must navigate this new world and try to make your way home back to job search.").
good_end(start(search), "You've made it back home! You see that your inbox has many new messages! It seems that some carry good news.").
neutral_end(start(search), "You lie in bed, browsing through your emails. No good news, but there are some promising opportunities presenting themselves.").
bad_end(start(search), "You crash in through the door, the deadlines for the applications you have prepped have all passed, and there is nothing new in your inbox.").
probs(start(search), [0.2, 0.2, 0.2, 0.3]).

% network start world facts
start_desc(start(network), "One day during a networking session, you begin to introduce yourself to an alumni while ordering at a cafe. Before you can even begin to express your admiration and respect, \nBANG! \nA truck appeared in the cafe where you were standing seconds before.").
good_end(start(network), "Your networking meeting has gone swimmingly. You have gained a valuable connection in the industry you hope to join.").
neutral_end(start(network), "Shaken up, you stutter your way through your talk, but hey! The alumni still has a slightly positive impression of you.").
bad_end(start(network), "Oh no! You've spilled coffee all over the alumni and yourself. Mortified, you run away never to see this cafe or the alumni again.").
probs(start(network), [0.2, 0.2, 0.3, 0.2]).

% recommendation start world facts
start_desc(start(recommendation), "It is a dark and stormy night. While you are mustering up the courage to ask your professor for a recommendation letter, a truck has already recommended you to another world.").
good_end(start(recommendation), "You wake up in your room to find that your professor wrote a glowing review, praising your performance in class and fervently recommending you.").
neutral_end(start(recommendation), "Your professor writes you a recommendation letter, while slightly struggling to remember who you are. Well, you've gotten the recommendation so don't forget to thank your professor.").
bad_end(start(recommendation), "Recommendation letter? This professor doesn't even know you. Where have you gone?").
probs(start(recommendation), [0.5, 0.1, 0.2, 0.2]).

% job start world facts
start_desc(start(job), "You've finally got a job! \nUnfortunately, it's a slightly sketchy job, but it's the only job that you've got at this point. As you navigate towards the alleyway they have directed you towards, a mass of fear and anticipation resting on your shoulders, you realize, \n\"Wait a second, this is a truck yard\". \nIt is a portal to another world.").
good_end(start(job), "You get a call as you leave the truck yard, and it turns out you made a wrong turn. Your job is actually at the high end place down the street.").
neutral_end(start(job), "While your new job still seems sketchy, it is in fact a job.").
bad_end(start(job), "Huh! You do not actually have a job. It appears you were daydreaming").
probs(start(job), [0.2, 0.1, 0.5, 0.2]).

% Facts of different possible scenarios and their possible choices


% End scenarios facts
