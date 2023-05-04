
public class Dancer {

	private int dancerId;
	private String firstName;
	private String middleName;
	private String lastName;
	private String birthday;
	private String streetAddress;
	private String city;
	private String state;
	private String zip;
	
	public Dancer(int dancerId, String firstName, String middleName, String lastName, String birthday,
			String streetAddress, String city, String state, String zip) {
		super();
		this.dancerId = dancerId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.birthday = birthday;
		this.streetAddress = streetAddress;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	public Dancer(int dancerId, String firstName, String lastName, String birthday, String streetAddress, String city,
			String state, String zip) {
		super();
		this.dancerId = dancerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthday = birthday;
		this.streetAddress = streetAddress;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	public int getDancerId() {
		return dancerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String toString() {
		return "Dancer [dancerId=" + dancerId + ", firstName=" + firstName + ", middleName=" + middleName
				+ ", lastName=" + lastName + ", birthday=" + birthday + ", streetAddress=" + streetAddress + ", city="
				+ city + ", state=" + state + ", zip=" + zip + "]";
	}
	
}
