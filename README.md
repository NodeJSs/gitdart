# Gitdart
Gitdart is a cli app that fetches information about github users

## Features
1. You can search for multiple users at once
2. Results are cached for offline use

## Installing Gitdart
   ```
    pub global activate -sgit https://github.com/NodeJSs/gitdart.git
   ```
## Using Gitdart
1. Fetching a single user
    ```
    gitdart -u NodeJSs
    ```
    or
    ```
    gitdart --user NodeJSs
    ```
2. Fetching multiple users
    ```
    gitdart -u NodeJSs,bamiogunfemi
    ```
