class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        func search(_ low: Int, _ high: Int) -> [[Int]] {
            if low == high { return [[], [nums[low]]] }
            let subs = search(low + 1, high)
            return subs + subs.map { [nums[low]] + $0 }
        }
        return search(0, nums.count - 1)
    }
}
