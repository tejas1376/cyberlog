# Session 4:

## Project Overview
A simple Flutter application demonstrating a home dashboard with proper Scaffold structure, AppBar, and Column layout with two cards.

## Features
- **Structurally Sound Scaffold**: Proper Flutter widget hierarchy
- **AppBar**: Customized app bar with title styling
- **Column Layout**: Vertical arrangement of widgets
- **Two Container Cards**: Demonstrating layout and styling skills
- **Responsive Design**: Works on different screen sizes

## Widgets Used
1. **Scaffold**: Basic app structure
2. **AppBar**: Top navigation bar
3. **Column**: Vertical layout
4. **Container**: For cards with custom styling
5. **Text**: Displaying content
6. **SizedBox**: For spacing

## Code Structure
- `main.dart`: Entry point
- `MyApp`: Root widget
- `HomeScreen`: Main screen with dashboard

## What This Demonstrates
✅ Proper Scaffold structure  
✅ AppBar customization  
✅ Column layout skills  
✅ Container styling (margin, padding, decoration)  
✅ Text styling  
✅ Basic Flutter widget hierarchy  

# Session 5:

## Project Overview

This Flutter application demonstrates how to create a home screen using GridView.
The app displays four placeholder cards arranged in two columns, representing different sections of a cyber-related application.

## Features Implemented

Uses GridView.count to create a two-column layout

Displays four cards:

Daily Log

Cyber Tips

Device Security

Notes

Each card uses:

Container

BoxDecoration

Rounded corners (borderRadius)

Icon and text

Simple and clean UI suitable for beginners

## Widgets Used

MaterialApp – root widget of the app

Scaffold – basic page structure

AppBar – top bar with title

GridView.count – grid layout with fixed number of columns

Container – used for card design

BoxDecoration – used for background color and rounded corners

Icon and Text – to show content inside cards

## How It Works

The home screen uses a GridView with crossAxisCount: 2, which creates two columns.

Each grid item is a Container styled using BoxDecoration.

Icons and text are placed inside the container using a Column.

Padding and spacing are added to improve the UI while keeping the code simple.

## Purpose of This App

This project helps beginners understand:

Grid layout in Flutter

Basic UI styling

Reusable widgets using simple functions

Clean and readable Flutter code

## Conclusion

This app successfully demonstrates a basic yet visually neat GridView UI using beginner-level Flutter concepts.
It is suitable for academic assignments and learning layout fundamentals.

# Session 6

## Project Overview

CyberLog is a basic Flutter application that demonstrates the core structure of a mobile app using a BottomNavigationBar.
The app contains three main pages: Home, Logs, and Settings.
Each page displays different content, and navigation is handled using icons at the bottom of the screen.

## Features

BottomNavigationBar for main navigation

Three main screens:

Home

Logs

Settings

Smooth switching between screens when icons are tapped

Use of Card widget to display log information

Clean and realistic UI using beginner-level Flutter widgets

## Widgets Used

MaterialApp – root widget of the application

Scaffold – provides app structure (AppBar, Body, BottomNavigationBar)

BottomNavigationBar – used for navigation between pages

Card – used to display log items with elevation and rounded corners

ListTile – used inside Card for structured content

ListView – used to display multiple logs and settings

Icon and Text – used to show icons and labels

## How Navigation Works

The selected tab index is stored in a variable called currentIndex.

When a user taps a bottom navigation icon, setState() updates the index.

The body content changes based on the selected index.

## Role of Card Widget

The Card widget is used in the Logs page.

It helps group log information in a clean and readable way.

Cards provide elevation (shadow) and rounded corners, making the UI look realistic.

## Learning Outcome

This project helps in understanding:

Bottom navigation structure in Flutter

Screen switching using state

Use of Card and ListTile widgets

Building a simple and realistic app layout

## Conclusion

The CyberLog app demonstrates a simple yet effective Flutter app structure suitable for beginners.
It follows material design principles while keeping the code easy to read and understand.

# Session 7

## Project Overview

CyberLog is a basic Flutter application that demonstrates how Provider can be used to manage application state in a clean and simple way.
The app manages user logs and app settings using ChangeNotifier and displays them across multiple screens.

## Features

BottomNavigationBar based app structure

Three main screens:

Home

Logs

Settings

Provider used for state management

User logs managed centrally

App settings (notifications ON/OFF) managed using Provider

Dark theme UI

Beginner-friendly and easy to understand code

## Technologies & Widgets Used

Flutter

Provider package

ChangeNotifier

notifyListeners()

MultiProvider

BottomNavigationBar

ListView

Card

ListTile

SwitchListTile

🧠 How Provider is Used
🔹 Log Management

LogProvider stores a list of user logs.

New logs are added from the Home screen.

Logs are displayed on the Logs screen.

UI updates automatically using notifyListeners().

## Settings Management

SettingsProvider manages app settings.

A notification setting is toggled using a switch.

Changes are reflected immediately on the UI.

## Navigation Flow

BottomNavigationBar is used to switch between:

Home

Logs

Settings

The selected tab index is updated using setState().

Each screen consumes data from Provider where required.

## Learning Outcomes

This project helps understand:

State management using Provider

Managing multiple providers using MultiProvider

Sharing data across screens

Creating a realistic app structure

Writing clean and maintainable Flutter code

## Conclusion

The CyberLog app demonstrates a simple yet effective use of Provider to manage both user logs and app settings.
It is suitable for beginners, academic assignments, and viva explanations.