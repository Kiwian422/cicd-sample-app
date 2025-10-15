#!/bin/bash
set -euo pipefail

cat > app/Dockerfile << _EOF_
FROM node:lts-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
_EOF_

cd app || exit
docker build -t getting-started .
docker run -t -d -p 3000:3000 --name getting-started getting-started
docker ps -a 
# mkdir tempdir
# mkdir tempdir/templates
# mkdir tempdir/static

# cp sample_app.py tempdir/.
# cp -r templates/* tempdir/templates/.
# cp -r static/* tempdir/static/.

# cat > tempdir/Dockerfile << _EOF_
# FROM python
# RUN pip install flask
# COPY  ./static /home/myapp/static/
# COPY  ./templates /home/myapp/templates/
# COPY  sample_app.py /home/myapp/
# EXPOSE 5050
# CMD python /home/myapp/sample_app.py
# _EOF_

# cd tempdir || exit
# docker build -t sampleapp .
# docker run -t -d -p 5050:5050 --name samplerunning sampleapp
# docker ps -a 
