FROM node:lts-alpine
RUN mkdir -p /home/ubuntu/backLaboratorioSO/node_modules && chown -R node:node /home/ubuntu/backLaboratorioSO
WORKDIR /home/ubuntu/backLaboratorioSO
COPY package.json *.* ./
USER node
COPY --chown=node:node . .
EXPOSE 3003