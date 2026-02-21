# 🎬 CineBox

Aplicativo de filmes desenvolvido em **Flutter**, com foco em **boas práticas**, **arquitetura limpa** e **gerenciamento de estado moderno** utilizando **Riverpod**.

O CineBox consome dados de uma API de filmes para exibir listagens, detalhes e informações completas sobre títulos populares, servindo como um projeto de estudo e portfólio profissional.

---

## ✨ Features

- 📽️ Listagem de filmes
- 🎞️ Detalhes completos do filme
- ⭐ Avaliações e notas
- 🧭 Navegação fluida entre telas
- ⚙️ Gerenciamento de estado reativo com Riverpod

---

## 🧠 Arquitetura

O projeto foi desenvolvido seguindo os princípios da **Clean Architecture**, promovendo separação de responsabilidades, baixo acoplamento e alta testabilidade.

### 📁 Estrutura de pastas

```text
lib/
├── core/          # Utilitários, exceções e configurações globais
├── data/          # Models, datasources e repositórios
├── domain/        # Entidades e casos de uso
├── presentation/ # UI, controllers e providers
```

### 📐 Padrões e conceitos aplicados

- Clean Architecture
- MVVM-like
- Repository Pattern
- Dependency Injection
- Single Responsibility Principle (SRP)

---

## 🛠️ Tecnologias e Packages

- **Flutter**
- **Dart**
- **Riverpod** (State Management)
- **HTTP / Dio** (Consumo de API)
- **Clean Architecture**

---

## 🚀 Gerenciamento de Estado

O **Riverpod** é utilizado como solução principal de gerenciamento de estado, sendo atualmente uma das abordagens **favoritas e recomendadas pelo Google** para aplicações Flutter, garantindo:

- Estado previsível e reativo
- Melhor organização do código
- Facilidade de testes
- Desacoplamento da UI

---

## ▶️ Como executar o projeto

### 🔧 Pré-requisitos

- Flutter SDK instalado
- Dart SDK
- Emulador ou dispositivo físico

### 📦 Passos

```bash
# Clone o repositório
git clone https://github.com/Thiago-Bilangieri/Cinebox.git

# Acesse a pasta do projeto
cd Cinebox

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

---

## 📚 Projeto educacional

Este projeto foi desenvolvido como parte do aprendizado em Flutter, aplicando práticas utilizadas no mercado profissional e servindo como base para aplicações escaláveis e de fácil manutenção.

---

## 👨‍💻 Autor

**Thiago Bilangieri**  
🔗 GitHub: https://github.com/Thiago-Bilangieri

---

## 📄 Licença

Este projeto está sob a licença **MIT**.  
Sinta-se livre para estudar, modificar e utilizar como base para seus próprios projetos.
