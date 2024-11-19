# To-Do List App

The To-Do List App is a Flutter application that allows users to create, manage, and delete tasks. It leverages Firebase as the backend and uses the Provider package for state management. The app ensures real-time data synchronization.

**Features**  
- Add new tasks to the to-do list.  
- Mark tasks as completed or revert them to pending.  
- Delete tasks when no longer needed.  
- Real-time updates of tasks with Firebase Cloud Firestore.  

**Installation Instructions**  
1. Clone the repository:  
   `git clone (https://github.com/maksklimko/ProviderTodoList.git)`  
2. Navigate to the project directory:  
   `cd provider_todo_list`  
3. Install dependencies:  
   `flutter pub get`  
4. Set up Firebase:  
   - Download `google-services.json` or `GoogleService-Info.plist` file.   
5. Run the application:  
   `flutter run`  

**Usage**  
1. **Home Screen**: Displays a list of tasks.  
2. **Add Task**: Use the input field and button to add new tasks.  
3. **Mark as Completed**: Tap on a task checkbox to toggle its status.  
4. **Delete Task**: press remove button to delete it.  

**Folder Structure**  
The project follows a **feature-based** folder structure to maintain modularity and scalability.  

**State Management**  
The application uses the **Provider** package for managing state. Providers handle UI logic and interact with the repository layer for data retrieval and updates.  
