# Build the backend
FROM node:14-alpine as backend
WORKDIR /app
COPY ./back/package*.json ./
RUN npm install
COPY ./back /app/back
RUN npm run build

# Build the frontend
FROM node:14-alpine as frontend
WORKDIR /app
COPY ./front/package*.json ./
RUN npm install
COPY ./front /app/
RUN npm run build

# Run the app with Postgres
FROM node:14-alpine
WORKDIR /app
COPY --from=backend /app/dist ./backend
COPY --from=frontend /app/build ./frontend
COPY .env .
COPY package*.json ./
RUN npm install --production
EXPOSE 8080
CMD ["npm", "run", "start"]