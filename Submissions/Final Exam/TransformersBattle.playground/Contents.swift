import UIKit

class Transformer {
    let name: String
    let alliance: String
    let strength: Int
    let intelligence: Int
    let speed: Int
    let endurance: Int
    let rank: Int
    let courage: Int
    let firepower: Int
    let skill: Int

    var overallRating: Int {
        return strength + intelligence + speed + endurance + rank + courage + firepower + skill
    }

    init(name: String, alliance: String, s: Int, i: Int, sp: Int, endurance: Int, rank: Int, courage: Int, firepower: Int, skill: Int) {
        self.name = name
        self.alliance = alliance
        self.intelligence = i
        self.strength = s
        self.endurance = endurance
        self.rank = rank
        self.firepower = firepower
        self.courage = courage
        self.speed = sp
        self.skill = skill
    }
}

protocol BattleEssentials {
    var numOfFaceOffs: Int {get}
    var transformers: [Transformer] {get}
}

class Battle: BattleEssentials {
    var numOfFaceOffs: Int = 0
    var transformers: [Transformer]

    init(transformers: [Transformer]) {
        self.transformers = transformers
    }

    func sortTeams() -> ([Transformer], [Transformer]) {
        var autobotsArray = [Transformer]()
        var decepticonsArray = [Transformer]()
        for transformer in transformers {
            if transformer.alliance == "A" {
                autobotsArray.append(transformer)
            } else {
                decepticonsArray.append(transformer)
            }
        }
        return (autobotsArray, decepticonsArray)
    }

    func startFaceOffs(autobots: [Transformer], decepticons: [Transformer], predicate: (Transformer, Transformer) -> ([Transformer], [Transformer])) {
        var endgame = false
        var winners = [Transformer]()
        var battleSurvivors = [Transformer]()
        if autobots.count == decepticons.count { // Teams have the same quantity so doesn't really matter who are we iterating on the foor loop
            for i in 0...decepticons.count - 1 {
                let faceOffConclusion = predicate(autobots[i], decepticons[i])
//              print(faceOffConclusion.1.count)
                winners.append(faceOffConclusion.0[0])
                endgame = checkForBattlePower(tupleOffTransformers: faceOffConclusion)
                
                numOfFaceOffs += 1
            }
        } else if autobots.count < decepticons.count { // Autobots has less team members so we need to use them to iterate
            for i in 0...autobots.count - 1 {
                let faceOffConclusion = predicate(autobots[i], decepticons[i])
                winners.append(faceOffConclusion.0[0])
                
                endgame = checkForBattlePower(tupleOffTransformers: faceOffConclusion)
        
                numOfFaceOffs += 1
            }
            if let survivorDecepticon =  decepticons.last {
                battleSurvivors.append(survivorDecepticon)
            }
            
        } else if autobots.count > decepticons.count { // Decepticons has less team members so we need to use them to iterate
            for i in 0...decepticons.count - 1 {
                let faceOffConclusion = predicate(autobots[i], decepticons[i])
                winners.append(faceOffConclusion.0[0])
                
               endgame = checkForBattlePower(tupleOffTransformers: faceOffConclusion)
//              print(battleSurvivors)
                numOfFaceOffs += 1
            }
            if let autobotSurvivor = autobots.last {
                battleSurvivors.append(autobotSurvivor)
            }
        }
        
        if endgame {
            print("-------------------------------------")
            print("Battle is over! Everything is destroyed!")
        } else {
            print("-------------------------------------")
            print("Battles fought: \(numOfFaceOffs)")
            self.checkForWinningTeam(transformers: (winners, battleSurvivors))
        }
    }
    
    // Checks from an array of winners which team has most winners
    func checkForWinningTeam(transformers: ([Transformer], [Transformer])) {
        let winnersArray = transformers.0
        let survivors = transformers.1

        if howManyAutobots(transformers: winnersArray) == howManyDecepticons(transformers: winnersArray) {
            print("It's a tie!")
        } else if howManyAutobots(transformers: winnersArray) > howManyDecepticons(transformers: winnersArray) {
            print("The winning team are the Autobots:")
            for transformer in winnersArray {
                if isAutobot(transformer: transformer) {
                    print(transformer.name)
                }
            }
            print("Survivors from the losing team Decepticons:")

            print(howManyDecepticons(transformers: survivors))
            print("------------------------------------------")



            for transformer in survivors {
                    if isDecepticon(transformer: transformer) {
                        print(transformer.name)
                    }
            }
        } else if howManyAutobots(transformers: winnersArray) < howManyDecepticons(transformers: winnersArray) {
            print("The winning team are the Decepticons:")
            for transformer in winnersArray {
                if isDecepticon(transformer: transformer) {
                    print(transformer.name)
                }
            }
            print("Survivors from the losing team Autobots:")

            print(howManyAutobots(transformers: survivors))
            print("----------------------------------------")

            for transformer in survivors {
                if isAutobot(transformer: transformer) {
                    print(transformer.name)
                }
            }
        }
    }
}

func checkForBattlePower(tupleOffTransformers: ([Transformer], [Transformer])) -> Bool {
    var count = 0
    var end = false
    for transfomer in tupleOffTransformers.0 {
        if transfomer.name == "Optimus Prime" || transfomer.name == "Pedraking" {
            count += 1
        }
    }
    
    if count == 2 {
        end = true
    }
    
    return end

}

