# Gestão de instâncias Moodle

Esse software facilita a gestão de múltiplos sites Moodle hospedados no mesmo servidor web. A versão inicial é minimamente funcional mas provavelmente contém bugs. Contribuições são bem-vindas.

1. Clone o projeto gestao no diretório raiz do seu servdidor web. É necessário tê-lo configurado previamente.
1. Atualize o diretório MOODLEDIR em `geraInstances.sh`
1. Copie `conf.dist.php` para `conf.php`
1. Insira os dados de conexão com o banco de dados suporte em `conf.php` bem como as categorias de cursos (instâncias) que você possui. Cada categoria deve ser um diretório distinto em MOODLEDIR.
1. Insira o esquema do banco de dados `schema.sql` no banco suporte. No momento, apenas PostgreSQL é suportado. AVISO: O banco suporte contém tabelas que não estão sendo utilizadas.
1. rode o script geraInstances.sh
1. Aponte o seu browser para http://seu.host.ou.ip/gestao/

(english version soon!)
