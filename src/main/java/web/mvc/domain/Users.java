package web.mvc.domain;


import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class Users {
    @Id
    private String usersId;
    
    private String usersPwd;
    @Column(unique = true)
    private String usersPhone;
    @Column(length = 30)
    private String usersEmail;
    @Column( length = 30)
    private String usersNickName;
    @Column(length = 1)
    private int  usersMemberShip;
    
    @CreationTimestamp
    private LocalDateTime usersRegDate;
    
    /*
    @OneToMany(mappedBy = "users", cascade = CascadeType.ALL)
    private List<Reply> replyList;
    
    @OneToMany(mappedBy = "users", cascade = CascadeType.ALL)
    private List<Orders> ordersList;
    */
    
    
}