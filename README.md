# Palimpsest

A mobile game built around the feeling of watching a hard drive defragment in the 90s.
You know the one - colored blocks slowly sorting themselves across a grid, chaos resolving into order, something deeply satisfying about the process even though you had no control over it.

## Motivation

I wanted to try Flutter and Dart.
Not to build something production-grade or prove a point - just to pick up a new stack by actually using it.

A small game felt like the right vehicle.
Constrained enough to finish, interesting enough to stay motivated, visual enough to know immediately when something works or doesn't.

The defrag idea came from memory.
I used to watch Norton Speed Disk run as a kid and found it genuinely mesmerizing - all those blocks moving around, the slow march toward order.
I never understood why it was satisfying.
Still don't, really.
But it was, and that felt like enough of a reason to build something around it.

## Gameplay (kinda)

The screen is a disk sector - a grid of blocks representing fragmented data.
Blocks are scattered.
Your job is to consolidate them.

You have one input: the **DEFRAG** button.

Pressing it supplies I/O resource to the drive.
While I/O is available, the defrag algorithm runs automatically - finding scattered data blocks and moving them toward the top of the grid, one at a time.
Each move costs I/O.
When the buffer runs dry, everything stops and waits.

So you tap.
Watch.
Tap again.
Watch the blocks slowly find their way home.

## Screenshots

<img width="200" height="1015" alt="Image" src="https://github.com/user-attachments/assets/3498c253-5484-4977-91dc-60bbb7d49254" />
<img width="200" height="1015" alt="Image" src="https://github.com/user-attachments/assets/37ef4cc0-1c61-480a-a82f-645809d33a6d" />
<img width="200" height="1015" alt="Image" src="https://github.com/user-attachments/assets/cc5e4096-0c96-4352-9e84-1dddc2c802da" />

## License

[All Rights Reserved](./LICENSE)
