# Shell-Script for removing old version of AWS-CLI2


## Summary

Shell-Script for bash removed past versions remaining after AWS-CLI2 update, leaving the latest version.


----

### Objective

#### Solution


AWS-CLI2 is not provided in a package installer such as pip, so updating with the AWS-distributed installer consumes approximately 210 MB of storage for each version update.
This script keeps only the latest version of the AWS-CLI2 installation file and deletes the older version.

- As an example of the problems caused by AWSCLI2, 20 updates occurred over a two-month period from February 2023 to the end of March 2023, squeezing 8 GB of storage.
- If you have separate installations for the root user and for user privileges, storage is squeezed for the directory where the installation is made (20 updates over 2 months in the aforementioned example would consume 16GB for the two installations)
- If you have only 10GB to 20GB of storage in VPS, cloud instances, containers, etc., the system may become dysfunctional.


----

### Detail

| Software | Version | note |
| :----------- | :--------- | :--- |
| bash| 5.0.17|The environment I built is bash 5.0.17. I guess it will work with bash and zsh under version 5.0, but it is not guaranteed.|


#### Install or update the AWS CLI

Please see there.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


#### Installation directory prerequisites.


##### Installation directory for root privileges.

~~~~
sudo ./aws/install
~~~~

※Note: To update your current installation of the AWS CLI, add your existing symlink and installer information to construct the install command with the --update parameter.


~~~~
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
~~~~


##### Installation directory for user privileges.

~~~~
./aws/install --bin-dir ~/.local/bin --install-dir ~/.local/aws-cli --update
~~~~

----

## Asset

- autoremove-oldawscli2-root.sh

For root privileges for all users (installation directory premise is "/usr/local/aws-cli/v2" and executable file installation directory is "/usr/local/bin")


- autoremove-oldawscli2.sh

For user privileges (the premise of the installation directory is "$HOME/.local/aws-cli/v2" and the installation directory of the executable file is "$HOME/.local/bin")



----

## Details

### Introduction

Please git clone or download the script.

~~~~
git clone autoremove-oldawscli2
~~~~

- autoremove-oldawscli2.sh
- autoremove-oldawscli2-root.sh


### Usage

#### Scripts for root privileges should be run with sudo

~~~~
chmod +x autoremove-oldawscli2-root.sh
sudo autoremove-oldawscli2-root.sh
~~~~

#### Scripts for user privileges should be run with user privileges

~~~~
chmod +x autoremove-oldawscli2.sh
autoremove-oldawscli2.sh
~~~~

----

## Disclaimer

Please understand that we are not responsible for any damage caused by the use of this program.

----

## License

"autoremove-oldawscli2" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License)


