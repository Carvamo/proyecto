create table Marca (
contract_address varchar(42)primary key,
nombre varchar(45)
);
create table SmartContract_Creacion(
contract_address varchar(42) primary key,
cantidad int,
marca_contract_address varchar(42) not null references Marca (id) on delete cascade on update cascade
);
create table Referencia(
token_id_IMEI int primary key,
nombre varchar(45),
memoria_ram int,
procesador varchar(45),
almacenamiento int, 
color varchar (45),
smartcontract_creacion_contract_address varchar(42) not null references SmartContract_Creacion (id) on delete cascade on update cascade,
smartcontrac_creacion_marca_contract_address varchar (42) not null references Marca (id) on delete cascade on update cascade
);
create table Mayorista(
contract_address varchar(42) primary key,
nombre varchar(45)
);
create table Cliente(
cedula int primary key, 
wallet_address varchar(42) primary key,
nombre varchar (45),
apellidos varchar(45),
correo_electronico varchar(45),
direccion varchar(45)
);
create table Pedido(
hash_transaccion varchar(66) primary key,
cantidad int,
mayorista_contract_address varchar(42) not null references Mayorista(id) on delete cascade on update cascade,
referencia_token_id_IMEI int not null references Referencia(id) on delete cascade on update cascade,
referencia_smartcontract_creacion_marca_contract_address varchar (42) not null references Marca(id) on delete cascade on update cascade
);
create table Compra (
hash_transaccion varchar(66) primary key, 
cliente_cedula int not null references Cliente(id) on delete cascade on update cascade,
cliente_wallet_address varchar (42) not null references Cliente(id) on delete cascade on update cascade,
referencia_token_id_IMEI int not null references Referencia(id) on delete cascade on update cascade,
marca_contract_address varchar(42) not null references Marca(id) on delete cascade on update cascade,
smartcontract_creacion_contract_address varchar (42) not null references SmartContract_Creacion(id) on delete cascade on update cascade,
mayorista_contract_address varchar(42) not null references Mayorista(id) on delete cascade on update cascade
);
create table Compra_Venta_Clientes(
hash_transaccion varchar(66) primary key,
cliente_cedula int not null references Cliente(id) on delete cascade on update cascade,
cliente_wallet_address varchar(42) not null references Cliente(id) on delete cascade on update cascade,
referencia_token_id_IMEI int not null references Referencia(id) on delete cascade on update cascade,
smartcontract_creaction_contract_address varchar(42) not null references SmarContract_Creacion(id) on delete cascade on update cascade,
marca_contract_address varchar(42) not null references Marca(id) on delete cascade on update cascade,
cliente_cedula1 int not null references Cliente(id) on delete cascade on update cascade,
cliente_wallet_address1 varchar(42) not null references Cliente(id) on delete cascade on update cascade
);
create table SmartContract_Perdida_Robo(
contract_address varchar(42) primary key,
referencia_token_id_IMEI int not null references Referencia(id) on delete cascade on update cascade, 
smartcontract_creacion_contract_address varchar(42) not null references SmartContract_Creacion(id) on delete cascade on update cascade,
marca_contract_address varchar(42) not null references Marca(id) on delete cascade on update cascade,
cliente_cedula int not null references Cliete(id) on delete cascade on update cascade,
cliente_wallet_address varchar(42) not null references Cliente(id) on delete cascade on update cascade
);