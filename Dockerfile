# --- Stage 1 --- Build stage, use AS to name the stage
FROM node:22-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# --- Stage 2 --- Production stage
FROM node:22-alpine
WORKDIR /app
# copying things from the build stage is much faster
COPY --from=builder /app .
EXPOSE 3000
ENV PORT=3000
CMD ["npm", "run", "start"]