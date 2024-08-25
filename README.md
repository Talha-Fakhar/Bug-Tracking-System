Bug Tracking System
This is a comprehensive Bug Tracking System built with Ruby on Rails, designed to streamline project management, bug tracking, and issue resolution within development teams. The application supports user authentication, project management, bug assignment, and role-based access control.

Features
User Authentication
Sign Up, Login, Logout: Users can register, log in, and log out securely using the Devise gem.
User Roles: The system supports three user roles: Manager, QA, and Developer.
Project Management
Manager Privileges:
Can create, view, edit, and delete projects.
Can assign multiple QAs and Developers to projects.
Can view all bugs within projects they manage.
Bug Management
Bug Creation:

Only QAs can create bugs within projects assigned to them.
Bugs belong to a specific project and are assigned to a developer for resolution.
Bug attributes include title, description, deadline, screenshot, type (feature or bug), and status.
The title, status, and type fields are required, while description and screenshot are optional.
The screenshot must be a PNG or GIF image, enforced by the CarrierWave gem.
Unique Bug Titles: Bug titles must be unique within the scope of a project.

Status Management:

Status values differ based on the bug type:
For feature: new, started, completed.
For bug: new, started, resolved.
User Role Capabilities
Manager:
Can manage projects and view all associated bugs.
QA:
Can view and manage bugs within their assigned projects.
Can edit or delete bugs they have created.
Developer:
Can view projects and bugs assigned to them.
Can update the status of bugs assigned to them.
Requirements
Database Schema
Create the database schema on paper and get approval from your trainer before coding.
Gems Used
Devise: For authentication.
Cancancan: For authorization.
CarrierWave: For image uploading.
Bootstrap: For styling.
