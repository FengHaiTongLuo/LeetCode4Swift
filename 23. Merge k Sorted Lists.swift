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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        
        func merge(_ begin: Int, _ end: Int) -> ListNode? {
            if begin + 1 >= end {
                return begin + 1 == end ? lists[begin] : nil
            }

            let center = (end + begin) / 2
            var node1 = merge(begin, center)
            var node2 = merge(center, end)
            var iter: ListNode? = nil
            var head: ListNode? = nil

            func assign(_ node: ListNode?) -> ListNode? {
                if iter == nil {
                    head = node
                } else {
                    iter?.next = node
                }
                iter = node
                return node?.next
            }

            while node1 != nil || node2 != nil {
                if node1 == nil {
                    node2 = assign(node2)
                } else if node2 == nil {
                    node1 = assign(node1)
                } else {
                    if node1!.val < node2!.val {
                        node1 = assign(node1)
                    } else {
                        node2 = assign(node2)
                    }
                }
            } // while

            return head
        }

        return merge(0, lists.count)
    }
}
