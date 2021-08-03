class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let cacheMax = 200005
        let cacheOffset = 100000
        guard nums.count >= 3 else { return [] }
        var arr: [[Int]] = []
        let sorted = nums.sorted()
        var cache: [Int] = Array(repeating: 0, count: cacheMax)
        var temp: [[Bool]] = Array(repeating: Array(repeating: false, count: 3000), count: 3000)

        for num in sorted {
            cache[num+cacheOffset] += 1
        }

        func next(_ index: Int, _ forward: Bool) -> Int {
            let c = sorted[index]
            var i = forward ? index + 1 : index - 1
            while i >= 0 && i < sorted.count {
                if sorted[i] != c {
                    break
                }
                i = forward ? i + 1 : i - 1
            }
            return i
        }

        func search(_ head: Int, _ tail: Int) {
            if tail - head < 2 {
                return
            }
            if temp[head][tail] {
                return
            }

            temp[head][tail] = true

            let a = sorted[head]
            let b = sorted[tail]
            let c = -(a + b)
            if a == 0 && b == 0 && c == 0 {
                if cache[0+cacheOffset] >= 3 {
                    if !arr.contains([0, 0, 0]) {
                        arr.append([0, 0, 0])
                    }
                }
                return
            } else {
                if c < a {
                    search(head, next(tail, false))
                    return
                } else if c > b {
                    search(next(head, true), tail)
                    return
                }
                if (c == a || c == b) {
                    if cache[c+cacheOffset] >= 2 {
                        arr.append([a, c, b])
                    }
                } else if cache[c+cacheOffset] >= 1 {
                    arr.append([a, c, b])
                }
                search(next(head, true), tail)
                search(head, next(tail, false))
            }
        }

        search(0, sorted.count-1)
        return arr
    }
}
