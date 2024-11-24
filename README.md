<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🗝️ Key Features](#key-features)
  - [🛠️ Built With](#built-with)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Videogames Rental Server <a name="about-project"></a>

**Videogames Rental Server** forms the backbone of a comprehensive full-stack web application designed to facilitate the rental of nostalgic vintage videogames. Operating as an API-only system, it offers a collection of REST endpoints meticulously crafted to ensure effortless accessibility and seamless integration.

## 🗝️ Key Features <a name="key-features"></a>

- Allows users to register and log in
- Supports admins (i.e. email: `dicodiaz@gmail.com`, password: `test123`)
- Allows anyone to read videogames
- Allows users to CRUD reservations
- Only allows admins to create and delete videogames
- Includes models, requests and routing specs
- Includes docs built with `rswag`

## 🛠️ Built With <a name="built-with"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- https://videogames-rental-server-548b6c289583.herokuapp.com/

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- [Install PostgreSQL](https://www.postgresql.org/download/)
- [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- Install the [rails gem](https://rubygems.org/gems/rails)

### Setup

Clone this repository to your desired folder:

```sh
cd my-folder
git clone git@github.com:dicodiaz/videogames_rental_server.git
cd videogames_rental_server
```

### Install

1. Install this project with:

```sh
bundle install
```

**Important note:** If you have the RAILS_MASTER_KEY (found in the Heroku app settings), please skip steps 2 to 4

2. Generate the secret key and copy it:

```sh
rake secret
```

3. Remove the `config/credentials.yml.enc` file and run:

```sh
EDITOR="code --wait" rails credentials:edit
```

4. Paste the generated secret key in the credentials file as the following line:

```ruby
devise_jwt_secret_key: <your_secret_key>
```

5. In case you need to, add your database credentials to the `config/database.yml` file under the default section:

```ruby
default: &default
  username: <your_username>
  password: <your_password>
```

Or create a _.env_ file to the root folder and add your DATABASE_PASSWORD in it

```
DATABASE_PASSWORD=<your_password>
```

6. Execute the following command to setup the database and migrate the tables:

```sh
rails db:setup
```

### Usage

To run the project, execute the following commands:

```sh
rails server
```

### Run tests

To run tests, run the following command:

```sh
rspec
```

### Build API docs

To build API docs, run the following command:

```sh
rake rswag:specs:swaggerize PATTERN="spec/requests/swagger/**/*_spec.rb"
```

### Deployment

There's a CD pipeline set up to track the `develop` branch.

Please open a PR from your feature branch to `develop` in order to contribute.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Dico Diaz Dussan**

- GitHub: [@dicodiaz](https://github.com/dicodiaz)
- LinkedIn: [Dico Diaz Dussan](https://www.linkedin.com/in/dico-diaz-dussan/)
- Portfolio: [portfolio.dicodiaz.com.co](https://portfolio.dicodiaz.com.co)

👤 **Luis Sanchez**

- Github: [GitHub](https://github.com/sanieni6/)
- Twitter: [Twitter](https://twitter.com/its_luis_sz23)
- Linkedin: [LinkedIn](https://www.linkedin.com/in/luissanchezz3/)

👤 **Alejandra Keber Maggi**

- GitHub: [@AlejandraKeber](https://github.com/AlejandraKeber)
- Twitter: [@KeberAlejandra](https://twitter.com/KeberAlejandra)
- LinkedIn: [alejandra-keber](https://www.linkedin.com/in/alejandra-keber)

👤 **David Espino**

- GitHub: [@DavidEspinoG](https://github.com/DavidEspinoG)
- Twitter: [@DavidEspinoG](https://twitter.com/DavidEspinoG)
- LinkedIn: [davidespinog](https://linkedin.com/in/davidespinog)

👤 **Nicolas Olaya**

- GitHub: [@NicolasAndrehh](https://github.com/NicolasAndrehh)
- Twitter: [@nicolasolaya22](https://twitter.com/nicolasolaya22)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/nicolas-olaya/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] Fix rswag specs so they pass when running `rspec`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Project based on [mc_videogames_back
  ](https://github.com/sanieni6/mc_videogames_back)
- A huge thanks to [Microverse](https://www.microverse.org) for their constant support.
- Special thanks to [Murat Korkmaz](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign) for providing the design guidelines.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
