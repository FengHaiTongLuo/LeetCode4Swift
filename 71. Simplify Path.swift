class Solution {
    func simplifyPath(_ path: String) -> String {
        var dotCount = 0
        var pathStack: [String] = []
        var item = ""

        func handle(_ ch: Character) {
            switch ch {
            case "/" :
                if item == ".." {
                    if !pathStack.isEmpty {
                        pathStack.removeLast()
                    }
                } else if item != "." && !item.isEmpty {
                    pathStack.append(item)
                }
                item = ""
            default :
                item.append(ch)
            }
        }

        for ch in path {
            handle(ch)
        }
        handle("/")
        
        var res = "/"
        for item in pathStack {
            res += item + "/"
        }
        if res.count > 1 {
            res.removeLast()
        }
        return res
    }
}
