-- comando para inserir uma linha gerando dados aleatorios
insert into estado (id, nome, uf ) values 
(nextval('seq_estado_id'), 
md5(random()::text) , SUBSTRING(md5(random()::text) FROM 0 FOR 3));

-- criando uma função para inserir dados aleatorios informando quantas linhas
Create or replace function insereDadosEstados(length integer) returns void as
$$
declare

begin

  for i in 1..length loop
    insert into estado (id, nome, uf ) values 
	(nextval('seq_estado_id'), 
	 md5(random()::text) , SUBSTRING(md5(random()::text) FROM 0 FOR 3));
  end loop;
  
end;
$$ language plpgsql;

select insereDadosEstados(10000);

