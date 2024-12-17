//
//  BSTTests.swift
//  DSAFun
//
//  Created by Andrew McLean on 12/16/24.
//

import XCTest
@testable import DSAFun

fileprivate typealias Node = BinaryTreeNode

final class BinarySearchTreeTests: XCTestCase {

	func testIsValid1() {
		let root = Node(4)
		root.left = Node(2)
		root.right = Node(6)
		root.left?.left = Node(1)
		root.left?.right = Node(3)
		root.right?.left = Node(5)
		root.right?.right = Node(7)

		XCTAssertTrue(root.isBinarySearchTree())
	}

	func testIsNotValid1() {
		let root = Node(3)
		root.left = Node(2)
		root.right = Node(4)
		root.left?.left = Node(1)
		root.right?.left = Node(5)
		root.right?.right = Node(6)

		XCTAssertFalse(root.isBinarySearchTree())
	}

	func testIsNotValidDuplicate1() {
		let root = Node(3)
		root.left = Node(2)
		root.right = Node(5)
		root.left?.left = Node(1)
		root.right?.left = Node(6)
		root.right?.right = Node(1)

		XCTAssertFalse(root.isBinarySearchTree())
	}
}
