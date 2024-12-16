//
//  LinkedListTests.swift
//  DSAFun
//
//  Created by Andrew McLean on 12/15/24.
//

import XCTest
@testable import DSAFun

final class LinkedListTests: XCTestCase {

    func testInitializersAndLength() throws {
		let emptyList: LinkedList<Int> = .init()
		XCTAssertNil(emptyList.head)
		XCTAssertEqual(emptyList.length(), 0)

		let listWithValues: LinkedList<Int> = .init(values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
		XCTAssertNotNil(listWithValues.head)
		XCTAssertEqual(listWithValues.length(), 11)
		print(listWithValues.description)
    }

	func testAppend() throws {
		let list: LinkedList<Int> = .init(headValue: 1)
		XCTAssertEqual(list.length(), 1)

		list.append(2)
		XCTAssertEqual(list.length(), 2)

		list.append(3)
		XCTAssertEqual(list.length(), 3)

		XCTAssertEqual(list.getValues(), [1, 2, 3])
	}

	func testPrependEmpty() throws {
		let list: LinkedList<Int> = .init()

		list.prepend(1)

		XCTAssertEqual(list.length(), 1)
		XCTAssertEqual(list.head?.value, 1)
	}

	func testPrependNonEmpty() throws {
		let list: LinkedList<Int> = .init(values: [2, 3, 4])

		list.prepend(1)

		XCTAssertEqual(list.length(), 4)
		XCTAssertEqual(list.head?.value, 1)
		XCTAssertEqual(list.getValues(), [1, 2, 3, 4])
	}

	func testInsertEmpty() throws {
		let list: LinkedList<Int> = .init()

		XCTAssertTrue(list.insert(1, atIndex: 0))
		XCTAssertEqual(list.length(), 1)
		XCTAssertEqual(list.head?.value, 1)
	}

	func testInsertMiddle() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 4, 5])

		XCTAssertTrue(list.insert(3, atIndex: 2))
		XCTAssertEqual(list.getValues(), [1, 2, 3, 4, 5])
	}

	func testInsertEnd() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 5])

		XCTAssertTrue(list.insert(4, atIndex: 3))
		XCTAssertEqual(list.getValues(), [1, 2, 3, 4, 5])
	}

	func testInsertOutOfBounds() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4])

		XCTAssertFalse(list.insert(4, atIndex: 4))
		XCTAssertEqual(list.getValues(), [1, 2, 3, 4])
	}

	func testRemoveFirst() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.removeFirst()

		XCTAssertEqual(list.getValues(), [2, 3, 4, 5])
	}

	func testRemoveFirstIndex() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.remove(at: 0)

		XCTAssertEqual(list.getValues(), [2, 3, 4, 5])
	}

	func testRemoveLast() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.removeLast()

		XCTAssertEqual(list.getValues(), [1, 2, 3, 4])
	}

	func testRemoveAt() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.remove(at: 2)

		XCTAssertEqual(list.getValues(), [1, 2, 4, 5])
	}

	func testRemoveLastIndex() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.remove(at: 4)

		XCTAssertEqual(list.getValues(), [1, 2, 3, 4])
	}

	func testRemoveOutOfBounds() throws {
		let list: LinkedList<Int> = .init(values: [1, 2, 3, 4, 5])

		list.remove(at: 8)

		XCTAssertEqual(list.getValues(), [1, 2, 3, 4, 5])
	}

	func testReverse() {
		let values: [Int] = [1, 2, 3, 4, 5]
		let reversedValues: [Int] = [5, 4, 3, 2, 1]

		let list: LinkedList<Int> = .init(values: values)

		list.reverse()

		XCTAssertEqual(list.getValues(), reversedValues)
	}

	func testIntersection() {
		let shared: LinkedList<Int> = .init(values: [123,5,6])
		guard let sharedHead = shared.head else {
			XCTFail()
			return
		}

		let listA: LinkedList<Int> = .init(values: [0,1,2,3])
		listA.append(node: sharedHead)

		let listB: LinkedList<Int> = .init(values: [10,11,12,13,14])
		listB.append(node: sharedHead)

		XCTAssertEqual(listA.intersectionValue(with: listB), 123)
	}

}
