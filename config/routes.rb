Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  controller "api/v1/dna_analyzer" do
    post :mutant, to: :mutant
    get :stats, to: :stats
  end
end
