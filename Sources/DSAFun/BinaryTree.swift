//
//  BinaryTree.swift
//  DSAFun
//
//  Created by Andrew McLean on 12/16/24.
//

import Foundation

public class BinaryTreeNode {
	public let key: Int
	public var left: BinaryTreeNode? = nil
	public var right: BinaryTreeNode? = nil

	init(_ key: Int) {
		self.key = key
	}

	public func isBinarySearchTree() -> Bool {
		return _isBST(
			node: self,
			min: nil,
			max: nil
		)
	}

	private func _isBST(node: BinaryTreeNode?, min: Int?, max: Int?) -> Bool {
		print("Comparing: \(node?.key) min: \(min) max: \(max)")

		// If its nil, then we hit the end of our branch, so yes it is.
		guard let node else { return true }

		// Check that the nodes value is less then the min value
		if let min = min, node.key <= min {
			print("min: \(min) key: \(node.key)")
			return false
		}

		// Check if max is > parent
		if let max = max, node.key >= max {
			print("min: \(min) key: \(node.key)")
			return false
		}

		// - When we check the left node:
		// - Pass the current (parent) node's key as the max value, as the left child's value should be less then this
		// - min will just pass through we're not comparing against this for left.
		let leftIsBST = _isBST(
			node: node.left,
			min: min,
			max: node.key
		)

		// - When we check the right node:
		// - Pass the current (parent) node's key as the min value. As the right child's should be greater than this.
		// - max will just pass through we're not companring against this for the right.
		let rightIsBST = _isBST(
			node: node.right,
			min: node.key,
			max: max
		)

		return leftIsBST && rightIsBST
	}

}
