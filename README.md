# Gerador de orçamento

Aplicativo Python para **prestadores de manutenção residencial e pequenos reparos**: encanadores, eletricistas, instaladores e profissionais autônomos. Uma interface simples para transformar materiais e mão de obra em um orçamento claro, salvar o histórico e exportar um PDF.

**Validação:** 33 testes aprovados e abertura do EXE verificada neste Windows. O APK foi compilado e teve a assinatura verificada, mas ainda não foi executado em um celular; consulte `VALIDACAO.md`.

## Uso rápido

1. Abra o aplicativo e entre em **Meu negócio**. Preencha ao menos o nome do prestador e salve.
2. Clique em **Novo**, informe o cliente e descreva o serviço.
3. Adicione cada item com tipo, quantidade, unidade e preço unitário. Aceita valores como `150,00` e `1.250,50`.
4. Ajuste o desconto em reais, a validade, o pagamento e as observações. Clique em **Salvar**.
5. Use **Visualizar**, **Exportar PDF** ou **Copiar texto / Compartilhar**.
6. Acompanhe a situação no próprio orçamento: Rascunho, Enviado, Aprovado, Recusado ou Concluído. Marcar como Enviado não envia mensagens automaticamente.

Os botões Visualizar, Exportar PDF e Copiar texto/Compartilhar também salvam o orçamento. Para incluir um item preenchido, clique em **Adicionar item** antes de salvar. Itens existentes podem ser editados ou removidos. Para aproveitar um orçamento anterior, use **Duplicar como novo orçamento**.

## Windows

- Extraia **todo** o ZIP `Gerador de orçamento-1.3.0.zip` para uma pasta.
- Abra `Gerador de orçamento.exe` dentro dela. Mantenha os arquivos e subpastas ao lado do EXE: eles incluem o Python e as dependências.
- Não precisa instalar Python nem conectar à internet para usar.
- Destino: Windows 10/11 de 64 bits com .NET Framework 4.8 (já presente no computador de desenvolvimento).
- O executável não tem certificado comercial de assinatura de código.

## Android

- Transfira `Gerador-de-orcamento-Android.apk` ao celular por USB, Bluetooth ou outro meio escolhido por você.
- Abra o arquivo e autorize a instalação pelo aplicativo usado para abri-lo, se o Android solicitar.
- Compatível com **Android 7.0 ou superior e sistema de 64 bits (ARM64)**. O APK também inclui x86_64 para emuladores. Android de 32 bits não está incluído.
- O APK inclui o interpretador Python e funciona offline desde a primeira abertura. Não requer conta ou servidor.
- O seletor de arquivos do Android permite escolher onde guardar o PDF e o backup. Escolha o armazenamento local para manter tudo offline.
- Compartilhar abre o menu do Android. O envio depende do aplicativo escolhido; mensagens pela internet exigem conexão nesse outro aplicativo.

## Dados e backup

Os dados ficam em SQLite no diretório privado do aplicativo. O histórico inicial é vazio; os dados de teste estão isolados em `work/` e não acompanham os aplicativos.

- **Meu negócio → Exportar backup** gera um arquivo JSON com o perfil e todos os orçamentos salvos.
- **Importar backup** acrescenta os orçamentos que ainda não existem. Orçamentos existentes são preservados, sem sobrescrever edições. Os novos recebem numeração local.
- Para transferir entre PC e celular, exporte em um aparelho e importe no outro. **Não há sincronização automática.**
- A importação salva uma cópia de segurança local chamada `antes-da-importacao.json` antes de alterar o banco.
- O arquivo de backup e os PDFs não são criptografados. Guarde-os em local adequado; podem conter contatos, endereço, CPF/CNPJ e chave Pix.
- Faça backup antes de desinstalar o aplicativo Android ou limpar seus dados.
- Os dados do prestador são guardados em cada orçamento. Alterar Meu negócio vale para novos orçamentos e novas cópias; preserva documentos anteriores.
- O aplicativo não emite nota fiscal nem processa pagamentos. A aprovação é um controle manual, sem assinatura digital.

## Desenvolvimento no VS Code

O projeto está em `C:\Users\Davi Gusman\Documents\Gerador de orçamento`.

Ambiente local: Python 3.12, Toga 0.5.7 e Briefcase 0.4.7. O `.venv` já foi preparado. Para executar pelo terminal do VS Code:

```powershell
$env:PYTHONPATH = "$PWD\src"
.\.venv\Scripts\python.exe -m geradororcamento
```

Em outro computador de desenvolvimento, instale Python 3.12 e Git, crie o ambiente com `python -m venv .venv` e instale as ferramentas com `.\.venv\Scripts\python.exe -m pip install -r requirements-dev.txt`. Ajuste `BRIEFCASE_HOME` para uma pasta existente sem espaços antes da compilação.

Para testar:

```powershell
.\.venv\Scripts\python.exe -m pytest -q
```

Para reconstruir os pacotes:

```powershell
.\build-windows.ps1
.\build-android.ps1
```

A compilação pode baixar dependências e exige internet. Os aplicativos gerados não dependem dela. Java 17, Android SDK e ferramentas de empacotamento estão no cache `C:\Users\Public\Documents\GeradorOrcamentoTools`. As licenças do SDK foram aceitas durante a preparação autorizada do ambiente.

O script Android aplica a configuração de privacidade ao projeto gerado, remove permissões de internet, desativa o backup automático do sistema e usa o Python do ambiente virtual. A pasta `signing/` contém a chave e a senha de assinatura local: mantenha uma cópia privada e segura. **Não publique essa pasta.** A mesma chave será necessária para instalar versões futuras sobre esta sem desinstalar.

### Estrutura

- `src/geradororcamento/core.py`: regras monetárias com Decimal, validação, SQLite e backup.
- `src/geradororcamento/app.py`: interface nativa compartilhada.
- `src/geradororcamento/files.py`: arquivos no Windows e Storage Access Framework no Android.
- `src/geradororcamento/pdf.py`: PDF local, com paginação e fontes padrão.
- `tests/`: testes de cálculo, persistência, PDF e fluxo da interface.
- `tools/`: preparação e assinatura do Android.
- `dist/`: pacotes finais.
- `work/`: arquivos temporários e evidências de teste; não necessários para usar o aplicativo.

### Referências técnicas

- [Toga](https://toga.beeware.org/)
- [Empacotamento Android com Briefcase](https://briefcase.beeware.org/en/stable/reference/platforms/android/gradle/)
- [Python embarcado no Android com Chaquopy](https://chaquo.com/chaquopy/doc/current/android.html)

O código do aplicativo é distribuído sob licença MIT. As dependências mantêm suas próprias licenças, incluídas nos pacotes quando fornecidas por elas.


## Novidades da versão 1.1
- Menu com seção ativa destacada.
- Editor em três etapas que preservam os campos.
- Total e ações fixos no rodapé.
- Painel com indicadores, cartões e cores por situação.
- Busca sem distinção de acentos e aviso antes de exportar dados não salvos.


## Versão 1.2
Consulte NOVIDADES-1.2.md para exclusão/restauração, logo opcional, nome personalizado do PDF e gráficos com período.


## Versão 1.3
Consulte NOVIDADES-1.3.md para exclusão permanente na Lixeira e logos de até 25 MB.
