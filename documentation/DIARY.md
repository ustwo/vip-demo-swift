
# Diary 

We started by coming up with an idea for the sample app and decided upon something music related (since we are both music fans). We decided to implement a simple application to display a   list of top artists and a list of top albums for each artist in a master-detail style user interface.

We then reviewed the [Clean Swift’s](http://clean-swift.com/) Clean Store [example](https://github.com/Clean-Swift/CleanStore) and downloaded their excellent Xcode templates.

## Artists scene

Having decided upon an idea we created this sample project and the first feature ("Scene") using the template which was the Artists list scene. We had the `ArtistsViewController`, `ArtistsInteractor` and `ArtistsPresenter` connected up via the `ArtistsConfigurator` but decided to make changes to the template generated files and remove the name spaced models i.e. Requests, Responses and View Models from our scene. We wanted to simplify and felt these were cool but not necessary. For example to add a new interaction we would need to add a new request and response as well as interactor methods.

Also we looked at the input and output protocol themselves and initially decided that we would only use the output protocols for the signatures as duplicating code in both protocols for the sake of boundaries was added overhead (or so we thought). 

We first completed the Artists list scene by creating an `ArtistsWorker` returning dummy data to verify the VIP cycle was working and we could display data. 

## Input / Output Protocols 

The next day we took a step back to decide upon the input protocols again and saw that there is value to these protocols which is to have a specific type for that class e.g. `ArtistsViewController` has it's own protocol i.e. `ArtistsViewControllerInput` rather than relying on the `ArtistsPresenterOutput` protocol that it implements. This also gives us the freedom to add functions to the ViewController's interface i.e input that isn't related to Presenter's output should we want to test that later (via a spy). So to avoid maintaining the same functions in both protocols we decided to make the input protocol of class B conform to the output protocol of class A so that we can inherit the functions.

## Network and Stores

Now that we had things populated it was time to power the app with an actual API for finding Artists info. We used the [Last.fm API](http://www.last.fm/api) given we had familiarity with it and it was fairly easy to integrate. 

We added a simple wrapper, around [URLSession](https://developer.apple.com/reference/foundation/urlsession) to send [URLRequest’s](https://developer.apple.com/reference/foundation/urlrequest) with a closure for completion. (Note. this is a best practice we typically do so that we could in theory change the underlying network library e.g. use [Alamofire](https://github.com/Alamofire/Alamofire) by having an interface around it)

Then we updated the `ArtistsWorker` to take an object that conforms to a Store protocol for fetching Articles. As per [Clean Swift](http://clean-swift.com/), using Stores allows us to abstract different sources for where the Artists data comes from i.e. API, Disk, Memory etc and test this more easily later.   We built an `ArtistAPIStore` for retrieving specifically from the and this would be the default store for our worker.

Note. We debated whether the Interactor should be the one to decide which workers / stores should be used or whether another object e.g. a Service should control but decided to stick with the pattern until we see a need to separate that e.g. if moving this code into a shared framework.

## Parsing

For parsing the data from the API this is largely up to developers how to model as VIP does not prescribe a way to do this. We modelled this using a generic `Parsable` protocol that our business models i.e. `Artist` would implement. Finally we updated the `ArtistsAPIStore` to serialise the JSON, parse the response via the protocol above and send the parsed array of `Artist` models to the `ArtistPresenter` (via the `ArtistWorker` that wraps the store).

## Presenter and View Model

Next we finalised our `ArtistViewModel` by including all the fields we wanted it to display and updated our `ArtistPresenter` to convert `Artist` models into an array of `ArtistViewModel` structs (giving them to the Presenter output to display).

Note. we thought about creating a view model for the entire screen that would contain this array of `ArtistViewModel` but decided that we didn’t need it for this example but it’s something we may find works out better in the long run. 

## Image Downloading

We had some discussion around whether to download `Artist` images via the Interactor i.e. VIP cycle and whether this would work well with [UITableView](https://developer.apple.com/reference/uikit/uitableview) logic. We decided not to because for each image download that completes we would need to reload the cell(s) and also ideally store the [UIImage](https://developer.apple.com/reference/uikit/uiimage) in each view model to populate which would be bad for performance and memory (as opposed to a local path or reference). Also image downloading didn’t feel like business logic so we felt it was ok not to use the Interactor here (and built a simple `ImageManager` and `ImageMemoryStore` to cache the images on top of our networking wrapper).
	
## Routing 

The final piece of the Artist list scene was how navigation would work when an `Artist` is selected. We noticed we needed to send the `Artist` to the `ArtistsRouter` in order to give it to the next screen so we added a variable to hold these `Artist` business models in the `ArtistsInteractor`. 

We felt that in the `ArtistsInteractor` was better than in the `ArtistsViewController` since it knows about these models anyway and keeps logic away from the `ArtistsViewController`.

## Artist Detail

Having completed our first scene adding the `ArtistDetail` scene was relatively easy. This screen displays `Album` models and thumbnails for the previously selected `Artist` in a table view as well.
	
## Unit Tests

We’re keen on unit tests but only at this stage did we feel ready to start seeing how they work in a VIP architecture. We followed [Clean Swift](http://clean-swift.com/test-driven-development-using-clean-architecture-part-1/) again, created test stubs for our methods and filled them in.

After completing the tests there were some changes we made:

- More use of initialisers (with default values) instead of mutable vars
- A Router protocol for spying
- Updated the view controller to take a configurator so we could inject it in the tests.

## Summary

All in all we learned how to build simple client / server iOS application using the VIP architecture instead of MVC. We still have some questions (such as view models for the screens, syncing model layer changes) but we feel we have enough knowledge of the advantages this architecture gives to iOS application development (e.g. smaller view controllers) and testing (strict simple responsibility principle) and we now feel more confident architecting other applications this way.