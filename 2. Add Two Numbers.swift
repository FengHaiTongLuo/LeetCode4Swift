class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var b1 = l1
        var b2 = l2
        let sumNode = ListNode()
        var iter: ListNode? = nil
        var addNext = false
        while b1 != nil || b2 != nil {
            if iter == nil {
                iter = sumNode
            } else {
                let next = ListNode()
                iter?.next = next
                iter = next
            }
            var sum = (b1?.val ?? 0) + (b2?.val ?? 0) + (addNext ? 1 : 0)
            if sum >= 10 {
                sum = sum % 10
                addNext = true
            } else {
                addNext = false
            }
            iter?.val = sum
            b1 = b1?.next
            b2 = b2?.next
        }
        if addNext {
            let next = ListNode(1)
            iter?.next = next
            iter = next
        }
        return sumNode
    }
}
