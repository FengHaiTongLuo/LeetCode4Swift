class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        let array = digits.cString(using: .utf8)!
        let len = strlen(array)
        let zeroChar = "0".cString(using: .utf8)![0]
        let map: [String] = [
            "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"
        ]
        var result: [String] = []

        func search(_ i: Int = 0, _ str: String = "") {
            if i == len {
                result.append(str)
                return
            }
            let number = Int(array[i] - zeroChar)
            let text = map[number-1]
            for char in text {
                search(i + 1, str+"\(char)")
            }
        }

        search()

        return result
    }
}
