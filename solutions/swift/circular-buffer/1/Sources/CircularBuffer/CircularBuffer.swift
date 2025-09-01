enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}

class CircularBuffer<T> {

    private var capacity: Int
    private var buffer: [T] = []

    var isFull: Bool {
        self.buffer.count >= self.capacity
    }

    init(capacity: Int) {
        self.capacity = capacity
        self.buffer.reserveCapacity(capacity)
    }

    func read() throws -> T {
        guard self.buffer.first != nil else { throw CircularBufferError.bufferEmpty }
        return self.buffer.removeFirst()
    }

    func write(_ value: T) throws {
        guard !self.isFull else { throw CircularBufferError.bufferFull }
        self.buffer.append(value)
    }

    func overwrite(_ value: T) {
        if isFull { self.buffer.removeFirst() }
        self.buffer.append(value)
    }

    func clear() {
        self.buffer.removeAll(keepingCapacity: true)
    }
}
