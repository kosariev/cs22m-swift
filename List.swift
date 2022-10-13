import Foundation

struct List {
    private var start: Node?
    private weak var end: Node?

    private class Node {
        var value: Int
        var next: Node?

        init(value: Int, next: List.Node? = nil) {
            self.value = value
            self.next = next
        }

        func copy() -> Node? {
            .init(value: value, next: next?.copy())
        }
    }

    mutating func append(_ value: Int) {
        copyIfNeeded()
        if let end {
            let node = Node(value: value)
            end.next = node
            self.end = end.next
        } else {
            let node = Node(value: value)
            start = node
            end = node
        }
    }

    func printList() {
        var node = start
        while let current = node {
            print(current.value)
            node = current.next
        }
    }

    private mutating func copyIfNeeded() {
        if start == nil || isKnownUniquelyReferenced(&start) {
            return
        }

        print("Copied")
        start = start?.copy()

        var current = start
        while let node = current {
            end = node
            current = current?.next
        }
    }
}
