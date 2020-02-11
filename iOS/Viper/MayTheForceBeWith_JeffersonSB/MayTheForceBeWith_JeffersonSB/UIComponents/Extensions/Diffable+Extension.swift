import Foundation
import IGListKit

/**
 A diffable value type that can be used in conjunction with
 `DiffUtility` to perform a diff between two result sets.
 */
public protocol Diffable: Equatable {
    associatedtype DiffIdentifier
    /**
     Returns a key that uniquely identifies the object.

     - returns: A key that can be used to uniquely identify the object.

     - note: Two objects may share the same identifier, but are not equal.

     - warning: This value should never be mutated.
     */
    var diffIdentifier: DiffIdentifier { get }
}

public extension Diffable {
    func listDiffable() -> ListDiffable {
        return DiffableBox(value: self)
    }
}

public final class DiffableBox<T: Diffable>: ListDiffable {
    public let value: T

    public init(value: T) {
        self.value = value
    }

    // IGListDiffable
    public func diffIdentifier() -> NSObjectProtocol {
        guard let object = value.diffIdentifier as? NSObjectProtocol else {
            fatalError("diffIdentifier should support NSObjectProtocol")
        }
        return object
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let other = object as? DiffableBox<T> {
            return value == other.value
        }
        return false
    }
}
