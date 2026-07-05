---
layout: page
title: GitHub
parent: Getting Started
nav_order: 1
has_children: true
permalink: /what_is_git/
---

# What is GitHub and why should I work with it?

GitHub is a universally recognized platform for developers, providing robust version control and collaboration tools.  
Built on Git, an open-source version control system created by Linus Torvalds, GitHub simplifies teamwork by enabling multiple developers to work on the same project, track changes, and merge code seamlessly.

Here are four reasons why you need to learn GitHub:

### 1. **Collaboration and Sharing**

GitHub enables efficient teamwork through features like branching, merging, pull requests, and code reviews. Whether working solo or in a team of thousands, GitHub ensures smooth collaboration and easy sharing of code.

### 2. **Code History and Recovery**

GitHub saves a detailed history of your project, allowing you to revert to earlier versions when necessary. This ensures stability and serves as a safeguard against unintended errors.

### 3. **Backup and Redundancy**

By storing repositories remotely, GitHub protects your work from local machine failures. If your device crashes, simply clone the repository and continue working without any data loss.

### 4. **Essential for the Python Ecosystem**

GitHub is pivotal to the Python community, hosting nearly all major Python libraries such as pandas, NumPy, and TensorFlow. Accessing these repositories allows you to study coding practices, understand features under the hood, and even contribute to open-source projects.

GitHub is a must-know for both academia and industry, the private and public sectors.  
It’s not just a tool for managing code; it’s a vital resource for learning, collaborating, and advancing in software development.

## Read more:

- **GitHub Quickstart**  
  <https://docs.github.com/en/get-started/quickstart/hello-world>
- **A Visual Git Reference**  
  <https://marklodato.github.io/visual-git-guide/index-en.html>

---

## Four Basic GitHub Commands

Below are four essential commands you’ll use frequently when working with Git (and by extension, GitHub). You’ll typically run these from your terminal or command prompt within your local repository folder.

### 1. **git clone**

- **Purpose:** Download (clone) a remote repository to your local machine.
- **Example:**

  ```bash
  git clone https://github.com/username/my-repo.git
  ```
- This creates a new folder named `my-repo` and copies all the repository files into it.

### 2. **git add**

- **Purpose:** Stage changes (new or modified files) to be included in your next commit.
- **Example:**

  ```bash
  git add .
  ```
- The above command stages *all* modified files in the current folder. You can also specify a single file, e.g. `git add filename.py`.

### 3. **git commit**

- **Purpose:** Save your staged changes with a descriptive message. Commits serve as checkpoints in your project history.
- **Example:**

  ```bash
  git commit -m "Add new feature for data processing"
  ```
- Use clear, meaningful messages that explain what’s changed and why.

### 4. **git push**

- **Purpose:** Upload local commits to a remote repository (e.g., GitHub).
- **Example:**

  ```bash
  git push origin main
  ```
- This sends your new commits to the `main` branch on GitHub (or whichever branch you specify).

These commands form the backbone of day-to-day Git usage:

- **clone** to get a remote repo locally,
- **add** to stage files,
- **commit** to record changes, and
- **push** to share your work online.

Mastering them ensures a smooth experience collaborating and maintaining version control on GitHub.

---
