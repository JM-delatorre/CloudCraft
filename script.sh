sudo apt update
sudo apt install openjdk-17-jre-headless
sudo apt install screen

# NORMAL
wget "https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar"

java -Xmx1024M -Xms1024M -jar server.jar nogui
echo "eula=true" > eula.txt

screen -d -m java -Xmx1024M -Xms1024M -jar server.jar nogui

#MODS FORGE
wget "https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.2.0/forge-1.20.1-47.2.0-installer.jar"

java -jar <serverFile> --installServer

./run.sh

echo "eula=true" > eula.txt
echo "-Xmx4G" >> user_jvm_args.txt

screen -d -m ./run.sh


#MODS FABRIC
curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.15.10/1.0.1/server/jar

mv fabric-server-mc.1.20.4-loader.0.15.10-launcher.1.0.1.jar server.jar

screen -d -m java -Xmx4G -jar server.jar nogui



