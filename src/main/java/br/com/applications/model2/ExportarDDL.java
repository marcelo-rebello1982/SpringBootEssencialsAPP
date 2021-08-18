package br.com.applications.model2;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ExportarDDL {

    public void exportarDDL() {
        Map<String, String> properties = new HashMap<>();

        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts-action", "drop-and-create");
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.create-target", "script_create_schema.sql");
        properties.put("spring.jpa.properties.javax.persistence.schema-generation.scripts.drop-target", "script_drop-and-create.sql");

    }
}
