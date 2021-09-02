Feature: Expresso food Feature

    This Document explains the details of the Food ordering feature.

    Scenario: Members on the session wants to initiate a food order
        Given member initiates an order from the "order Food Page"
        When on "order Food Page"
        Then request user to input "Budget"
        And Provide option for either "Group" or "Individual" orders
        When "Member" confirm food ordering
        Then Prompt Everybody for food ordering
        Then make 'Payment'

    Scenario: Member has received notification for food initiation.
        Given Member has receive notification for "food order"
        Then Show notification to 'Member'
        Then Show "order Food" Page
        And Request for user details like "Country","City","Address"
        When "City" is populated
        Then "Area" gets populated.
        And Request confirmation to "find restaurant page"
        Given 'User' has confirmed 'Details'
        Then Generate 'Voucher' for 'User'

    # Scenario: Member has no nearby restaurants
    #     Given member is on "find restaurant page"
    #     And member finds no "restaurants" available
    #     Then Display information for "Potential order" Places near by
    #     Then Save details in Database
    #     And provide option for "GiftCard" or "receive Money" or "loose order"
    #     When "receive Money" is chosen put "money" in "tab"
    #     Then Request recomendation from "member"

    # Scenario: Member has restaurants available
    #     Given Member is on "Find Restaurant Page"
    #     Then display "Budget" from Member that initiated "order"
    #     And display "restaurants" for user to select from
    #     Given a "restaurant" is selected
    #     Then display "Menu" from "restaurants"
    #     When a "Meal" is chosen
    #     Then select "Drinks" from "restaurants"
    #     When "Meal" and "Drinks" are confirmed
    #     Then display "delivery details Page"
    #     And confirm member "order"
    #     Then send "order" to member who initiated purchase

    # Scenario: All group  member has place their order
    #     Given All member have placed "order"
    #     Then return "summary details" to member who initiated purchase
    #     And confirm "Total order" with "delivery fee"
    #     And display "payment page"

    Scenario: Member wants to make payment
        Given member is on the "Payment Page"
        Then display "Payment Form" page
        And fill "Payment Form" with "details"
        Given member confirm "Payment"
        Then Send voucher and NOtification to member

