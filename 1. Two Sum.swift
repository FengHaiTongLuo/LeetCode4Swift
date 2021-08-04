// Solution 1.
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [-1, -1]
    }
}

// Solution 2.
class Solution {
    class Item {
        var index = 0
        var value = 0
    }
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var items = nums.map { i -> Item in
            let item = Item()
            item.value = i
            return item
        }

        for i in 0..<items.count {
            items[i].index = i
        }

        items.sort { $0.value < $1.value }

        var head = 0
        var tail = items.count - 1

        while head < tail {
            let sum = items[head].value + items[tail].value
            if sum > target {
                tail -= 1
            } else if sum < target {
                head += 1
            } else {
                return [items[head].index, items[tail].index]
            }
        }

        return []
    }
}
