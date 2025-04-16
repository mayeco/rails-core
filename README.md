# Rails Modern Application

A modern Ruby on Rails application built with Rails 8.0, designed for compatibility with modern browsers. This application includes comprehensive authentication options and leverages the latest Rails features for performance and scalability.

## Prerequisites

Ensure you have the following installed on your system:

- **Ruby**: 3.4.3 (using [RVM](https://rvm.io) or any Ruby version manager)
- **PostgreSQL**
- **Redis**
- **Node.js**

## Setup Instructions

Follow these steps to set up the application:

1. **Clone the repository**:
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Install dependencies**:
   - Install Ruby Gems:
     ```bash
     bundle install
     ```
   - Install JavaScript dependencies:
     ```bash
     bin/importmap
     ```

3. **Set up the database**:
   ```bash
   bin/rails db:setup
   ```

4. **Start the application**:
   ```bash
   bin/dev
   ```

## Key Features

- **Modern Browser Requirements**: Enforced compatibility with modern browsers supporting advanced features like WebP images, web push, and CSS nesting.
- **Comprehensive Authentication**:
  - User authentication powered by [Devise](https://github.com/heartcombo/devise)
  - OmniAuth integrations for Google, Facebook, and Microsoft.
- **High Performance**:
  - Redis-backed caching and queueing.
  - SolidCable, SolidQueue, and SolidCache for websocket, job, and cache optimizations.

## Deployment

This application is containerized using Docker and supports deployment using [Kamal](https://kamal-deploy.org). Ensure that Kamal is configured correctly for seamless deployment.
