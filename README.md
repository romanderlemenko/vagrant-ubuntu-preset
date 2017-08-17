# Vagrant Ubuntu Preset

This is my preset for Vagrant and Virtualbox with Ubuntu server.

#### Run
Execute the following commands to start the instance. Default password is `vagrant`.
```sh
$ git clone git@github.com:romanderlemenko/vagrant-ubuntu-preset.git
$ cd vagrant-ubuntu-preset
$ vagrant up
$ vagrant ssh
```

To refresh the instance destroy it before bootstraping.
```sh
$ vagrant destroy && vagrant up
```

#### Setup
All the basic settings can be configured in `settings.json` file:
```json
{
    "ubuntu": "trusty64",
    "ip": "192.168.99.99",
    "memory": "2048",
    "cpus": "2",
    "scripts": [
        { "path": "path/to/some/script.sh", "run": "always" },
        { "path": "path/to/another/script.sh", "run": "once"" }
    ]
}
```
