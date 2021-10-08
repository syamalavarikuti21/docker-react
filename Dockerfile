# build phase step

FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# run phase step
FROM nginx
EXPOSE 80

# copy the build files generated from previous step to nginx defalt location '/usr/share/nginx/html'
COPY --from=builder /app/build /usr/share/nginx/html

# no need to specify nginx command, nginx use this command by default
# CMD ["start", "nginx"] 
