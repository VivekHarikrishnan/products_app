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
      <ul>
        <li>Clone the Git repository </li><br />
            <ul>
              <li>
                $ git clone git@github.com/VivekHarikrishnan/products_app.git
              </li> <br/>
            </ul>

        <li>Run bundle to install necessary gems</li><br />
        <ul>  
          <li>
            $ bundle install
          </li><br/>
        </ul>

        <li>Database setup for the application</li><br />
        <ul>  
          <li>
            $ rake db:create </li><br/>
            <li>$ rake db:migrate</li><br/>
        </ul>

        <li>To run the application with initial set of data, use the following command</li><br />
        <ul>  
          <li>
                      $ rake db:populate        
          </li><br/>
        </ul>

        <li>Run the server</li><br />
        <ul>  
          <li>
            $ rails server
          </li><br/>
        </ul>    
      </ul>
    </div>
    <div>
      The application should be up and running. <br />
      You can visit the applications home page through <a target="_blank" href="http://localhost:3000">http://localhost:3000</a>
    <div>
</div>