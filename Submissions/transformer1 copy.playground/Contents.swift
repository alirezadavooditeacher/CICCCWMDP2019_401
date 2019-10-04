import UIKit

var str = "Hello, playground"

class transformer {
    var nameRobot:String
    var Strength:Int
    var Intelligence:Int
    var Speed:Int
    var Endurance:Int
    var Rank:Int
    var Courage:Int
    var Firepower:Int
    var Skill:Int
    var resultFight: Bool?
    
    
    var which:String
    
    var overallRating:Int {
        return Speed + Intelligence + Speed + Endurance + Firepower
    }
    
    init(nameRobot: String, strength:Int, intelligence: Int, speed:Int, endurance: Int, rank:Int, courage:Int, firepower:Int, skill:Int, which: String) {
        self.nameRobot = nameRobot
        self.Strength = strength
        self.Intelligence = intelligence
        self.Speed = speed
        self.Endurance = endurance
        self.Rank = rank
        self.Courage = courage
        self.Firepower = firepower
        self.Skill = skill
        self.which = which
    }
}

var a = "autobots"
var d = "Decetipcons"


// the instance of each transformers
let optimusPrime = transformer(nameRobot:"optimusPrime", strength: 10, intelligence: 10, speed: 8, endurance: 10, rank: 10, courage: 10, firepower: 8, skill: 10, which: a)
// the strongest
let predaking = transformer(nameRobot: "predaking", strength: 10, intelligence: 5, speed: 0, endurance: 8, rank: 7, courage: 9, firepower: 9, skill: 8, which: d)

let hubcup = transformer(nameRobot: "hubcup", strength: 3, intelligence: 9, speed: 4, endurance: 6, rank: 6, courage: 8, firepower: 1, skill: 9, which: a)

let Bluestreak = transformer(nameRobot: "Bluestreak", strength: 6, intelligence: 6, speed: 7, endurance: 9, rank: 5, courage: 2, firepower: 9, skill: 7, which: a)

let motorMaster = transformer(nameRobot: "motorMaster", strength: 9, intelligence: 6, speed: 5, endurance: 10, rank: 7, courage: 9, firepower: 7, skill: 4, which: d)

let blot = transformer(nameRobot: "blot", strength: 9, intelligence: 2, speed: 2, endurance: 10, rank: 4, courage: 10, firepower: 6, skill: 5, which: d)

let galvatron = transformer(nameRobot: "galavtron", strength: 10, intelligence: 9, speed: 9, endurance: 10, rank: 9, courage: 9, firepower: 9, skill: 10, which: d)

//let chase = transformer(nameRobot: "chase", strength: 4, intelligence: 6, speed: 6, endurance: 4, rank: 6, courage: 9, firepower: 1, skill: 8, which: a)

// transformers
let transformersArray:[transformer] = [optimusPrime, predaking, hubcup, Bluestreak, motorMaster, blot, galvatron]


// sorted by rank and team

func sortedAutobot(arr:[transformer]) -> [transformer] {
    var array = [transformer]()
    for value in arr {
        if value.which == a {
            array.append(value)
        }
    }
    
    let newArr = array.sorted(by: { (value1: transformer, value2: transformer) -> Bool in
        return value1.Rank > value2.Rank
    })
    return newArr
}



func sortedDecetipcons(arr:[transformer]) -> [transformer] {
    var array = [transformer]()
    for value in arr {
        if value.which == d {
            array.append(value)
        }
    }
    
    let newArr = array.sorted(by: { (value1: transformer, value2: transformer) -> Bool in
        return value1.Rank > value2.Rank
    })
    return newArr
}



let autobotsArray = sortedAutobot(arr: transformersArray)
let decepticonsArray = sortedDecetipcons(arr: transformersArray)


func numCanBattle(numA:Int, numB:Int)  -> Int {
    
    if numA > numB {
        return numB
    }
    else if numB < numA {
        return numA
    } else {
        return numA
    }
}

// how many battles we have
let battleNum = numCanBattle(numA: autobotsArray.count, numB: decepticonsArray.count)

