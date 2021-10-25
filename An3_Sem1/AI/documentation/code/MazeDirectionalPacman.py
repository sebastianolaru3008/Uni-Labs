class MazeDirectionalPacman( PacmanAgent ):
    "A Pacman agent that prefers to eat food or chase Ms. Pacman."
    def __init__( self, index, prob_food=0.5, prob_msPacman=0.5 ):
        self.index = index
        self.prob_food = prob_food
        self.prob_msPacman = prob_msPacman

    def getDistribution( self, state ):
        # Read variables from state
        legalActions = state.getLegalActions( self.index )
        pos = state.getGhostPosition( self.index )

        speed = 1

        actionVectors = [Actions.directionToVector( a, speed ) for a in legalActions]
        newPositions = [( pos[0]+a[0], pos[1]+a[1] ) for a in actionVectors]
        msPacmanPosition = state.getPacmanPosition()
        foodGrid = state.getFood()

        # Select best actions given the state
        distancesToMsPacman = [mazeDistance( pos, msPacmanPosition, state ) for pos in newPositions]
        distancesToFood = []
        for y in range(foodGrid.height):
            for x in range(foodGrid.width):
                if foodGrid[x][y] == True:
                    distancesToFood.extend( [mazeDistance( pos, (x, y), state )] for pos in newPositions )

        msPacmanMinDistance = min( distancesToMsPacman ) 
        if distancesToFood:
            foodMinDistance = min( distancesToFood )
            bestScore = min( msPacmanMinDistance, foodMinDistance  )
            bestProb = self.prob_food if foodMinDistance < msPacmanMinDistance else self.prob_msPacman
        else:
            bestScore = msPacmanMinDistance
            bestProb = self.prob_msPacman

        bestActions = [action for action, distance in zip( legalActions, distancesToMsPacman ) if distance == bestScore]
        bestActions.extend( [action for action, distance in zip( legalActions, distancesToFood ) if distance == bestScore] )

        # Construct distribution
        dist = util.Counter()
        for a in bestActions: dist[a] = bestProb / len(bestActions)
        for a in legalActions: dist[a] += ( 1-bestProb ) / len(legalActions)
        dist.normalize()
        return dist
