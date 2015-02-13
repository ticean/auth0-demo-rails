auth0-demo-rails
=================

This is Rails application for the Auth0 SSO example. It has been modified so 
that all configuration comes from ENV.

## Configuration

The following ENV are required. You can set however you'd like. A `.env` file
is supported.

````bash
PORT=3000
AUTH0_CLIENT_SECRET=myCoolSecret
AUTH0_CLIENT_ID=myCoolClientId
AUTH0_DOMAIN=samples.auth0.com
AUTH0_CALLBACK_URL=http://localhost:3000/auth/auth0/callback
````
