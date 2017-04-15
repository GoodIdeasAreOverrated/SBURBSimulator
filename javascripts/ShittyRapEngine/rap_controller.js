//stay fresh, don't repeat rhymes.
var player1Rhymes = [];
var player2Rhymes = [];

//would be so dope to rap about what's happened in the session.
//could read session summary?
//worry about this LATER, and definitely not in this stand alone page.
//for now, rap about your own interests.
window.onload = function() {
		var interest1 =  getRandomElementFromArray(interests);
		var interest2 =  getRandomElementFromArray(interests);
		rap(1,interest1);
		rap(2,interest2);
		rap(1,interest1);
		rap(2,interest2);

}

function rap(playerNum, interest){
	Math.seed =  getRandomSeed();

	var chosenRapTemplate = getRandomElementFromArray(rapTemplates);
	var firstWord = chosenRapTemplate.findWordBasedOnPart1AndInterest(interest)
	var firstWord = tryToUseRhyme(firstWord, playerNum);
	var secondWord = chosenRapTemplate.findWordBasedOnPart2AndInterestAndPart1Word(interest, firstWord)
	var secondWord = tryToUseRhyme(secondWord, playerNum);
	var str = rapInterjection() + ", " + chosenRapTemplate.part1;

	if(firstWord){
			str += firstWord;
			str += chosenRapTemplate.part2;
			if(secondWord){
				str += secondWord + ".";
			}else{
				str += rapMistake();
			}
	}else{
		str += rapMistake();
	}
	if(playerNum==1){
			rapper1Line(str);
	}else{
			rapper2Line(str);
	}

	if(firstWord && secondWord && firstWord != secondWord){
		if(playerNum==1){
				rap(1,interest); //keep going till you can't
				return;
		}else{
				rap(2,interest); //keep going till you can't.
				return;
		}
	}else{
		//give up
	}


	//TODO, KEEP GOING UNTIL HIT MAX LINES OR NO RHYME (HEY, THAT RHYMED)
	//give up if either word is null or if they match.
}



function tryToUseRhyme(rhyme, playerNum){
		var usedRhymes = player1Rhymes;
		if(playerNum == 2){
			usedRhymes = player2Rhymes;
		}
		if(usedRhymes.indexOf(rhyme) == -1){
		//	console.log("didnt find " + rhyme +" in");
	//		console.log(usedRhymes);
			usedRhymes.push(rhyme)
			return rhyme;
		}
		//the rhyme is not fresh.
		//console.log("found " + rhyme +" in");
		//console.log(usedRhymes);
		return null;
}
//red text
function rapper1Line(line){
	$("#rap").append("<font color='red'>"+line+"</font><br>")
}

//blue text
function rapper2Line(line){
	$("#rap").append("<font color='blue'>"+line+"</font><br>")
}
