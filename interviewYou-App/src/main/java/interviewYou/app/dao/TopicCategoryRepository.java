package interviewYou.app.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import interviewYou.app.entity.Category;
//@CrossOrigin
//@RepositoryRestResource(collectionResourceRel = "questionCategory", path = "question-category")
//public interface QuestionCategoryRepository extends JpaRepository<Category, Long> {
//}
import interviewYou.app.entity.Topic;

@CrossOrigin()
public interface TopicCategoryRepository extends JpaRepository<Category, Long> {
	Page<Category> findByCategory(@RequestParam("category") String category, Pageable pageable);

}
