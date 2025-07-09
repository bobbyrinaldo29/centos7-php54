# How to build this Image

1. Open Terminal.
2. Build Image with this command and wait until it's done
   ```bat
       docker build -t 'centos7-php54' .
   ```

3. Then, let's create a Container :<br/>
   ```bat
       docker container create --name centos-php54 -p 8054:80 -v /home/userPC/Sites/localhost:/var/www/html/ centos7-php54
   ```
   Note: change 'userPC' with user on your operating system.

4. Start Container.
   ```bat
       docker start centos-php54
   ```

5. Stop Container.
   ```bat
       docker stop centos-php54
   ```

## Information on this Image
1. centos 7
2. php version 5.4.16
