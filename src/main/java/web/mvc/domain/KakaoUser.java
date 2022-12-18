package web.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class KakaoUser {

	@Id
	private String usersId;
	@Column(nullable = false)
	private String usersPwd;
	@Column(nullable = false, length = 30)
	private String usersEmail;

}
