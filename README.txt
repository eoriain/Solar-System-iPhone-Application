Our Solar System - An iPhone Application

Specifications: This application was developed using Xcode 13.2.1 and formatted for use on an iPhone 13 Pro.

Application Overview:
The purpose of this application is to allow the user to explore the 10 prominent elements of our solar system: The Sun, Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune and Pluto. 

Application Elements:
The XML file developed to store the information to be called upon in the application was tiered with the family tag <solarsystem> with each element of the solar system being divided within the XML family with the tag <solarsystemelement>. Within each <solarsystemelement> was the characteristic features of each element to be called upon as required through the use of approriate tagging e.g. <name>, <image>, <diameter> and <distFromSun>. Due to the nature of the group, multiple sections was not required to display these element on the UITableViewController. 

In order to display the information contained within the XML file,  an XML parser was developed to call the appropriate information through as required within the application.

There are 6 key elements within the application (The application icon and the 5 application screen):

Application Icon:
I selected an image to repesents my application (which would subsequently be displayed in the application lauch screen). I uploaded this image to an application icon generater site which allowed me to export an AppIcon.appiconset file which contained all the necessary images to the correct dimension to be displayed on alterative device if necessary. I then located the original empty AppIcon.appiconset file in my project directory and replace it with my new folder. Then, once loaded, the application icon on the home screen of the phone would display my new application image.

Screen 1:
The first screen in the application presented to the user is the Launch Screen. This was developed by adding a new storyboard file to the xcode project and within the project setting, assign the new storyboard to the launch screen. Once customised to reflect the branding of the application (e.g. logo, app title, relevent image), while the application is loading during its start up, the launch screen will be displayed to the user until the application is ready to run.

Screen 2:
When the application has loaded, the user will be presented with a TableViewController. The table view calls the <name> and <image> from each <solarSystemelement> to populate each of the "Right Detail" cells. The table view then had a Navigation Controller embedded in it which was identified as the initial view controller. In order to customise further customiser the table view to be inkeeping with the theme of the solar system, a background image of stars was added as a UIImage. This was not possible to be done in the main.storyboard, therefore it was coded into the ElementTableViewController. The cells of the table view were made transparent by setting its background as clear. This was done so as to not obstruct the background image whilst giving its content the effect of floating in space. The same background image was applied to the 3rd screen. Finally, a segue was applied to the table cells to pass the selected cell's index value to the following ViewController, allowing for the data associated with the indexed element to be carried through.

Screen 3:
The third screen included 4 keys elements: A label outlet to present the name of the solarsystemelement; an action button named "Learn More" to segue to the fourth screen; A Previous and Next action button to cycle through the varies solarsystemelements (even if they may not have been initially selected in the table view) by applying +1 or -1 to the active index number and repopulating the screen; And finally, a SceneView to display an interactive model. The scene view contained a camera (the user's viewpoint), a light (to illuminate the model), and a call for my PlanetNode class. The PlanetNode class was contained within a separate swift file, "PlanetModelNode". In this file, a 3D sphere was specified with a rotation added to it. As well as this, it called for the <texture> data image of the selected solarsystemelement to be applied to the sphere as a diffuse material. Finally, I set allowsCameraControl to true to allow for the user to move the camera around the 3D space. This created an interactive display of the planet selected by the user to enhance the user's experience.

Screen 4:
When the user selects the "Learn More" button on screen 3 the detailsData would be pushed to the fourth screen to present the user with further information on the selected solarsystemelement. The solarsystemelement's name, diameter, orbital speed, distance from the sun, fun fact and image is all displayed on this screen though the use of outlet labels (and an outlet UIImageView in the case of the image). Additional images were added to the screen to make the information presented to the use more visual (i.e. arrows to indicate the element's diameter and rotation image for the orbital speed). I also applied a border to the fact label with curved corners to make it more visually pleasing. Finally, an action button named "Explore" was used to segue the detailsData to the fifth screen. The presentation of the fourth screen was extensively considered to ensure that it did not become to cluttered whilst engaging the user.

Screen 5:
The fifth and final screen is a UIWebView. On this screen, the web address contained with the XML under the tag <website> is set at the UIWebView URL by calling that tag from the detailsData push on the segue. the web window is then instructed to load said link to present the user with extensitive information from the NASA website on the specified solarsystemelement.
