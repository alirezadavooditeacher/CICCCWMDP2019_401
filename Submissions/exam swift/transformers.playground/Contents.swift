import UIKit

enum BotType:String {
    case decepticon = "Decepticon"
    case autobot = "Autobot"
}

enum Spec {
    case strength
    case intelligence
    case speed
    case endurance
    case rank
    case courage
    case firepower
    case skill
    func isOverall() -> Bool {
        switch self {
        case .strength:
            fallthrough
        case .intelligence:
            fallthrough
        case .speed:
            fallthrough
        case .endurance:
            fallthrough
        case .firepower:
            return true
        default:
            return false
        }
    }
}

struct Transformer {
    let name: String
    let type: BotType
    let specs: [Spec:Int]
    var winner: Bool?
    var overallRating: Int {
        var sum = 0
        for (spec, value) in specs {
            if spec.isOverall() {
                sum += value
            }
        }
        return sum
    }
    var overpower: Bool {
        return name == "Optimus Prime" || name == "Predaking"
    }
}

protocol BattleResult:AnyObject {
    func defineWinner(_ battle:Battle)
}

class Battle {
    var teams:[BotType:[Transformer]]
    weak var printer: BattleResult?
    
    var battles: Int {
        var minCount:Int?
        for (_, transformers) in teams {
            if minCount == nil || transformers.count < minCount! {
                minCount = transformers.count
            }
        }
        return minCount ?? 0
    }
    
    var winningTeam: BotType? {
        var deceptionWins = 0;
        var autobotWins = 0;
        for (team, transformers) in self.teams {
            for transformer in transformers {
                guard let win = transformer.winner else {
                    continue
                }
                
                if team == .decepticon && win {
                    deceptionWins += 1
                }
                if team == .autobot && win {
                    autobotWins += 1
                }
            }
        }
        
        if deceptionWins > autobotWins {
            return .decepticon
        } else if deceptionWins < autobotWins {
            return .autobot
        } else {
            return nil
        }
    }
    
    init(_ transformers: [(String, BotType, Int, Int, Int, Int, Int, Int, Int, Int)]) {
        var autobots = [Transformer]()
        var decepticons = [Transformer]()
        for (name, type, strength, intelligence, speed, endurance, rank, courage, firepower, skill) in transformers {
            let specs = [
                Spec.strength: strength,
                Spec.intelligence: intelligence,
                Spec.speed: speed,
                Spec.endurance: endurance,
                Spec.rank: rank,
                Spec.courage: courage,
                Spec.firepower: firepower,
                Spec.skill: skill
            ]
            let transformer = Transformer(name: name, type: type, specs: specs)
            if type == .autobot {
                autobots.append(transformer)
            } else {
                decepticons.append(transformer)
            }
        }
        self.teams = [BotType.autobot: autobots, BotType.decepticon: decepticons]
        self.sortTeamBots()
    }
    
    func sortTeamBots() {
        for (type, transformers) in self.teams {
            var arr = transformers
            for i in 1..<arr.count {
                var j = i
                while j > 0 && arr[j].specs[.rank]! > arr[j - 1].specs[.rank]! {
                    arr.swapAt(j - 1, j)
                    j -= 1
                }
            }
            self.teams[type] = arr
        }
    }
    func startBattle() {
        
        let rule1 = { (t1: Transformer, t2: Transformer) -> Bool in
            return t1.specs[.courage]! - t2.specs[.courage]! >= 4 && t1.specs[.strength]! - t2.specs[.strength]! >= 3
        }

        let rule2 = { (t1: Transformer, t2: Transformer) -> Bool in
            return t1.specs[.skill]! - t2.specs[.skill]! >= 3
        }
        
        let rule3 = { (t1: Transformer, t2: Transformer) -> Bool in
            return t1.overallRating > t2.overallRating
        }
        
        let rules = [rule1, rule2, rule3]
        
        func ruleChecker(_ t1: inout Transformer, _ t2: inout Transformer) {
            
            if t1.overpower {
                t1.winner = true
                t2.winner = false
                return
            } else if t2.overpower {
                t2.winner = true
                t1.winner = false
                return
            }
            
            for rule in rules {
                if rule(t1, t2) {
                    t1.winner = true
                    t2.winner = false
                    return
                } else if rule(t2, t1) {
                    t2.winner = true
                    t1.winner = false
                    return
                }
            }
            
            if t1.overallRating == t2.overallRating {
                t1.winner = false
                t2.winner = false
            }
        }
        
        var allDestroyed = false
        for i in 0..<self.battles {
            
            var t1 = self.teams[.autobot]![i]
            var t2 = self.teams[.decepticon]![i]
            
            if t1.overpower && t2.overpower {
                allDestroyed = true
                break
            }
            
            ruleChecker(&t1, &t2)
            
            self.teams[.autobot]![i] = t1
            self.teams[.decepticon]![i] = t2
        }
        
        if allDestroyed {
            print("All transformers were destroyed")
            
            for (team , transformers) in self.teams {
                var transformerList = [Transformer]()
                for transformer in transformers {
                    var t = transformer
                    t.winner = false
                    transformerList.append(t)
                }
                self.teams[team] = transformerList
            }
        }
        
        printer?.defineWinner(self)
    }
}

class Printer: BattleResult {
    func defineWinner(_ battle: Battle)  {
        if let winner = battle.winningTeam {
            let looser = winner == .autobot ? BotType.decepticon : BotType.autobot;
            var loosersName = [String]()
            for transformer in battle.teams[looser]! {
                if transformer.winner == true || transformer.winner == nil {
                    loosersName.append(transformer.name);
                }
            }
            print("Battles: \(battle.battles)")
            print("Winning Team: \(winner.rawValue)")
            if !loosersName.isEmpty {
                print("Survivors from the looser team: \(loosersName.joined(separator: ", "))")
            } else {
                print("The were no survivors")
            }
        } else {
            print("There is no winner")
        }
    }
}

var transformers = [
    ("Sideswipe", BotType.autobot, 7, 7, 7, 7, 5, 10, 3, 6),
    ("Optimus Prime", BotType.autobot, 10, 10, 8, 10, 10, 10, 8, 10),
    ("Bumblebee", BotType.autobot, 2, 8, 4, 7, 7, 10, 1, 7),
    ("GrimLock", BotType.autobot, 10, 7, 3, 10, 9, 10, 8, 10),
    ("Predaking", BotType.decepticon, 10, 5, 10, 8, 7, 9, 9, 8),
    ("Rampage", BotType.decepticon, 8, 3, 5, 6, 5, 8, 9, 6),
    ("Divebomb", BotType.decepticon, 7, 8, 6, 7, 6, 8, 7, 7)
]

let game = Battle(transformers)
let printer = Printer()
game.printer = printer
game.startBattle()
