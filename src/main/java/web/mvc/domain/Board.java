package web.mvc.domain;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_boardNo_seq")
	@SequenceGenerator(name = "board_boardNo_seq", allocationSize = 1, sequenceName = "board_boardNo_seq")
	private Long boardNo;
	
	@ManyToOne
	@JoinColumn(name = "users_id")
	private Users users;
	
	@Column(nullable = false)
	private String boardTitle;
	
	@Column(nullable = true)
	private String boardContent;
	
	@Column(nullable = false)
	private String boardImg;

	@CreationTimestamp
	private LocalDate boardRegDate;
	
	@Column(nullable = false)
	private int boardLikeNo;

	//댓글
	@OneToMany(mappedBy = "board", cascade = CascadeType.ALL)
	private List<Reply> replyList;


}
