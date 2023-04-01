# Use a imagem do OpenJDK 17 como base
FROM openjdk:17

 # Copie o código-fonte da sua aplicação para o contêiner
COPY . /usr/src/app
# Defina as variáveis de ambiente para comunicação com o banco de dados

ENV DB_HOSTNAME=hackatonprod.cyekrdho7kb5.us-east-1.rds.amazonaws.com \
 DB_PORT=3306 \
  DB_NAME=hackaton \
  DB_USERNAME=admin \
  DB_PASSWORD=hackatonprod1664

 # Defina o diretório de trabalho

 WORKDIR /usr/src/app

# Compile a aplicação

RUN ./gradlew build

# Execute a aplicação quando o contêiner iniciar

CMD ["java", "-jar", "/usr/src/app/build/libs/my-app.jar"]