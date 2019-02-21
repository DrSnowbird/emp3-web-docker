# EMP3-Web Docker (EMP3-Web Developer Kit Environment)
[![](https://images.microbadger.com/badges/image/openkbs/emp3-web-docker.svg)](https://microbadger.com/images/openkbs/emp3-web-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/emp3-web-docker.svg)](https://microbadger.com/images/openkbs/emp3-web-docker "Get your own version badge on microbadger.com")

# Reference
* [missioncommand/emp3-web: EMP3-Web](https://github.com/missioncommand/emp3-web/blob/master/devguide/quickstart.html)

# Run
The default behavior is "grunt serve" to launch the Developmental Validation Tool and the web server will be available at
http://localhost:3000/src/validation
```
./run.sh
./run.sh release
./run.sh <other grunt options>
```
Then, open your Web Browser: http://localhost:3000/src/validation

You will see terminal console display message similar to below:
```
Running "concurrent:prepValidation" (concurrent) task
    Running "injector:validation" (injector) task
    Injecting js files (319 files)
    Done, without errors.

    Execution Time (2019-01-19 03:32:46 UTC-0)
    loading tasks          1s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 92%
    injector:validation  88ms  ▇▇▇▇ 8%
    Total 1.1s

    Running "copy:vendorFilesToValidation" (copy) task
    Created 4 directories, copied 28 files
    Done, without errors.

    Execution Time (2019-01-19 03:32:46 UTC-0)
    loading tasks                    1s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 87%
    copy:vendorFilesToValidation  159ms  ▇▇▇▇▇ 13%
    Total 1.2s

Running "webpack-dev-server:start" (webpack-dev-server) task
webpack-dev-server on port 3000  
```

# Build
To build local image.

```
./build.sh
```

# See also 
* [openkbs/docker-atom-editor](https://hub.docker.com/r/openkbs/docker-atom-editor/)
* [openkbs/eclipse-photon-docker](https://hub.docker.com/r/openkbs/eclipse-photon-docker/)
* [openkbs/eclipse-photon-vnc-docker](https://hub.docker.com/r/openkbs/eclipse-photon-vnc-docker/)
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/intellj-vnc-docker](https://hub.docker.com/r/openkbs/intellij-vnc-docker/)
* [openkbs/knime-vnc-docker](https://hub.docker.com/r/openkbs/knime-vnc-docker/)
* [openkbs/netbeans9-docker](https://hub.docker.com/r/openkbs/netbeans9-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/papyrus-sysml-docker](https://hub.docker.com/r/openkbs/papyrus-sysml-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/sublime-docker](https://hub.docker.com/r/openkbs/sublime-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/webstorm-vnc-docker](https://hub.docker.com/r/openkbs/webstorm-vnc-docker/)

# Reference
* [Use npx instead of npm](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)

# Setup Dockerfile to Build behind Corporate Proxies
* See [Docker Proxy](https://docs.docker.com/network/proxy/)

For corporate with proxies, to build the images, you need to setup proxy. The better way to setup proxy for docker build and daemon is to use configuration file and there is no need to change the Dockerfile to contain your proxies setup.

With new feature in docker option --config, you needn't set Proxy in Dockerfile any more.

--config string : Location of client config files (default **"~/.docker/config.json"**)
or environment variable DOCKER_CONFIG

`DOCKER_CONFIG` : The location of your client configuration files.
```
    export DOCKER_CONFIG=~/.docker/config.json
```
It is recommended to set proxy with httpProxy, httpsProxy and ftpProxy in "**~/.docker/config.json**". 

```
{
   "proxies":
   {
       "default":
       {
           "httpProxy": "http://proxy.openkbs.org:8001",
           "httpsProxy": "http://proxy.openkbs.org:8001",
           "ftpProxy": "http://proxy.openkbs.org:8001",
           "noProxy": "127.0.0.1,localhost,.openkbs.org"
       }
   }
}
```
You need to adjust the DNS proxy hostnames according to your your corporate proxy hostnames or IP addresses.


# Grunt Tasks Reference
```
Available tasks
         concurrent  Run grunt tasks concurrently *                            
           compress  Compress files. *                                         
             concat  Concatenate files. *                                      
               copy  Copy files. *                                             
             cssmin  Minify CSS *                                              
             jshint  Validate files with JSHint. *                             
             uglify  Minify files with UglifyJS. *                             
              watch  Run predefined tasks whenever watched files change.       
             eslint  Validate files with ESLint *                              
           injector  Inject references to files into other files (think scripts
                     and stylesheets into an html file) *                      
              jsdoc  Generates source documentation using jsdoc *              
    mocha_phantomjs  Run client-side mocha test with phantomjs. *              
             remove  Remove directories and files. *                           
     string-replace  String Replace Task. *                                    
                war  grunt-war generating war. *                               
 webpack-dev-server  Start a webpack-dev-server. *                             
            webpack  Webpack files. *                                          
            default  Alias for "clean", "concurrent:minify", "copy:licenses",  
                     "copy:urlProxyToEMP", "concurrent:copyEnginesToEMP",      
                     "concurrent:prepUnitTestsRelease", "runUnitTests",        
                     "concurrent:prepValidationRelease", "concurrent:build",   
                     "injector:validationRelease", "string-replace",           
                     "copy:appToDist", "copy:devguide" tasks.                  
            release  Alias for "default", "war", "concurrent:compress" tasks.  
              quick  Alias for "clean", "uglify", "cssmin", "copy:app",        
                     "concurrent:copyMinifiedEngines", "copy:min", "jsdoc",    
                     "copy:devguide" tasks.                                    
           quickSDK  Alias for "uglify:sdk", "copy:min" tasks.                 
       quickLeaflet  Alias for "uglify:leaflet", "copy:min" tasks.             
        quickCesium  Alias for "uglify:cesium", "copy:min" tasks.              
      quickDevGuide  Alias for "copy:min", "copy:devguide" tasks.              
               test  Alias for "concurrent:prepUnitTests", "runUnitTests"      
                     tasks.                                                    
        testRelease  Alias for "remove", "concurrent:prepUnitTestsRelease",    
                     "runUnitTests" tasks.                                     
       runUnitTests  Alias for "concurrent:lintAndMocha" task.                 
              clean  Alias for "remove" task.                                  
               lint  Alias for "eslint:sdk" task.                              
                doc  Alias for "jsdoc" task.                                   
             genwar  Alias for "war" task.                                     
                min  Alias for "uglify", "cssmin" tasks.                       
              mocha  Alias for "mocha_phantomjs" task.                         
                zip  Alias for "compress:docs", "compress:devguide",           
                     "compress:emp3" tasks.                                    
              serve  Alias for "eslint:all", "concurrent:prepValidation",      
                     "webpack-dev-server" tasks. 
```

# Releases information
```
root@1b69cb491038:/usr# ./printVersions.sh 
+ echo JAVA_HOME=/usr/java
JAVA_HOME=/usr/java
+ java -version
java version "1.8.0_201"
Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
+ mvn --version
Apache Maven 3.6.0 (97c98ec64a1fdfee7767ce5ffb20918da4f719f3; 2018-10-24T18:41:47Z)
Maven home: /usr/apache-maven-3.6.0
Java version: 1.8.0_201, vendor: Oracle Corporation, runtime: /usr/jdk1.8.0_201/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.15.0-43-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.12
+ python3 -V
Python 3.5.2
+ pip --version
pip 18.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ pip3 --version
pip 18.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ gradle --version

------------------------------------------------------------
Gradle 5.1.1
------------------------------------------------------------

Build time:   2019-01-10 23:05:02 UTC
Revision:     3c9abb645fb83932c44e8610642393ad62116807

Kotlin DSL:   1.1.1
Kotlin:       1.3.11
Groovy:       2.5.4
Ant:          Apache Ant(TM) version 1.9.13 compiled on July 10 2018
JVM:          1.8.0_201 (Oracle Corporation 25.201-b09)
OS:           Linux 4.15.0-43-generic amd64

+ npm -v
6.4.1
+ node -v
v10.15.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.3 LTS"
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

```

# Issues during Build behind Your Corporate Proxy/Firewall
If you see similar issues/warning/error messages below and it means your corporate Proxy is blocking the downloading. You need to setup or export proxy environment variables if you don't want to use the pre-build images from openkbs/emp3-web-docker docker hub repo.

```
Cannot download "https://github.com/sass/node-sass/releases/download/v3.13.1/linux-x64-64_binding.node": 
HTTP error 404 Not Found
Hint: If github.com is not accessible in your location
      try setting a proxy via http_proxy and/or HTTP_PROXY, e.g. 
            export HTTP_PROXY=http://proxy.openkbs.org:8080
            export http_proxy=http://proxy.openkbs.org:8080
or configure npm proxy via, e.g.
            npm config set proxy http://proxy.openkbs.org:8080
```

