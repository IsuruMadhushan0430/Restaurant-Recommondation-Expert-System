%These are the facts........... 
% restaurant(Name, Style, Taste, Budget, FoodType)


restaurant(spicy_house, indian, spicy, medium, non_veg).
restaurant(veggie_delight, veg, mild, low, veg).
restaurant(street_flavors, street_food, spicy, low, non_veg).
restaurant(pasta_palace, italian, mild, high, veg).
restaurant(sushi_world, japanese, mild, high, non_veg).
restaurant(curry_corner, indian, spicy, low, veg).
restaurant(budget_bites, indian, mild, low, veg).
restaurant(chilli_chef, indian, spicy, medium, non_veg).
restaurant(raju_bhai, sri_lankan, spicy, high, non_veg).
restaurant(dk_restaurant, sri_lankan, mild, high, non_veg).
restaurant(cafitaria, sri_lankan, mild, low, non_veg).
restaurant(ramen_rush, japanese, spicy, low, non_veg).
restaurant(ice_bar, dessert, sweet, low, veg).
restaurant(donut_shop, dessert, sweet, low, veg).


% --- Main recommendation logic ---
recommend :-
    ask_preferences(Style, Taste, Budget, Type),
    findall(Restaurant,
            restaurant(Restaurant, Style, Taste, Budget, Type),
            RestaurantList),
    show_recommendations(RestaurantList, Style, Taste, Budget, Type).

% --- Ask user preferences ---
ask_preferences(Style, Taste, Budget, Type) :-
    nl, write('--- Restaurant Recommender System ---'), nl,
    write('What type of style do you like? (indian/italian/dessert/japanese/sri_lankan/veg/street_food): '), read(Style),
    write('Do you like spicy or mild food? (spicy/mild/sweet): '), read(Taste),
    write('What is your budget? (low/medium/high): '), read(Budget),
    write('Are you vegetarian or non vegetarian? (veg/non_veg): '), read(Type).

% --- Show recommendations with explanations ---
show_recommendations([], _, _, _, _) :-
    nl, write(' Sorry, no restaurant matches your preferences.'), nl, !.

show_recommendations(RestaurantList, Style, Taste, Budget, Type) :-
    nl,
    write('---  Reasoning ---'), nl,
    format('Because you prefer ~w style, ~w taste, ~w budget, and ~w food,~n', [Style, Taste, Budget, Type]),
    write('these restaurants match your preferences:'), nl, nl,
    list_restaurants(RestaurantList),
    nl, write(' You can choose any of the above based on your location or choice.'), nl.

% --- Helper to list restaurants neatly ---
list_restaurants([]).
list_restaurants([Head|Tail]) :-
    format('→ ~w~n', [Head]),
    list_restaurants(Tail).

% --- Start system ---
start :-
    nl, write('==============================='), nl,
    write(' Welcome to the Restaurant Recommender Expert System '), nl,
    write('==============================='), nl,
	write('=====Presented By CodeDot======'), nl, nl,
    recommend,
    nl, write('--- Enjoy your meal! ---'), nl.

