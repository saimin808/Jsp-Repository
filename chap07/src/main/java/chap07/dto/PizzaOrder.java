package chap07.dto;

public class PizzaOrder {

	private String name;
	private String address;
	private String crust;
	private String size;
	private String toppings;
	private String instructions;
	
	public PizzaOrder(String name, String address, String crust,
			String size, String toppings, String instructions) {
		this.name = name;
		this.address = address;
		this.crust = crust;
		this.size = size;
		this.toppings = toppings;
		this.instructions = instructions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCrust() {
		return crust;
	}

	public void setCrust(String crust) {
		this.crust = crust;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getToppings() {
		return toppings;
	}

	public void setToppings(String toppings) {
		this.toppings = toppings;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	
}
