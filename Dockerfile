FROM maven:3.3-jdk-8   as builder

WORKDIR /warehouse
COPY warehouse    .
RUN  mvn clean package -DskipTests=true
 


FROM  openjdk:8 
WORKDIR /warehouse
COPY --from=builder /warehouse/target/warehouse*.jar  /warehouse
CMD java -jar warehouse*.jar   
 
