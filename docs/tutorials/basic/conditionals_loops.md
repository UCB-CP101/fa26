---
layout: page
title: Conditionals & Loops Practice
parent: Basic Tutorials
grand_parent: Python Resources
nav_order: 4
permalink: /docs/tutorials/basic/conditionals_loops/
---

# Conditionals & Loops Practice

## Problem Definition

We have lists of student groups, and we want each group to have exactly **4 members**.

### Steps to achieve this:

1. Check the size of each group.
2. If a group has **more than 4 members**, remove extra members and add them to a separate list.
3. If a group has **fewer than 4 members**, add new members from the list of removed members.
4. If it has exactly 4 members, inform us that it has the perfect size.

This is a simple example where we have **12 members in total**, and we know we can make **3 teams of 4**. In other situations, we would need a different approach.

---

## Code

```python
# Defining groups
group_1 = ['Tina', 'Maryam', 'Zoe', 'Daniel']

# Typing out all the names with ' and , can be annoying; str.split() helps.
group_2 = 'Claudio Joao Peter Neel Ali'.split()
group_3 = 'Deb Ewa Dustin'.split()

# Instead of handling each group separately, we put all groups into a list.
groups = [group_1, group_2, group_3]

# Sorting groups based on size in descending order.
# This ensures we handle larger groups first so that we have members to add to smaller groups if needed.
groups.sort(key=len, reverse=True)

# printing len of groups without a for loop:
print(f"Group size is {len(groups[0])}")
print(f"Group size is {len(groups[1])}")
print(f"Group size is {len(groups[2])}")

# Accessing groups using a for loop and printing their len
# When using for loop, you often do not need to use index to access each item
# The for loop has direct access to each item in the iterable. 
for group in groups:
    print(f"Group size is {len(group)}")

# If you need the index, use enumerate():
for i, group in enumerate(groups):
    print(f"Group {i} size is {len(group)}")
```

---

## Balancing Group Sizes

```python

removed_members = []  # Stores extra members removed from oversized groups.
smaller_groups = []  # Tracks groups that still need more members.

for group in groups:
    if len(group) > 4:
        print(f"Group has {len(group)} members, exceeding 4.")
        removed_members.append(group.pop())  # Remove last member and store it
        print(f"Removed: {removed_members[-1]}")
        print(f"Updated group: {group}")

    elif len(group) < 4:
        print(f"Group has {len(group)} members, below 4.")
        if removed_members: # any nonzero value evaluate to True in Python, so if the list is not empty, this will pass. 
            print(f"Adding {removed_members[-1]} to this group.")
            group.append(removed_members.pop())  # Add last removed member
            print(f"Updated group: {group}")
        else:
            print("No available members to add.")
            smaller_groups.append(group)  # Track underfilled groups

    else:
        print("Perfect group size.")
```
