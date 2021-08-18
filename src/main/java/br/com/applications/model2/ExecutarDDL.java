package br.com.applications.model2;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ExecutarDDL {

//    public void executeDLL() {
//
//        Map<String, String> properties = new HashMap<>();
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.database.action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.drop-target", "scrip_drop-and-create.sql");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-source", "metadata");
//
//
//    }
//
    public Map<String,String> getMap () {
        Map<String, String> properties = new HashMap<>();
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.database.action", "drop-and-create");
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.action", "drop-and-create");
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.drop-target", "scrip_drop-and-create.sql");
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-source", "metadata");
        return properties;
    }


//
//    public static void main(String[] args) {
//
//        Map<String,String> properties = new HashMap<>();
//
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.database.action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.action", "drop-and-create");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.drop-target", "scrip_drop-and-create.sql");
//        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-source","metadata");
//
//    }
}
