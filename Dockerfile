FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# instalar Maven dentro del contenedor
RUN apt-get update && apt-get install -y maven

# copiar todo el proyecto
COPY . .

# compilar Spring Boot
RUN mvn clean package -DskipTests

EXPOSE 8080

CMD ["sh", "-c", "java -jar target/*.jar"]