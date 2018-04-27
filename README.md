# SCOR

<img src="https://raw.githubusercontent.com/mertyildiran/SCOR/master/public/images/scor-logo.png" align="right" height="24px"/>

Barebones of E-Commerce written on top of Ruby on Rails framework

<p align="center">
  <img src="http://i.imgur.com/JAWjmTu.png" alt="Screenshot 1" height="200px"/>
  <img src="http://i.imgur.com/kID5Te5.png" alt="Screenshot 2" height="200px"/>
</p>
<p align="center">
  <img src="http://i.imgur.com/8oC2Qpd.png" alt="Screenshot 3" height="200px"/>
  <img src="http://i.imgur.com/fGlOMhs.png" alt="Screenshot 4" height="200px"/>
</p>

### Version

0.5.7

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

*Note: If you are not logged in to the system you will get an exception which is extremely normal.*

Now you are able to grant whoever you want with Administrative Privileges by marking as Admin: [http://localhost:3000/admin/user](http://localhost:3000/admin/user)

<br><br>

### Developer

#### Database Autoloading

Write current state of database to seed:

```Shell
rake db:seed:dump
```

After that, whenever you want autoload your dump:

```Shell
rake db:seed
```

#### Rebuilding Your Database (for Testing)

```Shell
rake db:drop:all
rake db:create:all
rake db:migrate
rake db:test:prepare
```

#### Testing

##### Unit Tests

```Shell
rake test:units
```

##### Functional Tests

```Shell
rake test:functionals
```

##### Integration Tests

```Shell
rake test:integration
```

##### Benchmarking

```Shell
rake test:benchmark
```

##### Profiling

```Shell
rake test:profile
```

Alternatively, run all unit, functional and integration tests with profiling and benchmarking:

```Shell
rake test
```

**CAUTION:** Warnings can turn *stdout* to a mess. On that case use `RUBYOPT=W0` option. Example: `rake test:benchmark RUBYOPT=W0`
