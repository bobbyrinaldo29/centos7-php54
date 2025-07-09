# How to build this Docker Image

1. Open Terminal.
2. Build the Docker Image with this command and wait until process is complete.
    ```bat
        docker build -t 'centos7-php54' .
    ```
3. Create a folder named `local_container` in `/home/your-user/`

4. Inside `local_container` folder, create a `log` folder and set its permissions to 777.

5. Create the Container :<br/>
    ```bat
        docker container create --name centos-php54 -p 8054:80 -v /home/your-user/local_container/:/var/www/html/ centos7-php54
    ```
   Note: change `your-user` with user on your operating system.

6. Start the Container.
    ```bat
        docker start centos-php54
    ```

7. Stop the Container.
    ```bat
        docker stop centos-php54
    ```

## Information on this Image
1. centos 7
2. php version 5.4.16
