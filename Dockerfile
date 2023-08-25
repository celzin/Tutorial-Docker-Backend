FROM node:lts-alpine
RUN mkdir -p /home/ubuntu/backLaboratorioSO/node_modules && chown -R node:node /home/ubuntu/backLaboratorioSO
WORKDIR /home/node/api
COPY package.json yarn.* ./
USER node
COPY --chown=node:node . .
EXPOSE 3003