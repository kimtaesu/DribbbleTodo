import Foundation

func getThreadName() -> String {
    if Thread.isMainThread {
        return "main"
    } else {
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return "\(threadName)"
        } else if let queueName = currentQueueName(), !queueName.isEmpty {
            return "\(queueName)"
        } else {
            return String(format: "%p", Thread.current)
        }
    }
}

func currentQueueName() -> String? {
    let name = __dispatch_queue_get_label(nil)
    return String(cString: name, encoding: .utf8)
}
