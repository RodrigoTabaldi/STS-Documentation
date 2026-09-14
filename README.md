# STS Documentation Generator

[English version](README.en.md)

Base para criar documentação técnica de desenvolvimento de software consistente, rastreável e útil durante todo o ciclo de vida de um produto.

O projeto reúne e organiza referências e boas práticas de diferentes contextos internacionais — incluindo materiais associados à indústria, à academia e a organizações como Google e a Universidade de Zurique — em um modelo STS bilíngue. As fontes específicas e suas versões devem ser registradas na documentação gerada quando forem aplicáveis; este repositório não substitui nem republica essas fontes.

## A documentação é a Carta Magna do código

Neste projeto, a documentação é a referência normativa do sistema. Ela estabelece o que deve ser construído, por quê, sob quais restrições e como comprovar que o resultado atende ao esperado. O código implementa essas decisões; não deve contradizê-las silenciosamente.

Na prática, isso significa que requisitos, decisões de arquitetura, contratos de integração, dados, segurança, operação e critérios de aceite precisam permanecer claros, versionados e rastreáveis. Quando uma decisão muda, o código e sua documentação devem evoluir juntos.

## O que está incluído

- `assets/Model_STS.pdf`: modelo-base canônico em português.
- `assets/Model_STS_English.pdf`: modelo-base canônico em inglês.
- `SKILL.md`: instruções operacionais para usar os modelos e gerar documentação de projetos.
- `scripts/prepare-sts-project.ps1`: prepara a estrutura documental em outro projeto e verifica a integridade dos modelos copiados.

Os PDFs em `assets/` são referências imutáveis: não devem ser editados, renomeados, traduzidos, recomprimidos ou sobrescritos. A documentação de cada sistema deve ser produzida separadamente.

## Estrutura esperada da documentação

Os modelos STS organizam a documentação em torno de:

- contexto, objetivo e escopo;
- requisitos, critérios de aceite e rastreabilidade;
- arquitetura e decisões arquiteturais (ADRs);
- dados, integrações e contratos;
- qualidade, segurança e privacidade;
- implantação, operação e observabilidade;
- referências, responsáveis e evidências.

Uma seção não aplicável deve continuar registrada, com uma justificativa breve. Isso torna as lacunas explícitas e auditáveis.

## Como iniciar em um projeto

No PowerShell, execute o script a partir deste repositório, apontando para o projeto que receberá a base documental:

```powershell
./scripts/prepare-sts-project.ps1 -Destination "C:\caminho\para\o\projeto" -Language both
```

Valores aceitos em `-Language`:

- `pt` para português;
- `en` para inglês;
- `both` para projetos bilíngues.

O comando cria `docs/sts-base/`, copia os modelos selecionados, cria `DOCUMENTATION_CHARTER.md` e valida os hashes SHA-256 dos arquivos copiados.

## Fluxo de trabalho recomendado

1. Escolha o modelo no idioma do documento e leia o `DOCUMENTATION_CHARTER.md` do projeto.
2. Reúna fatos verificáveis: escopo, responsáveis, requisitos, arquitetura, contratos, riscos, operação e evidências.
3. Produza o documento específico do projeto sem alterar os PDFs-base.
4. Mantenha a ordem e o sentido das seções obrigatórias do modelo.
5. Atualize a documentação na mesma mudança que alterar decisões, interfaces ou comportamento relevante do sistema.

## Contribuição

Preserve a finalidade do repositório: governar e gerar documentação técnica. Mudanças nos modelos-base exigem uma nova versão aprovada do modelo, preservando os arquivos anteriores para rastreabilidade. Não inclua segredos, tokens ou dados pessoais desnecessários em documentos, exemplos ou histórico Git.

## Licenças e referências

Antes de distribuir documentação derivada ou incorporar material de terceiros, confirme os direitos de uso e cite a fonte, versão e data de consulta. Registre essas referências no documento do projeto que as utiliza.
