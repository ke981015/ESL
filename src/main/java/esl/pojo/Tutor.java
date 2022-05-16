package esl.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Tutor extends User{
	
	@Column(name="name")
	private String name;
	
	@Column(name="information")
	private String information;

	public Tutor() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}
	
}
