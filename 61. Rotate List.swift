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
    func getTail(_ head: ListNode?) -> (ListNode?, Int) {
        var iter = head
        var count = 1
        while iter?.next != nil {
            iter = iter?.next
            count += 1
        }
        return (iter, count)
    }

    func moveRight(_ head: ListNode?) {
        var next = head?.next
        var prevVal = head!.val
        while next != nil {
            let temp = next!.val
            next!.val = prevVal
            prevVal = temp
            next = next!.next
        }
        head!.val = prevVal
    }

    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return nil }
        let info = getTail(head)
        let tail = info.0
        let count = info.1
        var step = k % count
        guard count > 1 else { return head }
        while step > 0 {
            moveRight(head)
            step -= 1
        }

        return head
    }
}
