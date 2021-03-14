import Foundation
import TransferApp

public class TransferClientStub: TransferClient {
	
	var code:Int
	var message: String
	
	init(code: Int, message: String) {
		self.code = code
		self.message = message
	}
	
	public func transfer(request: Request) -> ClientResponse {
		return ClientResponse(code: self.code, message: self.message)
	}
}
