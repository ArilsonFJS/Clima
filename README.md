# ☀️ Clima (🚧 EM DESENVOLVIMENTO! 🚧)

**Clima** é um aplicativo iOS desenvolvido em Swift utilizando **UIKit** e **ViewCode**, que consome a API da **OpenWeatherMap** para exibir informações climáticas de uma localização específica.

---

## Funcionalidades

- Busca por clima atual de uma cidade.
- Exibição da temperatura, sensação térmica e condição do tempo (ícone e descrição).
- Interface desenvolvida 100% via ViewCode (sem storyboard).
- Layout responsivo e compatível com iPhones modernos.

---
### 📂 Estrutura do Projeto

> Clima/
> > │-- Constants/ (Constantes usadas no projeto)
> > > > │-- Models/ (Modelos de dados para os filmes)
> > > > > │-- Services/ (Serviço responsável por chamar a API TMDB)
> > > > > > │-- Controller/ (Lógica de apresentação e manipulação dos dados)
> > > > > > > │-- Views/ (Interfaces de usuário e componentes visuais)
---

## Tecnologias e Ferramentas

- **UIKit**
- **ViewCode**
- **Auto Layout**
- **URLSession** para requisições HTTP
- **OpenWeatherMap API**
- **JSONDecoder** para parse dos dados
- **Git** para versionamento

---

## Instalação

1. Clone o repositório:

```bash
git clone https://github.com/ArilsonFJS/Clima.git
```
---

## Configuração da API
Crie uma conta gratuita em https://openweathermap.org

Obtenha sua chave de API.

Crie um arquivo chamado APIConstants.swift no projeto com o seguinte conteúdo:

```swift
struct APIConstants {
    static let apiKey = "SUA_CHAVE_AQUI"
}
```

---

### Próximos Desafios
 - Adicionar suporte a localização por GPS.



