Feature: Moving

  Background:
    Given I run "tic-tac-toe --size 3 --players 1"

  Scenario: Moving the cursor with arrows
    When I press <Down><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │   │   │
      ├───┼───┼───┤
      │ x │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Right><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │   │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Up><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │ x │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Left><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ x │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

  Scenario: Moving the cursor with h/j/k/l for Vim lovers
    When I press <j><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │   │   │
      ├───┼───┼───┤
      │ x │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <l><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │   │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <k><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │   │ x │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <h><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ x │   │
      ├───┼───┼───┤
      │ x │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

  Scenario: Moving at the edges of the screen
    When I press <Up><Up><Up><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │   │   │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Right><Right><Right><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │   │ x │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Down><Down><Down><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │   │ x │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │   │   │ x │
      └───┴───┴───┘
      """

    When I press <Left><Left><Left><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │   │ x │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │ x │   │ x │
      └───┴───┴───┘
      """
