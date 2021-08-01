class Solution {
    class Scope {
        var begin = 0
        var end = 0
        var center: Int { !valid ? -1 : (begin + end) / 2 }
        var valid: Bool { end > begin }
        var count: Int { end - begin }
        func moveRight() { begin = center }
        func moveLeft() { if valid { end = center } }
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        func findValueAtIndex(_ index: Int) -> Int {
            let scope1 = Scope()
            let scope2 = Scope()
            scope1.end = nums1.count
            scope2.end = nums2.count
            
            while scope1.valid || scope2.valid {
                let v1 = scope1.valid ? nums1[scope1.center] : Int.min
                let v2 = scope2.valid ? nums2[scope2.center] : Int.min
                let currentIndex = scope1.center + scope2.center + 1
                
                if v1 < v2 {
                    if currentIndex == index {
                        if scope1.valid && scope1.center + 1 < scope1.end && nums1[scope1.center+1] < nums2[scope2.center] {
                            scope2.moveLeft()
                        } else {
                            return nums2[scope2.center]
                        }
                    } else if currentIndex < index {
                        scope1.count <= 1 ? scope2.moveRight() : scope1.moveRight()
                    } else if currentIndex > index {
                        scope2.moveLeft()
                    }
                } else {
                    if currentIndex == index {
                        if scope2.valid && scope2.center + 1 < scope2.end && nums2[scope2.center+1] < nums1[scope1.center] {
                            scope1.moveLeft()
                        } else {
                            return nums1[scope1.center]
                        }
                    } else if currentIndex < index {
                        scope2.count <= 1 ? scope1.moveRight() : scope2.moveRight()
                    } else {
                        scope1.moveLeft()
                    }
                }
            }
            return 0
        }
        
        let c1 = nums1.count
        let c2 = nums2.count
        if (c1 + c2) % 2 == 0 {
            let i1 = (c1 + c2) / 2
            let i2 = i1 - 1
            let v1 = findValueAtIndex(i1)
            let v2 = findValueAtIndex(i2)
            return (Double(v1) + Double(v2)) / 2.0
        } else {
            let i = (c1 + c2) / 2
            let value = findValueAtIndex(i)
            return Double(value)
        }
    }
}
