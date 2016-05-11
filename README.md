# SCOR

Barebones of E-Commerce written on top of Ruby on Rails Framework

### Version

0.4.0

### Installation

```Shell
bundle install
rake db:migrate
rake db:seed
rails server
```

Visit: [http://localhost:3000/](http://localhost:3000/)

### Admin Panel

Create your first user using this form: [http://localhost:3000/users/sign_up](http://localhost:3000/users/sign_up)

After that, set first user as the admin:

```Shell
rails console
u = User.first
u.admin = true
u.save
exit
```

Make sure you are logged in as admin and visit: [http://localhost:3000/admin](http://localhost:3000/admin)

*Note: If you are not logged in to system you will get an exception which is extremely normal.*

### Developer

Write current state of database to seed:

```Shell
rake db:seed:dump
```
