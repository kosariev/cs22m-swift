import Foundation

////var list1 = List()
////
////list1.append(1)
////list1.append(2)
////list1.append(3)
////print("list1")
////list1.printList()
////
////var list2 = list1
////list2.append(10)
////list2.append(15)
////print("list2")
////list2.printList()
//
//
////print("Hello, World!")
////var arr = [1, 2, 3]
////print(arr[1])
//

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 5)
tree.insert(newValue: 9)
tree.insert(newValue: 3)

print(tree)
tree.walk { print($0) }
print("===")
tree.remove(removeValue: 3)

var tree2 = tree
tree2.insert(newValue: 41)
print(tree2)
tree2.walk { print($0) }

var element = tree.search(searchValue: 5)?.description
print("DONE")
