package interviewYou.app.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import interviewYou.app.entity.Question;

@CrossOrigin()
@PreAuthorize("hasRole('USER') or hasRole('MODERATOR') or hasRole('ADMIN')")
public interface QuestionRepository extends JpaRepository<Question, Long> {
	Page<Question> findById(@RequestParam("id") Long id, Pageable pageable);
	
	Page<Question> findByTopicId(@RequestParam("topic_id") Long id, Pageable pageable); 
	
	//Page<Question> findById(@RequestParam("id") Long id, Pageable pageable);

//	Page<Question> findByNameContaining(@RequestParam("name") String name, Pageable pageable);
}
