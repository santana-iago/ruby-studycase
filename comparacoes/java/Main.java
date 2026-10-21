public class Main {
    public static void main(String[] args) {
        int primitivo = 7;
        Integer objeto = Integer.valueOf(primitivo);
        System.out.println(primitivo + 5);
        System.out.println(objeto.getClass().getSimpleName());
        System.out.println(((Object) objeto) instanceof Object);
    }
}
