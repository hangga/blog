---
id: 20240718
title: 'Porting an Old Delphi Project: Bringing CIH to the Browser with Vanilla JavaScript'
date: '2025-02-13T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=20240718'
permalink: /2025/02/13/porting-an-old-delphi-project-bringing-cih-to-the-browser-with-vanilla-javascript/
image: https://raw.githubusercontent.com/hangga/cih-js/refs/heads/main/cih-screenshot.png
categories:
- Linux
tags:
- 'Python'
- 'Py'
- 'Coding'
- 'Linux'
---

# Porting an Old Delphi Project: Bringing CIH to the Browser with Vanilla JavaScript

A while ago, I worked on a fun little project in **Delphi** that implemented the **CIH algorithm**. It was something I built to explore how to solve the *Traveling Salesman Problem (TSP)* using a constructive heuristic approach.

![cih delphi](https://github.com/hangga/CIH/blob/master/doc/cih_new.jpg?raw=true)
![cih delphi-2](https://github.com/hangga/CIH/blob/master/doc/cih_real.jpg?raw=true)

Recently, I decided to revisit that old project and give it new life on the web. Instead of dusty old Delphi code, I wanted to make it interactive, visual, and easy to share — so I ported the logic into **vanilla JavaScript**, added some canvas drawing, and wrapped it all up in a simple web demo. The full original Delphi code is still on GitHub here: [CIH Delphi Project](https://github.com/hangga/CIH).

---

## What is CIH?

**CIH** stands for **Cheapest Insertion Heuristic**.

It’s a constructive algorithm often used to approximate solutions to the **Traveling Salesman Problem (TSP)**. The TSP asks a classic optimization question:

👉 *Given a set of cities (nodes) and the distances between them, what’s the shortest possible route that visits each city exactly once and returns to the starting point?*

Since solving TSP exactly is computationally expensive, heuristics like CIH give us **“good enough” solutions quickly**.

Here’s how CIH works in simple terms:

1. **Start small** – begin with a tiny tour (usually two connected nodes).
2. **Add new nodes one by one** – each time, choose the insertion that causes the **least increase in total distance**.
3. **Repeat until all nodes are in the tour.**

It’s not guaranteed to be the absolute shortest route, but it’s often quite close, and very efficient.

---

## Rebuilding CIH in JavaScript

The ported JavaScript version follows the same CIH idea but adds interactive visualization.

* **Click on the canvas** to place nodes (representing cities).
* Every time a node is added, the script updates:

  * A **distance table** showing distances between nodes.
  * A **log of steps** describing how nodes are inserted into the tour.
  * The **canvas visualization**, drawing:

    * All possible connections (light gray lines).
    * The current shortest path (lime green).
    * Nodes (red circles with white IDs).

---

### Key Features in the Code

* **Node handling**

  ```js
  function addNode(x, y) {
      nodeCount++;
      const node = { id: nodeCount, x, y };
      nodes.push(node);
      updateDistanceTable();
      draw();
      logFlow(`Added node ${node.id} at (${node.x.toFixed(2)}, ${node.y.toFixed(2)})`);
      logSubTours();
  }
  ```

  Each click on the canvas creates a new node, updates the distance table, and triggers a redraw.

* **Distance calculation**

  ```js
  function calculateDistance(node1, node2) {
      const dx = node2.x - node1.x;
      const dy = node2.y - node1.y;
      return Math.sqrt(dx * dx + dy * dy);
  }
  ```

* **The CIH logic**

  ```js
  function calculateInsertionCost(tour, newNodeId) {
      let minCost = Infinity;
      let bestInsertion = null;
      for (let i = 0; i < tour.length; i++) {
          const current = tour[i];
          const distanceCurrent = getDistance(current.from, current.to);
          const distanceNewFrom = getDistance(current.from, newNodeId);
          const distanceNewTo = getDistance(newNodeId, current.to);
          const insertionCost = distanceNewFrom + distanceNewTo - distanceCurrent;
          if (insertionCost < minCost) {
              minCost = insertionCost;
              bestInsertion = { from: current.from, to: current.to, newNodeId };
          }
      }
      return bestInsertion;
  }
  ```

  This is where the “cheapest insertion” happens — finding the least costly way to fit a new node into the current tour.

* **Visualization**
  The canvas draws all edges in purple-gray, and highlights the final chosen tour in green. Nodes themselves are red circles with their IDs.

---

## Why This Matters

The beauty of this project isn’t just the algorithm itself, but how approachable it becomes when you can **see the process unfold step by step**:

* Watch nodes appear as you click.
* See how each new city gets inserted into the existing tour.
* Follow the log messages to understand why a particular path was chosen.

It’s a nice bridge between **algorithm theory** and **visual intuition**.

---

## Conclusion

This JavaScript port of my old Delphi CIH project is more than just code translation — it’s a way of revisiting an old idea and making it accessible, visual, and interactive for anyone curious about TSP and heuristics.

If you’re into algorithms, optimization, or just love seeing math come to life in the browser, give CIH a try. Who knew an old Delphi project could find new purpose in the age of JavaScript?