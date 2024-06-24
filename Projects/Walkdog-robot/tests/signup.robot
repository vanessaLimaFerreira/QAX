*** Settings ***
Documentation    Suite de teste de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup         Start session
Test Teardown      Finish session

*** Test Cases ***

Deve poder cadastrar um novo dog walker
    [Tags]    smoke    
   
    ${dog_walker}    Create Dictionary    
    ...    name=Vanessa Lima
    ...    email=v2125669@gmail.com
    ...    cpf=58326597082
    ...    cep=50920300
    ...    street=Rua Domélia
    ...    district=Jardim São Paulo
    ...    cityUf=Recife/PE
    ...    number=207
    ...    details=casa b
    ...    cnh=toretto.jpg  

 
    Go to signup Page
    Fill signup form    ${dog_walker}
    Submit sign up form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
  


Não Deve poder cadastrar com CPF inválido
        [Tags]    cpf_inv   
   
    ${dog_walker}    Create Dictionary    
    ...    name=Vanessa Lima
    ...    email=v2125669@gmail.com
    ...    cpf=583265970aa
    ...    cep=50920300
    ...    street=Rua Domélia
    ...    district=Jardim São Paulo
    ...    cityUf=Recife/PE
    ...    number=207
    ...    details=casa b
    ...    cnh=toretto.jpg

    Go to signup Page
    Fill signup form    ${dog_walker}
    Submit sign up form
    Alert should be    CPF inválido 


NÃO Deve poder cadastrar se campos obrigatórios nao forem preenchidos 
    [Tags]    required    

    Go to signup Page
    Submit sign up form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice  
   
    ${dog_walker}    Create Dictionary    
    ...    name=Vanessa Lima
    ...    email=v2125669@gmail.com
    ...    cpf=58326597082
    ...    cep=50920300
    ...    street=Rua Domélia
    ...    district=Jardim São Paulo
    ...    cityUf=Recife/PE
    ...    number=207
    ...    details=casa b
    ...    cnh=toretto.jpg
    
 
    Go to signup Page
    Fill signup form      ${dog_walker}
    Additional service    Cuidar
    Submit sign up form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe Adestrar de pets
    [Tags]    aservice  
   
    ${dog_walker}    Create Dictionary    
    ...    name=Lima da Costa
    ...    email=testeLima@gmail.com
    ...    cpf=58326597082
    ...    cep=50920300
    ...    street=Rua Domélia
    ...    district=Jardim São Paulo
    ...    cityUf=Recife/PE
    ...    number=207
    ...    details=casa b
    ...    cnh=toretto.jpg

 
    Go to signup Page
    Fill signup form    ${dog_walker}
    Additional service    Adestrar
    Submit sign up form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.