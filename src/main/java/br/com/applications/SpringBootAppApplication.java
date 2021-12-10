package br.com.applications;

import br.com.applications.testJpa.DBPercistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;


@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class SpringBootAppApplication implements CommandLineRunner {


    @Autowired
    public DBPercistence dbPercistence;


    public static void main(String[] args) {

//        Map<String, String> properties = new HashMap<>();
//
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.database.action=update","create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.drop-target", "scrip_drop-and-create.sql");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-source", "metadata");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts-action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-target", "script_create_schema.sql");


        SpringApplication.run(SpringBootAppApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

       // percistStudent();

    }

    public void percistStudent() {

        dbPercistence.percistStudent();
        dbPercistence.percistGeneralData();

    }
}
