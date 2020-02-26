#The Build Phase
FROM node:alpine AS builder
WORKDIR /app
COPY ./package.json .
RUN npm install 
#CMD ["npm", "run", "build"]
COPY . .
RUN npm run build 

#Now create the Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html