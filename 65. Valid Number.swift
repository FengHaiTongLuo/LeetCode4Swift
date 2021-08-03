class Solution {
    class State {
        var isRequireDigit = false
        var dotInput = false
        var isEInput = false
        var isSigned = false
        var isESigned = false
        var isNumberInput = false
        var isDotInput = false
    }

    func isNumber(_ s: String) -> Bool {
        let state = State()

        for c in s {
            switch c {
                case "+", "-" : 
                    if state.isSigned {
                        if state.isEInput {
                            if state.isESigned {
                                return false
                            } else {
                                state.isESigned = true
                                state.isRequireDigit = true
                                continue
                            }
                        }
                        return false
                    }
                    if state.isRequireDigit {
                        return false
                    }
                    state.isRequireDigit = true
                    state.isSigned = true
                case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" : 
                    state.isRequireDigit = false
                    state.isSigned = true
                    state.isNumberInput = true
                    if state.isEInput {
                        state.isESigned = true
                    }
                case "E", "e" :
                    if state.isRequireDigit {
                        return false
                    }
                    if state.isEInput {
                        return false
                    }
                    if !state.isSigned {
                        return false
                    }
                    state.isRequireDigit = true
                    state.isEInput = true
                case "." :
                    if state.isDotInput {
                        return false
                    }
                    if state.isRequireDigit && state.isNumberInput {
                        return false
                    }
                    if state.isEInput {
                        return false
                    }
                    if !state.isSigned {
                        state.isRequireDigit = true
                    }
                    state.isDotInput = true
                    state.isSigned = true
                default :
                    return false
            }
        }

        return !state.isRequireDigit && state.isSigned
    }
}
