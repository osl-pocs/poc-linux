# PoC for Linux Initial Configuration

This Proof of Concept (PoC) compiles scripts that assist in the initial
configuration of a new Linux server.

Scripts are organized within the `scripts` folder. For more details on what each
script does, open the script and review its contents.

## 1. Install the Initial Dependencies

This step installs the minimum common dependencies required:

```bash
$ ./scripts/install-host-deps.sh
```

## 2. Create the DevOps User

For this PoC, we assume that all commands are run as a specific user: `devops`.
Here’s how to create the `devops` user with initial configurations:

```bash
$ ./scripts/create-devops-user.sh
```

Switch to the `devops` user:

```bash
$ su devops
```

**NOTE:** Ensure you use the `devops` user for all subsequent steps.

## 3. Initial Git Configuration

While not mandatory, we recommend using the following script for initial Git
setup, which includes generating an SSH key for GitHub:

```bash
$ ./scripts/config-git.sh
```

## 4. Install Git Prompt Integration

To manage Git repositories on your server effectively, consider installing a
tool that integrates Git with your prompt. This script installs
`monty/bash-git-prompt` locally:

```bash
$ ./scripts/install-git-prompt.sh
```

Reload your session to apply changes:

```bash
$ source ~/.bashrc
```

## 5. Install Miniforge

If you need to use Conda or install Python packages, installing Miniforge on
your server may be necessary:

```bash
$ ./scripts/install-miniforge.sh
```

Reload your session after installation:

```bash
$ source ~/.bashrc
```

## 6. Install Docker and Execute Post-Install Steps

To run Docker on your server, use the following script, which follows Docker’s
recommended installation steps, including post-install procedures:

```bash
$ ./scripts/install-docker.sh
```
