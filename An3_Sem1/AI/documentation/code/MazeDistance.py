def mazeDistance(point1, point2, game_state):
    prob = search.PositionSearchProblem(game_state, start=point1, goal=point2, warn=False, visualize=False)
    return len(search.ids(prob))