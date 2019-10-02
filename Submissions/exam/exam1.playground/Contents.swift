import UIKit

class Transformer {
    var name = ""
    var team = ""
    var strength = 0
    var intelligence = 0
    var speed = 0
    var endurance = 0
    var rank = 0
    var courage = 0
    var firepower = 0
    var skill = 0
    
    init(_ name: String, _ team: String, _ strength: Int, _ intelligence: Int, _ speed: Int, _ endurance: Int, _ rank: Int, _ courage: Int, _ firepower: Int, _ skill: Int){
        self.name = name
        self.team = team
        self.strength = strength
        self.intelligence = intelligence
        self.speed = speed
        self.endurance = endurance
        self.rank = rank
        self.courage = courage
        self.firepower = firepower
        self.skill = skill
    }
}

class Autobot {
    var members = [Transformer]()
    init(_ members: [Transformer]){
        self.members = members
    }
}

class Decepticon {
    var members = [Transformer]()
    init(_ members: [Transformer]){
        self.members = members
    }
}


func sorteByRank(_ transformers: [Transformer]) -> [Transformer] {
    var sortedByRank = [Transformer]()
    var rankDict = [String:Int]()
    
    for i in transformers {
        rankDict[i.name] = i.rank
    }
    
    let sortedRankDict = rankDict.sorted { $1.value < $0.value }
    
    for k in sortedRankDict {
        for l in transformers {
            if k.key == l.name {
                sortedByRank.append(Transformer(l.name, l.team, l.strength, l.intelligence, l.speed, l.endurance, l.rank, l.courage, l.firepower, l.skill))
            }
        }
    }
    
    return sortedByRank
}

func calculateOverallRating(_ transformer: Transformer) -> Int {
    let overallRating = transformer.strength +
                        transformer.intelligence +
                        transformer.speed +
                        transformer.endurance +
                        transformer.firepower
    return overallRating
}

func removeWeakers(_ autobot: Autobot, _ decepticon: Decepticon) -> [Transformer] {
    var membersCnt = 0
    var overallRatingDict = [String:Int]()
    var surviovors = [Transformer]()
    
    
    if autobot.members.count > decepticon.members.count {
        while membersCnt < autobot.members.count {
            overallRatingDict[autobot.members[membersCnt].name] = calculateOverallRating(autobot.members[membersCnt])
            membersCnt += 1
        }
        
        // Weak order
        let sortedByOverallRatingDict = overallRatingDict.sorted { $0.value < $1.value }
        var weakernum = autobot.members.count - decepticon.members.count
        
        var weakerCnt = 0
        while weakernum > 0{
            for m in autobot.members {
                if m.name == sortedByOverallRatingDict[weakerCnt].key {
                    surviovors.append(autobot.members[weakerCnt])
                    autobot.members.remove(at: weakerCnt)
                    weakerCnt += 1
                }
                weakernum -= 1
            }
        }
    } else if autobot.members.count < decepticon.members.count {
        while membersCnt < decepticon.members.count {
            overallRatingDict[decepticon.members[membersCnt].name] = calculateOverallRating(decepticon.members[membersCnt])
            membersCnt += 1
        }
        
        // Weak order
        let sortedByOverallRatingDict = overallRatingDict.sorted { $0.value < $1.value }
        
        var weakernum = decepticon.members.count - autobot.members.count
        
        while weakernum > 0{
            for m in decepticon.members {
                if m.name == sortedByOverallRatingDict[weakernum - 1].key {
                    surviovors.append(decepticon.members[weakernum - 1])
                    decepticon.members.remove(at: weakernum - 1)
                }
                weakernum -= 1
            }
        }
    }
    
    return surviovors
}

