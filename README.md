<div>
    <h1>Welcome to Products Application</h1>
    <div>
      This application is created to list out products like Camera, Books and Songs. <br />
      It has an option to update, view and delete the relevent products (Camera, Book or Song).
    </div>
    <h2>Requirements</h2>
    <hr />
    <div> 
      <ul>
        <li>Ruby 1.9.3</li>
        <li>Ruby Gems 1.8.24</li>
        <li>Git</li>
        <li>MySQL</li>    
        <li>NodeJS</li>
      </ul>
    </div>

    <div>
    <h2>Installation</h2>
    <hr />
    Clone the Git repository
    <div> 
      <span>
        $ git clone git@github.com/VivekHarikrishnan/products_app.git
      </span>
    </div>

    Run bundle to install necessary gems
    <div>  
      <span>
        $ bundle install
      </span>
    </div>

    Database setup for the application
    <div>  
      <span>
        $ rake db:create <br/>
        $ rake db:migrate
      </span>
    </div>

    To run the application with initial set of data, use the following command
    <div>  
      <span>
        $ rake db:populate        
      </span>
    </div>

    Run the server
    <div>  
      <span>
        $ rails server
      </span>
    </div>    

    The application should be up and running. 
    You can visit the applications home page through <a target="_blank" href="http://localhost:3000">http://localhost:3000</a>
  </div>
</div>