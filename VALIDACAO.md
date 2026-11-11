# Validação da versão 1.3.0

## Executado

- 33 testes automatizados aprovados: formato brasileiro de números, arredondamento monetário, desconto, validação de itens e datas, gravação e reabertura SQLite, busca, estados, duplicação, importação atômica, prevenção de duplicação por UUID, exportação/cancelamento de arquivos e leitura/paginação do PDF.
- Fluxo da interface verificado com o backend de testes oficial do Toga.
- Teste com o backend real WinForms: cadastro de prestador, criação de orçamento, cálculo de R$ 170,00, salvamento e abertura da visualização. A conferência visual foi parcial; as capturas posteriores sofreram interferência de outras janelas.
- O EXE empacotado foi iniciado sem Python externo: criou o banco de dados e apresentou uma janela responsiva.
- Compilação Windows com interpretador Python embarcado, distribuída em ZIP portátil.
- Compilação Android release para ARM64 e x86_64, com assinatura APK v2/v3 verificada pelo apksigner.
- Manifesto Android inspecionado: não contém permissões INTERNET ou ACCESS_NETWORK_STATE; backup automático do sistema desativado.

## Limites da verificação

- O APK **não foi executado em aparelho físico**. Nenhum aparelho Android estava conectado.
- O emulador foi preparado, mas não iniciou no ambiente atual. O driver de aceleração não está instalado; a tentativa sem aceleração também encerrou antes de iniciar o Android. Nenhuma alteração de BIOS ou reinicialização foi feita.
- O teste de escrita do Android usa uma simulação do seletor de arquivos. A seleção de destino, gravação real, importação e compartilhamento precisam ser confirmados no celular.
- O executável Windows não possui certificado comercial de assinatura de código.
- Não foi realizado teste de carga com milhares de orçamentos. A versão foi projetada para uso individual e um histórico local de pequeno porte.

## Conferência recomendada no celular

1. Instalar o APK em Android 7.0+ de 64 bits.
2. Ativar modo avião e abrir o aplicativo.
3. Cadastrar o negócio, criar um orçamento e adicionar dois itens.
4. Salvar, fechar e reabrir para conferir a persistência.
5. Exportar PDF em Downloads e abrir com um leitor de PDF.
6. Exportar backup; importar no computador e conferir os valores.

Dados fictícios de teste ficam apenas em `work/`; não são incluídos no histórico dos aplicativos entregues.


Revisão 1.1: 33 testes aprovados, incluindo troca de etapas e preservação da etapa ao salvar. O teste funcional WinForms passou. A inspeção por acessibilidade confirmou os controles; a captura visual falhou no ambiente. Android ainda sem teste em aparelho físico.


Versão 1.2: 33 testes aprovados. Confirmados por testes: exclusão recuperável, numeração preservada, logo incorporada no PDF e no backup, nome de arquivo seguro, datas inclusivas e médias por dia. Teste nativo Windows passou com logo e gráfico. Android continua sem execução em aparelho físico.


Versão 1.3: 39 testes aprovados. Exclusão definitiva restrita à Lixeira, cancelamento e confirmação, sequência persistente após exclusão/reabertura/backup, migração de banco antigo e logos maiores que 5 MB, no limite de 25 MB e acima dele. Nenhum orçamento real foi excluído durante os testes. Android continua sem execução em aparelho físico.
