Feature: Host & Admin Privileges Back end

    This feature Describes the necessary flow of the Backend End Points that Host Privileges apply.

    ## Privileges applying to the Cafe
    Scenario: User wants to create a cafe
        Given 'User' has signed in and has 'role' of 'Admin' before creating a 'cafe'
        Then  submit request to 'api/v1/cafe/create' with 'cafe title', 'user id', ['plans']
        Then server generates '_id', 'code', 'link'
        And server creates 'general' lounge for user.

    Scenario: User wants to make barister
        Given 'User' is 'Admin' on 'Cafe'
        Then submit request to 'api/v1/cafe/makeCohost' with 'user id'
        Then server updates 'user' 'status' to 'pseudohost'
        And return 'user'

    Scenario: User Wants to Delete Cafe
        Given 'User' has 'role' of 'Admin' on 'Cafe'
        Then submit request to 'api/v1/cafe/delete' with 'cafe id'
        When 'Cafe' has any 'session' active
        Then server responds 'Session has one or mor active sessions'
        When 'Cafe' has no 'session' active
        Then server deletes cafe

    ## Privileges Applying to lounge
    Scenario: Admin wants to remove user from lounge
        Given 'User' has 'role' of 'Admin'
        Then submit request to 'api/v1/lounge/remove/user' with 'lounge id', ['member id']
        Then server respond with 'isDelete' option for 'member' turned 'True'

    Scenario: Admin wants to delete lounge
        Given 'User' has 'role' of 'Admin'
        Then submit request to 'api/v1/lounge/delete' with 'lounge id'
        Then server turn 'isDelete' option for 'lounge' to 'True'

    Scenario: User wants to leave lounge
        Given 'User' has 'role' 'member' of 'lounge'
        Then submit request to 'api/v1/lounge/leavelounge' with 'lounge id'
        Then server update 'lounge' with 'exit lounge' property 'true'

    ## Privileges applying to the Session
    Scenario: User wants to start session
        Given 'User' has 'role' of 'Host' and 'member' of 'lounge'
        Then submit request to 'api/v1/sessions/start' with 'user','lounge','attendee id' and 'display name'
        Then server generates 'session id'
        And send notification to 'members' in the 'lounge'

    Scenario: member wants to start session as pseudohost
        Given 'User' has 'role' of 'pseudohost' and 'member' of 'lounge'
        Then submit request to 'api/v1/sessions/start' with 'user','lounge','attendee id' and 'display name'
        Then server generates 'session id'
        And send notification to 'members' in the 'lounge'
        Then 'User' gets pseudohost privileges

    Scenario: Member wants to join on going session
        Given 'Session' has started
        Then submit request to 'api/v1/sessions/join' with 'session id', 'attendee id'
        Given member 'role' is 'host' member joins as 'host'
        Then member has 'host' privileges
        Given member 'role ' is 'attendee' member joins as 'member'
        Then member has 'member' privileges

    Scenario: Host wants to make member of session host
        Given 'Session' has started and member has 'role' 'host' of 'session'
        Then submit request to 'api/v1/sessions/changeRole/:role' with 'role' as Params and 'session code' and ['attendee id']
        Then server changes 'member' 'role' to 'Host'
        And return ['member list']

    Scenario: Host wants to end session
        Given 'Session' has started and member has 'role' 'host'
        Then submit request to 'api/v1/sessions/end/:lounge' with 'lounge id' as Params
        Then server deactivates 'session'

