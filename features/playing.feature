Feature: Playing

  Background:
    Given I run "tic-tac-toe --size 3 --players 2"

  Scenario: Switching players
    When I press <Space>
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

    When I press <Right><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ ○ │   │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

    When I press <Down><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ ○ │   │
      ├───┼───┼───┤
      │   │ x │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

  Scenario: Trying to play on taken fields
    When I press <Space>
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

    When I press <Space>
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

    When I press <Right><Space>
    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ ○ │   │
      ├───┼───┼───┤
      │   │   │   │
      ├───┼───┼───┤
      │   │   │   │
      └───┴───┴───┘
      """

  Scenario: Win
    When I press <Space>
      | x |   |   |
      |   |   |   |
      |   |   |   |
    And I press <Right><Space>
      |   | ○ |   |
      |   |   |   |
      |   |   |   |
    And I press <Down><Space>
      |   |   |   |
      |   | x |   |
      |   |   |   |
    And I press <Right><Space>
      |   |   |   |
      |   |   | ○ |
      |   |   |   |
    And I press <Down><Space>
      |   |   |   |
      |   |   |   |
      |   |   | x |

    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ ○ │   │
      ├───┼───┼───┤
      │   │ x │ ○ │
      ├───┼───┼───┤
      │   │   │ x │
      └───┴───┴───┘
      """

  Scenario: Tie
    When I press <Space>
      | x |   |   |
      |   |   |   |
      |   |   |   |
    When I press <Down><Right><Space>
      |   |   |   |
      |   | ○ |   |
      |   |   |   |
    When I press <Up><Right><Space>
      |   |   | x |
      |   |   |   |
      |   |   |   |
    And I press <Left><Space>
      |   | ○ |   |
      |   |   |   |
      |   |   |   |
    And I press <Down><Down><Space>
      |   |   |   |
      |   |   |   |
      |   | x |   |
    And I press <Up><Left><Space>
      |   |   |   |
      | ○ |   |   |
      |   |   |   |
    And I press <Right><Right><Space>
      |   |   |   |
      |   |   | x |
      |   |   |   |
    And I press <Down><Space>
      |   |   |   |
      |   |   |   |
      |   |   | ○ |
    And I press <Left><Left><Space>
      |   |   |   |
      |   |   |   |
      | x |   |   |

    Then I should see
      """
      ┌───┬───┬───┐
      │ x │ ○ │ x │
      ├───┼───┼───┤
      │ ○ │ ○ │ x │
      ├───┼───┼───┤
      │ x │ x │ ○ │
      └───┴───┴───┘
      """
