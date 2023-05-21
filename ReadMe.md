# SwiftUI Pokedex

This project is a Pokedex built with SwiftUI targeting iOS 16. It includes three main tabs: 
- The Home tab
- The Pokedex search tab
- The Profile tab

This project uses SkeletonUI for the Skeleton effects on the elements when loading (Mostly to try not to have too much layout shifting) and is the only dependency of this project. The API used is the PokeAPI, and for storing bookmarked Pokemon, we use Userdefaults (As the count of items is not that high and we do not need anything more complex)

## Folder structure
- Model: These are the data models for the app. For the most part, they are based on PokeAPI's Schema
- NavigationContatiner: These are the Navigation Containers that we mount under the tab views. In a more complex project, these can be setup so that Deeplinks or more programatic navigation is possible (But for this use case, we haven't used it to its full potential)
- Utils: These are general utility types, including a singlton Network and a function for fetching data and caching it. It also includes an ErrorHandler, which can be extended to use something like Sentry for keeping track of errors
- View: These are the Views for the app. For the most part they are screens, but any other Component is put here as well. Can be compartmentalised out of this into it's own package if there is a plan to expand this
- ViewModels: These Viewmodels are extensions of the Views they are bound to. This has a couple of advantages, Such as ensuring that the Views and the ViewModels have a 1-1 relationship and clear purpose