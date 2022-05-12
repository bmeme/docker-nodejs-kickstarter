# Node.js docker development kickstarter project
[![Maintained? Yes](https://img.shields.io/badge/Maintained%3F-Yes-success)](https://github.com/bmeme/docker-nodejs-kickstarter) ![GitHub last commit](https://img.shields.io/github/last-commit/bmeme/docker-nodejs-kickstarter) [![GitHub issues](https://img.shields.io/github/issues/bmeme/docker-nodejs-kickstarter)](https://github.com/bmeme/docker-nodejs-kickstarter/issues) ![GitHub top language](https://img.shields.io/github/languages/top/bmeme/docker-nodejs-kickstarter) ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/bmeme/docker-nodejs-kickstarter)

This project can be used as a starter to create a local environment to develop an application with [Node.js](https://nodejs.org/) using [Docker](https://www.docker.com/).

The idea is that you can use docker to develop your Node.js application, without having to install anything on your system.

Top benefits:
 - easy: you can easily configure your environment with the needed tools and versions
 - isolation: you will not mess up your system, anything is containerized and could be cleared in a moment
 - consistency: Docker provides a consistent environment for your application, the same for every developer or system

After the initial configuration, you will prefix your commands with `c` script and act pretty the same as you use to do if you have Node.js installed on your system.

## TL;DR

### 0. Check your requirements

To let anything work, you need to have `docker` and `docker-compose` installed and configured on your system.

### 1. Clone this repository

Start by cloning this repository locally on your system. 

```
git clone git@github.com:bmeme/docker-nodejs-kickstarter.git your-new-project-dir
```

### 2. Define your project name and group

Move to `your-new-project-dir`.
To configure and build your project, run:

```
./bmeme create
```

You will be prompted for a couple of questions, then the script will do all the work for you.

### 3. Check the result

To interact with the container, you can use `.bmeme/bin/c` script.
This script will run the command passed to it inside the container.

After the `bmeme create` command completes successfully, it will print an export command to add `.bmeme/bin` directory to `$PATH`, if needed.

```bash
eval $(./bmeme env)
```

You can check that everything is working by running: 

```
c node --version
```

Eureka! If you can see `node` version probably anything went well, and you can start developing your awesome application!

### 4. (BONUS) Go further!

Go ahead and read how to get the full potential out of your new development environment by understanding the docker environment lifecycle, how to use the wrappers and how to interact directly with your container!

Also if you run `./bmeme` script without arguments you will see basic help with some information about the available commands.

## Example: create a bright new React App

Suppose we want to start a new React application. Here is what you need to do to be up and running in near-zero time.

### 1. Use create-react-app to generate a new React app

We can run `create-react-app` using the `npx` wrapper to generate a new React application:
```
c npx create-react-app app
```
With this command, we are telling `create-react-app` to generate the application in the `app` directory.

### 3. Try it out!

When the application is successfully generated, move to the `app` directory and run it with: 
```
c PORT=80 npm start
```
Pretty straightforward, isn't it?

Note: to access the application with dinghy-http-proxy or dnsdock alias, see `./bmeme` output.


## Example: create a bright new Remix App

Suppose we want to create a React application, using one of [their stacks](https://remix.run/docs/en/v1/pages/stacks). Here is what you need to do to be up and running in near-zero time.

### 1. Use create-remix to generate a new Remix app

We can run `create-react-app` using the `npx` wrapper to generate a new React application:
```
c npx create-remix --template remix-run/indie-stack app
```
With this command, we are telling `create-remix` to generate the application in the `app` directory.

### 3. Try it out!

When the application is successfully generated, move to the `app` directory and run it with: 
```
c PORT=80 npm run dev
```
Pretty straightforward, isn't it?

Note: to access the application with dinghy-http-proxy or dnsdock alias, see `./bmeme` output.

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



## Access the container

You can use the `.bmeme/bin/c` script to exec a shell inside the container.

```
c bash
```

## Contributing

Any feedback, bug reports or ideas are extremely welcome.

Reach us through our [website](https://www.bmeme.com) or send us an email at [info@bmeme.com](mailto:info@bmeme.com).

## License

[MIT](https://choosealicense.com/licenses/mit/)

## References

- [BMEME Digital Factory](https://www.bmeme.com)
- [Node.js Docker official images](https://hub.docker.com/_/node)
- [Create a new React App](https://reactjs.org/docs/create-a-new-react-app.html)
- [Create a new Remix App](https://remix.run/docs/en/v1/tutorials/blog#creating-the-project)
