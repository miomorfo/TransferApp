import Foundation

public class TransferService {
	var client: TransferClient
	
	public init(transferClient: TransferClient) {
		self.client = transferClient
	}
	
	public func transfer(request: Request) -> Response {
		let response: ClientResponse =  client.transfer(request: request)
				
		if response.code == 520 {
			return Response(code: 520, message: "el monto debe ser mayor a 0")
		} else if response.code == 521 {
			return Response(code: 521, message: "el monto no puede ser mayor a $200.000")
		} else if response.code == 522 {
			return Response(code: 522, message: "las cuentas no pueden ser iguales")
		}  else if response.code == 503 {
			return Response(code: 503, message: "la operacioón no pudo ser procesada, por favor intete nuevamente")
		}
		
		return Response(code : response.code, message: response.message)
	}
}
