package kr.co.soldesk.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Table(name = "users")
@Getter
@Setter
@ToString
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Users  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Lid;

	@Column(name = "user_id", nullable = false, updatable = false, unique = true)
	private String id;

	private String email;
	
	private String password;
	
	private String name;
	
	private String vaccine;
		
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval=true)
	private Set<Roles> roles;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "writerIdx", cascade = CascadeType.ALL,orphanRemoval = true)
	private Set<Contents> contents;
}
