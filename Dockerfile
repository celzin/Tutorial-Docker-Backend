FROM node:alpine
#RUN mkdir -p /home/ubuntu/backLaboratorioSO/node_modules && chown -R node:node /home/ubuntu/backLaboratorioSO
WORKDIR /usr/app
COPY package.json *.* ./
RUN npm install
COPY . .
EXPOSE 3003
CMD npm start