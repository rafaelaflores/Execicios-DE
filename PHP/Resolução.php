<?php
// 1) Utilizando a variável $arrayDeClientes de um echo no nome do segundo cliente.

    $nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
    
    $cliente1 = new stdClass();
    $cliente1->nome = $nomes[0];
    
    $cliente2 = new stdClass();
    $cliente2->nome = $nomes[1];
    
    $cliente3 = new stdClass();
    $cliente3->nome = $nomes[2];
   
    $arrayDeClientes = [$cliente1, $cliente2, $cliente3];
    
    echo $arrayDeClientes[1]->nome."\n"; //usada a posição 1 pois o array começa em 0

// 2) Utilize a estrutura de dados $arrayDeNascimento para adicionar na estrutura $arrayDeClientes a data de nascimento de cada cliente.

    $arrayDeNascimento = [
        'Francisco Souza' => '10-12-1996',
        'Arthur Golveia' => '14-01-2000',
        'Guilherme Rosa' => '26-05-1985',
        'Marcelo Planalto' => '26-05-1985'
    ];

    foreach ($arrayDeNascimento as $nome => $data) {
    	if(in_array($nome, $nomes)) { //verifica se há o cliente no array e se sim, apenas atribui a data de nascimento a ele
        foreach ($arrayDeClientes as $cliente) {
            if ($nome == $cliente->nome) {
                $cliente->dataNascimento = $data;
            }   
        }
        } else { //novo cliente junto com a data de nascimento é adicionado ao array de clientes 
            $cliente4 = new stdClass();
            $cliente4->nome = $nome;
            $cliente4->dataNascimento = $data;

            $arrayDeClientes = [$cliente1, $cliente2, $cliente3, $cliente4];
        }
    }

// 3) Faça a ordenação e impressão da estrutura $arrayDeClientes resultante do exercício 2 pela data de nascimento (pode ser ascendente ou descendente).

function compara_clientes($c1, $c2) {
    if ($c1->dataNascimento == $c2->dataNascimento) {
        return 0;
    }
    return (strtotime($c1->dataNascimento) < strtotime($c2->dataNascimento)) ? -1 : 1; 
}
  
usort($arrayDeClientes, "compara_clientes"); //ordena os clientes do mais velho ao mais novo

foreach ($arrayDeClientes as $cliente) {
    echo $cliente->nome . " nascido em ";
    echo $cliente->dataNascimento . "\n";
} //faz a impressão
?>