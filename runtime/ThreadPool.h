#ifndef THREAD_POOL_H
#define THREAD_POOL_H

// Thread pool functions for Catamaran parallel execution
void spawn(const unsigned task, void (*f)(void));
void join(const unsigned task);

// Overloaded spawn functions for different argument counts (up to 33 args)
// These are implemented in ThreadPool.cpp

#endif // THREAD_POOL_H






