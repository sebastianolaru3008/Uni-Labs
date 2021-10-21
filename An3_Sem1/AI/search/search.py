# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
#
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""


import copy
import random

from game import Directions
from util import *


class Node:
    def __init__(self, state, parent, action, cost):
        self.state = state
        self.parent = parent
        self.action = action
        self.cost = cost


class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return [s, s, w, s, w, w, s, w]


def randomSearch(problem):
    """
    utils.Insert(Comments)
    """
    mystate = problem.getStartState()
    list = []
    while not problem.isGoalState(mystate):
        succesor = random.choice(problem.getSuccessors(mystate))
        list.append(succesor[1])
        mystate = succesor[0]
    return list


def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.
    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.
    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:
    """

    from util import Stack
    dfs_stack = Stack()

    visited = []
    path = []
    current_position = problem.getStartState()

    if problem.isGoalState(current_position):
        return []

    dfs_stack.push((current_position,[]))

    while(True):

        if dfs_stack.isEmpty():
            return []

        position, path = dfs_stack.pop()
        visited.append(position)

        if problem.isGoalState(position):
            return path

        succesors = problem.getSuccessors(position)

        if succesors:
            for item in succesors:
                if item[0] not in visited:

                    newPath = path + [item[1]] 
                    dfs_stack.push((item[0],newPath))

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    "*** YOUR CODE HERE ***"

    from util import Queue

    bfs_queue = Queue()

    visited = []
    path = []
    current_position = problem.getStartState()


    if problem.isGoalState(current_position):
        return []

    # Start from the beginning and find a solution, path is empty list #
    bfs_queue.push((current_position,[]))

    while(True):

        if bfs_queue.isEmpty():
            return []

        position,path = bfs_queue.pop()
        visited.append(position)

        if problem.isGoalState(position):
            return path

        successors = problem.getSuccessors(position)

        if successors:
            for item in successors:
                if item[0] not in visited and item[0] not in (state[0] for state in bfs_queue.list):

                    newPath = path + [item[1]]
                    bfs_queue.push((item[0],newPath))

def uniformCostSearch(problem):
    """Search the node of least total cost first."""
    "*** YOUR CODE HERE ***"

    from util import PriorityQueue

    ucs_queue = PriorityQueue()

    visited = [] 
    path = [] 
    current_position = problem.getStartState()

    if problem.isGoalState(current_position):
        return []
    
    ucs_queue.push((current_position,[]),0)

    while(True):

        if ucs_queue.isEmpty():
            return []

        position,path = ucs_queue.pop()
        visited.append(position)

        if problem.isGoalState(position):
            return path

        successors = problem.getSuccessors(position)

        if successors:
            for item in successors:
                if item[0] not in visited and (item[0] not in (state[2][0] for state in ucs_queue.heap)):

                    newPath = path + [item[1]]
                    pri = problem.getCostOfActions(newPath)

                    ucs_queue.push((item[0],newPath),pri)

                elif item[0] not in visited and (item[0] in (state[2][0] for state in ucs_queue.heap)):
                    for state in ucs_queue.heap:
                        if state[2][0] == item[0]:
                            oldPriority = problem.getCostOfActions(state[2][1])

                    newPriority = problem.getCostOfActions(path + [item[1]])

                    if oldPriority > newPriority:
                        newPath = path + [item[1]]
                        ucs_queue.update((item[0],newPath),newPriority)

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

from util import PriorityQueue
class MyPriorityQueueWithFunction(PriorityQueue):
    """
    Implements a priority queue with the same push/pop signature of the
    Queue and the Stack classes. This is designed for drop-in replacement for
    those two classes. The caller has to provide a priority function, which
    extracts each item's priority.
    """
    def  __init__(self, problem, priorityFunction):
        "priorityFunction (item) -> priority"
        self.priorityFunction = priorityFunction
        PriorityQueue.__init__(self)
        self.problem = problem
    def push(self, item, heuristic):
        "Adds an item to the queue with priority from the priority function"
        PriorityQueue.push(self, item, self.priorityFunction(self.problem,item,heuristic))

def f(problem,state,heuristic):

    return problem.getCostOfActions(state[1]) + heuristic(state[0],problem)

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""
    "*** YOUR CODE HERE ***"

    astar_queue = MyPriorityQueueWithFunction(problem,f)

    path = []
    visited = []
    current_position = problem.getStartState()

    if problem.isGoalState(current_position):
        return []

    item_elem = (current_position,[])

    astar_queue.push(item_elem,heuristic)

    while(True):

        if astar_queue.isEmpty():
            return []

        xy,path = astar_queue.pop()

        if xy in visited:
            continue

        visited.append(xy)

        if problem.isGoalState(xy):
            return path

        succ = problem.getSuccessors(xy)

        if succ:
            for item in succ:
                if item[0] not in visited:

                    newPath = path + [item[1]]
                    element = (item[0],newPath)
                    astar_queue.push(element,heuristic)

# Editor:
# Sdi1500129
# Petropoulakis Panagiotis

# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
