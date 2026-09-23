# 📚 Dicionário de Dados

Documentação das tabelas e campos utilizados no projeto de BI.

---

## 🗄️ Fontes de Dados

| Fonte | Tipo | Descrição |
|---|---|---|
| SQL Server | Banco Relacional | Dados transacionais de vendas |
| Excel | Planilha | Metas e dados complementares |

---

## 📊 Tabelas Principais

### `Fato_Vendas`
| Campo | Tipo | Descrição |
|---|---|---|
| id_venda | INT | Identificador único da venda |
| data_venda | DATE | Data da venda |
| id_produto | INT | FK para Dim_Produto |
| id_gerente | INT | FK para Dim_Gerente |
| id_supervisor | INT | FK para Dim_Supervisor |
| quantidade | INT | Quantidade vendida |
| valor_total | DECIMAL | Valor total da venda |

### `Dim_Produto`
| Campo | Tipo | Descrição |
|---|---|---|
| id_produto | INT | Identificador do produto |
| nome_produto | VARCHAR | Nome do produto |
| categoria | VARCHAR | Categoria do produto |

### `Dim_Gerente`
| Campo | Tipo | Descrição |
|---|---|---|
| id_gerente | INT | Identificador do gerente |
| nome_gerente | VARCHAR | Nome do gerente |
| regiao | VARCHAR | Região de atuação |

### `Dim_Supervisor`
| Campo | Tipo | Descrição |
|---|---|---|
| id_supervisor | INT | Identificador do supervisor |
| nome_supervisor | VARCHAR | Nome do supervisor |

### `Metas`
| Campo | Tipo | Descrição |
|---|---|---|
| id_meta | INT | Identificador da meta |
| id_gerente | INT | FK para Dim_Gerente |
| categoria | VARCHAR | Categoria do produto |
| trimestre | VARCHAR | Trimestre de referência |
| valor_meta | DECIMAL | Valor da meta de faturamento |

---

## 📐 Métricas Calculadas

| Métrica | Fórmula |
|---|---|
| **Faturamento** | SUM(valor_total) |
| **Quantidade de Vendas** | COUNT(id_venda) |
| **Ticket Médio** | Faturamento / Quantidade de Vendas |
| **% Atingimento de Meta** | (Faturamento / Meta) * 100 |
