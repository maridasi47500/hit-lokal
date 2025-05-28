from youtube_search import YoutubeSearch
  SEARCH_URL = "https://www.bing.com/search?q="
  LOCATIONS = [ARGV[0]]
  PLATFORMS = [ARGV[1]]

  METIERS_FR = [
    "Composé",
    "Réalisé",
    "Mixé",
    "Producteur exécutif",
    "Producteur",
    "Réalisateur",
    "Réalisations",
    "Auteurs",
    "Compositeur",
    "Production",
    "Editions",
  "Réalisation Clip ","Réalisation Musicale",
  "Maquillage",
  "Coiffure",
  "Assistante",
  "Record","Programmation","Mix"," Montage"," Etalonnage",
  "Pianiste / Autrice",
  "Compositeur.e.s",
  "Production / Editions",
    "Scénariste",
    "Directeur de production",
    "Assistant réalisateur",
    "Lumière",
    "Lumière/Électro",
    "Maquilleur",
    "Assistant maquillage",
    "Coiffeur",
    "Ongles",

    "Enregistrement",
    "Mixage",
    "Danseuses",
    "Auteur Compositeur", "Auteur", "Compositeur", "Mix/Mastering", "Prise de voix", "Production", "Réalisation", "Cadrage", "Étalonnage", "Aide technique"

  ].uniq
  METIERS_FR = [
    "Réalisateur", "Scénariste", "Créateur de Moodboard", "Scénographe", "Conception Artistique", "Monteur",
    "Directeur de la Photographie", "Opérateur de Caméra", "Assistant Caméra", "Monteur de Bande-Son", "Coloriste",
    "Artiste Vocal", "Violoniste", "Arrangeur", "Compositeur", "Producteur Musical", "Ingénieur du Mixage",
    "Ingénieur du Mastering", "Studio d'Enregistrement", "Responsable Artistique/Commercial", "Responsable Administratif/Financier",
    "Producteur Exécutif", "Assistant de Production", "Marketeur Digital", "Stratégiste en Médias Numériques",
    "Gestionnaire des Médias Sociaux", "Chorégraphe", "Danseur", "Conseiller en Image et Presse", "Maquilleur",
    "Coiffeur", "Styliste Ongulaire", "Directeur de Costume", "Directeur de Caractérisation", "Styliste",
    "Créateur de Costumes", "Photographe", "Designer de Couverture", "Assistant Photographe", "Vidéo Making-Of",
    "Producteur", "Gestionnaire Stratégique", "Distributeur"
  ]


    LOCATIONS.each do |location|
      PLATFORMS.each do |platform|
results = YoutubeSearch('search terms', max_results=10).to_json()


print(results)

# returns a json string
      end
    end



#########################################
#
#results = YoutubeSearch('search terms', max_results=10).to_dict()
#
#print(results)
## returns a dictionary
