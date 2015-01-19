# shelltoolbox

Welcome to my shell toolbox.

Get the script:

    $ curl -O ncarlier.github.io/shelltoolbox/echo

Run the script:

    $ curl -s ncarlier.github.io/shelltoolbox/echo | sh

With arguments:

    $ curl -s ncarlier.github.io/shelltoolbox/echo | bash -s -- arg1 arg2

## Scripts

### Backup

- Monitoring backup job: [/scripts/backup/monitor-job]()

### Deployment

- Init script for node js: [/scripts/deploy/init.d/node-service](/scripts/deploy/init.d/node-service)
- Init script for apache tomact: [/scripts/deploy/init.d/tomcat-service](/scripts/deploy/init.d/tomcat-service)
- Deployment script for node js app: [/scripts/deploy/bin/node-deploy](/scripts/deploy/bin/node-deploy)

### Proxy

- Export proxy configuration: [/scripts/proxy/proxy-exports.sh](/scripts/proxy/proxy-exports.sh)
- Proxy command for git: [/scripts/proxy/gitproxy](/scripts/proxy/gitproxy)
- Make SSH proxy: [/scripts/proxy/mkproxy](/scripts/proxy/mkproxy)
- Proxy command wrapper: [/scripts/proxy/proxy](/scripts/proxy/proxy)
- No proxy command wrapper: [/scripts/proxy/noproxy](/scripts/proxy/noproxy)

### Video

- Make timelapse from images with mencoder: [/scripts/video/mk-timelapse](/scripts/video/mk-timelapse)
- Make webcam streaming server with vlc: [/scripts/video/mk-webcam-stream](/scripts/video/mk-webcam-stream)
- Show webcam with mplayer: [/scripts/video/show-webcam](/scripts/video/show-webcam)
- Capture video with mencoder: [/scripts/video/capture-video](/scripts/video/capture-video)

### Misc

- Remove old kernel versions: [/scripts/misc/clean-kernel](/scripts/misc/clean-kernel)
- Create SSL certificate: [/scripts/misc/create-ssl](/scripts/misc/create-ssl)
- Create download basket: [/scripts/misc/dlbasketd](/scripts/misc/dlbasketd)
- Dump HTTP header with tcpdump: [/scripts/misc/dump-http-header](/scripts/misc/dump-http-header)
- Download java from Oracle website: [/scripts/misc/getjava](/scripts/misc/getjava)
- Import photos with gphoto2: [/scripts/misc/import-photo](/scripts/misc/import-photo)
- Create thumbnails from a directory: [/scripts/misc/mkthumb](/scripts/misc/mkthumb)
- Use mail for UPS notification: [/scripts/misc/nut-notify](/scripts/misc/nut-notify)


