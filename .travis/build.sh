source /etc/profile.d/devkit-env.sh

# Install ctrulib
apt-get install unzip
cd build_dir
curl -LJO https://github.com/smealum/ctrulib/archive/v1.5.1.zip
unzip ctrulib-1.5.1.zip -d ctrulib
cd ctrulib/ctrulib-1.5.1/libctru 
make install release -j

# Install armips, firmtool and makerom
cd /build_dir
curl -LJO https://ev1l0rd.s-ul.eu/mEIk4atQ
unzip armips-5996abc.zip -d armips
cd armips/armips-5996abc/x86_64
chmod +x armips
echo $PWD
cp -s $PWD/armips /usr/bin/armips

apt-get update && apt-get install python3 python3-pip -y
pip3 install cryptography
pip3 install git+https://github.com/TuxSH/firmtool.git

cd /build_dir
curl -LJO https://cdn.discordapp.com/attachments/356378491375190016/554910371052519464/makerom
chmod +x makerom
cp -s $PWD/makerom /usr/bin/makerom

# Finally clone and build luma3ds
git clone https://github.com/AuroraWright/Luma3DS.git 
cd Luma3DS
make firm -j2
