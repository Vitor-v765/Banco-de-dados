
CREATE DATABASE sistema_vendas_completo;
USE sistema_vendas_completo;


CREATE TABLE TBL_Usuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Usuario VARCHAR(45) NOT NULL,
    Senha_Usuario VARCHAR(45) NOT NULL,
    Tipo_Usuario VARCHAR(45) NOT NULL
);


CREATE TABLE TBL_Cliente (
    ID_Cliente_PK INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Cliente VARCHAR(100) NOT NULL,
    Teléfone_Cliente VARCHAR(20) NOT NULL,  
    RG VARCHAR(20) NOT NULL,                
    CPF VARCHAR(20) NOT NULL UNIQUE       
);


CREATE TABLE TBL_Endereco (
    ID_Endereco INT PRIMARY KEY AUTO_INCREMENT,
    País VARCHAR(100) NOT NULL,
    Estado VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Bairro VARCHAR(100) NOT NULL,
    CEP VARCHAR(25) NOT NULL,               
    Logradouro VARCHAR(100) NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES TBL_Cliente(ID_Cliente_PK)
);


CREATE TABLE TBL_Telefone (
    ID_Telefone INT PRIMARY KEY AUTO_INCREMENT,
    Teléfone VARCHAR(20) NOT NULL,          -- Alterado para VARCHAR
    Tipo_Telefone ENUM('Celular', 'Residencial', 'Comercial') NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES TBL_Cliente(ID_Cliente_PK)
);


CREATE TABLE TBL_Colaborador (
    ID_Colaborador_PK INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Colaborador VARCHAR(100) NOT NULL,
    Turno_Trabalho TIME NOT NULL,          
    Data_Admissao DATE NOT NULL,            
    RG VARCHAR(20) NOT NULL,                
    CPF VARCHAR(20) NOT NULL UNIQUE,       
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES TBL_Usuario(ID_Usuario)
);

-- Tabela de Produto
CREATE TABLE TBL_Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produto VARCHAR(45) NOT NULL,
    Categoria_Produto VARCHAR(45) NOT NULL,
    Marca_Produto VARCHAR(45) NOT NULL,
    Preco_Produto DECIMAL(10,2) NOT NULL    
);


CREATE TABLE TBL_Venda (
    ID_Venda_PK INT PRIMARY KEY AUTO_INCREMENT,
    Valor_Total DECIMAL(10,2) NOT NULL,     
    Data_Hora DATETIME NOT NULL,            
    ID_Cliente INT NOT NULL,
    ID_Colaborador INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES TBL_Cliente(ID_Cliente_PK),
    FOREIGN KEY (ID_Colaborador) REFERENCES TBL_Colaborador(ID_Colaborador_PK)
);


CREATE TABLE TBL_Item_Venda (
    ID_Item_Venda INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venda INT NOT NULL,
    ID_Produto INT NOT NULL,
    Quantidade INT NOT NULL DEFAULT 1,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Venda) REFERENCES TBL_Venda(ID_Venda_PK),
    FOREIGN KEY (ID_Produto) REFERENCES TBL_Produto(ID_Produto)
);

