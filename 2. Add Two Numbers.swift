/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 变量 b1 和 b2 存放 l1 和 l2 的链表移动指针
        var b1 = l1
        var b2 = l2

        // 变量 sumNode 存放相加之和的链表移动指针
        let sumNode = ListNode()

        // 变量 iter 存放相加之和的链表移动指针
        var iter: ListNode? = sumNode

        // 变量 addNext 存放是否相加后获得一个进位
        var addNext = false

        // b1 和 b2 初始化为 l1 和 l2 的首指针，进入循环
        while b1 != nil || b2 != nil || addNext {
            // b1 和 b2 指针相加，其中如果有任意一个指针为空，说明该指针前面没有数字了。
            // 没有数字的指针即可以当 0 处理。
            // 如果存在 addNext，说明上一轮数字相加有进位，那么要额外加一。
            var sum = (b1?.val ?? 0) + (b2?.val ?? 0) + (addNext ? 1 : 0)
            if sum >= 10 {
                // 相加结果大于等于 10 的时候，做进位处理，并且当前位保留个位数
                sum = sum % 10
                addNext = true
            } else {
                // 相加结果小于 10，则不做进位处理
                addNext = false
            }

            iter?.val = sum
            // 分别将 b1 和 b2 往前移动
            // 这里利用了`swift`语言的`optional`特性，其它语言就要做空指针判定
            b1 = b1?.next
            b2 = b2?.next

            // 当 b1 不为空 或者 b2 不为空 或者存在进位时，说明加数还有一位
            // iter往前移动
            if b1 != nil || b2 != nil || addNext {
                let next = ListNode()
                iter?.next = next
                iter = next
            }
        }
        
        return sumNode
    }
}
