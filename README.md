# Movies App

# MoviesWave - "Discover the World of Movies"

The project is a simple yet powerful movie discovery app built for iOS.  
Users can explore trending movies, search for their favorite films, and view detailed information, including trailers directly from YouTube.  
The app features a modern, intuitive interface, making movie exploration both seamless and enjoyable.

****

Code source available on GitHub: [MoviesProject](https://github.com/Sunbekova/MoviesProject)

About the App:  
The MoviesWave app connects to The Movie Database (TMDb) and YouTube API, offering users real-time information on movies and trailers. Users can view details such as the movie's title, release date, rating, and overview while enjoying smooth transitions between screens.

****

# Table of Contents
1. [Technical Topics](#topics)
2. [App Source](#app-source)
3. [Basic Information about the App](#app-description)
4. [Database Integration](#database-integration)
5. [Project Preview](#project-preview)
6. [Project Members](#project-members)
7. [Topics Covered at This Time](#used-topics-at-this-time)


# Topics
| Technical Side |
|----------------|
| MVC Architecture |
| API Integration |
| Networking with URLSession |
| JSON Parsing |
| AVPlayer for Video Playback |
| WebKit for Embedded Trailers |
| UserDefaults for Data Persistence |


# App Source
Explore trending movies, search for your favorites, and watch trailers.  

| Navigation | Description |
|------------|-------------|
| Trending Movies | Discover popular movies updated daily |
| Search Movies | Search for movies by name |
| Movie Details | View detailed information about a movie and its trailer |
| Favorites | Save favorite movies for later viewing |

APIs used:
- TMDb API: [https://www.themoviedb.org/](https://www.themoviedb.org/)
- YouTube API: [https://developers.google.com/youtube/](https://developers.google.com/youtube/)


# App Description

The app offers a sleek design that enables users to:
- View a list of trending movies, updated in real-time using the TMDb API.
- Access detailed information about each movie, including title, release date, rating, and an overview.
- Watch embedded trailers directly via the WebKit-based YouTube integration.
- Search for movies quickly and efficiently.
- Save favorite movies for quick access later.

The project emphasizes simplicity and functionality while providing a smooth user experience powered by modern iOS development techniques.

[Go to top](#movies-app)


# Database Integration

The app uses **UserDefaults** for local data persistence.  
This allows users to save and manage their favorite movies even after closing and reopening the app.

| Feature | Description |
|---------|-------------|
| Save to Favorites | Users can add movies to their Favorites list, stored using UserDefaults. |
| Remove from Favorites | Users can remove movies from their Favorites list. |
| Persistent Storage | Favorites are saved locally and persist between app launches. |

> **Note:** UserDefaults is efficient for lightweight storage like saving favorite movie IDs and titles.  
> For more complex data handling, integrating Core Data or Realm could be considered in future updates.

[Go to top](#movies-app)


# Project Preview

| **Trending Movies** | **Movie Details** | **Search** | **Favorites** |
|---------------------|-------------------|------------|---------------|
| ![Trending](https://github.com/user-attachments/assets/1b3f652f-741b-483f-a3d7-ffe22b31f838) | ![Details](https://github.com/user-attachments/assets/07c189f9-2d3f-410b-a3cd-fc9720c83667) | ![Search](https://github.com/user-attachments/assets/a77d4654-bacd-4d28-a5f8-e12b3c6e8d2d) | ![Favorites](https://github.com/user-attachments/assets/08d020aa-2f0a-4fcb-9e04-2ca8a92246e1) |

Embedded Trailer Example:

[![YouTube Trailer](https://img.youtube.com/vi/dummyID/0.jpg)](https://www.youtube.com/embed/dummyID)

[Go to top](#movies-app)


# Project Members
| Full Name          | ID         | GitHub                                      |
|-------------------|------------|---------------------------------------------|
| Suanbekova Aisha  | 22B030589 | [Suanbekova](https://github.com/Sunbekova/) |
| Tulepbergen Anel  | 22B030602 | [Tulepbergen](https://github.com/tttulepbergen) |
| Kemel Merey       | 22B030615 | [Kemel](https://github.com/kemelmerey) |

[Go to top](#movies-app)


# Used Topics at This Time

| Technical Side             | Topics Covered |
|----------------------------|----------------|
| MVC Architecture           | ✓ |
| Networking with URLSession | ✓ |
| JSON Parsing               | ✓ |
| TMDb API                   | ✓ |
| YouTube API                | ✓ |
| AVPlayer for Trailers      | ✓ |
| WebKit Integration         | ✓ |
| UserDefaults for Persistence | ✓ |

[Go to top](#movies-app)
