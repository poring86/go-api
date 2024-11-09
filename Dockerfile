# Etapa de construção do binário
FROM golang:1.22 as build

WORKDIR /app

# Copie os arquivos de dependências e baixe os módulos Go
COPY go.mod go.sum ./
RUN go mod download && go mod verify

# Copie o código da aplicação
COPY . .

# Compile o binário para Linux
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o /app/bin/server ./cmd/server

# Etapa final
FROM debian:bookworm-20241016-slim
WORKDIR /

# Copiar o binário da etapa de build
COPY --from=build /app/bin/server /server

# Copie o arquivo .env localizado em cmd/server
COPY --from=build /app/cmd/server/.env /.env

# Exponha a porta que o servidor usará
EXPOSE 8000

# Inicie o servidor
ENTRYPOINT ["/server"]
