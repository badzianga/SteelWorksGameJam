extends Node

const DIFFICULTY_CASUAL = 0
const DIFFICULTY_HARD = 1

var score: int # current score
var mistakes_left: int  # a.k.a. lifes (allowed mistakes on desk)
var in_area: String  # body (interaction object) name
var client_timer = 20  # time for all documents
var hunger_decrease: int
var happiness_decrease: int
var hygiene_decrease: int


func reset(difficulty: int):
	score = 0
	in_area = ""
	if difficulty == DIFFICULTY_CASUAL:
		mistakes_left = 3
		hunger_decrease = 2
		happiness_decrease = 4
		hygiene_decrease = 6
	else:
		mistakes_left = 1
		hunger_decrease = 1
		happiness_decrease = 2
		hygiene_decrease = 3


var bad_deeds := [
	"Vandalised a road sign",
	"Robbed small grocery store",
	"Set up a small tree on fire",
	"Murdered someone", 
	"Stole a protein bar from a gym store", 
	"Cheated in relationship",
	"Beat his own partner", 
	"Toke revenge on ex-partner", 
	"Hypocrite in a lot of cases", 
	"Was Selfish in a lot of cases",
	"Lied to a close friend", 
	"Drug Abuse",
	"Act of verbal assault",
	"Tax Fraud",
	"Burglary",
	"Money Laundering",
	"Shoplifting",
	"Identity Theft",
	"Drinking in public",
	"Cursing at people",
	"Illegal purchase",
	"Not wearing a seatbelt",
	"Damaging a mailbox",
	"Animal abuse",
	"Pulling false fire alarm",
	"Fake 911 Calls",
	"Fake Bomb Threat",
	"Having something you knwow is stolen",
	"Illegal possesion of pepper spray",
	"Carrying a Nunchucks",
	"Hanging onto a moving car",
	"Lying to a Police Officer",
	"Running from law",
	"Driving without License",
	"Taking something without permission",
	"Take candy from a shop without paying",
	"Bullying",
	"Being rude in class",
	"Being rude to others",
	"Writing fake checks",
	"Impersonating someone",
	"Commit fraud",
	"Disrupting Class",
	"Throwing away food",
	"Brushing Teeth with running water",
	"Dancing at a funeral",
	"Not giving away seat to an old person in transport",
	"Taking away ice cream from kid",
	"Being mean without reason",
	"Refusing to give water to a thirsty person",
	"Stealing road signs",
	"Causing fights",
	"Take part in brawls",
	"Gambling",
	"Kicked a dog",
	"Hacked school website",
	"Not flushing public toilet",
	"Theft of railroad tracks",
	"Passing on red light",
	"Not sorting trash",
	"Drug Market",
	"Assasination",
	"Run over a squirrel with a car",
	"Killed a bee",
	"Giving away dog to a shelter",
	"Stepped down on a flora",
]

var good_deeds := [
	"Communtiy Work",
	"Being helpful",
	"Caring",
	"Loving",
	"Attending Charity Events",
	"Great friend",
	"Forgiving",
	"Adopted Cat from a Shelter",
	"Helped family with daily chores",
	"Offered elderly person a seat in bus",
	"Offered elderly person to carry their bags",
	"Paid the person behind at the drive-through",
	"Hold the door for someone behind",
	"Volunteer in a local soup kitchen",
	"Foster animals",
	"Visiting a nursing home to chat with residents",
	"Leaving tips at a restaurants",
	"Often smiles and gives compliments",
	"Helped a neighbor with a lawnmower",
	"Fixed TV for a old lady",
	"Bought bag of groceries and donated it to a food bank",
	"Donated used clothes to a charity",
	"Cooked nutricious breakfast for a sick friend",
	"Volunteer babysitter",
	"Helped a friend in need",
	"Planted a tree",
	"Performed magic tricks at children hospital",
	"Played music in nursing home",
	"Donated stuffed toys to charity organisation",
	"Environmentally conscious",
	"Blood donator",
	"Bone marrow donator",
	"Conserve energy",
	"Gave away old eyeglasses",
	"Recyling trash",
	"Turned the tap off when shaving",
	"Let a car in a traffic",
	"Complimented a stranger",
	"Organ donor",
	"Switched spots with someone behind in line",
	"Helped old man find something in a grocery store",
	"Left coupons behind in a supermarket",
	"Helped a neighbor with a lot of stuff when they've moved in",
	"Gave street cat some food",
	"Gave street dog snacks",
	"Found someone's wallet and gave it back",
	"Helped a friend wth homework in middleschool",
]
