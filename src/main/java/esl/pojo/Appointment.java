package esl.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Appointment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name="appointmentid", unique = true, nullable = false)
	private int appointmentid;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="sender")
	private User sender;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="receiver")
	private User receiver;
	
	@Column(name="topic")
	private String topic;
	
	@Column(name="date")
	private String date;

	@Column(name="time")
	private String time;
	
	@Column(name="status")
	private String status;

	public Appointment() {
		super();
	}

	public int getAppointmentid() {
		return appointmentid;
	}

	public void setAppointmentid(int appointmentid) {
		this.appointmentid = appointmentid;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
