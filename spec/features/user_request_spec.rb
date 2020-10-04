require 'rails_helper'

RSpec.describe "Users" do
  describe "quand un utilisateur crée son compte" do
    it "affiche les bons champs" do
      visit new_user_registration_path

      expect(page).to have_content 'Nom'
      expect(page).to have_content 'Prénom'
      expect(page).to have_content 'Club'
      expect(page).to have_content 'Pays'
      expect(page).to have_content 'E-mail'
      expect(page).to have_content 'Mot de passe'
    end

    it "crée son compte sans erreur" do
      expect do
        visit new_user_registration_path

        fill_in :user_email, with: 'jean@bon.fr'
        fill_in :user_password, with: 'password'
        fill_in :user_password_confirmation, with: 'password'
        fill_in :user_nom, with: 'Bon'
        fill_in :user_prenom, with: 'Jean'
        fill_in :user_club, with: 'Beurre'
        fill_in :user_pays, with: 'France'
        click_on 'Sign up'
      end.to change(User, :count)
      user = User.last
      expect(user.nom).to eq 'Bon'
      expect(user.prenom).to eq 'Jean'
      expect(user.club).to eq 'Beurre'
      expect(user.pays).to eq 'France'
      expect(user.email).to eq 'jean@bon.fr'
    end
  end

  describe 'quand un utilisateur modifie son compte' do
    let!(:guitou) {create(:user)}

    it 'affiche les bons champs' do
      se_connecte_en_tant_qu_user(guitou)
      visit edit_user_registration_path(guitou)

      expect(page).to have_content 'Nom'
      expect(page).to have_content 'Prénom'
      expect(page).to have_content 'Club'
      expect(page).to have_content 'Pays'
      expect(page).to have_content 'E-mail'
      expect(page).to have_content 'Mot de passe'
      expect(guitou.club).to eq 'SSA'
    end

    it "modifie les champs sans erreur" do
      expect do
        se_connecte_en_tant_qu_user(guitou)
        visit edit_user_registration_path(guitou)

        fill_in :user_current_password, with: 'password'
        fill_in :user_club, with: 'Beurre'
        fill_in :user_pays, with: 'Monaco'
        click_on 'Update'
      end.to_not change(User, :count)

      user = User.last
      expect(user.nom).to eq 'Chou'
      expect(user.prenom).to eq 'Guitou'
      expect(user.club).to eq 'Beurre'
      expect(user.pays).to eq 'Monaco'
    end
  end
end
