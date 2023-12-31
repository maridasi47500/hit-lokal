<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.png">
    <meta name="description" content="Hit Lokal est une association qui a pour but de promouvoir la culture musicale à travers un site internet, une cérémonie de récompenses annuelle Les récompenses de la musique urbaine 100% lokal, 100% public">
	<meta property="og:type" content="website">
	<meta property="og:site_name" content="hit-lokal" /> <!-- website name -->
	<meta property="og:site" content="https://hit-lokal.com/" /> <!-- website link -->
    <meta property="og:title" content="">
    <meta property="og:url" content="">
    <meta property="og:description" content=""> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="">
    <meta property="og:image:type" content="image/jpeg">
	<meta property="og:fbid" content="1398329880488455">

	<meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="">
    <meta name="twitter:description" content="">
    <meta name="twitter:url" content="">
    <meta name="twitter:image" content="">

    <link rel="canonical" href="" itemprop="url">
    <!-- Webpage Title -->
    <title>Hit Lokal | Toute la musique de Guadeloupe, Guyane, Martinique et Réunion</title>
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="/css/swiper.css" rel="stylesheet">
	<link href="/css/styles.css" rel="stylesheet">
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample" class=" bg-gray">
    <!-- Navigation -->
<style>
#navbarSupportedContent .navbar-nav .nav-item form, input, .caret {
	margin: auto;
}
#navbarSupportedContent .navbar-nav .nav-item form {
	position: relative;
	width: 100%;
	max-width: 17em;
}
#navbarSupportedContent .navbar-nav .nav-item input, .caret {
	display: block;
	transition: all calc(var(--dur) * 0.5) linear;
}
#navbarSupportedContent .navbar-nav .nav-item input {
	background: transparent;
	border-radius: 50%;
	box-shadow: 0 0 0 0.25em inset;
	caret-color: var(--primary);
	width: 1.5em;
	height: 1.5em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	cursor: pointer;
}
#navbarSupportedContent .navbar-nav .nav-item input:valid {
	background: var(--input);
	border-radius: 0.25em;
	box-shadow: none;
	padding: 0.75em 1em;
	transition-duration: calc(var(--dur) * 0.25);
	transition-delay: calc(var(--dur) * 0.25);
	width: 100%;
	height: 3em;
}

#navbarSupportedContent .navbar-nav .nav-item input:focus {
	background: var(--input);
	border-radius: 0.25em;
	box-shadow: none;
	padding: 0.75em 1em;
	transition-duration: calc(var(--dur) * 0.25);
	transition-delay: calc(var(--dur) * 0.25);
	width: 100%;
	height: 3em;
}

#navbarSupportedContent .navbar-nav .nav-item input:focus {
	animation: showCaret var(--dur) steps(1);
	outline: transparent;
}
#navbarSupportedContent .navbar-nav .nav-item input:focus + .caret, input:valid + .caret {
	animation: handleToCaret var(--dur) linear;
	background: transparent;
	width: 1px;
	height: 1.5em;
	transform: translate(0,-1em) rotate(-180deg) translate(7.5em,-0.25em);
}
#navbarSupportedContent .navbar-nav .nav-item input::-webkit-search-decoration {
	-webkit-appearance: none;
}
#navbarSupportedContent .navbar-nav .nav-item label {
	color: #e3e4e8;
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
}
#navbarSupportedContent .navbar-nav .nav-item .caret {
	background: currentColor;
	border-radius: 0 0 0.125em 0.125em;
	margin-bottom: -0.6em;
	width: 0.25em;
	height: 1em;
	    transform: translate(0,-0.8em) rotate(-45deg) translate(0,0.75em);
	transform-origin: 50% 0;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
	:root {
		--bg: #17181c;
		--fg: #e3e4e8;
		--input: #2e3138;
		--primary: #5583f6;
	}
}

