# Use a imagem do OpenJDK 11 como base
FROM openjdk:11

 # Copie o código-fonte da sua aplicação para o contêiner
COPY . /usr/src/app
# Defina as variáveis de ambiente para comunicação com o banco de dados

ENV DB_HOSTNAME=localhost \
 DB_PORT=5432 \
  DB_NAME=my_db \
  DB_USERNAME=my_user \
  DB_PASSWORD=my_password

 # Defina o diretório de trabalho

 WORKDIR /usr/src/app

# Compile a aplicação

RUN ./gradlew build

# Execute a aplicação quando o contêiner iniciar

CMD ["java", "-jar", "/usr/src/app/build/libs/my-app.jar"]