## Setup
- First step is to contact your bank to request EBICS access and sign the needed documents.
- They might ask for an IP address and only allow requests from this address.
- Find your banks EBICS parameters, eg [EBICS parameters UBS] (http://media.topal.ch/Public/Downloads/ISO20022/EBICS/Financial_Institut/UBS/ubs_keyport_connection_parameters.pdf) or  [EBICS parameters for Zürcher Kantonalbank ](https://www.zkb.ch/media/dok/efinance/ebics-verbindungsparameter.pdf) (in German). Please check your own banks instructions. 
- In addition your bank will provide you with more parameters such as user id.
- Put those parameters in the `ebics.txt` properties file in the `$HOME/ebics/client` directory - check `ebics-template.txt`.

## Compile the project (minimum java 1.88)

      mvn install

      mvn exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--help"



## Usage

Once you configured `ebics.txt` you can create the user and send the `INI` and `HIA` request.

      mvn exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--create"

      mvn exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--ini --hia"

Then you need to print the generated initialization letters, they are generated in text format, you can convert them to PDF if you prefer:
The letter are in `./client/users/<userId>/letters/`

    recode utf-8..latin1 < A005Letter.txt | enscript  --output=-  | ps2pdf - > A005Letter.pdf
    recode utf-8..latin1 < E002Letter.txt | enscript  --output=-  | ps2pdf - > E002Letter.pdf
    recode utf-8..latin1 < X002Letter.txt | enscript  --output=-  | ps2pdf - > X002Letter.pdf

Print them and send them to your bank. They will then compare the letters with the INI and HIA request you sent and activate your account.

After this you can send the `HPB` request to fetch the bank parameters.

    mvn exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--hpb"

Then you need to compare the if the bank encryption keys from the `HPB` request match with the keys you see in your documents.

Now the client is ready to use, you can fetch the account data with a `STA` request

    mvn exec:java  -Dexec.mainClass=org.kopi.ebics.client.EbicsClient -Dexec.args="--sta -o sta.txt"


## Usage with docker image

Instead of compiling and maven you may use the docker image directly: 

        docker run e36io/ebics-cli --help

The Ebics client needs a working persisent directory with ebics.txt which also contains the output files - mount an external directory into the docker image: 

        docker run -v $HOME/ebics:/root/ebics e36io/ebics-cli --help


## SOCKS

If your bank allows requests only from a specific IP address (eg your server machine), it is convenient to use a SOCKS proxy so that you can send requests from your local machine during initialization / testing.

    ssh -D localhost:55555  user@yourserver

    mvn exec:java  -DsocksProxyHost=localhost -DsocksProxyPort=55555   .... 

