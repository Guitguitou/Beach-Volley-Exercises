require 'rails_helper'

RSpec.describe "Exercices" do
  describe 'quand un utilisateur crée un exercice' do
    let(:guitou) { create(:user) }
    it "affiche les champs nécessaires à un la création d'un exo" do
      se_connecte_en_tant_qu_user(guitou)
      visit new_exercice_path

      expect(page).to have_content("Nom de l'exercice")
      expect(page).to have_content("Description de l'exercice")
      expect(page).to have_content("Qu’est ce qu’on travaille?")
      expect(page).to have_content("Type d'exercice")
    end

    it "crée un exercice affilié à un utilisateur" do
      se_connecte_en_tant_qu_user(guitou)
      visit new_exercice_path
      expect do
        fill_in :exercice_nom, with: 'Triangle de construction classique'
        fill_in :exercice_fonction, with: 'Technique'
        fill_in :exercice_worked, with: 'Construction'
        fill_in :exercice_description, with: "Blablabla c'est une description"
        click_on "Enregistrer"
      end.to change(Exercice, :count)
      exercice = Exercice.last
      expect(exercice.nom).to eq 'Triangle de construction classique'
      expect(exercice.fonction).to eq 'Technique'
      expect(exercice.worked).to eq 'Construction'
      expect(exercice.description).to eq "Blablabla c'est une description"
      expect(exercice.user.prenom).to eq "Guitou"

    end
  end

  fdescribe 'quand un utilisateur modifie un exercice' do
    let(:guitou) { create(:user) }
    let(:exercice) { create(:exercice) }
    it 'modifie son exercice' do
      se_connecte_en_tant_qu_user(guitou)
      visit edit_exercice_path(exercice)

      expect(page).to have_content("Nom de l'exercice")
      expect(page).to have_content("Description de l'exercice")
      expect(page).to have_content("Qu’est ce qu’on travaille?")
      expect(page).to have_content("Type d'exercice")
    end
  end
end