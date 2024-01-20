-- CRIAÇÃO DO BANCO --

CREATE TABLE Usuario(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	sexo VARCHAR(20),
	data_nascimento date,
	email VARCHAR(100),
	telefone VARCHAR(20),
	estado VARCHAR(100),
	cidade VARCHAR(100),
	bairro VARCHAR(100),
	rua VARCHAR(100),
	numero integer
);

CREATE TABLE Aluno(
	id SERIAL PRIMARY KEY,
	area_interesse VARCHAR(150),
	status VARCHAR(50),
	data_inscricao date
);

CREATE TABLE Professor(
	id SERIAL PRIMARY KEY,
	projetos VARCHAR(150),
	especializacao VARCHAR(150),
	data_inscricao date
);

CREATE TABLE Comunidade(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(200),
	assunto VARCHAR(200),
	regras VARCHAR(200)
);

CREATE TABLE aluno_participa_comunidade(
	id_aluno INTEGER,
	id_comunidade INTEGER,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id),
	FOREIGN KEY (id_comunidade) REFERENCES comunidade(id)
);

CREATE TABLE Curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	assunto VARCHAR(200),
	material VARCHAR(200),
	carga_horaria VARCHAR(200),
	data_inicio date,
	data_conclusao date
);

CREATE TABLE professor_ministra_curso(
	id_professor INTEGER,
	id_curso INTEGER,
	FOREIGN KEY (id_professor) REFERENCES professor(id),
	FOREIGN KEY (id_curso) REFERENCES curso(id)
);

CREATE TABLE modulo(
	id INTEGER PRIMARY KEY,
	status VARCHAR(100),
	material VARCHAR(100),
	id_curso INTEGER,
	FOREIGN KEY (id_curso) REFERENCES curso(id)
);

CREATE TABLE aluno_assiste_curso(
	id_aluno INTEGER,
	id_curso INTEGER,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id),
	FOREIGN KEY (id_curso) REFERENCES curso(id),
	data_acesso DATE,
	hora_acesso TIME
);

