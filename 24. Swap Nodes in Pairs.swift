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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }

        func swap(_ node: ListNode?, _ prev: ListNode?) -> ListNode? {
            guard node?.next != nil else { return nil }
            let next = node?.next
            let nextNext = next?.next
            next?.next = node
            node?.next = nextNext
            prev?.next = next
            return nextNext
        }

        let newHead = head?.next
        var iter = head
        var prev: ListNode? = nil
        while iter != nil {
            let newIter = swap(iter, prev)
            prev = iter
            iter = newIter
        }

        return newHead
    }
}
