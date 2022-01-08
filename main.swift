// Listas
let participantes: [String] = ["Abel", "Braga","Carlos","Daniel"]

let despesas: [(nome: String, valor: Int, quantidade: Int)] = [
    (nome: "passeio", valor: 60001, quantidade: 2),
    (nome: "estadia", valor: 40000, quantidade: 4),
    (nome: "alimentação", valor: 50000, quantidade: 8),
    (nome: "gorjeta", valor: 20000, quantidade: 1)
]

func calcularDespesaPorPessoa(
    participantes: [String],
    despesas: [(nome: String, valor: Int, quantidade: Int)]) -> Any {
    var total: Int = 0 
    var resultado: [String:Int] = [:]
    
    if (despesas.count == 0 || participantes.count == 0) {
        return "A lista de despesas ou de participantes está vazia!"
    }

    // Encontrando o valor total
    for gasto in despesas {
        let valorDaDespesa: Int = gasto.valor * gasto.quantidade
   
        total += valorDaDespesa
    }

    // Encontrando o valor a pagar por pessoa
    let valorPorIntegrante: Int = total / participantes.count

    // Criando um mapa onde a chave é o nome da pessoa e o valor é quanto ela tem que pagar
    for p in participantes {
        resultado[p] = valorPorIntegrante
    }

    var resto: Int = total % participantes.count

    print("O valor total é \(total)")
    print("O valor por integrante é \(valorPorIntegrante)")
    print("O resto é \(resto)")
    print(" ")

    // Enquanto houver resto, somar 1 no valor a pagar do participante no índice do resto atual
    if resto == 0 {
        return resultado
    } else { 
        while resto > 0 {
            let nome = participantes[resto]
            resultado[nome] = valorPorIntegrante + 1
            resto -= 1
        }
        for (nome, valor) in resultado {
            if (valor == 0) {
                resultado[nome] = nil
            }
        }

        return resultado
    }
}

print(
    calcularDespesaPorPessoa(participantes: participantes, despesas: despesas)
)


