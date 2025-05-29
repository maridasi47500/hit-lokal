import sys
import random
from youtube_search import YoutubeSearch
import json

SEARCH_URL = "https://www.bing.com/search?q="

if len(sys.argv) > 2:  # Ensures an argument is provided
    location = sys.argv[1]  # Gets the first command-line argument
    selected_metiers = sys.argv[2].split(" ")  # Gets the first command-line argument
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




