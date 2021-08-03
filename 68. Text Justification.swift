class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var pre: [[String]] = []
        var item: [String] = []
        var itemLength = 0
        for i in 0..<words.count {
            let word = words[i]
            if itemLength + item.count + word.count > maxWidth {
                pre.append(item)
                item = []
                itemLength = 0
            } 

            item.append(word)
            itemLength += word.count
        }
        pre.append(item)
        var ans: [String] = []
        for i in 0..<pre.count {
            var str = ""
            let words = pre[i]
            var wordsLength = 0
            for j in 0..<words.count {
                wordsLength += words[j].count
            }
            var spaceSum = maxWidth - wordsLength
            var spaceSplit = spaceSum
            var spacer = 0
            if words.count > 1 {
                spaceSplit = spaceSum/(words.count-1)
                spacer = spaceSum % (words.count - 1)
            }
            for j in 0..<words.count {
                let word = words[j]
                str += word
                if i != pre.count - 1 {
                    if j != words.count - 1 {
                        if spaceSplit > 0 {
                            for _ in 0..<spaceSplit {
                                str += " "
                            }
                        }
                        spaceSum -= spaceSplit
                        if spacer > 0 {
                            spacer -= 1
                            spaceSum -= 1
                            str += " "
                        }
                    }
                } else {
                    if spaceSum > 0 {
                        str += " "
                        spaceSum -= 1
                    }
                }
            }
            if spaceSum > 0 {
                for _ in 0..<spaceSum {
                    str += " "
                }
            }
            ans.append(str)
        }

        return ans
    }
}
