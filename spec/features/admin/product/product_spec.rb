require "spec_helper"

feature "Product" do
  scenario "add a new product" do
    login_as(:naiara)

    click_link "Adicionar um produto"

    fill_in "Nome", with: "Any product name"
    fill_in "Descrição", with: "Some content"
    check('branca')

    expect(current_path).to eql(new_product_path)
    expect(page).to have_content("Produto adicionado com sucesso!")
  end
end