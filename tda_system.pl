%#################################################################
%             TDA System
%#################################################################
% Representacion: Name X InitialChatbotCodeLink X Chatbots X Users X ChatHistorys X CurrentChatbotID X CurrentFlowID X Date
/*
Predicados:
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, [Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date] (aridad = 9)
    getSystemChatbots([_, _, Chatbots, _, _, _, _, _], Chatbots) (aridad = 2)
    getSystemUsers([_, _, _, Users, _, _, _, _], Users) (aridad = 2)
    getSystemChatHistorys([_, _, _, _, ChatHistorys, _, _, _], ChatHistorys) (aridad = 2)
    getSystemCurrentChatbotID([_, _, _, _, _, CurrentChatbotID, _, _], CurrentChatbotID) (aridad = 2)
    getSystemCurrentFlowID([_, _, _, _, _, _, CurrentFlowID, _], CurrentFlowID) (aridad = 2)
    getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink, _, _, _, _, _, _], InitialChatbotCodeLink) (aridad = 2)
    setSystemStartFlowID(System, StartFlowID, NewSystem) (aridad = 3)
    setSystemChatbots(System, NewChatbots, NewSystem) (aridad = 3)
    addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots) (aridad = 3)
    setSystemUsers(System, NewUsers, NewSystem) (aridad = 3)
    setSystemChatHistorys(System, NewChatHistorys, NewSystem) (aridad = 3)
    addUserToUsers(SystemUsers, User, NewSystemUsers) (aridad = 3)
    addChatHistoryToChatHistorys(SystemChatHistorys, ChatHistory, NewSystemChatHistorys) (aridad = 3)
    setSystemChathistorysAndCurrentFlowAndChatbotIDs(System, NewCurrentFlowID, NewCurrentChatbotID, NewChatHistorys, NewSystem) (aridad = 5)
    makeNewInteraction(Chatbot, Flow, User, Message, NewInteraction) (aridad = 5)

Metas primarias:
    system, setSystemStartFlowID, setSystemChatbots, setSystemUsers, setSystemChatHistorys, setSystemChathistorysAndCurrentFlowAndChatbotIDs,
    addChatbotToChatbots, addUserToUsers, addChatHistoryToChatHistorys, makeNewInteraction

Metas secuandarias:
    getSystemChatbots, getSystemUsers, getSystemChatHistorys, getSystemCurrentChatbotID, getSystemCurrentFlowID, getSystemInitialChatbotCodeLink,
*/

% ------------------------------ Constructor -----------------------------------

% Dominio: string X int X List(Chatbot) X List(User) X List(ChatHistory) X int X int X int X System
% Descripcion: Crea un System
% Tipo de algoritmo: N/A
% Recorrido: System
system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, [Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date]).

% ------------------------------ Selectores ------------------------------------

% Dominio: System X List(Chatbot)
% Descripcion: Obtiene la lista de Chatbots del System
% Tipo de algoritmo: N/A
% Recorrido: List(Chatbot)
getSystemChatbots([_, _, Chatbots, _, _, _, _, _], Chatbots).

% Dominio: System X List(User)
% Descripcion: Obtiene la lista de Users del System
% Tipo de algoritmo: N/A
% Recorrido: List(User)
getSystemUsers([_, _, _, Users, _, _, _, _], Users).

% Dominio: System X List(ChatHistory)
% Descripcion: Obtiene la lista de ChatHistorys del System
% Tipo de algoritmo: N/A
% Recorrido: List(ChatHistory)
getSystemChatHistorys([_, _, _, _, ChatHistorys, _, _, _], ChatHistorys).

% Dominio: System X int
% Descripcion: Obtiene el CurrentChatbotID del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemCurrentChatbotID([_, _, _, _, _, CurrentChatbotID, _, _], CurrentChatbotID).

% Dominio: System X int
% Descripcion: Obtiene el CurrentFlowID del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemCurrentFlowID([_, _, _, _, _, _, CurrentFlowID, _], CurrentFlowID).

