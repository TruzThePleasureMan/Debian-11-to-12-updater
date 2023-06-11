## Debian 11 to 12 updater

## Disclaimer before usage

This update will take a couple gigabytes in disk space, I recommend you have at least 5GB of free space before running this script.

I would as well recommend to run `sudo apt --purge autoremove` -y after the upgrade is done, this is to just clear up some space.

## Usage

### Recommended to run as root

```bash
wget -O update.sh https://raw.githubusercontent.com/TruzThePleasureMan/Debian-11-to-12-updater/master/update.sh && chmod +x update.sh && ./update.sh
```

## Why was this made?

I wrote this little script just to semi-automate the update from Debian 11, to 12. This script is meant to be used if you're lazy like me, or for large scale deployments.

If this script is causing any issues, please open an issue, or a pull request.

# Improvements?

If you have any improvements, please open a pull request, or an issue.