/* Animations */
@keyframes showCaret {
	.navbar-nav .nav-item from {
		caret-color: transparent;
	}
	to {
		caret-color: var(--primary);
	}
}
@keyframes handleToCaret {
	.navbar-nav .nav-item from {
		background: currentColor;
		width: 0.25em;
		height: 1em;
		transform: translate(0,-1em) rotate(-45deg) translate(0,0.875em);
	}
	25% {
		background: currentColor;
		width: 0.25em;
		height: 1em;
		transform: translate(0,-1em) rotate(-180deg) translate(0,0.875em);
	}
	50%, 62.5% {
		background: var(--primary);
		width: 1px;
		height: 1.5em;
		transform: translate(0,-1em) rotate(-180deg) translate(7.5em,2.5em);
	}
	75%, 99% {
		background: var(--primary);
		width: 1px;
		height: 1.5em;
		transform: translate(0,-1em) rotate(-180deg) translate(7.5em,-0.25em);
	}
	87.5% {
		background: var(--primary);
		width: 1px;
		height: 1.5em;
		transform: translate(0,-1em) rotate(-180deg) translate(7.5em,0.125em);
	}
	to {
		background: transparent;
		width: 1px;
		height: 1.5em;
		transform: translate(0,-1em) rotate(-180deg) translate(7.5em,-0.25em);
	}
}

