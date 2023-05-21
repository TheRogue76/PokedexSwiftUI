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
- ViewModels: These Viewmodels are extensions of the Views they target. This has a couple of advantages, Such as ensuring that the Views and the ViewModels have a 1-1 relationship and clear purpose as well as streamlinging the naming process

## Networking
We are using the RESTful variant of the PokeAPI for this project (Due to the graphql one being beta and the documentation not being as good). As mentioned before, we are using a singleton Network class, and an Endpoints Enum for the paths. The Endpoints enum has a value of path attached to it, and can be customized based on the url that we need to have as many resource id's as needed.

The queries are defined under Network, and are based on the resources that the Endpoint provides, not the functionality that might be required for a specific ViewModel. This is to ensure a lack of conflict between different components and to keep the logic streamlined. Any resource that a ViewModel might require are defined in it's own scope using a combination of these resource calls

One thing that stands out is the caching and the generic `fetchData` method. As this app only needs to read the data from the server and there are no mutations, we rely heavily on caching to avoid making useless calls and speeding up.

## Image Loading
We are wraping the `AsyncImage` and creating the `ImageView` Component. The main reasoning for this is to make sure we will always have a `View` as an output that takes up the same space across the board so that we can use something like `SkeletonUI` to style it while it is loading and not cause too much layout shift
