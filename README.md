<h1 align="center" id="title">ansible-pull</h1>

<p id="description">This project uses Ansible in combination with a bootstrap script to deploy some of my favorite tools for Linux. Currently I only use it on WSL2 with Ubuntu but I am planning to use it for all kind of workstations.</p>

  
  
<h2>🧐 Features</h2>

Here're some of the project's best features:

*   Dist-Upgrade
*   IaC-Inspired
*   Tasks-Seperated

<h2>🛠️ Installation Steps:</h2>

<p>1. Verify that curl is avaible</p>

```
which curl
```

<p>2. If curl is not avaible run</p>

```
sudo apt install curl
```

<p>3. Copy the follwing command to your bash</p>

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/N0nTr0x/ansible_pull_wsl/main/bootstrap.sh)"
```

<p>4. Or use wget</p>

```
sh -c "$(wget https://raw.githubusercontent.com/N0nTr0x/ansible_pull_wsl/main/bootstrap.sh -O -)"
```

  
  
<h2>💻 Built with</h2>

Technologies used in the project:

*   Ansible
