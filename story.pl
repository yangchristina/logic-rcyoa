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
choice(scene(), 1, "Swamp (dark and stormy)", ["1"], [], 0),
choice(scene(), 2, "Magical candy castle in the clouds (light and magical)", ["1"], [], 0),
choice(scene(), 3, "Desert (dry and windy and sunny)", ["1"], [], 0),
choice(scene(), 4, "Virtual world (futuristic, EDM music)", ["1"], [], 0)
]).

% to suppress discontiguous warning messages (so that facts can be grouped by which scenario, for easier reading)
:- discontiguous start_desc/2.
:- discontiguous good_end/2.
:- discontiguous neutral_end/2.
:- discontiguous bad_end/2.
:- discontiguous probs/2.
:- discontiguous scene_desc/2.
:- discontiguous choice/6.

% Initial world scenarios (represented as a series of facts).
% sample use below
% show_desc(_) :- start_desc(start(studio), T),
%                    write(T).
% Studio start world facts
start_desc(start(1), "You are sitting in your studio apartment, watching youtube videos of cats, when you see you've received an email. It's the results for your job interview last week.\nYou slowly reach your mouse towards the email. Your hands tremble.\nBam! You get hit by a truck.").
good_end(start(1), "The truck thing was your real interview. You get the job!").
neutral_end(start(1), "It was actually a scam email").
bad_end(start(1), "The truck thing was your real interview. You did not pass.").
probs(start(1), [0.2, 0.2, 0.3, 0.3]). % not sure if we really need this tbh.

% Countryside start world facts
start_desc(start(2), "You're in the countryside.\nThere's a barren feel to the place.\nYou stab your hoe at the ground, bored out of your mind.\nSuddenly, a truck comes up out of nowhere, and bam! You black out.").
good_end(start(2), "After your adventure, you come back to find your hoe has become magical. You become the best farmer in the galaxy").
neutral_end(start(2), "You realize after your long adventure that farming is your one true passion.").
bad_end(start(2), "Your crops have all dried up. Now you are penniless.").
probs(start(2), [0.2, 0.2, 0.5, 0.1]).

% Teddy start world facts
start_desc(start(3), "On a dark and stormy night, you hug your teddy bear tightly. Thunder crackles outside your window. 'Dear Teddy', you say. 'At least I have you.' \n All of a sudden, a truck hits you. In an instant, everything went dark. You grasp around for your teddy. \n But it was too late. Teddy's stitches had come undone, his stuffing spilling out like a river of memories. \nWith trembling hands, you gather Teddy's broken body, holding him close one last time. Tears stream down your cheeks as you feel Teddy's whispered words of remorse and love. \n In that final moment, as the darkness of the truck engulfs you, you know that you have been truly loved, and that is all that matters.").
good_end(start(3), "A tailor poofs in front of you, and fixes up your teddy bear. Your face shines in happiness, as you bring your teddy in for a long bear hug.").
neutral_end(start(3), "You rise up in your kingdom, and order all trucks to be destroyed in your kingdom. You hold a funeral for your Teddy, and cry many buckets.").
bad_end(start(3), "You find out that your teddy hates you, and sent you on that adventure to take over your kingdom. Now you are a lowly subject, working for your cruel overlord, king Teddy.").
probs(start(3), [0.5, 0.1, 0.2, 0.2]).

% Jobsearch start world facts
start_desc(start(4), "One day after job searching, you are making your way back home when a truck sends you to another world.\n You must navigate this new world and try to make your way home back to job search.").
good_end(start(4), "You've made it back home! You see that your inbox has many new messages! It seems that some carry good news.").
neutral_end(start(4), "You lie in bed, browsing through your emails. No good news, but there are some promising opportunities presenting themselves.").
bad_end(start(4), "You crash in through the door, the deadlines for the applications you have prepped have all passed, and there is nothing new in your inbox.").
probs(start(4), [0.2, 0.2, 0.2, 0.3]).

% network start world facts
start_desc(start(5), "One day during a networking session, you begin to introduce yourself to an alumni while ordering at a cafe. \nBefore you can even begin to express your admiration and respect, \nBANG! \nA truck appeared in the cafe where you were standing seconds before.").
good_end(start(5), "Your networking meeting has gone swimmingly. You have gained a valuable connection in the industry you hope to join.").
neutral_end(start(5), "Shaken up, you stutter your way through your talk, but hey! The alumni still has a slightly positive impression of you.").
bad_end(start(5), "Oh no! You've spilled coffee all over the alumni and yourself. Mortified, you run away never to see this cafe or the alumni again.").
probs(start(5), [0.2, 0.2, 0.3, 0.2]).

