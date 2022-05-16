package esl.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Student extends User{
	
	@Column(name="name")
	private String name;
	
	@Column(name="age")
	private int age;

	public Student() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}
