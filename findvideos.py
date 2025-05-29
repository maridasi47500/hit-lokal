import sys
import random
from youtube_search import YoutubeSearch
import json

SEARCH_URL = "https://www.bing.com/search?q="

METIERS_FR = list(set([
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
  "Réalisateur", "Scénariste", "Créateur de Moodboard", "Scénographe", "Conception Artistique", "Monteur",
  "Directeur de la Photographie", "Opérateur de Caméra", "Assistant Caméra", "Monteur de Bande-Son", "Coloriste",
  "Artiste Vocal", "Violoniste", "Arrangeur", "Compositeur", "Producteur Musical", "Ingénieur du Mixage",
  "Ingénieur du Mastering", "Studio d'Enregistrement", "Responsable Artistique Commercial", "Responsable Administratif Financier",
  "Producteur Exécutif", "Assistant de Production", "Marketeur Digital", "Stratégiste en Médias Numériques",
  "Gestionnaire des Médias Sociaux", "Chorégraphe", "Danseur", "Conseiller en Image et Presse", "Maquilleur",
  "Coiffeur", "Styliste Ongulaire", "Directeur de Costume", "Directeur de Caractérisation", "Styliste",
  "Créateur de Costumes", "Photographe", "Designer de Couverture", "Assistant Photographe", "Vidéo Making-Of",
  "Producteur", "Gestionnaire Stratégique", "Distributeur"
]))
if len(sys.argv) > 1:  # Ensures an argument is provided
    location = sys.argv[1]  # Gets the first command-line argument
    selected_metiers = " ".join(random.sample(METIERS_FR, 2)).split(" ")  # Selects 2 unique random elements and joins them
    # Select 2 random elements
    # Convert them into "description: <value>" format and join them into a single string
    result_string = " ".join([f"description:{h}" for h in selected_metiers])
    

    query = f"{location} production music video {result_string}"
    print(query)
    results = json.loads(YoutubeSearch(query, max_results=1000).to_json())
    #print(results["videos"])
    for result in results["videos"]:
        print(f"Title: {result['title']}")
        print(f"URL: {result['id']}")
    
        if "?v=" in result["url_suffix"]:
            video_id = result["id"]
            formatted_title = result["title"].replace("(", "").replace(")", "").replace("#", "").replace(" - YouTube", "").replace(" ", "%20")
            print(f'<a href="/ajouter.php?lienvid={video_id}&titre={formatted_title}">ajouter à hit lokal</a>')
        
        print("-" * 40)
    else:
        print("Please provide a location as a command-line argument.")




