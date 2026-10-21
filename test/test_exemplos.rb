# encoding: UTF-8
require "minitest/autorun"
require "open3"
require "rbconfig"

class ExemplosRubyTest < Minitest::Test
  DIR = File.expand_path("../exemplos/ruby", __dir__)
  ESPERADO = {
    "01_tudo_e_objeto.rb" => "Integer\n12\n12\nTrueClass\nNilClass\nClass\nSymbol\ntrue\n",
    "02_metodo_de_um_objeto.rb" => "Sou um objeto com metodo proprio\n[:apresentar]\nfalse\nObject\n",
    "03_closure_e_proc.rb" => "Proc\n[37.5, 75.0, 105.0]\n60.0\n72.0\n",
    "04_enumerator_lazy.rb" => "[128, 256, 512, 1024, 2048, 4096]\nEnumerator\nEnumerator::Lazy\n[128, 256, 512]\n",
    "05_define_method_dsl.rb" => "false\npt-BR\n",
    "06_prepend_e_super.rb" => "[log] iniciando finalizacao\npedido confirmado\n",
    "07_refinements.rb" => "false\nruby-on-rails\nfalse\n",
    "08_pattern_matching.rb" => "Pedido 42: frete gratis (R$ 180)\n"
  }.freeze

  def test_existem_exatamente_oito_exemplos
    assert_equal ESPERADO.keys.sort, Dir.glob(File.join(DIR, "*.rb")).map { |f| File.basename(f) }.sort
  end

  def test_limite_de_dez_linhas_do_trabalho
    ESPERADO.each_key do |arquivo|
      linhas = File.readlines(File.join(DIR, arquivo))
      assert_operator linhas.length, :<=, 10, "#{arquivo} passou de 10 linhas"
    end
  end

  ESPERADO.each do |arquivo, saida|
    define_method("test_execucao_#{File.basename(arquivo, '.rb')}") do
      stdout, stderr, status = Open3.capture3(RbConfig.ruby, File.join(DIR, arquivo))
      assert status.success?, "#{arquivo} falhou: #{stderr}"
      assert_equal saida, stdout
      assert_equal "", stderr
    end
  end
end
