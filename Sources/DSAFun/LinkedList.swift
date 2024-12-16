//
//  LinkedList.swift
//  DSAFun
//
//  Created by Andrew McLean on 12/15/24.
//

import Foundation

public class Node<T : Equatable> : CustomStringConvertible {
	let value: T
	var next: Node<T>?

	init(value: T) {
		self.value = value
	}

	public var description: String {
		return "Node<\(T.self)>(\(self.value))"
	}
}

public class LinkedList<T : Equatable> {
	var head: Node<T>?

	init(headValue: T? = nil) {
		if let headValue {
			self.head = .init(value: headValue)
		}
	}

	init(values: [T]) {
		values.forEach { value in
			append(value)
		}
	}
	
	func getValues() -> [T] {
		if head == nil { return [] }

		var values: [T] = []
		var current = head

		while let node = current {
			values.append(node.value)
			current = node.next
		}

		return values
	}

	func length() -> Int {
		if head == nil { return 0 }

		var length: Int = 0
		var current: Node<T>? = head

		while let node = current {
			length += 1
			current = node.next
		}

		return length
	}
	
	func append(_ value: T) {
		guard let head else {
			head = Node(value: value)
			return
		}

		var current = head
		while let node = current.next {
			current = node
		}

		current.next = Node(value: value)
	}

	func append(node: Node<T>) {
		guard let head else {
			head = node
			return
		}

		var current = head
		while let node = current.next {
			current = node
		}

		current.next = node
	}

	func prepend(_ value: T) {
		// Create a new node
		let newNode = Node(value: value)

		// Set the newNode's next to the current head
		// This is fine if head nil, just means the list is empty
		newNode.next = head

		// Set head to the new node so its at the front.
		head = newNode
	}

	func insert(_ value: T, atIndex index: Int) -> Bool {
		if index == 0 {
			prepend(value)
			return true
		}

		if index >= length() {
			return false
		}

		let newNode = Node(value: value)
		var current = head

		for _ in 0..<index - 1 {
			current = current?.next
		}

		newNode.next = current?.next
		current?.next = newNode

		return true
	}

	func removeFirst() {
		head = head?.next
	}

	func removeLast() {
		// If head is also last
		if head?.next == nil {
			head = nil
		}

		var previousNode: Node<T>? = nil
		var nextNode = head?.next

		while let node = nextNode?.next {
			previousNode = nextNode
			nextNode = node
		}

		previousNode?.next = nil
	}

	func remove(at index: Int) {
		if index == 0 {
			removeFirst()
			return
		}

		var previous: Node<T>? = nil
		var current = head
		for _ in 0..<index {
			previous = current
			current = current?.next
		}

		previous?.next = current?.next
		current?.next = nil
	}

	func reverse() {
		// Track what will be the prev node
		var prev: Node<T>? = nil
		var current = head

		while let node = current {
			// Keep a reference to the next node in the list before mutating the node.next
			let nextNode = node.next

			// Swap the current node's next with the prev value
			node.next = prev

			// Set the prev value to current node
			prev = node

			// Just like we normally do, continue the loop
			current = nextNode
		}

		head = prev
	}

	func intersectionValue(with list: LinkedList<T>) -> T? {
		let m = self.length()
		let n = list.length()

		var currentA = self.head
		var currentB = list.head

		if n > m {
			let a = currentA
			currentA = currentB
			currentB = a
		}

		let differenceInLength = abs(m - n)

		for _ in 1...differenceInLength {
			currentA = currentA?.next
		}

		for _ in 0..<m-1 {
			if let valueA = currentA?.value,
			   let valueB = currentB?.value,
			   valueA == valueB {
				return valueA
			}
			currentA = currentA?.next
			currentB = currentB?.next
		}

		return nil
	}

}

extension LinkedList : CustomStringConvertible {

	public var description: String {
		var values: [String] = []
		var current = head
		while let node = current {
			values.append("\(node.value)")
			current = node.next
		}
		return values.joined(separator: " -> ")
	}

}
