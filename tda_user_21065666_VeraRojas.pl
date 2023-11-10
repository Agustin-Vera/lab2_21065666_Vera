%#################################################################
%             TDA User
%#################################################################
% Representacion: Name X Status
/*
Predicados:
    user(Name, Status, [Username, Status]) (aridad = 3)
    getUserName([Name,_], Name) (aridad = 2)
    getUserStatus([_, Status], Status) (aridad = 2)
    getUsersIDs(UserList, UsernameList) (aridad = 2)
    getUsersStatus(UserList, UserStatusList) (aridad = 2)
    getUserLogged(UserList, User) (aridad = 2)
    userExist(Users, Username) (aridad = 2)
    usersLogged(Users) (aridad = 1)
    changeUserStatus(User, Status, UpdatedUser)  (aridad = 3)
    changeUsersStatus([User|Resto], Username, Status, [UserLogged|Resto]) (aridad = 4)

Metas primarias:

Metas secuandarias:
    
*/
% ------------------------------ Constructor -----------------------------------

% Dominio:
% Descripcion:
% Tipo de algoritmo:
% Recorrido: 
user(Name, Status, [Username, Status]) :-
    string_lower(Name, Username).

% ------------------------------ Selectores ------------------------------------

% Dominio: User X Username
% Descripcion: Obtiene el Name del User
% Tipo de algoritmo: N/A
% Recorrido: String
getUserName([Name,_], Name).

% Dominio: User X int
% Descripcion: Obtiene el status del User
% Tipo de algoritmo: N/A
% Recorrido: int
getUserStatus([_, Status], Status).

% Dominio: UserList X UsernameList
% Descripcion: Dada una lista de Users obtiene todos los nombres de los Users
% Tipo de algoritmo: Recursion de cola
% Recorrido: list
getUsersIDs([], []).
getUsersIDs([User|Resto], [Name|Resultado]) :-
    getUserName(User, Name),
    getUsersIDs(Resto, Resultado), !.

% Dominio: UserList X UserStatusList
% Descripcion: Dada una lista de Users obtiene todos los status de los Users
% Tipo de algoritmo: Recursion de cola
% Recorrido: list
getUsersStatus([],[]).
getUsersStatus([User|Resto], [Status|Resultado]) :-
    getUserStatus(User, Status),
    getUsersStatus(Resto, Resultado), !.

% Dominio: UserList X User
% Descripcion: Dada una lista de User obtiene al User con sesion iniciada
% Tipo de algoritmo: Recursion de cola
% Recorrido: User
getUserLogged([], []).
getUserLogged([User|_], User) :-
    member(1, User), !.
getUserLogged([_|Resto], Resultado) :-
    getUserLogged(Resto, Resultado).

% ------------------------------ Pertenencias ----------------------------------

% Dominio: UserList X String
% Descripcion: Verifica si un User existe dentro de una lista de Users
% Tipo de algoritmo: N/A
% Recorrido: boolean
userExist(Users, Username) :-
    getUsersIDs(Users, UserNames),
    string_lower(Username, NewUsername),
    member(NewUsername, UserNames).

% Dominio: UserList
% Descripcion: verifica si hay usuarios iniciados
% Tipo de algoritmo: N/A
% Recorrido: boolean
usersLogged(Users) :-
    getUsersStatus(Users, UsersStatus),
    member(1, UsersStatus).

% ------------------------------ Modificadores ---------------------------------

% Dominio: User X int X User
% Descripcion: Cambia el status de un User correspondiente
% Tipo de algoritmo: N/A
% Recorrido: User
changeUserStatus(User, Status, UpdatedUser) :-
    getUserName(User, Name),
    user(Name, Status, UpdatedUser).

% Dominio: UserList X String X int X UserList
% Descripcion: Dada una lista de User cambia el Status del User con nombre Username 
% Tipo de algoritmo: N/A
% Recorrido: list
changeUsersStatus([], _, _, []).
changeUsersStatus([User|Resto], Username, Status, [UserLogged|Resto]) :-
    string_lower(Username, UsernameLower),
    member(UsernameLower, User),
    changeUserStatus(User, Status, UserLogged), !.
changeUsersStatus([User|Resto], Username, Status, [User|Resultado]) :-
    changeUsersStatus(Resto, Username, Status, Resultado).