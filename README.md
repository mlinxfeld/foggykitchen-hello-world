# FoggyKitchen Hello World

## Project description

With the OCI DevOps service and this project, you'll be able to build, test and deploy this application to Oracle Container Engine for Kubernetes (OKE) via K8S manifest files.

## How to use code 

### Using docker

If you want to build and test it locally on your own laptop or server then you should run the commands as follows:

**STEP1.** Clone the repo and go into the cloned directory:

```shell
[opc@myserver opc]$ git clone https://github.com/mlinxfeld/foggykitchen-hello-world
Cloning into 'foggykitchen-hello-world'...
remote: Enumerating objects: 57, done.
remote: Counting objects: 100% (57/57), done.
remote: Compressing objects: 100% (46/46), done.
remote: Total 57 (delta 19), reused 42 (delta 9), pack-reused 0
Unpacking objects: 100% (57/57), done.

[opc@myserver opc]$ cd foggykitchen-hello-world
```
**STEP2.** Build the image with build.sh script:

```shell
[opc@myserver foggykitchen-hello-world]$ ./build.sh
Sending build context to Docker daemon  3.642MB
Step 1/15 : FROM nginx:1.14.2
 ---> 295c7be07902
Step 2/15 : COPY ./config/nginx.conf /etc/nginx/nginx.conf
 ---> Using cache
 ---> 2fb5f76c4067
Step 3/15 : RUN mkdir /etc/nginx/conf/
 ---> Using cache
 ---> 87312f621876
Step 4/15 : COPY ./config/mime.types /etc/nginx/conf/mime.types
 ---> Using cache
 ---> 1edd25d32a7b
Step 5/15 : COPY ./config/fastcgi.conf /etc/nginx/fastcgi.conf
 ---> Using cache
 ---> b90ef5e1f85c
Step 6/15 : COPY ./config/proxy.conf /etc/nginx/proxy.conf
 ---> Using cache
 ---> e16bbc8046f6
Step 7/15 : RUN mkdir /usr/share/nginx/html/js
 ---> Using cache
 ---> 2070ceb4adc9
Step 8/15 : RUN mkdir /usr/share/nginx/html/css
 ---> Using cache
 ---> 9cac644445b2
Step 9/15 : RUN mkdir /usr/share/nginx/html/img
 ---> Using cache
 ---> 2153db7ab05e
Step 10/15 : COPY ./src/ /usr/share/nginx/html/
 ---> Using cache
 ---> 77730b7075a7
Step 11/15 : COPY ./src/js /usr/share/nginx/html/js
 ---> Using cache
 ---> 64887c392a10
Step 12/15 : COPY ./src/css /usr/share/nginx/html/css
 ---> Using cache
 ---> 24fcd969913b
Step 13/15 : COPY ./src/img /usr/share/nginx/html/img
 ---> Using cache
 ---> 5c7700cf2c34
Step 14/15 : EXPOSE 80
 ---> Using cache
 ---> 56783e8ba2dd
Step 15/15 : CMD nginx -g "daemon off;"
 ---> Using cache
 ---> a6d63c3cb178
Successfully built a6d63c3cb178
Successfully tagged foggykitchen-hello-world:latest
```

**STEP3.** Execure run.sh script and check docker processes:

```shell
[opc@myserver foggykitchen-hello-world]$ ./run.sh

[opc@myserver ~]$ docker ps
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                NAMES
e2c778cdfeb0        foggykitchen-hello-world   "/bin/sh -c 'nginx -…"   37 seconds ago      Up 35 seconds       0.0.0.0:80->80/tcp   fk-hello-world
```
**STEP4.** Access the application with curl:

```shell
[opc@myserver foggykitchen-hello-world]$ curl localhost
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>FOGGYKITCHEN.XYZ</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" type="text/css">
  </head>
  <body>
    <header>
      <nav class="top-menu" id="top-menu"></nav>
      <div id="mobile-menu" class="mobile-menu">
        <div class="mobile-logo">
          <img src="img/foggykitchen_logo.jpeg"></i>
        </div>
        <button class="hamburger-button">
          <i id="hamburger-icon" class="fas fa-bars"></i>
        </button>
        <nav id="mobile-nav" class="mobile-nav slide-in">
        </nav>
      </div>
    </header>
    <main>
      <div id="content" class="content">
        <div class="maincontainer">
          <div class="leftpane">
            <h3>FOGGYKITCHEN.XYZ</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          </div>
          <div class="rightpane">
              <img src="img/foggykitchen.png" alt="Image 1">
          </div>
          <div class="bottompane">
             <img src="img/foggykitchen.png" class="bottompane-image" alt="Image 1">
          </div>
        </div>
      </div>
    </main>
    <script src="js/topmenu.js"></script>
    <footer>
      <div class="footercontainer">
        <p>&copy; 2023 FOGGYKITCHEN.XYZ. All rights reserved.</p>
      </div>
    </footer>
  </body>
</html>
```
**STEP5.** If server has been exposed to public Internet you can check web browser access:

<img width="1461" alt="image" src="https://github.com/mlinxfeld/foggykitchen-hello-world/assets/44723865/3bc04370-7b65-47bd-b622-ba22e49c7fc9">
