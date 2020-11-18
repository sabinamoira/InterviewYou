package interviewYou.app.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;

import interviewYou.app.entity.Question;

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer {
	private EntityManager entityManager;

	@Autowired
	public MyDataRestConfig(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}

	@Override
	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
		 HttpMethod[] theUnsupportedActions = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE};
		 // disable HTTP methods for Question: PUT, POST and DELETE
		 config.getExposureConfiguration()
		 .forDomainType(Question.class)
		 .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
		 .withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
		 exposeIds(config);

		 } 

	private void exposeIds(RepositoryRestConfiguration config) {

		Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();
		List<Class> entityClasses = new ArrayList<>();
		// - get the entity types for the entities
		for (EntityType tempEntityType : entities) {

			entityClasses.add(tempEntityType.getJavaType());
			Class[] domainTypes = entityClasses.toArray(new Class[0]);
			config.exposeIdsFor(domainTypes);
		}

	}
}
