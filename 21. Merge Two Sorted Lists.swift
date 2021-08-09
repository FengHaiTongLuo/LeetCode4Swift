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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 ?? l2
        }

        var cur: ListNode? = nil
        var iter1 = l1
        var iter2 = l2
        var head: ListNode? = nil

        while iter1 != nil || iter2 != nil {
            if iter1 == nil {
                cur?.next = iter2
                break
            } else if iter2 == nil {
                cur?.next = iter1
                break
            } else if iter1!.val <= iter2!.val {
                if cur == nil {
                    cur = iter1
                    head = cur
                } else {
                    cur?.next = iter1
                    cur = iter1
                }
                iter1 = iter1?.next
            } else {
                if cur == nil {
                    cur = iter2
                    head = cur
                } else {
                    cur?.next = iter2
                    cur = iter2
                }
                iter2 = iter2?.next
            }
        }

        return head
    }
}
