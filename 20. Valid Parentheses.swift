class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []
        for char in s {
            if char == ")" {
                if let comp = stack.popLast(), comp == "(" {
                    continue
                } else {
                    return false
                }
            } else if char == "]" {
                if let comp = stack.popLast(), comp == "[" {
                    continue
                } else {
                    return false
                }
            } else if char == "}" {
                if let comp = stack.popLast(), comp == "{" {
                    continue
                } else {
                    return false
                }
            } else {
                stack.append("\(char)")
            }
        }
        return stack.isEmpty
    }
}
