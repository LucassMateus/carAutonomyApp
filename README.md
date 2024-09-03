
**Car Autonomy App**

Este aplicativo Flutter foi desenvolvido para efetuar o cálculo de consumo de combustível de veiculos cadastrados de acordo com as informações fornecidas pelo usuário.

Neste projeto utilizei uma arquitetura **MVVM** juntamente com o **Repository Pattern**. Desta forma, cada camada da arquitetura mantém suas responsabilidades bem divididas e a obtenção de dados para a aplicação protegida.

Funcionalidades
**Cadastrar/Editar Veículos:** Permite ao usuário cadastrar novos veículos ou editar informações dos veículos existentes.
**Listagem de Veículos:** Exibe a lista dos veículos cadastrados pelo usuário.
**Cálculo do consumo de combustivel:** Permite ao usuário calcular o consumo de combustível do veículo com base em dados de consumo médio de trajetos urbanos e em rodovias.
**Armazenamento Local:** Os dados da aplicação são armazenados localmente utilizando SQLite, permitindo que os dados cadastrados pelo usuário fiquem salvos.

Tecnologias Utilizadas
**Flutter:** Framework utilizado para o desenvolvimento do aplicativo.
**SQLite:** Package utilizado para armazenar os dados localmente
**ValueNotifier:** Utilizado para efetuar o gerenciamento de estado da aplicação, permitindo ao aplicativo ter telas reativas. Para "Turbinar" o ValueNotifier, combinei ele com o padrão **State**, desta forma é possível ter um gerenciamento mais robusto.
**Provider:** Utilizado para efetuar a injeção de depêndencias do projeto.
