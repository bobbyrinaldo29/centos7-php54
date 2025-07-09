# Tata cara build image

1. Ketik perintah "docker build -t 'centos7-php54' ." untuk mem-build image dan tunggu hingga selesai.

2. Jika selesai ketik perintah
    docker container create --name centos-php54 -p 8054:80 -v /home/userPC/Sites/localhost:/var/www/html/ centos7-php54

3. Ketik perintah "docker start centos-php54" untuk menjalankan Container.

4. Ketik perintah "docker stop centos-php54" jika ingin menghentikan Container.
