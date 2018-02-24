VERSION=3.6.4

sudo apt-get update
sudo apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev -y
wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tar.xz
tar xf Python-${VERSION}.tar.xz
cd Python-${VERSION}
./configure
make
sudo make altinstall

echo "Delete the source code and uninstall all previously installed packages? {Y/N} (Case sensitive!)"
read ans
if [ans = "Y"] 
then
sudo rm -r Python-${VERSION}
rm Python-${VERSION}.tgz
sudo apt-get --purge remove build-essential tk-dev
sudo apt-get --purge remove libncurses5-dev libncursesw5-dev libreadline6-dev
sudo apt-get --purge remove libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
sudo apt-get --purge remove libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
sudo apt-get autoremove
sudo apt-get clean
else
echo "Done!"
fi