% Dominio: System X int
% Descripcion: Obtiene el InitialChatbotCodeLink del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink, _, _, _, _, _, _], InitialChatbotCodeLink).

% ------------------------------ Modificadores ---------------------------------

% Dominio: System X int X System
% Descripcion: Modifica el StartFlowID del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemStartFlowID(System, StartFlowID, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, _, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, StartFlowID, Date, NewSystem).

% Dominio: System X List(Chatbot) X System
% Descripcion: Modifica los Chatbots del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemChatbots(System, NewChatbots, NewSystem) :-
    system(Name, InitialChatbotCodeLink, _, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, NewChatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

% Dominio: System X List(User) X System
% Descripcion: Modifica los Users del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemUsers(System, NewUsers, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, _, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, NewUsers, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

% Dominio: System X List(ChatHistory) X System
% Descripcion: Modifica los Chathistorys del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemChatHistorys(System, NewChatHistorys, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, Users, _, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, Users, NewChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

% Dominio: System X int X int X List(ChatHistory) X System
% Descripcion: Modifica el CurrentFlowID, CurrentChatbotID y ChatHistorys del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemChathistorysAndCurrentFlowAndChatbotIDs(System, NewCurrentFlowID, NewCurrentChatbotID, NewChatHistorys, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, Users, _, _, _, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, Users, NewChatHistorys, NewCurrentChatbotID, NewCurrentFlowID, Date, NewSystem).

% ------------------------------ Otros predicados ------------------------------

% Dominio: List(Chatbot) X Chatbot X List(Chatbot)
% Descripcion: Agrega un Chatbot a una lista de Chatbots
% Tipo de algoritmo: N/A
% Recorrido: List(Chatbot)
addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots) :-
    append(SystemChatbots, [Chatbot], NewSystemChatbots).

% Dominio: List(User) X User X List(User)
% Descripcion: Agrega un User a una lista de Users
% Tipo de algoritmo: N/A
% Recorrido: List(User)
addUserToUsers(SystemUsers, User, NewSystemUsers) :-
    append(SystemUsers, [User], NewSystemUsers).

% Dominio: List(Chathistory) X Chathistory X List(Chathistory)
% Descripcion: Agrega un Chathistory a una lista de Chathistorys
% Tipo de algoritmo: N/A
% Recorrido: List(Chathistory)
addChatHistoryToChatHistorys(SystemChatHistorys, ChatHistory, NewSystemChatHistorys) :-
    append(SystemChatHistorys, [ChatHistory], NewSystemChatHistorys).

% Dominio: Chatbot X Flow X User X String X String
% Descripcion: Crea el mensaje de interaccion entre el usuario y el sistema
% Tipo de algoritmo: N/A
% Recorrido: String
makeNewInteraction(Chatbot, Flow, User, Message, NewInteraction) :-
    getUserName(User, Username),
    get_time(TimeStamp),
    number_string(TimeStamp, Time),
    string_concat(Time, " - ", TimeString),
    string_concat(Username, ": ", UserString),
    string_concat(Message, "\n", MessageString),
    string_concat(UserString, MessageString, UserMessage),
    string_concat(TimeString, UserMessage, UserMessageFinal),
    getChatbotName(Chatbot, Chatbotname),
    string_concat(Chatbotname, ": ", ChatbotnameMsg),
    getFlowNameMsg(Flow, FlowNameMsg),
    string_concat(FlowNameMsg, "\n", FlowMessage),
    string_concat(ChatbotnameMsg, FlowMessage, SystemMessage),
    string_concat(TimeString, SystemMessage, SystemMessageWithDate),
    getFlowOptions(Flow, FlowOptions),
    optionsToString(FlowOptions, OptionsString),
    string_concat(SystemMessageWithDate, OptionsString, AlmostSystemMessage),
    string_concat(AlmostSystemMessage, "\n", FinalSystemMessage),
    string_concat(UserMessageFinal, FinalSystemMessage, NewInteraction).