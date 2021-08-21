class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var item: [Int] = []
        var ans: [[Int]] = []
        func search(_ i: Int) {
            if item.count == k {
                ans.append(item)
                return
            } else if item.count + n - i + 1 < k {
                return
            }
            item.append(i)
            search(i + 1)
            item.removeLast()
            search(i + 1)
        }
        search(1)
        return ans
    }
}
