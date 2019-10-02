import UIKit

protocol RobotInfo {
    var name: String { get }
    var team: String { get }
    var strength: Int { get }
    var intelligence: Int { get }
    var speed: Int { get }
    var endurance: Int { get }
    var rank: Int { get }
    var courage: Int { get }
    var firepower: Int { get }
    var skill: Int { get }
    var overRating: Int { get }
}

struct Robot: RobotInfo {
    var name: String
    var team: String
    var strength: Int
    var intelligence: Int
    var speed: Int
    var endurance: Int
    var rank: Int
    var courage: Int
    var firepower: Int
    var skill: Int
    var overRating: Int {
        return self.strength + self.intelligence + self.speed + self.endurance + self.rank + self.courage + self.firepower + self.skill
    }

    init(name: String, team: String) {
        self.name = name
        self.team = team
        self.strength =  Robot.randomRank()
        self.intelligence = Robot.randomRank()
        self.speed = Robot.randomRank()
        self.endurance = Robot.randomRank()
        self.rank = Robot.randomRank()
        self.courage = Robot.randomRank()
        self.firepower = Robot.randomRank()
        self.skill = Robot.randomRank()
    }

    static func randomRank()->Int{
        return Int.random(in: 1...10)
    }
}

let specialRule: (Robot,Robot)->String = { (aRobot: Robot, dRobot: Robot)->String in
    let optimusPrime = "Optimus Prime"
    let predaking = "Predaking"
    
    if (aRobot.name == optimusPrime || aRobot.name == predaking) && (dRobot.name == optimusPrime || dRobot.name == predaking){
        return "E"
    }else if aRobot.name == optimusPrime || aRobot.name == predaking {
        return "A"
    } else if dRobot.name == optimusPrime || dRobot.name == predaking {
        return "D"
    }
    return "N"
}


let rule1: (Robot,Robot)->String = { (aRobot: Robot, dRobot: Robot)->String in
    
    if aRobot.courage >= dRobot.courage + 4 && aRobot.strength >= dRobot.strength  + 3  {
        return "A"
    } else if aRobot.courage + 4 <= dRobot.courage && aRobot.strength + 3 <= dRobot.strength {
        return "D"
    }
    return "N"
}

let rule2: (Robot,Robot)->String = { (aRobot: Robot, dRobot: Robot)->String in
    
    if aRobot.skill >= dRobot.skill + 3 {
        return "A"
    } else if aRobot.skill + 3 <= dRobot.skill {
        return "D"
    }
    return "N"
}

let rule3: (Robot,Robot)->String = { (aRobot: Robot, dRobot: Robot)->String in
    
    if aRobot.overRating > dRobot.overRating {
        return "A"
    } else if aRobot.overRating < dRobot.overRating {
        return "D"
    } else if aRobot.overRating == dRobot.overRating {
        return "BD"
    }
    return "N"
}

class Geme {
    
    var battles:Int
    var aRobots: (robots:[Robot],score:Int)
    var dRobots:(robots:[Robot],score:Int)
    var gameRules:[(Robot,Robot)->String]
    var destroyedFlg = false
    enum Result:String {
        case autobotWin = "A" , deceptionWin = "D", end = "E" ,next = "N", bothDestroyed = "BD"
    }
    
    func caculateScore(result:Result , rNum: Int) {
        switch result {
        case .autobotWin:
            aRobots.score += 1
            dRobots.robots[rNum].name = ""
        case .deceptionWin:
            dRobots.score += 1
            aRobots.robots[rNum].name = ""
        case .next:
            print("")
        case .end:
            destroyedFlg = true
        case .bothDestroyed:
            aRobots.robots[rNum].name = ""
            dRobots.robots[rNum].name = ""
        }
    }
    
    init(aRobots:[Robot],dRobots:[Robot]) {
        self.battles = 0
        self.aRobots = (aRobots,0)
        self.dRobots = (dRobots,0)
        self.gameRules = [specialRule,rule1,rule2,rule3]
    }
    
    func fight(){
        print("------------ Start to fight --------------------")
        // sort by rank
        aRobots.robots.sort { $1.rank < $0.rank }
        dRobots.robots.sort { $1.rank < $0.rank }
        
        // set count of battles
        if aRobots.0.count >= dRobots.0.count {
            battles = dRobots.0.count
        } else {
            battles = aRobots.0.count
        }
        
        // fight!!
        var i = 0
        while i <= battles - 1 && !destroyedFlg  {
            print("< Battle \(i + 1) >")
            print(aRobots.robots[i])
            print("VS")
            print(dRobots.robots[i])
            for rule in gameRules {
                if let result = Result(rawValue:rule(aRobots.robots[i], dRobots.robots[i])){
                    print(result)
                    caculateScore(result: result, rNum: i)
                    if result.rawValue != "N" {
                        break
                    }
                }
            }
            i += 1
        }
    }
    
    func printResult() {
        var aMembers = [String]()
        var dMembers = [String]()
        
        print("------------- Result ----------------")
        if destroyedFlg {
            print("The game was destryed!!!")
        } else {
            for member in aRobots.robots {
                if member.name != "" {
                    aMembers.append(member.name)
                }
            }

            for member in dRobots.robots {
                if member.name != "" {
                    dMembers.append(member.name)
                }
            }
            
            print("- \(battles) battles ")
            if aRobots.score > dRobots.score {
                print("<Survivers>")
                print("- Winning team(\(aRobots.robots[0].team)): \(aMembers) ")
                print("- Losing team (\(dRobots.robots[0].team)): \(dMembers) ")
            } else if aRobots.score < dRobots.score {
                print("<Survivers>")
                print("- Winning team(\(dRobots.robots[0].team)): \(dMembers) ")
                print("- Losing team (\(aRobots.robots[0].team)): \(aMembers) ")
            } else {
                print("\(battles) battles drow")
            }
        }
    }
}
// Create Robots for Autbot
print("[Autbot team]")
var autbot1 = Robot.init(name: "AFTERBURNER", team: "A")
var autbot2 = Robot.init(name: "BUMBLEBEE", team: "A")
var autbot3 = Robot.init(name: "GEARS", team: "A")
print(autbot1)
print(autbot2)
print(autbot3)
// Create Deception
print("[Deception team]")
var deception1 = Robot.init(name: "BATTLETRAP", team: "D")
var deception2 = Robot.init(name: "DEVASTATOR", team: "D")
var deception3 = Robot.init(name: "FANGRY", team: "D")
print(deception1)
print(deception2)
print(deception3)

let game1 = Geme(aRobots: [autbot1,autbot2,autbot3], dRobots: [deception1,deception2,deception3])
game1.fight()
game1.printResult()
