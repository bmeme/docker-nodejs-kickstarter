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

To use this build, you need to have [Memento](https://github.com/bmeme/memento), [Memento Kickstarter plugin](https://github.com/bmeme/memento-kickstarter) and [Memento Docker plugin](https://github.com/bmeme/memento-docker) installed.

### 1. Init a new project with memento kickstarter

Start by creating a new project using this repository as template.
```bash
memento kickstarter create nodejs
```

### 2. Define your project name and group

Move to your new project dir and run `memento docker configure`.
You will be asked a couple of questions to complete the project startup.
If everything is ok you will see a basic help with some information about the available commands.

To create the docker environment for your project, run:
```bash
memento docker configure create
```

### 3. Check the result

To interact with the container, you can use `memento docker cmd`.
It will run the command passed to it inside the container.

You can check that everything is working by running:
```bash
memento docker cmd node --version
```

Eureka! If you can see `node` version probably anything went well, and you can start developing your awesome application!

### 4. (BONUS) Go further!

Go ahead and read how to get the full potential out of your new development environment by understanding the docker environment lifecycle, how to use the wrappers and how to interact directly with your container!

## Example: create a bright new React App

Suppose we want to start a new React application. Here is what you need to do to be up and running in near-zero time.

### 1. Use create-react-app to generate a new React app

We can run `create-react-app` using the `npx` wrapper to generate a new React application:
```
memento docker cmd npx create-react-app app
```
With this command we are telling `create-react-app` to generate the application in the `app` directory.

### 3. Try it out!

When the application is successfully generated, move the `app` directory and run it with: 
```
memento docker cmd PORT=80 npm start
```
Pretty straightforward, isn't it?

Note: to access the application with dinghy-http-proxy or dnsdock alias, see `memento docker configure` output.


## Access the container

You can run a shell directly inside the container:

```bash
memento docker cmd bash
```

## Contributing

Any feedback, bug reports or ideas are extremely welcome.

Reach us through our [website](https://www.bmeme.com) or send us an email at [info@bmeme.com](mailto:info@bmeme.com).

## License

[MIT](https://choosealicense.com/licenses/mit/)

## References

- [BMEME Digital Factory](https://www.bmeme.com)
- [Memento](https://github.com/bmeme/memento)
- [Memento Kickstarter plugin](https://github.com/bmeme/memento-kickstarter)
- [Memento Docker plugin](https://github.com/bmeme/memento-docker)
- [Node.js Docker official images](https://hub.docker.com/_/node)
- [Create a new React App](https://reactjs.org/docs/create-a-new-react-app.html)
