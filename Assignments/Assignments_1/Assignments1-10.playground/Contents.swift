//problem10


func grade(_ name:String,_ grade1:Double,_ grade2:Double,_ grade3:Double,_ grade4:Double,_ grade5:Double) -> (String,Double){
    let average:Double = (grade1+grade2+grade3+grade4+grade5)/5
    return (name,average)
}

func FindTop(_ student:[(String,Double)]){
    
    var index = 0
    var max_index = 0;
    while index < student.count-1{
        if student[max_index].1 > student[index+1].1{
            
        }else{
            max_index = index+1
        }
        index += 1
    }
    print(student[max_index])
    
}

let student_A=grade("Alex",75,84,85,70,80)
let student_B=grade("Barbra",80,90,70,84,100)
let student_C=grade("Cindy",77,100,67,95,80)
let Student = [student_A,student_B,student_C]

FindTop(Student)

