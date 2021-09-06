Feature: Expresso food Feature

    This Document explains the details of the Food ordering feature.

    Scenario: Members on the session wants to initiate a food order
        Given member initiates an order from the "order Food Page"
        When on "order Food Page"
        Then request user to input "Budget"
        And Provide people to be selected
        Then Prompt selected 'Members' for food ordering
        Then make 'Payment'
        And Generate Voucher for User

    Scenario: Member has received notification for food initiation.
        Given Member has receive notification for "food order"
        Then Show notification to 'Member'
        Then Show "order Food" Page
        And Request for user details like "Country","City"
        Given 'User' has confirmed 'Details'
        Then Generate 'Voucher' for 'User'

    Scenario: Member wants to make payment
        Given member is on the "Payment Page"
        Then display "Payment Form" page
        And fill "Payment Form" with "details"
        Given member confirm "Payment"
        Then Notification to member

