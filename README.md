# UserList 

User Project.

![alt text](https://github.com/shukill/UserList/blob/main/app_preview.png?raw=true)

#### Tools
    - GetX - Preferred over BLOC to reduce boiler code and get smoother user interaction
   


#### Layers:

**core**
    - contains [constants] mainly having app constants , such as base url , image paths and all
    - contains [styles] contains app text styles , common decoration and all

**views**
    - contains [modules] mainly dedicated folder for every relevent screen/state in the application
  
**modules** 
    - contains [components] to interact in presentation layer. All the common widgets for the widget tree
    - contains [controllers] get controllers to manage state across the application.
    - contains [models] for parsing external JSON from API.
    - contatins [services] for getting data from external api or local DB

**test** - test should follow the same directory structure as the production code.

