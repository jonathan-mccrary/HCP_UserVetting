# HCP_UserVetting

<div>
<h2>Challenge Prompt</h2>
<h3>Coding Challenge – Provider Vetting - Health Connect Partners</h3>
<p>
<h4>Objective</h4>
Providers are invited to our conferences and given free airfare and hotel rooms. Therefore, we want to make sure we are inviting the most valuable providers we can. Create a small web page to allow us to vet these providers based on a series of questions. After the questions are answered, display the results to the user and save the answers to the database.
</p>
 
<p>
<h4>Recommended Technologies</h4>

<ul>
  <li>.Net Core MVC Website</li>
  <li>Entity Framework</li>
  <li>React</li>
</ul>
</p>

<p>
<h4>Guidelines:</h4>

We do not want to overwhelm a provider with a long list of questions, so the list of questions has been boiled down to 3 questions with optional sub questions that will appear/disappear depending on the previous answers. Providers will be prompted for their name and email address, and then a list of questions.
</p>

<p>
<h4>Vetting Questions</h4>
<ol>
  <li>
    Are your hospital/health system product or service decisions made by a Value Analysis Committee (or other committee)? [Yes or No answer]
    <ul>
      <li>
        IF YES: Are you on the committee? [Yes or No answer]
      </li>
      <li>
        IF YES: Are you a voting member? [Yes or No answer]
      </li>
    </ul>
  </li>
  <li>
    Are you a decision maker on products or services used in your hospital/system? [Yes or No answer]
    <ul>
      <li>
        IF NO: 
        <ul>
          <li>
            Are you an influencer on products and services purchased for your hospital/system?
          </li>
          <li>
            What is the name and title of the decision maker from your hospital/system? (free form)
          </li>
        </ul>
      </li>
      <li>
        IF YES to being Decision Maker
        <ul>
          <li>
            Do you make decisions exclusively for the facility where you work daily, or are you responsible for more than one facility?
            <ul>
              <li>
                A. My Facility
              </li>
              <li>
                B. Multiple Facilities
              </li>
            </ul>
          </li>
          <li>
            IF Multiple Facilities Selected
            <ul>
              <li>
                Do you make decisions for multiple facilities on a regional or national basis for your organization?
                <ul>
                  <li>
                     A. Regional
                  </li>
                  <li>
                    B. National
                  </li>
                </ul>
              </li>
              <li>
                How Many facilities are you currently responsible for? (Free type number)
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    In your current role, do you regularly communicate and/or meet with vendors/suppliers?
    <ul>
      <li>
        Less than 10%
      </li>
      <li>
        10 - 20%
      </li>
      <li>
        20 – 40%
      </li>
      <li>
        Over 40%
      </li>
    </ul>
  </li>
</ol>
</p>

<p>
  <h4>Vetting Rules</h4>
  
  <ul>
    <li>
    If the provider is not on the committee and a committee exists, they should fail.
    </li>
    <li>
    If they answer no to question 2, they should fail. If they are an influencer and there is no committee (Question 1) they should fail.
    </li>
    <li>
    If they answer no to question 3, they should fail.
    </li>
    <li>
    If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
    </li>
    <li>
    Otherwise, the provider should pass.
    </li>
  </ul>
</p>

<p>
<h4>Considerations</h4>

  <ul>
  <li>
    Providers must answer all questions before proceeding.
  </li>
  <li>
    Once a provider has answered the questions, they are not allowed to take the vetting questionnaire again.
  </li>
  <li>
    Questions will most likely evolve and change over time. Keep this in mind when saving the answers to the database.
  </li>
  </ul>
</p>
</div>

<div>
  <h2>Applicaiton Description</h2>
  
  <p>
  This is a .NET Core MVC single-page application using React.js as the UI builder. The logic to handle the rules laid out in the prompt is contained within a rules engine. These rules are stored in database tables which are read at runtime. This allows the rules engine to be flexible and data-driven. 
  </p>
  <p>
  All scripts to build the database tables and rules are contained within the solution. 
  </p>
  <p>
  Considerations: Since it was built on Visual Studio for Mac, the JavaScriptEngineSwitcher.ChakraCore.Native.osx-x64 (3.7.1) dependency will need to be changed to a Windows native package. Granted, since the application is dependent on a connection to SQL Server, the corresponding database must be setup and connection strings changed in the application.
  </p>
</div>

<div>
  <h2>Dependencies & Technologies</h2>
  
  <ul>
  <li>
  JavaScriptEngineSwitcher.ChakraCore (3.3.2)
  </li>
  <li>
  JavaScriptEngineSwitcher.ChakraCore.Native.osx-x64 (3.3.2)
    </li>
  <li>
  JavaScriptEngineSwitcher.Core (3.3.0)
    </li>
  <li>
  JavaScriptEngineSwitcher.Extensions.MsDependencyInjection (3.3.0)
    </li>
  <li>
  JavaScriptEngineSwitcher.V8 (3.1.1)
    </li>
  <li>
  Microsoft.EntityFrameworkCore (3.1.1)
    </li>
  <li>
  Microsoft.EntityFrameworkCore.Design (3.1.1)
    </li>
  <li>
  Microsoft.EntityFrameworkCore.Relational (3.1.1)
    </li>
  <li>
  Microsoft.EntityFrameworkCore.SQLServer (3.1.1)
    </li>
  <li>
  Newtonsoft.Json (12.0.3)
    </li>
  <li>
  React.AspNet (5.2.8)
    </li>
  <li>
  React.Core (5.2.8)
  </li>
  </ul>
</div>

<div>
  <h2>Other Technologies Used</h2>
  
  <ul>
  <li>
    Docker - Conatiner for SQL Server instance on Mac
  </li>
  <li>
    Azure Data Studio - SQL manipulation for SQL Server instance
  </li>
  </ul>
</div>
