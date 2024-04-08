% Author: Michelle
%
% Present types of worlds
% start scene option 1:
% startScene :-
%     write("What type of world would you like?"), nl,
%     write("Swamp (dark and stormy)"), nl,
%     write("Magical candy castle in the clouds (light and magical)"),
%     write("Desert (dry and windy and sunny)"),
%     write("Virtual world (futuristic, EDM music)").
% option 2 (more consistent with former one):
scene_desc(scene(start), "What type of world would you like?").
scene_choices(scene(start), [
    choice(num(1), "Swamp (dark and stormy)", ["1"], 0),
    choice(num(2), "Magical candy castle in the clouds (light and magical)", ["1"], 0),
    choice(num(3), "Desert (dry and windy and sunny)", ["1"], 0),
    choice(num(4), "Virtual world (futuristic, EDM music)", ["1"], 0)
]).

% to suppress discontiguous warning messages (so that facts can be grouped by which scenario, for easier reading)
:- discontiguous start_desc/2.
:- discontiguous good_end/2.
:- discontiguous neutral_end/2.
:- discontiguous bad_end/2.
:- discontiguous probs/2.
:- discontiguous scene_desc/2.
:- discontiguous scene_choices/2.

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
start_desc(start(job), "You've finally got a job! \nUnfortunately, it's a slightly sketchy job, but it's the only job that you've got at this point. As you navigate towards the alleyway they have directed you towards, a mass of fear and anticipation resting on your shoulders, you realize, \n'Wait a second, this is a truck yard'. \nIt is a portal to another world.").
good_end(start(job), "You get a call as you leave the truck yard, and it turns out you made a wrong turn. Your job is actually at the high end place down the street.").
neutral_end(start(job), "While your new job still seems sketchy, it is in fact a job.").
bad_end(start(job), "Huh! You do not actually have a job. It appears you were daydreaming").
probs(start(job), [0.2, 0.1, 0.5, 0.2]).

% Facts of different possible scenarios and their possible choices
% Scenarios are represented as scene(id, desc, lst), where lst is a lst of possible choices: choice(id, desc, next, points).
scene_desc(scene(1), "You open your eyes, and see butterflies fluttering all around you. They place a crown made of silk on your head. You push yourself up. They all bow down. \n'Butterfly Monarch,' they cry out. 'Save us from the evil frogs who have kidnapped our children.'").
scene_choices(scene(1), [
    choice(num(1), "Throw away the crown. What rubbish!", [scene(2), scene(11)], 1), % num may be switched to just an int? not sure rn
    choice(num(2), "Love frogs, so you agree to save them, but secretly collect information about them so you can betray the butterflies later", [scene(4)], -1),
    choice(num(3),"Point your sword to the sky, and declare you will save the butterflies, and destroy the frogs!", [scene(4), scene(10), scene(3), scene(5)], 9),
    choice(num(4), "As a seasoned ruler, you calmly order the butterflies to bring you a plate of jelly beans.", [scene(2)], 7)
]).

scene_desc(scene(2), "Ouch! An apple hits your head. You open your eyes to a crowd of jeering frogs. You survey your surroundings. You are smack in the middle of an ancient roman gladiator stadium. Slop! A tomato splatters all over your face. Your worst nightmare has come true! But before the life seeps out of your eyes, darkness descends on the stadium. Amid the panicked croaks, you feel some tiny fluttering creatures drag you away. When you awake again, they ask you. 'Brave hero, will you take up our charitable cause to destroy the evil frogs?").
scene_choices(scene(2), [
    choice(num(1), "'Of course! They will pay for this great humiliation!'", [scene(4), scene(3)], 7),
    choice(num(2), "'Destroy them? Never! They've already destroyed me!'", [scene(11), scene(9), scene(5)], 2),
    choice(num(3), "'Will I be paid? Is this job? My greatest strength is that I will sell my soul to be employed.'", [scene(3), scene(4), scene(5)], 5),
    choice(num(4), "'DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS.'", [scene(3), scene(5)], 9)
    ]).

scene_desc(scene(3), "You find yourself at the edge of a dark and gloomy forest. What to do? You've got to cross it to get to Froglandia. What will you choose...").
scene_choices(scene(3), [
    choice(num(1), "Turn back, nope, this dark forest is not for meeeee", [scene(1), scene(9), scene(11)], 2),
    choice(num(2), "Send butterfly scouts deep into the woods, but it does not seem likely that they will return", [scene(10.5)], -3),
    choice(num(3), "Bravely forge ahead.", [scene(5)], 8),
    choice(num(4), "The frogs will protect me I will be safe.", [scene(5), scene(2)], 1),
    choice(num(5), "Scout around the area for tools that may be useful.", [scene(4), scene(5)], 7)
]).

scene_desc(scene(4), "As you are preparing for the next step of your journey, you realize that you may need some tools. As you look around, you see some potentially useful items...").
scene_choices(scene(4), [
    choice(num(1), "Wow, this lamp seems useful", [scene(3)], 8),
    choice(num(2), "I need nothing but my own courage and skills", [scene(5)], 6),
    choice(num(3), "Give me everything you offer", [scene(5)], 4),
    choice(num(4), "Money, money, money, MONEYYYYYYY!!!!!", [scene(5)], 10)
]).

