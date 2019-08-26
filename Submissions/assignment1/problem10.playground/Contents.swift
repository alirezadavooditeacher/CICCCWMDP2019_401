import UIKit

/*
 Implement a function which receives a list of tuples. Each tuples represent the transcript
 of a student with 5 grades between 0 and 100. Each tuple also contains the name of the
 student. Example (“Ali”, 67, 87, 90, 45, 39). The function should return the name and the
 GPA of the top student.
 タプルのリストを受け取る関数を実装します。 各タプルはトランスクリプトを表します
     0〜100の5段階の学生の成績。各タプルには学生の名前も含まれます。 例（「アリ」、67、87、90、45、39）。 関数は、トップの生徒の名前とGPAを返す必要があります。
 
*/

func grades (_ student1: [Any], _ student2: [Any], _ student3: [Any], _ student4: [Any], _ student5: [Any]) -> String {
    let s1average = (student1[1] + student1[2] + student1[3] + student1[4]) / 5
    if average >= 100 && average <= 90 {
        
    }
    
    
}

let student1 = ("student1", 92, 96, 93, 95, 100)
let student2 = ("student2", 82, 86, 83, 85, 90)
let student3 = ("student3", 72, 76, 73, 75, 80)
let student4 = ("student4", 62, 66, 63, 65, 70)
let student5 = ("student5", 52, 56, 53, 55, 60)
grades(student1, student2, student3, student4, student5)





