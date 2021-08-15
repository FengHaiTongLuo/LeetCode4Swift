// O(log(n))复杂度解法 1
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

// O(log(n))复杂度解法 2
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        struct RANGE {
            var begin = 0
            var end = 0
            var center = 0
            mutating func set(_ b: Int, _ e: Int, _ c: Int) {
                begin = b
                end = e
                center = c
            }
        }
        func cmp(_ a: Int, _ b: Int) -> Int {
            guard a != -1 && b != -1 else { return 0 }
            if nums1[a] >= nums2[b] {
                return b + 1 >= nums2.count || nums2[b+1] >= nums1[a] ? 0 : 1
            }
            return a + 1 >= nums1.count || nums1[a+1] >= nums2[b] ? 0 : -1
        }
        func mov(_ r1: inout RANGE, _ r2: inout RANGE, _ mv: Int) {
            r1.end = r1.center
            r1.center -= mv
            r2.begin = r2.center + 1
            r2.center += mv
        }
        func search() -> (Int, Int) {
            let n = (nums1.count + nums2.count) / 2 + 1
            if nums1.isEmpty {
                return (-1, n - 1)
            } else if nums2.isEmpty {
                return (n-1, -1)
            }
            var range1 = RANGE()
            var range2 = RANGE()
            if nums1.count < nums2.count {
                range1.set(0, nums1.count, nums1.count / 2)
                range2.set(0, nums2.count, n - 2 - range1.center)
            } else {
                range2.set(0, nums2.count, nums2.count / 2)
                range1.set(0, nums1.count, n - 2 - range2.center)
            }
            var t = cmp(range1.center, range2.center)
            while t != 0 {
                if t > 0 {
                    var mv = 0
                    if range1.center - range1.begin < range2.end - 1 - range2.center {
                        mv = (range1.center - range1.begin + 1) / 2
                    } else {
                        mv = (range2.end - range2.center) / 2
                    }
                    guard mv != 0 else { return (-1, n-1) }
                    mov(&range1, &range2, mv)
                } else {
                    var mv = 0
                    if range1.end - 1 - range1.center < range2.center - range2.begin {
                        mv = (range1.end - range1.center) / 2
                    } else {
                        mv = (range2.center - range2.begin + 1) / 2
                    }
                    if mv == 0 {
                        return (n-1, -1)
                    }
                    mov(&range2, &range1, mv)
                }
                t = cmp(range1.center, range2.center)
            }
            return (range1.center, range2.center)
        }
        func answer(_ s: (Int, Int)) -> Double {
            var m1 = Int(Int32.min)
            var m2 = Int(Int32.min)
            if (nums1.count + nums2.count) % 2 == 0 {
                if s.0 != -1 {
                    m1 = nums1[s.0]
                    if s.0 > 0 { m2 = nums1[s.0-1] }
                    if m2 > m1 { swap(&m1, &m2) }
                }
                if s.1 != -1 {
                    if nums2[s.1] > m2 { m2 = nums2[s.1] }
                    if m2 > m1 { swap(&m1, &m2) }
                    if s.1 > 0 && nums2[s.1-1] > m2 { m2 = nums2[s.1-1] }
                    if m2 > m1 { swap(&m1, &m2) }
                }
            } else {
                if s.0 != -1 { m1 = nums1[s.0] }
                if s.1 != -1 { m1 = max(m1, nums2[s.1]) }
                m2 = m1
            }
            return (Double(m1) + Double(m2)) / 2.0
        }
        let s = search()
        return answer(s)
    }
}
