var clientes = [    
    {
      'id': 1,
      'nome': 'Luis Santos Silveira',
      'idade': 18,
    },
    {
      'id': 2,
      'nome': 'Ricardo Lopes Alves',
      'idade': 30
    },
    {
      'id': 3,
      'nome': 'Gustavo Silva Junior',
      'idade': 26
    }
  ]
  
  var numero = "5(1)9-876-543-21";

/* 1) Percorra o objeto clientes e mostre o nome da cada cliente da seguinte maneira: "ultimoSobrenome, primeiroNome"; */

    clientes.forEach(cliente => {
    var nome = cliente.nome.split(' '); //separa a varíavel conforme espaços presentes nela
    var primeiroNome = nome[0]; 
    var ultimoSobrenome = nome[nome.length - 1];

    var nomeFinal = ultimoSobrenome + ", " + primeiroNome;

    console.log(nomeFinal)});

/* 2) Formate a variável “numero” para o seguinte formato: "(XX)_X_XXXX-XXXX" */

function formataTelefone(telefone) {
    telefone = telefone.replace(/[^0-9]/g, ""); //uso do regex para tirar os caracteres presentes na variável
    telefone = telefone.replace(/(\d{2})(\d{1})(\d{4})(\d{4})/, "($1) $2 $3-$4"); //regex para adicionar o formato solicitado
    return telefone;
}

console.log(formataTelefone(numero));
