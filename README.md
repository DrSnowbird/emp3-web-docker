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
(or other grunt 
Then,
   Open Web Browser: http://localhost:3000/src/validation
```
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
```
./build.sh
```
# Setup Dockerfile to Build behind Corporate Proxies
* See [Docker Proxy](https://docs.docker.com/engine/reference/commandline/cli/ https://docs.docker.com/network/proxy/)

For corporate with proxies, to build the images, you need to setup proxy. The better way to setup proxy for docker build and daemon is to use configuration file and there is no need to change the Dockerfile to contain your proxies setup.

With new feature in docker option --config, you needn't set Proxy in Dockerfile any more.

--config string : Location of client config files (default **"~/.docker/config.json"**)
or environment variable DOCKER_CONFIG

`DOCKER_CONFIG` : The location of your client configuration files.

$ export DOCKER_CONFIG=~/.docker/config.json
It is recommended to set proxy with httpProxy, httpsProxy and ftpProxy in "**~/.docker/config.json**". You need to adjust the DNS proxy hostname accordign to your specifics of your corporate proxy.
```
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://proxy.openkbs.org:3001",
     "httpsProxy": "http://proxy.openkbs.org:3001",
     "ftpProxy": "http://proxy.openkbs.org:3001",
     "noProxy": "127.0.0.1,localhost,.openkbs.org"
   }
 }
}
```
Adjust proxy IP and port as needed and then save to ~/.docker/config.json

# Grunt Tasks
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
