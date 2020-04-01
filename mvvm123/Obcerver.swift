
import Foundation


class Obcerver<T> {
    typealias Listener = (T) -> Void
    var next: Listener?
    
    var value : T {
        didSet {
            next?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(next: Listener?) {
        self.next = next
        next?(value)
    }
}
