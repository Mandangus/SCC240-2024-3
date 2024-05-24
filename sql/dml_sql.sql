INSERT INTO DoadoresCampanha (Cod_Doador, Estado_Ficha, Tipo_Doador) VALUES 
(1, 'Limpa', 'Físico'),
(2, 'Limpa', 'Jurídico'),
(3, 'Suja', 'Físico'),
(4, 'Limpa', 'Jurídico'),
(5, 'Limpa', 'Físico'),
(6, 'Suja', 'Jurídico');

INSERT INTO ProcessoJudicial (Cod_Processo, Cod_Individuo, Data_Termino, Procedencia) VALUES 
(1, 1, '2025-12-31', 'Favorável'),
(2, 2, '2026-06-30', 'Desfavorável'),
(3, 3, '2024-11-15', 'Favorável'),
(4, 4, '2025-08-20', 'Desfavorável'),
(5, 5, '2023-10-10', 'Favorável'),
(6, 6, '2027-01-05', 'Desfavorável');

INSERT INTO DoadorFisico (Cod_Doador, CPF, quantDoacoes) VALUES 
(1, '12345678901', 2),
(3, '23456789012', 3),
(5, '34567890123', 1);

INSERT INTO DoadorJuridico (Cod_Doador, CNPJ) VALUES 
(2, '12345678000101'),
(4, '23456789000102'),
(6, '34567890000103');

INSERT INTO Doa (cod_doador, valor, quantDoacoes) VALUES 
(1, 500.00, 2),
(2, 1000.00, 1),
(3, 1500.00, 3),
(4, 2000.00, 1),
(5, 2500.00, 1),
(6, 3000.00, 1);


