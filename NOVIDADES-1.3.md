# Versão 1.3 — Lixeira e logos maiores

## Exclusão permanente

Na **Lixeira**, cada orçamento agora oferece **Restaurar** e **Excluir permanentemente**. A exclusão definitiva pede confirmação identificando o orçamento e o cliente. Depois de confirmada, não é possível restaurá-lo pela Lixeira. A numeração continua avançando, sem reutilizar o número excluído, inclusive após fechar o programa ou restaurar um backup desta versão.

PDFs e backups exportados anteriormente permanecem nos seus arquivos. Importar um backup antigo pode trazer novamente um orçamento que estava nele.

## Logos de até 25 MB

Em **Meu negócio → Escolher logo**, selecione PNG ou JPEG de até **25 MB (25.000.000 bytes)**, no Windows ou no Android. O limite de dimensões é 50 megapixels. A logo continua opcional, é reduzida para manter o aplicativo leve e fica incorporada ao orçamento, sem precisar manter o arquivo original.

## Atualização

No computador, salve seu trabalho, feche a versão anterior e abra o atalho **Abrir Gerador de orçamento**. A versão nova fica em `Aplicativo Windows 1.3`, usando o mesmo local de dados.

No Android, instale o novo APK como atualização, sem desinstalar o aplicativo anterior. A chave de assinatura foi mantida.

## Validação

39 testes automatizados passaram, incluindo cancelamento e confirmação da exclusão, proteção contra excluir definitivamente um orçamento ativo, persistência da numeração, migração de dados antigos, backup e uma imagem PNG real maior que 5 MB. O limite exato de 25 MB e a rejeição acima dele também foram testados. O APK ainda precisa de teste em aparelho físico.