/* ============ desktop view ============ */
.dropdown-menu[data-bs-popper] {
    top: 100% !important;
    left: 20px !important;
    margin-top: 0.125rem;
}
@media all and (min-width: 992px) {
	.dropdown-menu li{ position: relative; 	}
	.nav-item .submenu{
		display: none;
		position: absolute;
		left:100%; top:-7px;
	}
	.nav-item .submenu-left{
		right:100%; left:auto;
	}
	.dropdown-menu > li:hover{ background-color: #f1f1f1 }
	.dropdown-menu > li:hover > .submenu{ display: block; }
}
/* ============ desktop view .end// ============ */

/* ============ small devices ============ */
@media (max-width: 991px) {
  .dropdown-menu .dropdown-menu{
      margin-left:0.7rem; margin-right:0.7rem; margin-bottom: .5rem;
  }
}
/* ============ small devices .end// ============ */

.alert-dismissible .btn-close {
    position: absolute;
    top: 0!important;
    right: 0;
    z-index: 2;
    padding: 0.5rem 0.5rem;
}

.alert{
    margin-bottom: 0;

}
</style>


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
          <a class="navbar-brand logo-image" href="/index.php"><img height="400" src="/images/logo-n.png" alt="alternative"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link pl-0 active" aria-current="page" href="/actualites.php">Actualités</a>
                    </li>
                    <li class="nav-item dropdown" id="myDropdown">
                       <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"> Top  </a>
                          <ul class="dropdown-menu">
                            <li> <a class="dropdown-item" href="/top.php"> Top de la semaine </a></li>
                            <li> <a class="dropdown-item" href="/top/nouveautes"> Nouveautés </a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown" id="myDropdown">
                       <a class="nav-link dropdown-toggle" href="/artistes.php" data-bs-toggle="dropdown"> Artistes  </a>
                          <ul class="dropdown-menu">
                            <li> <a class="dropdown-item" href="/artistes.php"> Artistes </a></li>
                            <li> <a class="dropdown-item" href="/realisateurs.php"> Réalisateurs </a></li>
                            <li> <a class="dropdown-item" href="/compositeurs.php"> Compositeurs </a>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/lassociation.php">L’Association</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/awards.php">Awards</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ajouter.php">Ajouter votre clip</a>
                    </li>
                                        <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#loginform">Connexion</a>
                    </li>
                    					<li class="nav-item">

						 <form action="/recherche.php" method="GET" id="form-1">
                        	<label for="search">Search</label>
                        	<input id="search" name="s" type="search" pattern=".*\S.*" required>
                        	<span class="caret"></span>
                        </form>
                    </li>


      </ul>

    </div>
  </div>

</nav>

          <!-- login Modal -->
    <div id="loginform" class="modal fade loginform" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                     <a class="navbar-brand logo-image" href="/index.html"><img width="96" height="96" src="images/logo-n.png" alt="alternative"></a>
                    <!-- Contact Form -->
					 <h1>Connexion</h1>
					    <div class="social-container">

                        	            <span class="fa-stack">
											<a href="https://hit-lokal.com/membres2/oauth.php?provider=facebook" class="social-link">

												  <i class="fas fa-circle fa-stack-2x"></i>
                                                  <i class="fab fa-facebook-f fa-stack-1x"></i>
											</a>
										</span>
										 <!--
										<span class="fa-stack">
											     <a href="https://hit-lokal.com/membres2/oauth.php?provider=google">
                                                    <i class="fas fa-circle fa-stack-2x"></i>
                                                    <i class="fab fa-google fa-stack-1x"></i>
                                                </a>
										</span>
										-->
                    </div> <!-- end of social-container -->
					 <div class="text-1">ou utilisez votre email</div>



                   <form id="login-form"  method="post" role="form" style="display: block;">
                        <div class="form-group">
                            <input type="text" name="email_login" class="form-control-input" placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password_login" class="form-control-input" placeholder="Mot de passe" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-solid-reg">Se connecter</button>
                        </div>
                    </form>
                    <!-- end of contact form -->
					<div class="login-link-container">
                            <a href="/recover.php">
								Mot de passe oublié
                            </a>
							  <a  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#registerform" >
								Créer un compte
                            </a>
					</div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            </div> <!-- end of modal-content -->
        </div> <!-- end of modal-dialog -->
    </div> <!-- end of modal -->
    <!-- end of login modal -->


	    <!-- Register Modal -->
    <div id="registerform" class="modal fade loginform" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

			<button type="button" class="btn-return" data-bs-dismiss="modal" aria-label="Close"><i class="fa fa-arrow-left" aria-hidden="true"></i></button>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                     <a class="navbar-brand logo-image" href="/index.html"><img width="96" height="96" src="/images/logo-n.png" alt="alternative"></a>
                    <!-- Contact Form -->
					 <h1>Créer un compte</h1>
					    <div class="social-container">

                        	            <span class="fa-stack">
											<a href="https://hit-lokal.com/membres2/oauth.php?provider=facebook" class="social-link">

												  <i class="fas fa-circle fa-stack-2x"></i>
                                                  <i class="fab fa-facebook-f fa-stack-1x"></i>
											</a>
										</span>
										 <!--
										<span class="fa-stack">
											     <a href="https://hit-lokal.com/membres2/oauth.php?provider=google">
                                                    <i class="fas fa-circle fa-stack-2x"></i>
                                                    <i class="fab fa-google fa-stack-1x"></i>
                                                </a>
										</span>
										-->
                    </div> <!-- end of social-container -->

					 <div class="text-1">ou utilisez votre email</div>
                       <form id="register-form" method="post" role="form" >
                        <div class="form-group">
                            <input type="text"  name="username" class="form-control-input" placeholder="Nom" required>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control-input" placeholder="Email" required>
                        </div>
						<div class="form-group">
                            <input type="password" name="password" class="form-control-input" placeholder="Mot de passe" required>
                        </div>


                       	<div class="form-group">
                            <div class="d-inline-block me-1">Je suis un artist</div>
                            <div class="form-check form-switch d-inline-block">
                                <input type="checkbox" name="isArtist" class="form-check-input" id="site_state" style="cursor: pointer;">

                                </div>
                        </div>


                        <div class="form-group">
                            <button type="submit" class="btn-solid-reg">Créer mon compte</button>
                        </div>
                    </form>
                    <!-- end of contact form -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            </div> <!-- end of modal-content -->
        </div> <!-- end of modal-dialog -->
    </div> <!-- end of modal -->
    <!-- end of register modal -->

<script>
document.addEventListener("DOMContentLoaded", function(){
// make it as accordion for smaller screens
if (window.innerWidth < 992) {

  // close all inner dropdowns when parent is closed
  document.querySelectorAll('.navbar .dropdown').forEach(function(everydropdown){
    everydropdown.addEventListener('hidden.bs.dropdown', function () {
      // after dropdown is hidden, then find all submenus
        this.querySelectorAll('.submenu').forEach(function(everysubmenu){
          // hide every submenu as well
          everysubmenu.style.display = 'none';
        });
    })
  });

  document.querySelectorAll('.dropdown-menu a').forEach(function(element){
    element.addEventListener('click', function (e) {
        let nextEl = this.nextElementSibling;
        if(nextEl && nextEl.classList.contains('submenu')) {
          // prevent opening link if link needs to open dropdown
          e.preventDefault();
          if(nextEl.style.display == 'block'){
            nextEl.style.display = 'none';
          } else {
            nextEl.style.display = 'block';
          }

        }
    });
  })
}
// end if innerWidth
});
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47717247-10', 'auto');
  ga('send', 'pageview');

</script>



    <!-- Header -->
    <header id="header" class="header" style="background-color: black!important; max-height: 100vh">
<main>
<style>
main {
  position: relative;
  width: 80vw;
  min-height: 100vh;
  background-color: black;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto;
}


main .credit a {
  color: inherit;
  text-decoration: none;
}

main .credit a:hover {
	  color: inherit;
	  text-decoration: none;
      opacity: .9;
  }

main a {
	width: 100%;
	cursor: pointer;
	z-index: 1;
}
.credit p {
    position: absolute;
    top: 6%;
    left: 2%;
    color: #FFFFFF;
    margin: 0;
    font-size: 1.2em;
    text-transform: uppercase;
    letter-spacing: .08em;
	z-index:2;
}

main img{
  width: 60%;
  height: auto;
  position: absolute;
  // cursor: none;
  transition: 650ms ease;

}


 .img-01 {
    z-index: 2;
  }
  
  .img-02 {
    z-index: 1;
    opacity: 0;
    pointer-events: none;
    filter: blur(100px);
	position: relative;
  }

.img-01:hover {
  opacity: 0;
}

.img-01:hover ~ .img-02 {
    opacity: 1;
    filter: blur(0);

}

</style>
    <a  href="actualites/les-15-acteurs-influents-de-la-musique-outremer" target="_blank">
  <img class="img img-01" src="../../media/actus/2023/01/les-acteurs-influents-de-la-musique-outremer-thlg.png" alt="">

  <img class="img img-02" src="../../media/actus/2023/01/les-acteurs-influents-de-la-musique-outremer-thlg.png" alt="">
  </a>
  
  <div class="credit">
  <p><a target="_blank" href="actualites/les-15-acteurs-influents-de-la-musique-outremer">Les 15 acteurs influents de la musique Outremer</a></p>
</div>
</main>
</header>

    <!-- Details 1 -->
    <!-- sorties -->
	<div id="sorties" class="basic-2 projects bg-gray position-relative">
	<div class="vecteur-3" ></div>
		<div class="container"  style="z-index:2">
            <div class="row">
                <div class="col-lg-12">
				    <div style="display: flex">
                    <h2 class="h2-heading">Entrée dans le top </h2><span class="line-2" ></span>
					</div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
                <div class="col-lg-12">   
                                  
                    <div class="row">
									
                        <div class="element-item  col-lg-3">
                            <a href="videos.php?vid=kto-la-caisse-feat-flash" title="Kto - la caisse (feat. flash)">
                                <img src="../../media/clip/2023/06/kto-la-caisse-feat-flash-2023.jpg" alt="Kto - la caisse (feat. flash)" />
								  <div class="artist" >Kto  </div> <div class="title"> la caisse (feat. flash)</div>
                            </a>
                        </div>
									
                        <div class="element-item  col-lg-3">
                            <a href="videos.php?vid=omerta-street-life" title="Omerta - street life">
                                <img src="../../media/clip/2023/06/omerta-street-life-clip-officiel-2023.jpg" alt="Omerta - street life" />
								  <div class="artist" >Omerta  </div> <div class="title"> street life</div>
                            </a>
                        </div>
									
                        <div class="element-item  col-lg-3">
                            <a href="videos.php?vid=tiitof-sheriff" title="Tiitof - sheriff">
                                <img src="../../media/clip/2023/06/tiitof-sheriff-clip-officiel-2023.jpg" alt="Tiitof - sheriff" />
								  <div class="artist" >Tiitof  </div> <div class="title"> sheriff</div>
                            </a>
                        </div>
									
                        <div class="element-item  col-lg-3">
                            <a href="videos.php?vid=panik-j-x-select-slk-mama-desole" title="Panik j x select slk - mama désolé">
                                <img src="../../media/clip/2023/06/panik-j-x-select-slk-mama-desole-clip-officiel-2023-2023.jpg" alt="Panik j x select slk - mama désolé" />
								  <div class="artist" >Panik j x select slk  </div> <div class="title"> mama désolé</div>
                            </a>
                        </div>
					                    <!-- end of filter -->
					</div>
					<div class="d-flex justify-content-center">
                     <a href="top.php" class="btn-solid-reg" style="	margin-right:0%; z-index:3">voir tous</a>
				    </div>
            </div> <!-- end of row -->
		</div> <!-- end of container -->
    </div> <!-- end of filter -->
    <!-- end of sorties -->

<!-- --- -->	
<!-- --- -->	
<!-- Top -->
<!-- --- -->
<!-- --- -->

    <div id="top" class="basic-3 le-top position-relative"  style="z-index:2">
		<div class="vecteur-4" ></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="image-container" style="z-index:1" >
										     <div>
					         
							<img class="img-fluid img-1 "  src="../../media/clip/2023/03/maurane-voyer-feat-meryl-sakitefo-2023.jpg" alt="Maurane voyer feat Meryl - Sakitefo" />
								<a href="videos.php?vid=maurane-voyer-feat-meryl-sakitefo" title="Maurane voyer feat Meryl - Sakitefo">
									<i class="fa fa-play fa-play-1" aria-hidden="true"></i>
								</a>
						 </div>
					   					     <div>
					         
							<img class="img-fluid img-2 "  src="../../media/clip/2022/07/kalash-feat-maureen-laptop-clip-officiel-2022.jpg" alt="Kalash feat Maureen - Laptop" />
								<a href="videos.php?vid=kalash-feat-maureen-laptop" title="Kalash feat Maureen - Laptop">
									<i class="fa fa-play fa-play-2" aria-hidden="true"></i>
								</a>
						 </div>
					   						
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6 col-xs-12">
                     <div class="text-container top">
					     <div style="display: flex; align-items: end; justify-content: end;">
                        <h2 class="h2-heading-right">le top</h2><span class="line-3" ></span>
						</div>
                        <p class="text-1">Retrouvez toutes les semaines, le TOP des musiques et artistes les plus écoutés!<br />
                          <!-- <span class="text-2">  ! </span>--> </p>
                         <div style="display: flex; flex-wrap: wrap" class="d-flex justify-content-center">
						 <a href="top.php"class="btn-solid-top" >Top de la semaine</a>
						<!-- <a class="btn-solid-top b1" >All time</a>-->
						 </div>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details 1 -->
	
<!-- --- -->	
<!-- --- -->	
<!-- les actus -->
<!-- --- -->
<!-- --- -->	

	<div id="actualites" class="basic-1 filter actu position-relative" style="z-index:2">
	    <div class="vecteur-5" ></div>
		 <div class="rectangle-28" ></div>
		<div class="container">
            <div class="row">
                <div class="col-lg-12">
				    <div style="display: flex">
                    <h2 class="h2-heading">LES ACTUS </h2><span class="line-2" ></span>
					</div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
          
		  <div class="row">
                <div class="col-lg-12">
		    <div class="row mx-auto my-auto justify-content-center">
            <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner" role="listbox">
			
			
					
			  <div class="carousel-item active" id="1">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/mikl-a-la-cigale-notre-reportage" title="Mikl à la Cigale notre reportage">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/11/mikl-a-la-cigale-notre-reportage-thlg.jpg"
                                             alt="Mikl à la Cigale notre reportage" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  	
			  <div class="carousel-item " id="2">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/goulam-du-zouk-venu-des-comores" title="Goulam du zouk venu des Comores">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/11/goulam-du-zouk-venu-des-comores-thlg.jpg"
                                             alt="Goulam du zouk venu des Comores" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  	
			  <div class="carousel-item " id="3">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/jahyanai-annonce-la-sortie-de-son-premier-album" title="Jahyanaï annonce la sortie de son premier album">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/10/jahyanai-annonce-la-sortie-de-son-album-thlg.png"
                                             alt="Jahyanaï annonce la sortie de son premier album" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  	
			  <div class="carousel-item " id="4">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/kenyon-un-remix-konpa-de-son-single-marianna" title="Kenyon, un remix konpa de son single Marianna">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/10/kenyon-marianna-thlg.jpg"
                                             alt="Kenyon, un remix konpa de son single Marianna" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  	
			  <div class="carousel-item " id="5">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/hit-lokal-partenaire-de-la-tournee-de-kalash" title="Hit Lokal partenaire de la tournée de Kalash">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/10/hit-lokal-partenaire-de-la-tournee-de-kalash-thlg.png"
                                             alt="Hit Lokal partenaire de la tournée de Kalash" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  	
			  <div class="carousel-item " id="6">
                    <div class="col-md-2">
                        <div class="card">
				           <a href="actualites/kalash-la-tournee-commence-" title="Kalash La tournée commence !">
                            <div class="card-img position-relative">
                                <img src="../../media/actus/2022/10/kalash-la-tournee-commence--thlg.png"
                                             alt="Kalash La tournée commence !" class="img-fluid">
							<!--	<div class="badge">
									<button class="btn-solid-yellow">Artiste</button> 
								</div> -->
                            </div>
						   </a>
                        </div>
                    </div>
                </div>
			
			  
            </div>
            <a class="carousel-control-prev w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>
    </div>
		
		

    </div> <!-- end of col -->
    </div> <!-- end of row -->
							
		</div> <!-- end of container -->
    </div> <!-- end of filter -->
    <!-- end of sorties -->








<!-- --- -->	
<!-- --- -->	
<!-- Awards -->
<!-- --- -->
<!-- --- -->

    <div id="awards" class="basic-5 awards position-relative" style="z-index:2">
	 <div class="vecteur-6" ></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-xs-12">
                    <div class="text-container">
					     <div style="display: flex; align-items: left; justify-content: left;">
                        <h2 class="h2-heading">Hit Lokal Awards</h2>
						</div>
                        <p class="text-1"> Chaque année, l’arrivée du printemps rime avec l’organisation des Hit Lokal Awards, qui est LA cérémonie dédiée à promouvoir et récompenser les meilleurs artistes de la musique ultramarine.</p>
                        <a href="https://hitlokalawards.com/notopen" target="_blanck" class="btn-solid-top" >en savoir plus</a>                   
				   </div> <!-- end of text-container -->
                </div> <!-- end of col -->
				    <div class="col-lg-7 col-xs-12">
                    <div class="image-container" style="position:absolute; float:right; z-index:1" >
                           <img class="img-fluid p-3" src="images/awards/image-22.png" alt="alternative" />
				           <img class="img-fluid p-2" src="images/awards/image-21.png" alt="alternative" />
						   <img class="img-fluid p-1" src="images/awards/image-20.png" alt="alternative" />
                        
						
						
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details 1 -->




<!-- --- -->	
<!-- --- -->	
<!-- Qui somme nous -->
<!-- --- -->
<!-- --- -->

		<div id="lassociation" class="basic-4 somme-nous position-relative" style="z-index:2">
	   
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="image-container" style="position:absolute; z-index:1" >
                         <img class="img-fluid p-1" src="images/awards/centre.jpg" alt="alternative" />
                         <img class="img-fluid p-2" src="images/qui-somme-nous/centre.jpg" alt="alternative" />
                      <!--   <img class="img-fluid p-3" src="images/qui-somme-nous/centre.png" alt="alternative" /> -->
						
						
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6 col-xs-12">
                    <div class="text-container">
					     <div style="display: flex; align-items: end; justify-content: end;">
                        <h2 class="h2-heading-right">A propos</h2><span class="line-3" ></span>
						</div>
						<h4>Qui sommes-nous</h4>
                        <p class="text-1"> Hit Lokal est une association qui a pour but de promouvoir la culture musicale à travers un site internet, une cérémonie de récompenses annuelle
Les récompenses de la musique urbaine 100% lokal, 100% public 
 </p>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details 1 -->

<!--  FOOTER AREA START  -->
<div id="footer" class="">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6 col-md-6 footer-widget">
			       <a class="logo-image" href="/index.php"><img width="81" height="83" src="/images/logo---.png" alt="alternative"></a>
                <div class="footer-widget footer-text">
                    <p>Association événementielle <br />culturelle créée en 2012.</p>
                </div>
            </div>
            <div class="col-lg-3 col-sm-4 col-md-4">
                <div class="footer-widget footer-link">
                    <h4>MENU</h4>
                    <ul>
                        <li><a href="#">Actualités</a></li>
                        <li><a href="#">Top</a></li>
                        <li><a href="#">Artistes</a></li>
                        <li><a href="#">L’Association</a></li>
                        <li><a href="#">Awards</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="footer-widget footer-link">
                    <h4>CONTACT</h4>
                    <ul>
                        <li><a href="#">contact@hit-lokal.com</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="footer-widget  footer-link">
                        <h4>Suivez nous</h4>
                                       <div class="social-container">
                        <span class="fa-stack">
                            <a href="https://fr-fr.facebook.com/pages/Hit-Lokal/278235282267372">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-facebook-f fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="https://twitter.com/hitlokal">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-twitter fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="https://www.instagram.com/hitlokal/?hl=fr">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-instagram fa-stack-1x"></i>
                            </a>
                        </span>
                    </div> <!-- end of social-container -->
                </div>
            </div>
        </div>
        <div class="row footer-nd">
            <div class="col-lg-12 text-center">
                <div class="footer-copy">
                   © 2012 - 2023, Hit Lokal - Tous droits réservés.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
<script src="/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
<script src="/js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
<script src="/js/isotope.pkgd.min.js"></script> <!-- Isotope for filter -->
<script src="/js/scripts.js"></script> <!-- Custom scripts -->
<script src="/js/sharer.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<noscript>
    <a href="https://www4.smartadserver.com/call/pubjumpi/94540/628914/13520/S/[timestamp]/?" target="_blank">
    <img src="https://www4.smartadserver.com/call/pubi/94540/628914/13520/S/[timestamp]/?" border="0" alt="" /></a>
</noscript>

<script type="text/javascript">
$(document).ready(function(){
    document.getElementById("search").addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
            document.getElementById("form-1").submit();
            return false;
        }
    });
});
</script>

<script>
let items = document.querySelectorAll('.carousel .carousel-item')

//let texts = document.querySelectorAll('.widget-49 .carousel-item')

items.forEach((el) => {
    const minPerSlide = 5
    let next = el.nextElementSibling
    for (var i=1; i<minPerSlide; i++) {
        if (!next) {
            // wrap carousel by using first child
        	next = items[0]
      	}
        let cloneChild = next.cloneNode(true)
        el.appendChild(cloneChild.children[0])
        next = next.nextElementSibling
    }
})

$('#recipeCarousel').bind('slide.bs.carousel', function() {
    currentIndex = $('div.active').index() + 1;
     $('#textCarousel').carousel(currentIndex);
 
  })
  
 // .on('slide.bs.carousel', function (event) {
</script>
</body>
</html>