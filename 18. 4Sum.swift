class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }

        let sorted = nums.sorted()
        let count = sorted.count
        var result: [[Int]] = []
        var lastVi: Int? = nil
        var lastVj: Int? = nil
        var lastVk: Int? = nil
        var lastVl: Int? = nil

        for i in 0..<count {
            let vi = sorted[i]
            if vi == lastVi {
                continue
            }
            lastVi = vi
            lastVj = nil
            var remain = target - vi
            if remain < vi * 3 {
                break
            }
            for j in i+1..<count {
                let vj = sorted[j]
                if lastVj == vj {
                    continue
                }
                lastVk = nil
                remain = target - vi - vj
                if remain < vj * 2 {
                    break
                }
                for k in j+1..<count {
                    let vk = sorted[k]
                    if lastVk == vk {
                        continue
                    }
                    lastVl = nil
                    remain = target - vi - vj - vk
                    if remain < vk * 1 {
                        break
                    }
                    for l in k+1..<count {
                        let vl = sorted[l]
                        if lastVl == vl {
                            continue
                        }
                        remain = target - vi - vj - vk - vl
                        if remain == 0 {
                            if !result.contains([vi, vj, vk, vl]) {
                                result.append([vi, vj, vk, vl])
                            }
                        }
                    }
                }
            }
        }
        
        return result
    }
}
