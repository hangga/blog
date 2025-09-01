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


# From Delphi to JavaScript Today: Reviving My Old CIH Project

Back in **2009**, I wrote a little side project in **Delphi**. The idea? Implement the **Cheapest Insertion Heuristic (CIH)** — a constructive algorithm to approximate solutions to the **Traveling Salesman Problem (TSP)**.

At the time, it was mostly a coding experiment, tucked away in a folder, and later uploaded here: [CIH on GitHub](https://github.com/hangga/CIH).

<!-- ![cih delphi](https://github.com/hangga/CIH/blob/master/doc/cih_new.jpg?raw=true)
![cih delphi-2](https://github.com/hangga/CIH/blob/master/doc/cih_real.jpg?raw=true) -->
Fast forward more than a decade, I thought: *“Why not bring this old project back to life, but in the browser?”* No installers, no legacy IDEs, just a simple **vanilla JavaScript + canvas** demo that anyone can click and play with.

![cih-js](https://hangga.github.io/blog/wp-content/uploads/2025/Screenshot-cih-js.png)

👉 Demo: [CIH-JS Visualization](https://hangga.github.io/cih-js/)

---

## What is CIH Anyway?

**CIH** stands for **Cheapest Insertion Heuristic**. It’s one of those “good enough, fast enough” strategies for tackling the classic **Traveling Salesman Problem (TSP)**:

👉 *Given a set of cities and distances between them, what’s the shortest route that visits each city exactly once and returns home?*

Solving TSP exactly can be painfully slow, but CIH takes a more pragmatic approach:

1. Start with a small tour (two connected nodes).
2. Insert new nodes one by one.
3. At each step, choose the insertion spot that **increases the total distance the least**.

It’s not guaranteed to be the *absolute* best route, but it’s often very close, and super fast.

---

## Calculating Distances (Yes, That Formula From School)

Before the “heuristic magic,” we need the basics: measuring the distance between two nodes.

And here’s the joke: you already know this. Yep, it’s just the good old **Pythagorean theorem**. Remember sitting in class thinking, *“When will I ever use this in real life?”* Well… this is one of those times.

![formulas](https://hangga.github.io/blog/wp-content/uploads/2025/two-distance-formulas.png)

In code:

```js
function calculateDistance(node1, node2) {
    const dx = node2.x - node1.x;
    const dy = node2.y - node1.y;
    return Math.sqrt(dx * dx + dy * dy);
}
```

Here’s how it looks visually after adding two nodes:

![Two nodes with a connecting line](https://hangga.github.io/blog/wp-content/uploads/2025/connecting-line.png)

---

## Insertion Cost (Like Inviting a New Friend Into the Group Chat)

The essence of CIH is finding the **cheapest place to add a new node** into the tour.

Think of it like a group chat with your friends. A new buddy wants in. You don’t just drop them randomly — you place them where they’ll “fit in” without messing up the flow of conversation.

That’s what the algorithm does: it tests all possible spots and picks the least disruptive one.

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

On the canvas, when a third node is added, the algorithm tries different positions before settling on the cheapest insertion:

![Third node inserted into the tour](https://hangga.github.io/blog/wp-content/uploads/2025/connecting-three.png)

---

## Visualizing the Tour

This is where the JavaScript port really shines:

1 **Click on the canvas** → a new node is added.
2 **Distance table updates** → showing all pairwise distances.
3 **Sub-tours are logged** → step-by-step narration of how the algorithm chooses.
4 **Canvas highlights**:

  * All possible connections = light purple-gray.
  * Current shortest path = bright green.
  * Nodes = red circles with white IDs.

Here’s a shot after several nodes have been placed:

![CIH tour with multiple nodes](https://hangga.github.io/blog/wp-content/uploads/2025/multiple-nodes.png)

Notice the **lime-green path**? That’s the current “cheapest insertion” tour chosen by the algorithm.


## Log – Step-by-Step Flow

The **log panel** is basically a running commentary of how the CIH (Cheapest Insertion Heuristic) algorithm works behind the scenes.

![log detil](https://hangga.github.io/blog/wp-content/uploads/2025/log-detil-1.png)

1. **Step 0–3** → Nodes are added with their coordinates (e.g., node 1 at `(238,161)`, node 2 at `(370,155)`).
2. **Step 4–5** → The algorithm starts generating possible sub-tours.
3. **Step 6** → First sub-tour `(1 → 2), (2 → 1)` with a total distance of **264.27**.
4. **Step 7** → That sub-tour is chosen as the temporary best route.
5. **Step 8–15** → A new node is inserted, insertion costs are calculated, and the cheapest option is picked.
6. The final chosen route for 3 nodes becomes: **(2 → 1), (1 → 3), (3 → 2)** with a total of **510.41**.

For a larger example (7 nodes, third screenshot):

1. The algorithm generates **multiple candidate sub-tours** (Step 80–95), each with its own total distance.
   Example:
  * Step 83: `(2 → 1), (1 → 3), (3 → 4), (4 → 5), (5 → 2)` → **752.79**
  * Step 90: `(1 → 3), (4 → 5), (5 → 2), (3 → 6), (6 → 4), (2 → 7), (7 → 1)` → **1048.52**
2. **Step 96** → The sub-tour with total distance **820.10** is selected.
3. **Step 97 (Final chosen)** → The final optimal tour:

  ```
  (2 → 1), (1 → 3), (3 → 6), (6 → 4), (4 → 7), (7 → 5), (5 → 2)
  ```

  with total distance **820.10**.

👉 In short, the log shows the **trial-and-error journey** as the algorithm compares insertion options and narrows down to the shortest tour.

---

## Distance Table

![Table Distance](https://hangga.github.io/blog/wp-content/uploads/2025/table-distance.png)

The **distance table** is the raw data behind all those calculations. It lists pairwise distances between every node.

Example:

1. From **1 → 2** = **132.14**
2. From **2 → 3** = **124.72**
3. From **3 → 1** = **253.55**

The CIH algorithm keeps referring back to this table to evaluate insertion costs and compute total route distances.

---

## Takeaway

1. The **log** = step-by-step narration of the CIH process.
2. The **distance table** = the foundation data that powers those calculations.
3. The **final chosen route** = the best tour selected with the shortest overall distance.

---

## Looking Back, Moving Forward

What started as a **Delphi project in 2009** has now been reimagined in JavaScript, complete with visual feedback and a friendlier explanation.

It’s a reminder that sometimes, old code doesn’t have to stay in the past — it can evolve, adapt, and even become more fun than before.

So if you’re curious about optimization, algorithms, or just want to see high school math doing something cool: give CIH a try.

👉 Live demo: [CIH-JS](https://hangga.github.io/cih-js/)


<!-- # Porting an Old Delphi Project: Bringing CIH to the Browser with Vanilla JavaScript

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

* **Calculating Distances (Yes, That Old Formula You Learned in School)**

  Before we dive into the “smart” part of the algorithm, we need something very basic: a way to measure the distance between two points.

  And here’s the fun part: you already know this formula. Seriously. Remember back in school when you were wondering, *“When am I ever going to use the Pythagorean theorem in real life?”* — well, congratulations, you’re using it now.

  The distance between two nodes `(x1, y1)` and `(x2, y2)` is:

  ![formulas](/wp-content/uploads/2025/two-distance-formulas.png)

  In code, it looks like this:

  ```js
  function calculateDistance(node1, node2) {
    const dx = node2.x - node1.x;
    const dy = node2.y - node1.y;
    return Math.sqrt(dx * dx + dy * dy);
  }
  ```

  That’s it. The same old Pythagoras you once doodled in math class is now helping us solve the Traveling Salesman Problem. Who would’ve thought?


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

If you’re into algorithms, optimization, or just love seeing math come to life in the browser, give CIH a try. Who knew an old Delphi project could find new purpose in the age of JavaScript? -->