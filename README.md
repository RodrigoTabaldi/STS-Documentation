# STS Documentation Generator

[English version](README.en.md)

O STS Documentation Generator é um padrão prático para criar documentação técnica de software consistente, rastreável e útil ao longo do ciclo de vida do produto. Ele fornece dois modelos-base bilíngues, uma skill operacional e um script para iniciar a documentação de outro projeto com integridade verificável.

## Propósito e posicionamento

O STS organiza práticas amplamente adotadas na indústria e na academia — como requisitos rastreáveis, ADRs, contratos de integração, controles de segurança e evidências operacionais — em um modelo único de documentação. Ele não é um padrão oficial, nem implica endosso, certificação ou afiliação com qualquer instituição citada como referência de boas práticas.

As fontes externas que orientarem uma documentação devem ser citadas no próprio documento do projeto, com título, versão e data de consulta. Este repositório não substitui nem republica tais fontes.

No STS, a documentação é a referência normativa do sistema: define o que será construído, por quê, sob quais restrições e como demonstrar o resultado. O código implementa essas decisões; mudanças relevantes em requisitos, interfaces ou operação devem atualizar ambos na mesma alteração.

## Conteúdo do repositório

- `assets/Model_STS.pdf` — modelo-base canônico em português.
- `assets/Model_STS_English.pdf` — modelo-base canônico em inglês.
- `SKILL.md` — uma skill STS, com dois fluxos operacionais: preparar a base documental e gerar documentação específica do projeto.
- `scripts/prepare-sts-project.ps1` — inicializa a base documental em outro projeto e verifica a cópia dos modelos por SHA-256.

Os PDFs em `assets/` são artefatos de referência imutáveis. Não os edite, renomeie, traduza, recomprima ou sobrescreva. A documentação preenchida de cada sistema deve ser criada em arquivos separados.

## Estrutura documental do STS

Os modelos organizam a documentação em torno de:

- contexto, objetivo, escopo e responsáveis;
- requisitos, critérios de aceite e rastreabilidade;
- arquitetura e decisões arquiteturais (ADRs);
- dados, integrações e contratos;
- qualidade, segurança e privacidade;
- implantação, operação e observabilidade;
- referências, evidências e histórico de decisões.

Se uma seção não se aplicar, mantenha-a no documento com uma justificativa curta. Isso torna limites e lacunas explícitos e auditáveis.

## Início rápido

### Pré-requisitos

- PowerShell 5.1 ou posterior;
- permissão de escrita no projeto de destino;
- acesso a este repositório.

No PowerShell, execute o script a partir da raiz deste repositório e informe o projeto que receberá a base documental:

```powershell
./scripts/prepare-sts-project.ps1 -Destination "C:\caminho\para\o\projeto" -Language both
```

Valores aceitos em `-Language`:

- `pt` — copia o modelo em português;
- `en` — copia o modelo em inglês;
- `both` — copia os dois modelos (padrão).

O comando cria `docs/sts-base/`, copia somente os modelos selecionados, cria `DOCUMENTATION_CHARTER.md` na raiz do projeto de destino e confirma que cada cópia tem o mesmo hash SHA-256 do original. Arquivos com o mesmo nome no destino são substituídos; confirme o caminho de destino antes de executar.

## Os dois fluxos da skill STS

### 1. Preparar a base documental

Use o script acima para anexar os modelos imutáveis e a carta de documentação a um projeto. A carta aponta para os modelos selecionados e registra as regras de preservação, rastreabilidade e segurança da documentação.

### 2. Gerar documentação do projeto

1. Escolha o modelo do idioma do documento e leia `DOCUMENTATION_CHARTER.md`.
2. Reúna fatos verificáveis: escopo, requisitos, responsáveis, arquitetura, contratos, riscos, operação e evidências.
3. Crie um entregável específico do projeto, fora de `docs/sts-base/`.
4. Preserve a ordem e o significado das seções do modelo; vincule IDs, ADRs, diagramas, contratos, testes e evidências quando existirem.
5. Revise links, responsáveis, referências e critérios de aceite antes da entrega.

Não inclua segredos, tokens, credenciais ou dados pessoais desnecessários na documentação.

## Uso como skill

`SKILL.md` contém as instruções que uma ferramenta compatível deve seguir ao trabalhar com este padrão. Para disponibilizá-la no seu ambiente, instale ou referencie este diretório conforme o mecanismo de skills da ferramenta; mantenha `SKILL.md`, `assets/` e `scripts/` juntos, pois a skill depende desses caminhos relativos.

## Contribuição e versionamento

Preserve o objetivo do repositório: governar e gerar documentação técnica. Uma mudança em qualquer modelo-base exige uma nova versão aprovada e a retenção dos modelos anteriores para rastreabilidade. Alterações no script ou na skill devem manter a compatibilidade entre o README, a carta gerada e o comportamento real do comando.

Antes de distribuir documentação derivada ou incorporar material de terceiros, confirme os direitos de uso e registre a fonte, versão e data de consulta no documento que a utiliza.