// rules
func specialRule1(autobot: transformer, decepticon: transformer) -> Int {
    
    var autoWon = false
    var deceptipconWon = false
    
    if autobot.nameRobot == "optimusPrime" {
        autoWon = true
    }
    else if decepticon.nameRobot == "predaking" {
        deceptipconWon = true
    }
    
    // optimus prime won so autobot won
    if autoWon == true && deceptipconWon == false {
        return 1
    }
    // predaking won so decepticon won
    else if autoWon == false && deceptipconWon == true {
        return 2
        
    // destroyed each other
    }
    else if autoWon == true && deceptipconWon == true {
        return 3
    }
    
    // this rule doesn't meet
    return 4
}

func isOverRatedCourage(autobot: transformer, decepticon: transformer) -> Int {
    if autobot.Courage - decepticon.Courage >= 4 {
        return 1
    }
    else if decepticon.Courage - autobot.Courage >= 4{
        return 2
    }
    
    // this rule doesn't meet
    return 3
    
}
    
func isOverRatedSkill(autobot: transformer, decepticon: transformer) -> Int {
    if autobot.Skill - decepticon.Skill >= 3 {
        return 1
    }
    else if decepticon.Skill - autobot.Skill >= 3{
        return 2
    }
    // this rule doesn't meet
    return 3
}

func overAllRating(autobot: transformer, decepticon: transformer) -> Int {
    if autobot.overallRating > decepticon.overallRating {
        return 1
    } else if autobot.overallRating < decepticon.overallRating {
        return 2
    }
    return 3
}
    

// who's gonna be surviors?

var survivorA:[transformer]{
    var array = [transformer]()
    
    for index in  battleNum ..< autobotsArray.count{
        array.append(autobotsArray[index])
    }
    return array
}


var survivorD:[transformer]{
    var array = [transformer]()
    
    for index in  battleNum ..< decepticonsArray.count{
        array.append(decepticonsArray[index])
    }
    return array
}

for index in 0 ..< battleNum {
    
    print("NO. \(index)")
    
    print("\(autobotsArray[index].nameRobot) vs \(decepticonsArray[index].nameRobot)")
    
    if specialRule1(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 1 {
        print("optimusPrime won!")
        print("autobot won!")
        print("\(decepticonsArray[index].nameRobot) lost.")
        print()
        
        autobotsArray[index].resultFight = true
        decepticonsArray[index].resultFight = false
        
        continue
    }
    else if specialRule1(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 2 {
        print("predaking won!")
        print("decepticons won!")
        print("\(autobotsArray[index].nameRobot) lost.")
        print()
        
        autobotsArray[index].resultFight = false
        decepticonsArray[index].resultFight = true
        
        continue
    }
    else if specialRule1(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 3 {
        print("optimusPrime and predaking are destroyed.")
        
        autobotsArray[index].resultFight = false
        decepticonsArray[index].resultFight = false
        
        continue
    }
    
    if isOverRatedSkill(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 1 {
        print("autobot won!")
        print("\(decepticonsArray[index].nameRobot) lost.")
        
        autobotsArray[index].resultFight = true
        decepticonsArray[index].resultFight = false
        
        continue
        
    } else if isOverRatedSkill(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 2 {
        print("decepticons won!")
        print("\(autobotsArray[index].nameRobot) lost.")
        
        autobotsArray[index].resultFight = false
        decepticonsArray[index].resultFight = true
        
        continue
    }
    
    if overAllRating(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 1 {
        print("autobot won!")
        print("\(decepticonsArray[index].nameRobot) lost.")
        
        autobotsArray[index].resultFight = true
        decepticonsArray[index].resultFight = false
        
        continue
    }
    else if overAllRating(autobot: autobotsArray[index], decepticon: decepticonsArray[index]) == 2 {
        print("decepticons won!")
        print("\(autobotsArray[index].nameRobot) lost.")
        
        autobotsArray[index].resultFight = false
        decepticonsArray[index].resultFight = true
        continue
    }
    
}

print()

var numWonAutobot = 0
for value in autobotsArray{
    if value.resultFight == true {
        numWonAutobot += 1
    }
}


var numWonDecepticon = 0
for value in decepticonsArray{
    if value.resultFight == true {
        numWonDecepticon += 1
    }
}

if numWonAutobot > numWonDecepticon {
    print("Finally, autobot won!! congrats!")
    for value in survivorD {
        print("survivor: \(value.nameRobot)")
    }
}
else if numWonAutobot < numWonDecepticon {
    print("Finally, decepticon won!! congrats!")
    for value in survivorA {
        print("survivor: \(value.nameRobot)")
    }
}
