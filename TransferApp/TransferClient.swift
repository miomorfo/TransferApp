public protocol TransferClient {
	func transfer(request: Request) -> ClientResponse
}
