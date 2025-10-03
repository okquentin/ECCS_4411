public class Java {
	public static void main(String[] args) {
		String Data = "Data";
		String Types = "Types";
		String DataTypes = Data + Types;
		System.out.println(DataTypes);
		String extractedTypes = DataTypes.substring(Data.length());
		System.out.println(extractedTypes);
	}
}