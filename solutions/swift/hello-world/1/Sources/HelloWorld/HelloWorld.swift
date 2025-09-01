final class HelloWorld {

    class func hello(_ name: String? = nil) -> String {
        return "Hello, \(name ?? "World")!"
    }
}
