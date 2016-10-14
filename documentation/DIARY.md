
## Diary 

We started by thinking of a concept / idea for the sample app and decided upon something music related since we are both music fans.

We then reviewed the Clean Swift examples for the Create Order / List order and downloaded the Xcode templates there.

Having decided upon an idea we created this sample project and created the first feature ("Scene") using the template. We had the View Controller, Interactor and Presenter connected up but decided to remove the name spaced models i.e. Requests, Responses and View Models from our scene because we felt they were adding overhead that we could do without. For example to add a new interaction we would need a new request and a new ViewControllerOutput (InteractorInput) function.

Also we looked at the inpTODO: ut and output protocol themselves and initially decided that we would only use the Output protocols for the signatures as duplicating code in both protocols for the sake of boundaries was adding overhead that we could do without. 

We first completed the Artists list scene by creating a worker returning dummy data (no stores, or networking yet) to verify the VIP cycle was working. 

The next day we took a step back to decide upon the input protocols again and saw that there is value to the input protocols which is to have a specific type for that class e.g. ViewController has it's own protocol i.e. ViewControllerInput rather than relying on the PresenterOutput protocol plus this gives us the freedom to add functions to the ViewController's interface i.e input that isn't related to Presenter's Output should we want to test that later via a spy. So to avoid maintaning the same functions in both protocols we decided to make the input protocol conform to the output protocol (use protocol conformance) so that we can inherit the functions.

TODO: Network and Stores

TODO: Parsing

TODO: View Model

TODO: Presenter 

TODO: Artists List UI elements

TODO: Image Downloading

	VIP cycle or not
	
TODO: Routing 

TODO: Artist Detail
	
TODO: Unit Tests

TODO: Error handling 

TODO: Pull to refresh 

TODO: Image Caching 