func isAutobot(transformer: Transformer) -> Bool { // Check wether robot is a Autobot
    if transformer.alliance == "A" {
        return true
    } else {
        return false
    }
}

func isDecepticon(transformer: Transformer) -> Bool { // Check wether robot is a Decepticon
    if transformer.alliance == "D" {
        return true
    } else {
        return false
    }
}

func howManyAutobots(transformers: [Transformer]) -> Int { // Count how many autobots are inside the array
    var counter = 0
    
    for transformer in transformers {
        if isAutobot(transformer: transformer) {
            counter += 1
        }
    }
    return counter
}

func howManyDecepticons(transformers: [Transformer]) -> Int { // Count how many decepticons are inside the array
    var counter = 0
    
    for transformer in transformers {
        if isDecepticon(transformer: transformer) {
            counter += 1
        }
    }
    return counter
}

// This predicate checks for all rulers and returns a winner and a looser.

let predicate = {(autobot: Transformer, decepticon: Transformer) -> ([Transformer], [Transformer]) in

    var winner = [Transformer]()
    var looser = [Transformer]()
    
    if autobot.name == "Optimus Prime" && decepticon.name == "Pedraking" {
        winner.append(autobot)
        winner.append(decepticon)
        print("Massive Explosion!")
    } else if autobot.name == "Optimus Prime" && decepticon.name != "Pedraking" {
        winner.append(autobot)
        looser.append(decepticon)
        print("\(autobot.name) won directly because he is OP!")
    } else if decepticon.name == "Pedraking" && autobot.name != "Optimus Prime" {
        winner.append(decepticon)
        looser.append(autobot)
        print("\(decepticon.name) won directly because he is OP!")
        
    } else if autobot.courage - decepticon.courage >= 4 && autobot.strength - decepticon.strength >= 3 {
        winner.append(autobot)
        looser.append(decepticon)
        print("\(autobot.name) won directly!")
        return (winner, looser)
        
    } else if decepticon.courage - autobot.courage >= 4 && decepticon.strength - autobot.strength >= 3 {
        winner.append(decepticon)
        looser.append(autobot)
        print("\(decepticon.name) won directly!")
        return (winner, looser)
        
    } else if autobot.skill - decepticon.skill >= 3 {
        winner.append(autobot)
        looser.append(decepticon)
        print("\(autobot.name) won! \(decepticon.name) was destroyed")
        return (winner, looser)
        
    } else if decepticon.skill - autobot.skill >= 3 {
        winner.append(decepticon)
        looser.append(autobot)
        print("\(decepticon.name) won! \(autobot.name) was destroyed!")
        return (winner, looser)
        
    } else if autobot.overallRating > decepticon.overallRating {
        winner.append(autobot)
        looser.append(decepticon)
        print("\(autobot.name) wins! \(decepticon.name) has being crushed!")
        return (winner, looser)
        
    } else if autobot.overallRating == decepticon.overallRating {
        looser.append(autobot)
        looser.append(decepticon)
        print("Both \(autobot.name) and \(decepticon.name) have being crushed!")
        return (winner, looser)
        
    } else if autobot.overallRating < decepticon.overallRating {
        winner.append(decepticon)
        looser.append(autobot)
        print("\(decepticon.name) wins! \(autobot.name) has being crushed!")
        return (winner, looser)
    }
    
    return (winner, looser)
}

//---------------------------


let rampage = Transformer(name: "Rampage", alliance: "D", s: 8, i: 3, sp: 5, endurance: 6, rank: 5, courage: 8, firepower: 9, skill: 6)
let bumblebee = Transformer(name: "Bumblebee", alliance: "A", s: 2, i: 8, sp: 4, endurance: 7, rank: 7, courage: 10, firepower: 1, skill: 7)
let megatron = Transformer(name: "Megatron", alliance: "D", s: 10, i: 10, sp: 4, endurance: 8, rank: 10, courage: 9, firepower: 10, skill: 9)
let jazz = Transformer(name: "Jazz", alliance: "A", s: 5 , i: 9, sp: 7, endurance: 7, rank: 8, courage: 9, firepower: 5, skill: 10)
let ironhide = Transformer(name: "Ironhide", alliance: "A", s: 8, i: 7, sp: 3, endurance: 9, rank: 7, courage: 10, firepower: 7, skill: 7)
let starscream = Transformer(name: "Starscream", alliance: "D", s: 7, i: 7, sp: 9, endurance: 7, rank: 5, courage: 8, firepower: 7, skill: 7)
let optimus = Transformer(name: "Optimus Prime", alliance: "A", s: 8, i: 3, sp: 8, endurance: 3, rank: 1, courage: 4, firepower: 5, skill: 7)

let pedra = Transformer(name: "Pedraking", alliance: "D", s: 7, i: 2, sp: 9, endurance: 5, rank: 1, courage: 3, firepower: 5, skill: 7)

let battle = Battle(transformers: [rampage, bumblebee, starscream, ironhide, megatron, jazz])
let battle2 = Battle(transformers: [pedra, optimus])

var autobots = battle.sortTeams().0
var decepticons = battle.sortTeams().1

var autobots2 = battle2.sortTeams().0
var decepticons2 = battle2.sortTeams().1


battle.startFaceOffs(autobots: autobots, decepticons: decepticons, predicate: predicate)

battle2.startFaceOffs(autobots: autobots2, decepticons: decepticons2, predicate: predicate)


