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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 1 else { return head }
        func reverse(_ head: ListNode?, _ k: Int, _ prev: ListNode?) -> ListNode? {
            var result = head
            var newHead: ListNode?
            var newPrev: ListNode? = nil

            // 计算第k个指针的位置
            func count(_ node: ListNode?) -> ListNode? {
                var iter = node
                var i = 0
                while iter != nil {
                    i += 1
                    if i == k {
                        return iter
                    }
                    iter = iter?.next
                }
                return nil
            }

            // 既然没有找到第k个，直接返回头指针
            guard let kThNode = count(head) else { return head }
            // 第k个指针一定是新表头
            result = kThNode
            // 既然是新表头，那么上一个指针的next就是它了
            prev?.next = kThNode
            newHead = kThNode.next
            
            newPrev = head

            // 下面来翻转指针
            var iter = head
            var target = kThNode.next

            for _ in 0..<k {
                let nextIter = iter?.next
                iter?.next = target
                target = iter
                iter = nextIter
            }

            reverse(newHead, k, newPrev)

            return result
        }

        return reverse(head, k, nil)
    }
}