% recommendation start world facts
start_desc(start(6), "It is a dark and stormy night. While you are mustering up the courage to ask your professor for a recommendation letter, a truck has already recommended you to another world.").
good_end(start(6), "You wake up in your room to find that your professor wrote a glowing review, praising your performance in class and fervently recommending you.").
neutral_end(start(6), "Your professor writes you a recommendation letter, while slightly struggling to remember who you are. Well, you've gotten the recommendation so don't forget to thank your professor.").
bad_end(start(6), "Recommendation letter? This professor doesn't even know you. Where have you gone?").
probs(start(6), [0.5, 0.1, 0.2, 0.2]).

% job start world facts
start_desc(start(7), "You've finally got a job! \nUnfortunately, it's a slightly sketchy job, but it's the only job that you've got at this point. As you navigate towards the alleyway they have directed you towards, a mass of fear and anticipation resting on your shoulders, you realize, \n'Wait a second, this is a truck yard'. \nIt is a portal to another world.").
good_end(start(7), "You get a call as you leave the truck yard, and it turns out you made a wrong turn. Your job is actually at the high end place down the street.").
neutral_end(start(7), "While your new job still seems sketchy, it is in fact a job.").
bad_end(start(7), "Huh! You do not actually have a job. It appears you were daydreaming").
probs(start(7), [0.2, 0.1, 0.5, 0.2]).

