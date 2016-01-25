__author__ = 'jessey.lin'
__date__ = '1/24/16'


import numpy as np
import matplotlib.pyplot as plt
import heapq
from dijkstra import DijkstraShortestPath

# The Graph class is orgainzed into 2 fields: "nodes" and "edges"
# The "nodes" field is a 2 by N numpy array specifiying the positions of the N vertices/nodes
# The "edges" field is an array of length N of arrays of nodes, with list i giving the list
#          of nodes that node i is connected to. For the graphs we are dealing with, you may assume
#          that if i is connected to j then j is connected to i.

class Graph(object):
    """Graph to search through using Dijkstra's or A*. Stores each node as a 2-dimensional point,
    and the edges as a map from node number to a list of node numbers it is connected to"""
    def __init__(self, nodes, edges):
        super(Graph, self).__init__()
        # Nodes are stored as x-y values
        self.nodes = np.array(nodes)
        # Edges are a map from a node to list of nodes
        self.edges = edges

    def drawPath(self,path):
        # Draw nodes
        plt.scatter(self.nodes[:,0],self.nodes[:,1])
        # Draw edges
        linesx = []
        linesy = []
        for i in xrange(len(self.edges)):
            for j in self.edges[i]:
                plt.plot([self.nodes[i][0], self.nodes[j][0]],
                         [self.nodes[i][1], self.nodes[j][1]],'b-',linewidth=0.5)
        # Don't draw path if there is none
        if len(path) == 0:
            plt.show()
            return True
        # Draw start and end nodes
        plt.scatter( \
            self.nodes[[path[0],path[-1]],0], \
            self.nodes[[path[0],path[-1]],1],s=90,c='k',marker='x') # ,linewidths='1'
        # Highlight chosen path nodes
        plt.scatter(self.nodes[path,0],self.nodes[path,1],s=30,c='r')
        # Highlight chosen path edges
        pathx = []
        pathy = []
        for i in xrange(len(path)-1):
            if path[i] >= len(self.nodes) or path[i+1] not in self.edges[path[i]]:
                # Invalid path
                plt.show()
                return False
            else:
                pathx.append(self.nodes[path[i]][0])
                pathx.append(self.nodes[path[i+1]][0])
                pathx.append(None)
                pathy.append(self.nodes[path[i]][1])
                pathy.append(self.nodes[path[i+1]][1])
                pathy.append(None)
        plt.plot(pathx,pathy,'r',linewidth=2)
        # Done, all successful
        plt.show()
        return True

    def draw(self):
        self.drawPath([])


def graphMain():
    # # Create nodes
    # nodes = np.array([[0.0, 0.0],  # Node 0
    #               [0.0, 1.0],  # Node 1
    #               [1.0, 0.0],  # Node 2
    #               [1.0, 1.0]]) # Node 3
    #
    # # Create edges
    # edges = [ [1, 2,3], # Node 0
    #          [0, 3], # Node 1
    #          [0, 3], # Node 2
    #          [0,1, 2]] # Node 3

    # Create nodes
    # nodes are enumerated from west to east, then south to north
    nodes = np.array([[0.0, 0.0],  # Node 0
                  [0.0, 1.0],  # Node 1
                  [0.0, 2.0],  # Node 2
                  [1.0, 0.0],  # Node 3
                  [1.0, 1.0],  # Node 4
                  [1.0, 2.0],  # Node 5
                  [2.0, 0.0],  # Node 6
                  [2.0, 1.0],  # Node 7
                  [2.0, 2.0]]  # Node 8
                  )

    # Create edges
    edges = [ [1, 2], # Node 0
             [0,4, 2], # Node 1
             [1, 5], # Node 2
             [0, 4, 6], # Node 3
             [1, 3, 5, 7, 8], # Node 4
             [2, 4, 8], # Node 5
             [3, 7], # Node 6
             [4, 6, 8], # Node 7
             [4, 5, 7]] # Node 8


    g = Graph(nodes,edges) # A simple graph with nodes on the unit square
    # g.draw()

    dsp = DijkstraShortestPath(g, 0)
    dsp.computeDSP()
    path = dsp.shortestPath(0,8)
    g.drawPath(path)


if __name__ == "__main__":
    graphMain()
    #final output is a matplotlib plot of the 8 node square with the shortest path in red from 0 to 8th node