scene_desc(scene(5), "You've run into a giant frog henchman. What will you do next?").
scene_choices(scene(5), [
    choice(num(1), "Flee. My life is not worth this.", [scene(11), scene(10.5), scene(9)], 1),
    choice(num(2), "Sacrifice the butterflies. Hey, I've got more important things to do", [scene(10.5), scene(10), scene(6), scene(8)], -5),
    choice(num(3), "Prepare for battle. Even though I've spent everyday job searching... Wish me luck.", [scene(6), scene(10), scene(7)], 8),
    choice(num(4), "Prepare for battle! I've got this!", [scene(8), scene(6), scene(7)], 8),
    choice(num(5), "I can convince this frog that I'm on his side.", [scene(7), scene(6), scene(8)], 6)
]).

scene_desc(scene(6), "After a long and arduous confrontation, the frog henchman decides to flee and report back. How will you move forward?").
scene_choices(scene(6), [
    choice(num(1), "No matter, I am prepared to move forward", [scene(10), scene(5), scene(10.5)], 8),
    choice(num(2), "Oh no, I've got to turn back and recoup", [scene(9), scene(11)], 4),
    choice(num(3), "Speed up to apprehend the henchman again", [scene(3), scene(5), scene(10), scene(10.5)], 7),
    choice(num(4), "I'm on the frogs' side? Why should I stop it. Pretend to accidentally let it go.", [scene(10), scene(10.5)],-1)
]).

scene_desc(scene(7), "You've defeated the frog henchman with ease. How will you deal with it and what is your next course of action?").
scene_choices(scene(7), [
    choice(num(1), "Dispose of it. That way, no one will be able to alert the frogs. And let's continue onwards", [scene(10)], 10),
    choice(num(2), "How could I forget? I am with the frogs. Let it go, but its defeat shall lure the butterflies into a false sense of security, Mwahhahahahahahah.", [scene(3), scene(2), scene(10.5), scene(10)], -2),
    choice(num(3), "I'll show it some mercy but just to be safe, I'll send it back to the butterflies.", [scene(9), scene(10)], 7),
    choice(num(4), "I'll show some mercy, it will guide me to the frog monarch or else!", [scene(10)], 8)
]).

scene_desc(scene(8), "The frog henchman has defeated you. Despite your valiant efforts, the frog henchman has easily defeated you. Now it is thinking of capturing you. How are you to move forward?").
scene_choices(scene(8), [
    choice(num(1), "Run away! The frogs are too scary!", [scene(9), scene(11)], 1),
    choice(num(2), "I was just pretending to be defeated, I'm  on the frogs' side, remember? This is also part of my plan", [scene(10.5)], -2),
    choice(num(3), "Evade capture! The frogs may have won this battle, but I'll win the war!", [scene(10)], 6),
    choice(num(4), "I'll allow myself to be captured, but that just means I'll be brought right to the frog monarch, where I'll show it my might!", [scene(10.5)], 8)
]).

scene_desc(scene(9), "You've decided to retreat. The butterflies welcome you back disappointedly but resigned. They offer you the choice to try again or to give up.").
scene_choices(scene(9), [
    choice(num(1), "I'm going back home, it's not worth it! Send me home!", [scene(11), end()], 1),
    choice(num(2), "I can keep going, let me try again.", [scene(3), scene(5), scene(10)], 7),
    choice(num(3), "I guess I can keep going? Give me more money and I'll do it.", [scene(4)], 8)
]).

scene_desc(scene(10), "You valiantly march onwards towards the frogs' lair, as prepared as you ever will be. The ominous castle looms closer and closer, increasing in size along with the pit of fear and anxiety in your chest. Wow, this may even be more scary than job search. But you've decided to do this and so you will. Now, you see the frog monarch, more intimidating than you ever thought. It snarls and offers you some choices, how will you respond?").
scene_choices(scene(10), [
    choice(num(1), "Fight! I will never give up", [end()], 7),
    choice(num(2), "Surrender, frogs are too scary. I'm sorry, butterflies, but I can't!", [end()], -10),
    choice(num(3), "Is it too late to run away?", [end()], 2),
    choice(num(4), "I've prepared this long, I guess I'll do my best.", [end()], 7)
]).

scene_desc(scene(10.5), "You've failed to evade capture. A frog henchman found you and is now bringing you to the frog monarch. Scary scary. How will you respond?").
scene_choices(scene(10.5), [
    choice(num(1), "Fight! I will never give up", [end()], 7),
    choice(num(2), "Surrender, frogs are too scary. I'm sorry, butterflies, but I can't!", [end()], -100),
    choice(num(3), "Is it too late to run away?", [end()], (-2)),
    choice(num(4), "I've prepared this long, I guess I'll do my best.", [end()], 7)
]).

scene_desc(scene(11), "It's time to make a choice. You see a mysterious glowing portal appear two steps ahead. Will you take the wager and hope to go home?").
scene_choices(scene(11), [
    choice(num(1), "Stay", [end(*)], 1),                 % game will end
    choice(num(2), "Continue the adventure", [scene(3)], 1),  % game continues
    choice(num(3), "Go home", [end()], 1)                % game will end
]).

% scene_desc(scene(), ).
% scene_choices(scene(), [

% ]).

all_scenario_keys([scene(1), scene(2), scene(3), scene(4), scene(5), scene(6), scene(7), scene(8), scene(9), scene(10), scene(10.5), scene(11)]).

% End scenarios facts
scene(end(*), "You've successfully avoided job search. You spend your days frolicking around with butterflies. But when will you get back to reality?").
scene(end(), "The End."). % This isn't necessarily needed (instead have a check for "end"), for now I've left it

is_end(scene(end)).
is_end(scene(end(*))).
