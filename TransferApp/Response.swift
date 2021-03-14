public class Response {
	var code: Int
	var message: String
	
	public init(code: Int, message: String) {
		self.code = code
		self.message = message
	}
	
	public func getCode() -> Int {
	return self.code
	}
}
