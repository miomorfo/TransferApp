import Foundation
public class Request {
	var ammount: Int
	var originAccount: String
	var destinationAccount: String
	
	public init(ammount: Int, from: String, to:String) {
		self.ammount = ammount
		self.originAccount = from
		self.destinationAccount = to
	}
}