% Facts of different possible scenarios and their possible choices
% Scenarios are represented as scene(id, desc), and then a series of choices, represented by choice(scene(id), num, desc, lstbest, lst, points)
scene_desc(scene(1), "You open your eyes, and see butterflies fluttering all around you. They place a crown made of silk on your head. \n You push yourself up. They all bow down. \n'Butterfly Monarch,' they cry out. 'Save us from the evil frogs who have kidnapped our children.'").
choice(scene(1), 1, "Throw away the crown. What rubbish!", [scene(2), scene(11)], [scene(3), scene(4), scene(5), scene(9), scene(10), scene(10.5), scene(11)], 1).
choice(scene(1), 2, "Love frogs, so you agree to save them, but secretly collect information about them so you can betray the butterflies later", [scene(4),scene(14)], [scene(2), scene(3), scene(4), scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], -1).
choice(scene(1), 3,"Point your sword to the sky, and declare you will save the butterflies, and destroy the frogs!", [scene(4), scene(10), scene(3), scene(5)], [scene(2), scene(5), scene(9),scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 9).
choice(scene(1), 4, "As a seasoned ruler, you calmly order the butterflies to bring you a plate of jelly beans.", [scene(2)], [scene(3), scene(4), scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 7).

scene_desc(scene(2), 'Ouch! An apple hits your head. You open your eyes to a crowd of jeering frogs. \n You survey your surroundings. You are smack in the middle of an ancient roman gladiator stadium. \nSlop! A tomato splatters all over your face. Your worst nightmare has come true! But before the life seeps out of your eyes, darkness descends on the stadium. \nAmid the panicked croaks, you feel some tiny fluttering creatures drag you away. When you awake again, they ask you. \n \'Brave hero, will you take up our charitable cause to destroy the evil frogs?\'').
choice(scene(2), 1, 'Of course! They will pay for this great humiliation!', [scene(4), scene(3)], [scene(1), scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 7).
choice(scene(2), 2, 'Destroy them? Never! They\'ve already destroyed me!', [scene(11), scene(9), scene(5)], [scene(1), scene(2), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], -2).
choice(scene(2), 3, "'Will I be paid? Is this job? My greatest strength is that I will sell my soul to be employed.'", [scene(3), scene(4), scene(5)], [scene(1), scene(10), scene(10.5), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], -1).
choice(scene(2), 4, "'DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS. DEATH TO THE FROGS.'", [scene(3), scene(5)], [scene(1), scene(10), scene(4), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 9).

scene_desc(scene(3), 'You find yourself at the edge of a dark and gloomy forest. What to do? You\'ve got to cross it to get to Froglandia. What will you choose...').
choice(scene(3), 1, "Turn back, nope, this dark forest is not for meeeee", [scene(1), scene(9), scene(11)], [scene(2),scene(5),scene(4), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 2).
choice(scene(3), 2, "Send butterfly scouts deep into the woods, but it does not seem likely that they will return", [scene(10.5),scene(14)], [scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], -3).
choice(scene(3), 3, "Bravely forge ahead.", [scene(5),scene(12)], [scene(10), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 8).
choice(scene(3), 4, "The frogs will protect me I will be safe.", [scene(5), scene(2),scene(14)], [scene(1), scene(10), scene(10.5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], -3).
choice(scene(3), 5, "Scout around the area for tools that may be useful.", [scene(4),scene(12)], [scene(5), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 7).

scene_desc(scene(4), "As you are preparing for the next step of your journey, you realize that you may need some tools. As you look around, you see some potentially useful items...").
choice(scene(4), 1, "Wow, this lamp seems useful", [scene(3)], [scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 8).
choice(scene(4), 2, "I need nothing but my own courage and skills", [scene(5)], [scene(3), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 6).
choice(scene(4), 3, "Give me everything you offer", [scene(5)], [scene(3), scene(10.5), scene(10), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 4).
choice(scene(4), 4, "Money, money, money, MONEYYYYYYY!!!!!", [scene(5)], [scene(3), scene(10), scene(10.5), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 10).

scene_desc(scene(5), "You've run into a giant frog henchman. What will you do next?").
choice(scene(5), 1, "Flee. My life is not worth this.", [scene(11), scene(9)], [scene(2), scene(10.5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 1).
choice(scene(5), 2, "Sacrifice the butterflies. Hey, I've got more important things to do", [scene(14), scene(6), scene(8)], [scene(7), scene(11)], -5).
choice(scene(5), 3, "Prepare for battle. Even though I've spent everyday job searching... Wish me luck.", [scene(6), scene(7)], [scene(8)], 8).
choice(scene(5), 4, "Prepare for battle! I've got this!", [scene(6), scene(7)], [scene(8), scene(11)], 8).
choice(scene(5), 5, "I can convince this frog that I'm on his side.", [scene(7), scene(6), scene(8)], [scene(2), scene(11), scene(1),scene(14)], 6).

scene_desc(scene(6), "After a long and arduous confrontation, the frog henchman decides to flee and report back. How will you move forward?").
choice(scene(6), 1, "No matter, I am prepared to move forward", [scene(10), scene(5)], [scene(3), scene(4), scene(10.5), scene(1), scene(2), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 8).
choice(scene(6), 2, "Oh no, I've got to turn back and recoup", [scene(9), scene(11)], [scene(4), scene(5), scene(1), scene(2)], 4).
choice(scene(6), 3, "Speed up to apprehend the henchman again", [scene(3), scene(5), scene(10), scene(10.5)], [scene(7), scene(8), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 7).
choice(scene(6), 4, "I'm on the frogs' side? Why should I stop it. Pretend to accidentally let it go.", [scene(10), scene(10.5),scene(14)], [scene(8), scene(3), scene(5), scene(4), scene(1), scene(2), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)],-1).

scene_desc(scene(7), "You've defeated the frog henchman with ease. How will you deal with it and what is your next course of action?").
choice(scene(7), 1, "Dispose of it. That way, no one will be able to alert the frogs. And let's continue onwards", [scene(10)], [scene(5), scene(3), scene(4), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 10).
choice(scene(7), 2, "How could I forget? I am with the frogs. Let it go, but its defeat shall lure the butterflies into a false sense of security, Mwahhahahahahahah.", [scene(3), scene(2), scene(10.5), scene(10), scene(14)], [scene(4), scene(5), scene(11)], -2).
choice(scene(7), 3, "I'll show it some mercy but just to be safe, I'll send it back to the butterflies.", [scene(10)], [scene(11), scene(9), scene(3), scene(4), scene(5)], 7).
choice(scene(7), 4, "I'll show some mercy, it will guide me to the frog monarch or else!", [scene(10)], [scene(10.5), scene(3), scene(5)], 8).

scene_desc(scene(8), "The frog henchman defeated you. Despite your valiant efforts, the frog henchman has easily defeated you. Now it is thinking of capturing you. How are you to move forward?").
choice(scene(8), 1, "Run away! The frogs are too scary!", [scene(9), scene(11)], [scene(1), scene(2)], 1).
choice(scene(8), 2, "I was just pretending to be defeated, I'm  on the frogs' side, remember? This is also part of my plan", [scene(10.5),scene(14)], [scene(3), scene(4), scene(5), scene(11)], -2).
choice(scene(8), 3, "Evade capture! The frogs may have won this battle, but I'll win the war!", [scene(10)], [scene(11), scene(10.5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 6).
choice(scene(8), 4, "I'll allow myself to be captured, but that just means I'll be brought right to the frog monarch, where I'll show it my might!", [scene(10.5)], [scene(10), scene(11)], 8).

scene_desc(scene(9), 'You\'ve decided to retreat. The butterflies welcome you back disappointedly but resigned. They offer you the choice to try again or to give up.').
choice(scene(9), 1, "I'm going back home, it's not worth it! Send me home!", [scene(11), scene(end)], [], -11).
choice(scene(9), 2, 'I can keep going, let me try again.', [scene(3), scene(5), scene(10)], [scene(1), scene(2), scene(4), scene(10.5), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 7).
choice(scene(9), 3, 'I guess I can keep going? Give me more money and I\'ll do it.', [scene(4)], [scene(1), scene(2), scene(3), scene(5), scene(10), scene(10.5), scene(11), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)], 5).

scene_desc(scene(10), "You valiantly march onwards towards the frogs' lair, as prepared as you ever will be. The ominous castle looms closer and closer, increasing in size along with the pit of fear and anxiety in your chest. Wow, this may even be more scary than job search. But you've decided to do this and so you will. Now, you see the frog monarch, more intimidating than you ever thought. It snarls and offers you some choices, how will you respond?").
choice(scene(10), 1, "Fight! I will never give up", [scene(end)], [], 7).
choice(scene(10), 2, "Surrender, frogs are too scary. I'm sorry, butterflies, but I can't!", [scene(end)], [], -10).
choice(scene(10), 3, "Is it too late to run away?", [scene(end)], [scene(11)], -2).
choice(scene(10), 4, "I've prepared this long, I guess I'll do my best.", [scene(end)], [], 7).

scene_desc(scene(10.5), 'You\'ve failed to evade capture. A frog henchman found you and is now bringing you to the frog monarch. Scary scary. How will you respond?').
choice(scene(10.5), 1, "Fight! I will never give up", [scene(end)], [], 7).
choice(scene(10.5), 2, 'Surrender, frogs are too scary. I\'m sorry, butterflies, but I can\'t!', [scene(end)], [], -100).
choice(scene(10.5), 3, "Is it too late to run away?", [scene(end)], [scene(11)], (-2)).
choice(scene(10.5), 4, "I've prepared this long, I guess I'll do my best.", [scene(end)], [], 7).

scene_desc(scene(11), 'It\'s time to make a choice. You see a mysterious glowing portal appear two steps ahead. Will you take the wager and hope to go home?').
choice(scene(11), 1, "Stay", [scene(end(*))], [], 1).                 % game will end
choice(scene(11), 2, "Continue the adventure", [scene(3)], [scene(1), scene(2), scene(4), scene(5), scene(10), scene(10.5), scene(9)], 1).  % game continues
choice(scene(11), 3, "Go home", [scene(end)], [], 1).                % game will end

scene_desc(scene(12), 'Your journey to help the butterflies has begun, but you feel that you don\'t feel confident enough to face the frogs. In response, the butterflies have decided to fulfill one of your wishes.').
choice(scene(12),1,"There is no need for this.",[scene(4)],[scene(5), scene(3), scene(2)],5).
choice(scene(12),2,"I'll take everything you have.",[scene(10.5)],[scene(3),scene(4),scene(5), scene(12), scene(13), scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)],4).
choice(scene(12),3,"What am I supposed to do?",[scene(1), scene(3), scene(4)],[scene(2), scene(5)],1).
choice(scene(12),4,"I would like a job please.", [scene(11), scene(5)], [scene(1), scene(2), scene(3), scene(4)]).

scene_desc(scene(13), 'Ominously, everything around you has darkened, as you trek along the path. Above you see something glowing, and as you get closer, you see that it is a toad! \nThis toad eats both butterflies and frogs and it asks you what it should have for its next meal. How do you respond?' ).
choice(scene(13),1,"You should eat butterflies, they are very tasty snacks.",[scene(5), scene(14)],[scene(11), scene(10.5)],-10).
choice(scene(13),2,"Eat frogs! They are much bigger than butterflies and will therefore be much more filling.",[scene(5), scene(4)],[scene(3), scene(10)],9).
choice(scene(13),3,"Eat both, why choose one when you can have them all",[scene(14), scene(5),scene(18)],[scene(3), scene(4),scene(10.5),scene(16),scene(17),scene(19),scene(21)],-5).
choice(scene(13),4,"Neither. Why eat those when you could eat chocolate", [scene(20),scene(21),scene(17)],[scene(2),scene(3),scene(4),scene(5),scene(12),scene(14),scene(16),scene(17),scene(18),scene(19)],7).

scene_desc(scene(14), 'The butterflies confront you, suspicious that you are betraying them. How will you reassure them?').
choice(scene(14),1,'Of course I\'m still with the butterflies!',[scene(14.5)],[],5).
choice(scene(14),2,'Well it depends on how much you are offering me.',[scene(14.5)],[scene(14.6)],-2).
choice(scene(14),3,'I\'ve never hidden that I like frogs?',[scene(14.6)],[scene(14.5)],-5).

scene_desc(scene(14.5), 'The butterflies decide to believe you, sending you along on your journey with more confidence and supplies.').
choice(scene(14.5),1,'Well, regardless of what anyone thinks, I just want to go home',[scene(11)],[scene(3), scene(4), scene(5), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],4).
choice(scene(14.5),2,'So much to do and so little time!',[scene(5)],[scene(3), scene(4), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],5).
choice(scene(14.5),3, 'Huh! It seems they believe me',[scene(5)],[scene(3), scene(4), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],-3).

scene_desc(scene(14.6), 'The butterflies don\'t believe you, deciding to banish you from their world. In a last ditch attempt to show then your loyalty and conviction what will you do?').
choice(scene(14.6),1,'Well, regardless of what anyone thinks, I just want to go home',[scene(11)],[scene(3), scene(4), scene(5), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],-4).
choice(scene(14.6),2,'So much to do and so little time!',[scene(5)],[scene(3), scene(4), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],-5).
choice(scene(14.6),3, 'Huh! It seems they don\'t believe me',[scene(5)],[scene(3), scene(4), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],-9).
choice(scene(14.6),4,'Where has everything gone wrong? I really am on the butterflies side',[scene(11)],[scene(3), scene(4), scene(5), scene(9), scene(10), scene(10.5), scene(12), scene(13),scene(16),scene(17),scene(18),scene(19),scene(21)],4).

scene_desc(scene(15), 'Your efforts to be noticed by the frogs have been seen. A frog henchman looms above, will you still attempt to ally yourself with them?').
choice(scene(18),1,'I\'m not afraid of anything!', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21),scene(11)],-5).
choice(scene(18),2,'Is it too late to make amends with the butterflies?', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21)],-2, scene(11)).
choice(scene(18),3,'I just wanted a job!', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21),scene(11)],-7).
choice(scene(15),4,'I\'ll tell them everything I know!',[scene(14)], [scene(11),scene(10.5)],-10).

scene_desc(scene(16), 'A mysterious creature reveals itself to you in the dark forest, tempting you with the offer to get what you want in the real world, if only you give up this world. How will you choose to proceed?').
choice(scene(16),1,'Call their bluff',[scene(5)],[scene(1), scene(2), scene(3), scene(4), scene(10), scene(10.5), scene(11), scene(end), scene(end(*)), scene(12), scene(13),scene(14),scene(15),scene(16),scene(17),scene(18),scene(19),scene(20),scene(21)],2).
choice(scene(16),2,'I\'ll wager everything!',[scene(10)],[scene(1), scene(2), scene(3), scene(4), scene(5), scene(9), scene(10.5), scene(11), scene(12), scene(13),scene(14),scene(15),scene(16),scene(17),scene(18),scene(19),scene(20),scene(21)],6).

scene_desc(scene(17), 'The battle against the frogs has begun, what will your strategy be?').
choice(scene(17),1, 'Brave, but rash.',[scene(10)], [scene(1), scene(2), scene(3), scene(4), scene(5), scene(9), scene(10.5), scene(11), scene(end), scene(12), scene(13),scene(14),scene(15),scene(16),scene(17),scene(18),scene(19),scene(20),scene(21)], -1).
choice(scene(17),2, 'Cautious and slow.', [scene(3), scene(4)],[scene(1),scene(2),scene(5),scene(9), scene(12),scene(13),scene(14),scene(15),scene(16),scene(17),scene(18),scene(19),scene(21)]).
choice(scene(17),3, 'I\'m not gonna fight.', [scene(9), scene(11)],[scene(2),scene(3),scene(4),scene(5),scene(12),scene(14),scene(16),scene(17),scene(18),scene(21)]).

scene_desc(scene(18), 'Someone or something has cursed you. Perhaps it was someone you upset with your previous choices. No matter what choice you make, you have been set back from accomplishing your goals').
choice(scene(18),1,'I\'m not afraid of anything!', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21),scene(11)],-5).
choice(scene(18),2,'Is it too late to make amends?', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21)],-2, scene(11)).
choice(scene(18),3,'I just wanted a job!', [scene(3),scene(4),scene(5),scene(13),scene(12)],[scene(10),scene(10.5),scene(15),scene(16),scene(17),scene(19),scene(21),scene(11)],-7).

scene_desc(scene(19), 'Along the way you see a small creature trapped on a tree branch, will you try to help it?').
choice(scene(19),1,'Help it, of course!',[scene(20)], [scene(16), scene(21)],9).
choice(scene(19),2,'Walk away, I\'m a very busy person.', [scene(18),scene(3), scene(5)],[scene(4),scene(9),scene(16),scene(17),scene(21),scene(10.5),scene(13),scene(12)],-5).
choice(scene(19),3, 'What will I get in return?', [scene(20),scene(18),scene(16),scene(21)],[scene(3),scene(4),scene(5),scene(14),scene(15),scene(10.5),scene(12),scene(13)],3).

scene_desc(scene(20), 'As thanks for the good deed, you have been rewarded, and presented with three choices, but beware that their descriptions may be deceiving').
choice(scene(20),1,'Choose the smallest choice', [scene(2),scene(3),scene(4),scene(5)],[scene(12),scene(13),scene(14),scene(15),scene(16),scene(17),scene(18),scene(19)], 5).
choice(scene(20),2,'Choose the medium choice',[scene(12),scene(13),scene(14),scene(16)],[scene(2),scene(3),scene(4),scene(5),scene(15),scene(17),scene(18),scene(19),scene(21)],9).
choice(scene(20),3,'Choose the largest choice',[scene(18),scene(19),scene(21)],[scene(2),scene(3),scene(4),scene(5),scene(15),scene(12),scene(13),scene(14),scene(16)],7).

scene_desc(scene(21), 'You\'ve come across a mysterious merchant offering 5 choices, for the low price of 5 points.\n Each choice presents a statement which may be true or false. There is one true statement and the rest are all false. \nIf you can choose the true statement, you will double your investment, but otherwise... you will lose it all!').
choice(scene(21),1, 'This statement is the true statement.',[scene(19),scene(18)],[scene(3),scene(4),scene(5), scene(16), scene(17),scene(14),scene(13),scene(12)],-5).
choice(scene(21),2, 'All the other statements are false.',[scene(19),scene(18)],[scene(3),scene(4),scene(5), scene(16), scene(17),scene(14),scene(13),scene(12)],10).
choice(scene(21),3, 'There are no true statements.',[scene(19),scene(18)],[scene(3),scene(4),scene(5), scene(16), scene(17),scene(14),scene(13),scene(12)],-5).
choice(scene(21),4, 'Statement 1 is true.',[scene(19),scene(18)],[scene(3),scene(4),scene(5), scene(16), scene(17),scene(14),scene(13),scene(12)],-5).
choice(scene(21),5, 'I will abstain.',[scene(19),scene(18)],[scene(3),scene(4),scene(5), scene(16), scene(17),scene(14),scene(13),scene(12)],-5).

% scene_desc(scene(), ).
% choice(scene(),,,,).

% Find a list of all the choices in a certain scenario
choices_in_scene(Scene, ListOfChoices) :-
    findall(Choice, choice(Scene, Choice, _, _, _, _), ListOfChoices).

% Empty scene
% scene_desc(scene(), ).
% choice(scene(),,,,).

% list of keys of all possible scenarios
all_scenario_keys([scene(1), scene(2), scene(3), scene(4), scene(5), scene(6), scene(7), scene(8), scene(9), scene(10), scene(10.5), scene(11), scene(end), scene(end(*)), scene(12), scene(13),scene(14),scene(14.5),scene(14.6),scene(15),scene(16),scene(17),scene(18),scene(19),scene(20),scene(21)]).

% End scenarios facts
scene_desc(scene(end(*)), 'You\'ve successfully avoided job search. You spend your days frolicking around with butterflies. But when will you get back to reality?').
scene_desc(scene(end), "The End."). % This isn't necessarily needed (instead just have a check for "end"), for now I've left it
