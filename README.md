![](https://img.shields.io/badge/Microverse-blueviolet)

# Budget app

> The Budget app its a mobile app that allows the user to manage his/her finacial transactions. The user can create diferents categories and inside them all the transactions.
- (Heroku link)[https://tranquil-oasis-26787.herokuapp.com/]
- (Project presentation video)[https://www.loom.com/share/76fdda8c2bbb4949bdbc55d98efaead8]

## Built With

- Ruby on Rails
- PostgreSQL
- devise / devise-jwt - for authentication
- cancancan - for authorization

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

### Setup

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone https://github.com/emiliazm/budget-app.git
cd budget-app
bundle install
```

- You will need a `.env` file before you install and run the project. The `.env` file contains environment variables needed to deploy the webpage. There is a commented `.env.example` file you can use as a guide to configure your own. Type the following commands into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```
cp .env.example .env

rails secret
```

- Edit file .env

  - Provide the values for the variables
    - DATABASE_HOST
    - DATABASE_USER
    - DATABASE_PASSWORD
    - DEVISE_JWT_SECRET_KEY
  - Assign the value returned by the `rails secret` to DEVISE_JWT_SECRET_KEY.

- Type this commands into the terminal:

```
rails db:reset
```

### Run application

- Type this command into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Testing

- Type this command into the terminal:

```
rspec
```

## Authors

👤 **Emilia Zambrano**

- GitHub: [@emiliazm](https://github.com/emiliazm)
- Twitter: [@emilia_zm](https://twitter.com/emilia_zm)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/emiliazm/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/) for the motivation.
- Design: Original design idea by (Gregoire Vella on Behance)[https://www.behance.net/gregoirevella]

## 📝 License

This project is [MIT](./MIT.md) licensed.