-- POVOANDO O BANCO --
-- Inserindo 10 tuplas na tabela Usuario
INSERT INTO Usuario (nome, sexo, data_nascimento, email, telefone, estado, cidade, bairro, rua, numero)
VALUES
    ('João da Silva', 'Masculino', '1990-05-15', 'joao@email.com', '(11) 1234-5678', 'São Paulo', 'São Paulo', 'Centro', 'Rua A', 123),
    ('Maria Souza', 'Feminino', '1985-08-20', 'maria@email.com', '(21) 9876-5432', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Avenida 12', 456),
    ('Pedro Santos', 'Masculino', '2000-02-10', 'pedro@email.com', '(31) 5555-1234', 'Minas Gerais', 'Belo Horizonte', 'Centro', 'Rua B', 789),
    ('Camila Oliveira', 'Feminino', '1995-03-25', 'camila@email.com', '(41) 9876-5432', 'Paraná', 'Curitiba', 'Vila Y', 'Avenida Z', 101),
    ('Lucas Pereira', 'Masculino', '1988-09-18', 'lucas@email.com', '(51) 7777-8888', 'Rio Grande do Sul', 'Porto Alegre', 'Lapa', 'Rua C', 567),
    ('Juliana Almeida', 'Feminino', '1992-04-03', 'juliana@email.com', '(71) 9999-1010', 'Bahia', 'Salvador', 'Barra', 'Avenida W', 202),
    ('Gustavo Fernandes', 'Masculino', '1980-12-10', 'gustavo@email.com', '(81) 4444-5555', 'Pernambuco', 'Recife', 'Boa Viagem', 'Rua D', 303),
    ('Isabela Rodrigues', 'Feminino', '2001-07-05', 'isabela@email.com', '(61) 6666-7777', 'Distrito Federal', 'Brasília', 'Asa Sul', 'Quadra X', 505),
    ('Marcos Lima', 'Masculino', '1993-06-28', 'marcos@email.com', '(98) 7878-9898', 'Maranhão', 'São Luís', 'Olho d''Água', 'Avenida Y', 404),
    ('Amanda Silva', 'Feminino', '1998-11-12', 'amanda@email.com', '(84) 1212-2323', 'Rio Grande do Norte', 'Natal', 'Ponta Negra', 'Rua E', 606);

-- Inserindo 10 tuplas na tabela Aluno
INSERT INTO Aluno (area_interesse, status, data_inscricao)
VALUES
    ('Ciência da Computação', 'Ativo', '2023-01-10'),
    ('Engenharia Elétrica', 'Inativo', '2022-11-05'),
    ('Engenharia Civil', 'Ativo', '2023-02-20'),
    ('Medicina', 'Inativo', '2022-12-15'),
    ('Administração de Empresas', 'Ativo', '2023-03-10'),
    ('Psicologia', 'Inativo', '2022-11-25'),
    ('Biologia', 'Ativo', '2023-01-05'),
    ('Educação Física', 'Ativo', '2023-03-15'),
    ('História', 'Inativo', '2022-10-30'),
    ('Química', 'Ativo', '2023-02-05');
	
-- Inserindo 10 tuplas na tabela Professor
INSERT INTO Professor (projetos, especializacao, data_inscricao)
VALUES
    ('Inteligência Artificial', 'Machine Learning', '2023-02-20'),
    ('Engenharia de Software', 'Desenvolvimento Web', '2022-09-15'),
    ('Bioquímica', 'Biologia Molecular', '2023-01-30'),
    ('Economia', 'Finanças', '2023-02-10'),
    ('Arqueologia', 'Antropologia', '2023-01-15'),
    ('Engenharia Química', 'Nanotecnologia', '2023-02-05'),
    ('Física Teórica', 'Cosmologia', '2023-03-01'),
    ('Literatura', 'Poesia Moderna', '2023-03-20'),
    ('Sociologia', 'Política Contemporânea', '2023-04-05'),
    ('Psicologia Clínica', 'Terapia Cognitivo-Comportamental', '2023-01-10');	
	
INSERT INTO Comunidade (id, nome, assunto, regras)
VALUES
    (1, 'Comunidade de Programadores', 'Desenvolvimento de Aplicações Web em JavaScript e Python', 'Respeitar as regras'),
    (2, 'Comunidade de Designers', 'Design Gráfico para Redes Sociais e Identidade Visual', 'Cumprir as diretrizes da comunidade'),
    (3, 'Comunidade de Estudantes de Medicina', 'Estudos Avançados de Medicina e Prática Clínica', 'Colaboração acadêmica'),
    (4, 'Comunidade de Engenheiros', 'Engenharia Civil, Projetos Estruturais e Inovação Tecnológica', 'Compartilhar experiências técnicas'),
    (5, 'Comunidade de Fotografia', 'Técnicas Avançadas de Fotografia Digital e Composição', 'Compartilhar fotos e técnicas'),
    (6, 'Comunidade de Músicos', 'Composição Musical, Produção Sonora e Colaborações Artísticas', 'Jam sessions e colaborações musicais'),
    (7, 'Comunidade de Viajantes', 'Roteiros de Viagens Aventurosas e Dicas Práticas', 'Dicas de viagem e aventuras'),
    (8, 'Comunidade de Escritores', 'Narrativas de Ficção Científica, Poesia e Escrita Criativa', 'Compartilhar histórias e feedback literário'),
    (9, 'Comunidade de Ciência de Dados', 'Aplicações Práticas de Ciência de Dados e Visualização Avançada', 'Compartilhar artigos e projetos'),
    (10, 'Comunidade de Empreendedores', 'Startups, Inovação Tecnológica e Empreendedorismo', 'Experiências em startups e negócios');


-- Inserindo 10 tuplas na tabela aluno_participa_comunidade
INSERT INTO aluno_participa_comunidade (id_aluno, id_comunidade)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Inserindo 10 tuplas na tabela Curso
INSERT INTO Curso (id, nome, assunto, material, carga_horaria, data_inicio, data_conclusao)
VALUES
    (1, 'Curso de Desenvolvimento Web', 'Web Development 101', 'Livros e videoaulas', '80 horas', '2023-02-01', '2023-04-01'),
    (2, 'Curso de Fotografia Digital', 'Digital Photography Masterclass', 'Apostilas e tutoriais', '60 horas', '2023-03-15', '2023-05-15'),
    (3, 'Curso de Administração de Negócios', 'Business Administration Fundamentals', 'Material didático online', '100 horas', '2023-01-10', '2023-04-10'),
    (4, 'Curso de Marketing Digital', 'Digital Marketing Strategies', 'Vídeo aulas e estudos de caso', '75 horas', '2023-02-20', '2023-05-01'),
    (5, 'Curso de Ciência de Dados', 'Data Science Bootcamp', 'Recursos online e projetos práticos', '120 horas', '2023-03-10', '2023-06-10'),
    (6, 'Curso de Inglês Avançado', 'Advanced English Language Course', 'Livros e aulas online', '90 horas', '2023-01-25', '2023-04-25'),
    (7, 'Curso de Música Eletrônica', 'Electronic Music Production', 'Tutoriais e software de produção', '70 horas', '2023-02-15', '2023-05-15'),
    (8, 'Curso de Marketing Pessoal', 'Personal Branding Workshop', 'Material online e consultoria', '45 horas', '2023-03-05', '2023-05-20'),
    (9, 'Curso de Ciências Ambientais', 'Environmental Science Fundamentals', 'Recursos online e pesquisa de campo', '85 horas', '2023-01-15', '2023-04-15'),
    (10, 'Curso de Culinária Internacional', 'International Cuisine Masterclass', 'Receitas e aulas práticas', '50 horas', '2023-02-05', '2023-05-05');

-- Inserindo 10 tuplas na tabela professor_ministra_curso
INSERT INTO professor_ministra_curso (id_professor, id_curso)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Inserindo 10 tuplas na tabela modulo
INSERT INTO modulo (id, status, material, id_curso)
VALUES
    (1, 'Em andamento', 'Apostilas', 1),
    (2, 'Concluído', 'Vídeo aulas', 2),
    (3, 'Em andamento', 'Material online', 3),
    (4, 'Concluído', 'Estudos de caso', 4),
    (5, 'Em andamento', 'Projetos práticos', 5),
    (6, 'Concluído', 'Aulas online', 6),
    (7, 'Em andamento', 'Tutoriais e software', 7),
    (8, 'Concluído', 'Material online', 8),
    (9, 'Em andamento', 'Pesquisa de campo', 9),
    (10, 'Concluído', 'Aulas práticas', 10);
	
-- Inserindo 10 tuplas na tabela aluno_assiste_curso
INSERT INTO aluno_assiste_curso (id_aluno, id_curso, data_acesso, hora_acesso)
VALUES
    (1, 1, '2023-02-15', '08:30:00'),
    (2, 2, '2023-03-20', '14:15:00'),
    (3, 3, '2023-01-25', '10:45:00'),
    (4, 4, '2023-02-28', '16:20:00'),
    (5, 5, '2023-03-10', '09:00:00'),
    (6, 6, '2023-01-05', '11:30:00'),
    (7, 7, '2023-02-10', '13:45:00'),
    (8, 8, '2023-03-05', '10:00:00'),
    (9, 9, '2023-01-15', '14:10:00'),
    (10, 10, '2023-02-25', '12:20:00');
	
SELECT * FROM ALUNO