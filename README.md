## Política de Retenção de Dados
Para manter o histórico de dados por um período de 3 meses, podemos configurar uma política de retenção, caso esteja disponível, ou criar jobs de deleção para remover dados com mais de 3 meses. Essa abordagem garante que apenas os dados necessários sejam mantidos, ajudando a otimizar o uso de armazenamento e a reduzir custos.

## Uso do Databricks
Iniciei o projeto utilizando o Databricks, mas notei que os arquivos após as requisições não persistiam porque o DBFS não estava ativo. Porém, na versão Community, não havia a opção de habilitá-lo nas configurações, conforme encontrei nos fóruns e na documentação. Optei, então, por seguir uma abordagem mais tradicional.
