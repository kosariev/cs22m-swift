enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree<T>, T, BinaryTree<T>)

    var count: Int {
        switch self {
            case let .node(left, _, right):
                return left.count + 1 + right.count
            case .empty:
                return 0
        }
    }

    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }

        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
    }

    mutating func naiveRemove(removeValue: T) {
        guard case .node(var left, let value, var right) = self else {
            return
        }

        if removeValue < value {
            left.naiveRemove(removeValue: removeValue)
        } else {
            right.naiveRemove(removeValue: removeValue)
        }
    }

    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
            case .empty:
                return .node(.empty, newValue, .empty)
            case let .node(left, value, right):
                if newValue < value {
                    return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
                } else {
                    return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
                }
        }
    }
    
    private func newTreeWithoutRemovedValue(removeValue: T) -> BinaryTree {
        switch self {
            case .empty:
                return .empty;
            case let .node(left, value, right):
                if removeValue == value {
                    return .empty
                }
                if removeValue < value {
                    return .node(left.newTreeWithoutRemovedValue(removeValue: removeValue), value, right)
                } else {
                    return .node(left, value, right.newTreeWithoutRemovedValue(removeValue: removeValue))
                }
        }
    }

    mutating func insert(newValue: T) {
        let ifExists = self.search(searchValue: newValue)
        if ifExists == nil {
            self = newTreeWithInsertedValue(newValue: newValue)
        }
    }
    
    mutating func remove(removeValue: T) {
        let ifExists = self.search(searchValue: removeValue)
        if ifExists != nil {
            self = newTreeWithoutRemovedValue(removeValue: removeValue)
        }
    }

    func walk(process: (T) -> ()) {
        switch self {
            case .empty:
                return
            case let .node(left, value, right):
                left.walk(process: process)
                process(value)
                right.walk(process: process)
        }
    }

    func search(searchValue: T) -> BinaryTree? {
        switch self {
            case .empty:
                return nil
            case let .node(left, value, right):
                if searchValue == value {
                    return self
                }
                if searchValue < value {
                    return left.search(searchValue: searchValue)
                } else {
                    return right.search(searchValue: searchValue)
                }
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
            case let .node(left, value, right):
                return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
            case .empty:
                return ""
        }
    }
}
