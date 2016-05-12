# SCOR

Barebones of E-Commerce written on top of Ruby on Rails framework

<p align="center"><img src="https://raw.githubusercontent.com/mertyildiran/SCOR/master/public/images/scor-logo.png"></p>

### Version

0.4.8

### Installation

```Shell
git clone https://github.com/mertyildiran/SCOR.git
cd SCOR/
bundle install
rake db:migrate
rake db:seed
rails server
```

Visit: [http://localhost:3000/](http://localhost:3000/)

### Admin Panel

Create your first user using this form: [http://localhost:3000/users/sign_up](http://localhost:3000/users/sign_up)

After that, set the first user as the admin:

```Shell
rails console
u = User.first
u.admin = true
u.save
exit
```

Make sure you are logged in as admin and visit: [http://localhost:3000/admin](http://localhost:3000/admin)

*Note: If you are not logged in to system you will get an exception which is extremely normal.*

Now you are able to grant whoever you want with Administrative Privileges by checking Admin attribute: [http://localhost:3000/admin/user](http://localhost:3000/admin/user)

### Demo

Visit: [http://scor.dragon.computer/](http://scor.dragon.computer/)

Standard User

Email: **user@dragon.computer**
Password **scoruser**

Admin

Email: **admin@dragon.computer**
Password **scoradmin**

For Admin Panel, visit: [http://scor.dragon.computer/admin](http://scor.dragon.computer/admin)

### Developer

#### Database Autoloading

Write current state of database to seed:

```Shell
rake db:seed:dump
```
