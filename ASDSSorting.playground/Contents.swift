import UIKit

//MARK:  1. BUBBLE SORT
func bubbleSort(_ list: [Int] ) -> [Int] {
    var a = list
    for i in 0 ..<  a.count {
        for j in 0 ..<  a.count - i - 1 {
            if a[j] > a[j+1] {
                a.swapAt(j, j+1)
            }
        }
    }
    return a
 }

let sortedBubbledList = bubbleSort([-3232,200, 1212,0,1,2,4,-23233232,5,3,1,-1,23,11,54])
print("1. USING BUBBLE SORT: \(sortedBubbledList )")



//MARK: 2. SELECTION SORT (find smallest element location(Loc) and replace it with pass(i) )
func selectionSort(_ list: [Int] ) -> [Int] {
    var a = list
    for i in 0 ..<  a.count {
        // find smallest element location
        var loc = i
        var min = a[i]
        for j in i ..<  a.count {
            if a[j] < min {
                min = a[j]
                loc = j
            }
        }
        
        if loc != i {
            a.swapAt(loc, i)
        }
    }
    return a
 }
let sortedSelectionList = selectionSort([-3232,200, 1212,0,1,2,4,-23233232,5,3,1,-1,23,11,54])
print("2. USING SELECTION SORT: \(sortedSelectionList )")


//MARK: 3. INSERTION SORT (Check left side and minimum at the right place)
func insertionSort(_ list: [Int] ) -> [Int] {
    var a = list
    for i in 1 ..< a.count {
        var item = a[i]
        for j in 0 ..< i{
            if   item < a[j] {
                a.swapAt(i, j)
            }
        }
    }
    return a
 }
let sortedInsertionList = insertionSort([-3232,200, 1212,0,1,2,4,-23233232,5,3,1,-1,23,11,54])
print("3. USING INSERTION SORT: \(sortedInsertionList)")




//MARK: 4. MERGE SORT (DIVIDE/ CONCUR / COMBINE)
func mergSort(_ list: [Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }
    let mid = list.count / 2
    let left =    mergSort(Array(list[ 0 ..< mid]))
    let right =   mergSort(Array(list[ mid ..< list.count]))
    return  merge(left: left, right: right)
}

func merge(left:[Int], right:[Int]) -> [Int] {
    var l = 0
    var r = 0
    var result  = [Int]()
    while l < left.count && r < right.count  {
        let leftElement = left[l]
        let rightElement = right[r]
        if leftElement < rightElement {
            result.append(leftElement)
            l += 1
        } else if leftElement > rightElement  {
            result.append(rightElement)
            r += 1
        } else {
            result.append(leftElement)
            l += 1
            result.append(rightElement)
            r += 1
        }
    }
    // something left in left array
    while l < left.count  {
        result.append(left[l])
        l += 1
    }
    // something right in right array
    while r < right.count  {
        result.append(right[r])
        r += 1
    }
    return result
}
let sortedMergSort = mergSort([-3232,200, 1212,0,1,2,4,-23233232,5,3,1,-1,23,11,54])
print("4. USING MERGE SORT: \(sortedMergSort)")
