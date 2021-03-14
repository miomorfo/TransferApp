import XCTest
@testable import TransferApp

class TransferServiceTest: XCTestCase {

	override func setUpWithError() throws {
	}
	
	override func tearDownWithError() throws {
	}
	
	func testAmountMustBeMajorThanZero() throws {
		let client = TransferClientStub(code: 520, message: "el monto debe mayor que cero")
		let service = TransferService(transferClient: client)
		
		let ammount = 0
		let originAccount = "Cuenta 119811 Corriente BCI"
		let destinationAccount = "Cuenta 87653888 Vista Santander"
		
		let request = Request(ammount: ammount, from: originAccount, to: destinationAccount)
		
		let response = service.transfer(request: request)
		
		XCTAssertEqual(response.getCode(), 520)
	}
	
	func testAmountCantBeMajorThan200_000() throws {
		let client = TransferClientStub(code: 521, message: "el monto no puede ser mayor a $200.000")
		let service = TransferService(transferClient: client)
		
		let ammount = 450_000
		let originAccount = "Cuenta Corriente 27816539 ITAÚ"
		let destinationAccount = "Cuenta Vista 1876735 Banco Estado"
		
		let request = Request(ammount: ammount, from: originAccount, to: destinationAccount)
		
		let response = service.transfer(request: request)
		
		XCTAssertEqual(response.getCode(), 521)
	}
	
	func testAccountsCantBeEquals() throws {
		let client = TransferClientStub(code: 522, message: "Las cuentas no pueden ser iguales")
		let service = TransferService(transferClient: client)
		
		let ammount = 150_000
		let originAccount = "Cuenta Corriente  11119829 Scotiabank"
		let destinationAccount = "Cuenta Corriente 11119829 Scotiabank"
		
		let request = Request(ammount: ammount, from: originAccount, to: destinationAccount)
		
		let response = service.transfer(request: request)
		
		XCTAssertEqual(response.getCode(), 522)
	}
	
	func testOperationCantBeProcess() throws {
		let client = TransferClientStub(code: 503, message: "La operación no pudo ser procesada, por favor intete nuevamente")
		let service = TransferService(transferClient: client)
		
		let ammount = 100_000
		let originAccount = "Cuenta Corriente  2435511 BCI"
		let destinationAccount = "Cuenta Corriente 11119829 Scotiabank"
		
		let request = Request(ammount: ammount, from: originAccount, to: destinationAccount)
		
		let response = service.transfer(request: request)
		
		XCTAssertEqual(response.getCode(), 503)
	}

	
}
