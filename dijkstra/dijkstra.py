__author__ = 'jessey.lin'
__date__ = '1/24/16'


import numpy as np
import heapq

REMOVED = '<removed-task>'      # placeholder for a removed task

class DijkstraShortestPath(object):
    """Implements Dijkstra's shortest path algorithm
    Input: g: Graph as specified in the Graph class, with N nodes, and edges for each node
           source: start node, a number from 0 to N-1
    Output: SPTree, dictionary of parent
    Efficiency: proportional to |E|log|V|, using python's heapq implementation of priority queue
    """

    def __init__(self, g, source):
        self.g = g
        self.source = source
        self.distanceToNode = {}
        self.SPTree = {}
        self.pq = []
        self.entry_finder = {} # mapping of nodes to entries, entry = [distance, node]

    def computeDSP(self):
        """
        :return: min distance from source to every vertex
        """
        for v in range(0,len(self.g.nodes)):
            self.distanceToNode[v]= float("inf")
        self.distanceToNode[self.source] = 0.0

        self.add_task(self.source, priority=self.distanceToNode[self.source])
        while len(self.entry_finder) != 0:
            v = self.pop_task()
            for w in self.g.edges[v]:
                self.calTempDist(w,v)

        print "end of computeDSP: print SPTree"
        print self.SPTree

    def calTempDist(self, dest,origin):
        """
        :param dest: destination node
        :param origin: origin node
        :return:decide min distance based on current state of explored vertices
        """

        if self.distanceToNode[dest] > self.distanceToNode[origin] + self.straightLineDistance( origin, dest):
            self.distanceToNode[dest] = self.distanceToNode[origin] + self.straightLineDistance( origin, dest)
            self.SPTree[dest] = origin
            w = dest
            if w in [entry[1] for entry in  self.pq]:
                self.remove_task(self.pq, w)
                self.add_task( w, self.distanceToNode[w])
            else:
                self.add_task( w, self.distanceToNode[w])



    def straightLineDistance(self,a,b):
        """
        :param a: coordinates of a
        :param b: coordinates of b
        :return: catesian distance from a to b
        """
        return np.linalg.norm(self.g.nodes[a]-self.g.nodes[b])


    def shortestPath(self,v,w):
        """
        :param v: from vertex v
        :param w: to vertex w
        :return: list of nodes representing v->w shortest path
        """
        path = [w]
        cur = w
        while(cur != v):
            cur = self.SPTree[cur]
            path.append(cur)

        path.reverse()
        return path

# the following helper functions are added since pq cannot be modified though entry_finder can
    def add_task(self,task, priority=0):
        'Add a new task or update the priority of an existing task'
        if task in self.entry_finder:
            self.remove_task(task)

        entry = [priority, task]
        self.entry_finder[task] = entry
        heapq.heappush(self.pq, entry)

    def remove_task(self,task):
        'Mark an existing task as REMOVED.  Raise KeyError if not found.'
        entry = self.entry_finder.pop(task)
        entry[-1] = REMOVED

    def pop_task(self):
        'Remove and return the lowest priority task. Raise KeyError if empty.'

        while self.pq:
            priority, task = heapq.heappop(self.pq)
            # print "popped task: "
            # print task
            if task is not REMOVED:
                del self.entry_finder[task]
                return task
        raise KeyError('pop from an empty priority queue')