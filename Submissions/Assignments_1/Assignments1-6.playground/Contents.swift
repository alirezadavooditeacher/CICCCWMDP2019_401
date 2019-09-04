func swap(_ numA:inout Int,_ numB:inout Int)->(Int,Int){
    let tempA = numA
    numA = numB  //not include B
    numB = tempA //include A
    return (numA,numB)
}
var A = 5
var B = 6
print((A,B))
print(swap(&A,&B))
