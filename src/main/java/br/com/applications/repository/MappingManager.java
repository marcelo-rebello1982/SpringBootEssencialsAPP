package br.com.applications.repository;

//import org.springframework.context.ApplicationContext;
//import org.springframework.data.jpa.repository.JpaRepository;
//
//import javax.persistence.EntityNotFoundException;
//import java.lang.reflect.ParameterizedType;
//import java.lang.reflect.Type;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Optional;
//
//public class MappingManager {
//    private Map<String, JpaRepository> entity4Repositories = new HashMap<>();
//    private Map<String, Class> entity4Class = new HashMap<>();
//
//    MappingManager(ApplicationContext applicationContext) {
//        Map<String, JpaRepository> repositoryBeans = applicationContext.getBeansOfType(JpaRepository.class);
//        repositoryBeans.forEach((repositoryName, repositoryBean) -> {
//            Class entityClass = MappingSupport.getEntityClass(repositoryBean);
//            String entityClassName = MappingSupport.getEntityName(entityClass);
//            entity4Repositories.put(entityClassName, repositoryBean);
//            entity4Class.put(entityClassName, entityClass);
//        });
//    }
//
//    public Optional<JpaRepository> getJpaRepository(String repository) {
//        return Optional.ofNullable(entity4Repositories.get(repository));
//    }
//
//    public Object getEntityObj(String repository) {
//        return Optional.ofNullable(entity4Class.get(repository)).map(clazz -> {
//            try {
//                return clazz.newInstance();
//            } catch (InstantiationException | IllegalAccessException e) {
//                e.printStackTrace();
//            }
//            return null;
//        }).orElseThrow(EntityNotFoundException::new);
//    }
//
//    static class MappingSupport {
//        static Class getEntityClass(JpaRepository jpaRepository) {
//            Type[] jpaInterfacesTypes = jpaRepository.getClass().getGenericInterfaces();
//            Type[] type = ((ParameterizedType) ((Class) jpaInterfacesTypes[0]).getGenericInterfaces()[0]).getActualTypeArguments();
//            return (Class) type[0];
//        }
//    }
//}
//
