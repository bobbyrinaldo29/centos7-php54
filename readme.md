# Tata cara build image

1. Pastikan folder "pear" sudah berada di folder root yang sama dengan file Dockerfile.
    (Jika tidak ada bisa ambil dari Production di "usr/share/pear")

4. Ketik perintah "docker build -t 'centos7-php54' ." untuk mem-build image dan tunggu hingga selesai.

5. Jika selesai ketik perintah
    docker container create --name centos-php54 -p 8054:80 -v /home/userPC/Sites/localhost:/var/www/html/ centos7-php54

6. Ketik perintah "docker start centos-php54" untuk menjalankan Container.

7. Ketik perintah "docker stop centos-php54" jika ingin menghentikan Container.