func battle(_ autobot: Autobot, _ decepticon: Decepticon) {
    var battlesCnt = 0
    var surviovors = [Transformer]()
    

    var winnersOfAutobot = [Transformer]()
    var winnersOfdecepticon = [Transformer]()
    
    var tempcnt = 1
    
    // remove weakers
    surviovors = removeWeakers(autobot, decepticon)
    
    // bosses check
    var bosscheckcnt = 0
    
    while bosscheckcnt < autobot.members.count - 1 {
        if autobot.members[bosscheckcnt].name == "Optimus Prime" && decepticon.members[bosscheckcnt].name == "Predaking" {
            print("This battle ended because Optimus Prime and Predaking engaged")
        } else {
            if autobot.members[bosscheckcnt].name == "Optimus Prime" {
                winnersOfAutobot.append(autobot.members[bosscheckcnt])
                autobot.members.remove(at: bosscheckcnt)
                decepticon.members.remove(at: bosscheckcnt)
            }
            bosscheckcnt += 1

            if decepticon.members[bosscheckcnt].name == "Predaking" {
                winnersOfdecepticon.append(decepticon.members[bosscheckcnt])
                decepticon.members.remove(at: bosscheckcnt)
                autobot.members.remove(at: bosscheckcnt)
            }
        }
        bosscheckcnt += 1
    }
    
    
    
    let cnt = autobot.members.count
    
    func checkPointsDifference(_ oneOfAutobot: Transformer, _ oneOfdecepticon: Transformer) -> [Int] {
        var courageMargin = 0
        var strengthMargin = 0
        var skillMargin = 0
        
        // 1 means autobot, 2 means decepticon in winner
        var winner1 = 0
        var winner2 = 0
        var winner3 = 0
        
        if autobot.members[battlesCnt].courage > decepticon.members[battlesCnt].courage {
            courageMargin = autobot.members[battlesCnt].courage - decepticon.members[battlesCnt].courage
            winner1 = 1 
            
        } else if autobot.members[battlesCnt].courage < decepticon.members[battlesCnt].courage {
            courageMargin = decepticon.members[battlesCnt].courage - autobot.members[battlesCnt].courage
            winner1 = 2
        } else {
            courageMargin = 0
        }
        
        if autobot.members[battlesCnt].strength > decepticon.members[battlesCnt].strength {
            strengthMargin = autobot.members[battlesCnt].strength - decepticon.members[battlesCnt].strength
            winner2 = 1
            
        } else if autobot.members[battlesCnt].strength < decepticon.members[battlesCnt].strength {
            strengthMargin = decepticon.members[battlesCnt].strength - autobot.members[battlesCnt].strength
            winner2 = 2
        } else {
            strengthMargin = 0
        }
        
        if autobot.members[battlesCnt].skill > decepticon.members[battlesCnt].skill {
            skillMargin = autobot.members[battlesCnt].skill - decepticon.members[battlesCnt].skill
            winner3 = 1
            
        } else if autobot.members[battlesCnt].skill < decepticon.members[battlesCnt].skill {
            skillMargin = decepticon.members[battlesCnt].skill - autobot.members[battlesCnt].skill
            winner3 = 2
            
        } else {
            skillMargin = 0
        }
        return [courageMargin, strengthMargin, skillMargin, winner1, winner2, winner3]
    }
    
    while battlesCnt < cnt {
        
        var cpd = checkPointsDifference(autobot.members[battlesCnt], decepticon.members[battlesCnt])
        
        if cpd[0] > 4 && cpd[1] > 3 {
            if cpd[3] == cpd[4] {
                if cpd[3] == 1 { // 1 means autobot
                    winnersOfAutobot.append(autobot.members[battlesCnt])
                } else if cpd[3] == 2 { //  2 means decepticon
                    winnersOfdecepticon.append(decepticon.members[battlesCnt])
                }
            }
            
        } else if cpd[2] > 3 {
            if cpd[5] == 1 { // 1 means autobot
                winnersOfAutobot.append(autobot.members[battlesCnt])
            } else if cpd[5] == 2 { //  2 means decepticon
                winnersOfdecepticon.append(decepticon.members[battlesCnt])
            }
            
        } else {
            if calculateOverallRating(autobot.members[battlesCnt]) < calculateOverallRating(decepticon.members[battlesCnt]) {
                winnersOfdecepticon.append(decepticon.members[battlesCnt])
            } else if calculateOverallRating(autobot.members[battlesCnt]) > calculateOverallRating(decepticon.members[battlesCnt]) {
                winnersOfAutobot.append(autobot.members[battlesCnt])
            }
        }
        battlesCnt += 1
    }
    
    if autobot.members.count > decepticon.members.count {
        print("\(battlesCnt) battles \nWiner(Autobot team): ", terminator: "")
        for n in winnersOfAutobot{
            if tempcnt < winnersOfAutobot.count {
                tempcnt += 1
                print("\(n.name)", terminator: ", ")
            } else {
                print("\(n.name)")
            }
        }
        tempcnt = 0
        
        print("Surviovors from the losing team(decepticon team):", terminator: "")
        for o in surviovors{
            if tempcnt < surviovors.count {
                print(o.name, terminator: ", ")
            } else {
                print(o.name)
            }
        }
        
    } else {
        print("\(battlesCnt) battles \nWiner(decepticon team): ", terminator: "")
        for p in winnersOfdecepticon{
            if tempcnt < winnersOfdecepticon.count {
                tempcnt += 1
                print("\(p.name)", terminator: ", ")
            } else {
                print("\(p.name)")
            }
        }
        tempcnt = 0
        
        print("Surviovors from the losing team(Autobot):", terminator: "")
        for q in surviovors{
            if tempcnt < surviovors.count {
                print(q.name, terminator: ", ")
            } else {
                print(q.name)
            }
        }
    }
    
}


let A1 = Transformer("aaaaa1", "Autobot", 9,4,7,8,8,6,2,6)
let A2 = Transformer("aaaaa2", "Autobot", 1,2,1,7,6,2,1,4)
let A3 = Transformer("aaaaa3", "Autobot", 5,4,1,3,5,7,4,1)
let A4 = Transformer("aaaaa4", "Autobot", 5,2,8,9,1,3,1,1)
let A5 = Transformer("aaaaa5", "Autobot", 2,7,3,8,5,3,8,4)
let A6 = Transformer("aaaaa6", "Autobot", 1,2,1,1,2,1,2,3)
let A7 = Transformer("aaaaa7", "Autobot", 1,3,2,1,2,3,1,2)

let D1 = Transformer("ddddd1", "decepticon", 2,1,6,3,4,2,5,1)
let D2 = Transformer("ddddd2", "decepticon", 5,1,4,6,5,3,1,4)
let D3 = Transformer("ddddd3", "decepticon", 1,4,5,7,3,5,8,3)
let D4 = Transformer("ddddd4", "decepticon", 5,8,2,4,1,2,1,2)
let D5 = Transformer("ddddd5", "decepticon", 10,1,10,1,1,1,10,1)
//let D6 = Transformer("ddddd6", "decepticon", 1,2,1,1,2,1,2,3)
//let D7 = Transformer("ddddd7", "decepticon", 1,3,2,1,2,3,1,2)

var autobot = Autobot([A1,A2,A3,A4,A5,A6,A7])
var decepticon = Decepticon([D1,D2,D3,D4,D5])

sorteByRank(autobot.members)
sorteByRank(decepticon.members)

battle(autobot, decepticon)
