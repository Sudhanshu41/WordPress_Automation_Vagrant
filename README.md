# 🚀 WordPress Automated Setup using Vagrant

This project demonstrates how to automatically set up a **WordPress development environment** using **Vagrant and Ubuntu**.

The goal of this project is to practice **Infrastructure as Code (IaC)** by automating the installation and configuration of a complete web server environment.

Using **Vagrant provisioning**, the virtual machine automatically installs and configures:

* Apache Web Server
* MySQL Database
* PHP
* WordPress

---

# 🛠 Technologies Used

| Technology   | Purpose                    |
| ------------ | -------------------------- |
| Vagrant      | Virtual machine management |
| VirtualBox   | Virtualization provider    |
| Ubuntu Linux | Operating system           |
| Apache       | Web server                 |
| MySQL        | Database                   |
| PHP          | Backend language           |
| WordPress    | Content Management System  |

---

# 📁 Project Structure

```
wordpress-vagrant-environment
│
├── Vagrantfile
├── scripts
│   └── bootstrap.sh
├── screenshots
│   └── wordpress-running.png
├── README.md
└── .gitignore
```

---

# ⚙️ How It Works

When the virtual machine starts, the provisioning script automatically performs the following tasks:

1️⃣ Updates Ubuntu system packages
2️⃣ Installs Apache Web Server
3️⃣ Installs MySQL Database
4️⃣ Installs PHP and required extensions
5️⃣ Downloads and extracts WordPress
6️⃣ Configures Apache virtual host
7️⃣ Creates MySQL database and user
8️⃣ Connects WordPress with the database

This automation allows the **entire development environment to be recreated with a single command.**

---

# 📋 Requirements

Before running this project, make sure the following tools are installed:

* Vagrant
* VirtualBox
* Git

---

# ▶️ How to Run the Project

### 1️⃣ Clone the repository

```
git clone https://github.com/Sudhanshu41/wordpress-vagrant-environment.git
```

### 2️⃣ Navigate to the project directory

```
cd wordpress-vagrant-environment
```

### 3️⃣ Start the virtual machine

```
vagrant up
```

### 4️⃣ Open the website

```
http://192.168.56.24
```

WordPress setup page should appear.

---

# 📸 Screenshot

WordPress running on the Vagrant virtual machine.

---

# 🎯 Learning Objectives

This project was created to practice:

* Infrastructure as Code (IaC)
* Automated environment provisioning
* Linux server configuration
* Vagrant based development environments

---

# 👨‍💻 Author

**Sudhanshu Kumar**
