class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        func recurse(_ lCount: Int = 0, _ stackCount: Int = 0, _ str: String = "") {
            if lCount == n && stackCount == 0 {
                result.append(str)
                return
            }

            if stackCount == 0 {
                recurse(lCount+1, stackCount+1, str+"(")
            } else {
                if lCount < n {
                    recurse(lCount+1, stackCount+1, str+"(")
                }
                recurse(lCount, stackCount-1, str+")")
            }
        }

        recurse()

        return result
    }
}
