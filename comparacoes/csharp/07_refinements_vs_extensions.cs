using System;

public static class SlugExtensions {
    public static string Slug(this string valor) =>
        string.Join("-", valor.Trim().ToLowerInvariant()
            .Split(' ', StringSplitOptions.RemoveEmptyEntries));
}

public class Program {
    public static void Main() {
        Console.WriteLine(" Ruby on Rails  ".Slug());
    }
}
// Extension methods sao resolvidos pelo compilador: nao alteram a classe String.
// Refinements do Ruby participam da resolucao de metodos no escopo ativado.
