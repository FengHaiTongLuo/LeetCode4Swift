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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 0
        var iter = head

        while iter != nil {
            count += 1
            iter = iter?.next
        }

        var i = 0
        iter = head
        var prev = head
        while iter != nil {
            if i == count - n {
                break
            }
            prev = iter
            iter = iter?.next
            i += 1
        }

        var newHead: ListNode? = i == 0 ? head?.next : head
        if i != 0 {
            prev?.next = iter?.next
        }

        iter?.next = nil

        return newHead
    }
}
