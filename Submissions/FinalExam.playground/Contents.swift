import UIKit

var teamA_number = 0
var teamD_number = 0
struct Transformer:Equatable{
    var Name:String
    var Team:String
    var Strength:Int
    var Intelligence:Int
    var Speed:Int
    var Endurance:Int
    var Rank: Int
    var Courage:Int
    var Firepower:Int
    var Skill:Int
    var AllRating:Int{
        return Strength + Intelligence + Speed + Rank + Courage + Firepower + Skill
    }
}

var Ateam:[Transformer] = []
var Dteam:[Transformer] = []
var A_Winners:[Transformer] = []
var D_Winners:[Transformer] = []

class Rules{
    
    static func AorDTeam(Members:[Transformer])->([Transformer],[Transformer]){
        for member in Members{
            if member.Team == "A"{
                teamA_number += 1
                Ateam.append(member)
            }
            else if member.Team == "D"{
                teamD_number += 1
                Dteam.append(member)
            }
            else{
                print("Enter the wrong team name ")
            }
        }
        return (Ateam,Dteam)
    }
    
    static func rule1(A_member:Transformer,D_member:Transformer)-> Transformer?{
        if (A_member.Name == "Optimus Prime" || A_member.Name == "Predaking"){
            teamD_number -= 1
            A_Winners.append(A_member)
            Dteam.remove(at: Dteam.firstIndex(of:D_member)!)
            return A_member
        }
        else if (D_member.Name == "Optimus Prime" || D_member.Name == "Predaking"){
            teamA_number -= 1
            D_Winners.append(D_member)
            Ateam.remove(at: Ateam.firstIndex(of:A_member)!)
            return D_member
        }
        else if ((A_member.Courage - D_member.Courage) > 3) && ((A_member.Strength - D_member.Strength) > 2){
            teamD_number -= 1
            A_Winners.append(A_member)
            Dteam.remove(at: Dteam.firstIndex(of:D_member)!)
            return A_member
        }else if (A_member.Skill - D_member.Skill) > 2{
            teamD_number -= 1
            Dteam.remove(at: Dteam.firstIndex(of:D_member)!)
            A_Winners.append(A_member)
            return A_member
        }else if A_member.AllRating > D_member.AllRating{
            teamD_number -= 1
            Dteam.remove(at: Dteam.firstIndex(of:D_member)!)
            A_Winners.append(A_member)
            return A_member
        }else if A_member.AllRating == D_member.AllRating{
            teamA_number -= 1
            teamD_number -= 1
            Dteam.remove(at: Dteam.firstIndex(of:D_member)!)
            Ateam.remove(at: Ateam.firstIndex(of:A_member)!)
            return nil
        }else{
            teamA_number -= 1
            D_Winners.append(D_member)
            Ateam.remove(at: Ateam.firstIndex(of:A_member)!)
            return D_member
        }
    }
    static func Display(Members:[Transformer]){
        var (A,D):([Transformer],[Transformer]) = ([],[])
        var count = 0
        (A,D) = Rules.AorDTeam(Members: Members)
        
        if teamA_number < teamD_number{
            count = teamA_number
        }else{ count = teamD_number}
        
        for i in 0..<count{
            Rules.rule1(A_member:A[i],D_member:D[i])
        }
        
        if A_Winners.count > D_Winners.count{
            print("Winner team: Autobots")
        }else if A_Winners.count == D_Winners.count{
            print("This turn is a tie")
        }else{
            print("Winner team: Decepticons")
        }
        print("Survivors-D: \(Dteam)\nSurvivors-A: \(Ateam)")
    }
}


var battleMembers:[Transformer] = []
battleMembers.append(Transformer(Name: "Buzzsaw", Team: "D", Strength: 5, Intelligence: 8, Speed: 8, Endurance: 4, Rank: 6, Courage: 7, Firepower: 4, Skill: 9))
battleMembers.append(Transformer(Name: "Soundwave", Team: "D", Strength: 8, Intelligence: 9, Speed: 2, Endurance: 6, Rank: 7, Courage: 5, Firepower: 6, Skill: 10))
battleMembers.append(Transformer(Name: "Bluestreak", Team: "D", Strength: 6, Intelligence: 6, Speed: 7, Endurance: 9, Rank: 5, Courage: 2, Firepower: 9, Skill: 7))

battleMembers.append(Transformer(Name: "Optimus Prime", Team: "A", Strength: 3, Intelligence: 2, Speed: 1, Endurance: 2, Rank: 3, Courage: 2, Firepower: 3, Skill: 3))

battleMembers.append(Transformer(Name: "OutBack", Team: "A", Strength: 4, Intelligence: 5, Speed: 6, Endurance: 5, Rank: 4, Courage: 9, Firepower: 6, Skill: 5))
battleMembers.append(Transformer(Name: "Hubcap", Team: "A", Strength: 4, Intelligence: 4, Speed: 4, Endurance: 4, Rank: 4, Courage: 4, Firepower: 4, Skill: 4))

Rules.Display(Members: battleMembers)

