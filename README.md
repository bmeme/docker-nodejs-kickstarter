# Node.js docker development kickstarter project
[![Maintained? Yes](https://img.shields.io/badge/Maintained%3F-Yes-success)](https://github.com/bmeme/docker-nodejs-kickstarter) ![GitHub last commit](https://img.shields.io/github/last-commit/bmeme/docker-nodejs-kickstarter) [![GitHub issues](https://img.shields.io/github/issues/bmeme/docker-nodejs-kickstarter)](https://github.com/bmeme/docker-nodejs-kickstarter/issues) ![GitHub top language](https://img.shields.io/github/languages/top/bmeme/docker-nodejs-kickstarter) ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/bmeme/docker-nodejs-kickstarter)

This project can be used as a starter to create a local environment to develop an application with [Node.js](https://nodejs.org/) using [Docker](https://www.docker.com/).

The idea is that you can use docker to develop your Node.js application, without having to install anything on your system.

Top benefits:
 - easy: you can easily configure your environment with the needed tools and versions
 - isolation: you will not mess up your system, anything is containerized and could be cleared in a moment
 - consistency: Docker provides a consistent environment for your application, the same for every developer or system

After the initial configuration, you will use the wrappers `./npm` and `./npx` and act pretty the same as you use to do if you have Node.js installed on your system.

## TL;DR

### 0. Check your requirements

To let anything works, you need to have `docker` and `docker-compose` installed and configured on your system.

### 1. Clone this repository

Start by cloning this repository locally on your system. 

```
git clone git@github.com:bmeme/docker-nodejs-kickstarter.git your-new-project-dir
```

Move `your-new-project-dir` and remove `.git` directory.
```
cd your-new-project-dir && rm -rf .git LICENSE
```

### 2. Define your project name and group

Edit the configuration file `.env`, changing placeholders to fit your needs. You can retrieve your UID and GID running `id -u` and `id -g`, respectively.

A configured `.env` file will look like the following:

```env
# Custom variables.
PROJECT_NAME=awesomeidea
PROJECT_VENDOR=mystartup

FIX_UID=501
FIX_GID=20

PROJECT_PORT=3000

# Compose CLI environment variables.
# @see https://docs.docker.com/compose/reference/envvars
COMPOSE_PROJECT_NAME=${PROJECT_NAME}_${PROJECT_VENDOR}
COMPOSE_FILE=.bmeme/docker-compose.yml
```

### 3. Start the docker environment

Now you can let `docker` create and start your local development environment. 

To do this, it's enough to run:

```bash
docker-compose up -d
```

After this command completes successfully, you can check that everything is working by running: 

```
./npm --version
```
Eureka! If you can see `npm` version probably anything went well, and you can start developing your awesome application!

### 4. (BONUS) Go further!

Go ahead and read how to get the full potential out of your new development environment by understanding the docker environment lifecycle, how to use the wrappers and how to interact directly with your container!

## Example: create a bright new React App

Suppose we want to start a new React application. Here is what you need to do to be up and running in near-zero time.

### 1. Clear the app directory

The `app` directory is mounted in the container and represents the working dir of our project.
To create a new application we need to remove the `.gitkeep` file first.

```
rm -f app/.gitkeep
```

### 2. Use create-react-app to generate a new React app

We can run `create-react-app` using the `npx` wrapper to generate a new React application:
```
./npx create-react-app --use-npm .
```
With this command we are telling `create-react-app` to generate the application in the current directory, that is `app` in the container.

### 3. Try it out!

When the application is successfully generated, we can run it with: 
```
./npm start
```
We can access our brand new React app opening http://localhost:3000 (on linux) or http://awesomeidea.mystartup.docker (on macos) with our browser .
Pretty straightforward, isn't it?

## Docker environment lifecycle

This project creates a docker environment that you can use to develop and build your Node.js application. 
The docker environment lifecycle could be summarized as follow: `build`, `start`, `stop` and `clean`.

![Docker Environment Lifecycle](https://user-images.githubusercontent.com/445544/122754211-a5494500-d293-11eb-85a6-13a1d3657daa.jpg)

To create the docker development environment, you will use the following command:

```
$ docker-compose up -d
```

This command prepares and starts a container where you will run your application.

To check the status, use `docker-compose ps`.
For example, if the container is up and running you will see something like this:

```
$ docker-compose ps
           Name                     Command         State   Ports
-----------------------------------------------------------------
awesomeidea_mystartup_app_1   /bin/sleep infinity   Up
```

When you don't need to use your development environment, you can stop it:
```bash
docker-compose stop
```

Of course, you can start it again when you come back to development:
```bash
docker-compose start
```

In case you want to wipe out your docker environment, you can clean up everything with:
```bash
docker-compose down -v
```

To summarize: you need to create the docker development environment only the first time, or after a wipeout. Once the docker environment exists, you can start and stop as you need id.


## Using the wrappers

Run `npm` or `npx` commands using the wrappers:

```bash
$ ./npm --version
8.1.2
$ ./npx --version
8.1.2
```

If you need to run other commands inside the container, you can run it with `.bmeme/bin/app`

```
$ .bmeme/bin/app node --version
v16.13.1
```

## Access the container

You can use the `.bmeme/bin/app` wrapper to exec commands in the container.
If you run the script without anything, you will access a shell inside the container itself.

```
.bmeme/bin/app node
```

## Contributing

Any feedback, bug reports or ideas are extremely welcome.

Reach us through our [website](https://www.bmeme.com) or send us an email at [info@bonsaimeme.com](mailto:info@bonsaimeme.com).

## License

[MIT](https://choosealicense.com/licenses/mit/)

## References

- [Node.js Docker official images](https://hub.docker.com/_/node)
- [BMEME Digital Factory](https://www.bmeme.com)
- [Create a new React App](https://reactjs.org/docs/create-a-new-react-app.html)
