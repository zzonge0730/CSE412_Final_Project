#include <algorithm>
#include <atomic>
#include <cassert>
#include <climits>
#include <cstdio>
#include <iostream>
#include <mutex>
#include <thread>

#include <unistd.h>

#include "ThreadPool.h"
// #include "softboundcets.h"

#define DEBUG(x) 

#ifndef NUM_THREADS
#error "Num threads not specificed!"
#endif

static constexpr unsigned numThreads{ NUM_THREADS };

using namespace std;

// global mutex for writting to the console
//DEBUG(static mutex console_mutex);
static mutex console_mutex;

static void call_with_args(unsigned num_args, void (*f)(void), void **args) {
  //DEBUG(console_mutex.lock());
  // DEBUG(cerr << "call_with_args() by " << this_thread::get_id() << "\n");
  // DEBUG(console_mutex.unlock());
  // console_mutex.lock();
  // cerr << "call_with_args() argNum: " << num_args << "\n";
  // console_mutex.unlock();

  assert(f);
  assert(args);
  //cerr << "init: num_args: " << num_args << "\n";
  //assert(num_args == 0u || *args);
  if (num_args == 0u) {
    cerr << "num_args is 0...\n";
  }
  if (*args == NULL || *args == nullptr) {
    cerr << "*args ptr is null...\n";
    return;
  }

  // select which call based on number of arguments
  switch (num_args) {
  case 0u: {
    f();
    return;
  }

  case 1u: {
    auto g = (void (*)(void *))f;
    g(args[0]);
    return;
  }

  case 2u: {
    auto g = (void (*)(void *, void *))f;
    g(args[0], args[1]);
    return;
  }

  case 3u: {
    auto g = (void (*)(void *, void *, void *))f;
    g(args[0], args[1], args[2]);
    return;
  }

  case 4u: {
    auto g = (void (*)(void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3]);
    return;
  }

  case 5u: {
    auto g = (void (*)(void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4]);
    return;
  }

  case 6u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5]);
    return;
  }

  case 7u: {
    auto g =
        (void (*)(void *, void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
    return;
  }

  case 8u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *,
                       void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
    return;
  }
  
  case 9u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *,
                       void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
    return;
  }

  case 10u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
    return;
  }

  case 11u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10]);
    return;
  }
  
  case 12u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11]);
    return;
  }

  case 13u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12]);
    return;
  }

  case 14u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12], args[13]);
    return;
  }

  case 15u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14]);
    return;
  }

  case 16u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15]);
    return;
  }

  case 17u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16]);
    return;
  }

  case 18u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17]);
    return;
  }
  case 19u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18]);
    return;
  }

  case 20u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18],
    args[19]);
    return;
  }

  case 21u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18],
    args[19], args[20]);
    return;
  }

  case 22u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21]);
    return;
  }

  case 23u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21], args[22]);
    return;
  }


  case 26u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25]);
    return;
  }


  case 33u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32]);
    return;
  }
  

  default:
    cerr << "num_args: " << num_args << " is not correct...\n";
    return;
  }
}

namespace {
struct Job {
  unsigned num_args;
  void (*f)(void);
  void *args[512];//origin --- 8
};
}

// do not look/modify j or stop unless you hold m
static void do_work(Job *j, mutex *m, atomic<bool> *valid, bool *stop, bool * available) {
  // DEBUG(console_mutex.lock());
  // DEBUG(cerr << "do_work() by " << this_thread::get_id() << "\n");
  // DEBUG(console_mutex.unlock());
  // (console_mutex.lock());
  // (cerr << "do_work() by " << this_thread::get_id() << "\n");
  // (console_mutex.unlock());

  assert(j);
  assert(m);
  assert(valid);
  assert(stop);

  bool shutdown;
  do {
    // lock m to prevent changes to j and stop
    unique_lock<mutex> l(*m);

    // check if we've been told to shutdown
    shutdown = *stop;

    // cerr << "199---\n";
    // check if we've been given a job
    if (valid->load()) {
      // do the work
      call_with_args(j->num_args, j->f, j->args);
      
      // tell the ThreadPool that we did the work
      valid->store(false);
      *available = true;
    } else {
      // give another thread a chance
      l.unlock();
      this_thread::yield();
    }
  } while (!shutdown);
}

namespace {
class ThreadPool {
  Job jobs[numThreads];
  mutex mutexes[numThreads];
  bool stops[numThreads];
  thread threads[numThreads];
  atomic<bool> hasJobs[numThreads];
  bool available[numThreads];
  mutex available_mutex;

public:
  ThreadPool();
  ~ThreadPool();
  unsigned assignJob(unsigned num_args, void *arg1, void *arg2, void *arg3,
                     void *arg4, void *arg5, void *arg6, void *arg7, void *arg8,
                     void (*f)(void));
  unsigned assignJob9(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9,
                    void (*f)(void));
  unsigned assignJob10(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void (*f)(void));
  unsigned assignJob11(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11,
                    void (*f)(void));
  unsigned assignJob12(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12,
                    void (*f)(void));
  unsigned assignJob13(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13,
                    void (*f)(void));
  unsigned assignJob14(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14,
                    void (*f)(void));              
  unsigned assignJob15(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void (*f)(void));

  unsigned assignJob16(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16,
                    void (*f)(void));
  unsigned assignJob17(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17,
                    void (*f)(void));
  unsigned assignJob18(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18,
                    void (*f)(void));
  unsigned assignJob19(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19,
                    void (*f)(void));
  unsigned assignJob20(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void (*f)(void));
  unsigned assignJob21(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, void *arg21,
                    void (*f)(void));
  unsigned assignJob22(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22,
                    void (*f)(void));
  unsigned assignJob23(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23,
                    void (*f)(void));
  unsigned assignJob26(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                    void *arg26,
                    void (*f)(void));
  unsigned assignJob33(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                    void *arg26, void *arg27, void *arg28, void *arg29, void *arg30,
                    void *arg31, void *arg32, void *arg33,
                    void (*f)(void));
  void join(unsigned threadID);
};
}

ThreadPool::ThreadPool() {
  // DEBUG(console_mutex.lock());
  // DEBUG(puts("ThreadPool::ThreadPool()"));
  // DEBUG(console_mutex.unlock());

  (console_mutex.lock());
  (puts("ThreadPool::ThreadPool()"));
  (console_mutex.unlock());

  for (unsigned i{ 0u }; i < numThreads; ++i) {
    stops[i] = false;
    hasJobs[i] = false;
    available[i] = true;
    threads[i] =
        thread{ &do_work, &jobs[i], &mutexes[i], &hasJobs[i], &stops[i], &available[i]};
  }
}

ThreadPool::~ThreadPool() {
  // DEBUG(console_mutex.lock());
  // DEBUG(puts("ThreadPool::~ThreadPool()"));
  // DEBUG(console_mutex.unlock());

  (console_mutex.lock());
  (puts("ThreadPool::~ThreadPool()"));
  (console_mutex.unlock());

  // signal all threads to stop
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    mutexes[i].lock();
    stops[i] = true;
    mutexes[i].unlock();
  }

  // join on all threads
  for (auto &t : threads) {
    t.join();
  }
}

// returns positive ThreadID if successful, or negative value if unsuccessful
unsigned ThreadPool::assignJob(const unsigned num_args, void *arg1, void *arg2,
                               void *arg3, void *arg4, void *arg5, void *arg6,
                               void *arg7, void *arg8, void (*f)(void)) {
  // DEBUG(console_mutex.lock());
  // DEBUG(puts("ThreadPool::assignJob()"));
  // DEBUG(console_mutex.unlock());

  // (console_mutex.lock());
  // // (puts("ThreadPool::assignJob()"));
  // for (unsigned j = 0u; j < numThreads; ++j) {
  //   if (available[j]) {
  //     cerr << "thread id: " << j << " is ava...\n";
  //   } else {
  //     cerr << "thread id: " << j << " is busy...\n";
  //   }
  // }
  // (console_mutex.unlock());

  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      // lock mutexes[i] to prevent the thread from reading the job while we
      // change it.
      auto l2 = unique_lock<mutex>(mutexes[i]);
      // cerr << "l2---\n";
      // update jobs[i] to the job we want
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;
      j.args[1] = arg2;
      j.args[2] = arg3;
      j.args[3] = arg4;
      j.args[4] = arg5;
      j.args[5] = arg6;
      j.args[6] = arg7;
      j.args[7] = arg8;
    
      // signal to the thread that it has a job to do
      hasJobs[i] = true;

      // note that the thread isn't available
      available[i] = false;

      // tell the caller the threadID of the thread
      return i;
    }
  }

  // all theads are busy
  return UINT_MAX;
}

unsigned ThreadPool::assignJob9(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob10(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob11(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob12(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}
unsigned ThreadPool::assignJob13(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob14(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob15(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}


unsigned ThreadPool::assignJob16(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob17(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob18(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob19(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob20(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob21(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      j.args[20] = arg21;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob22(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      j.args[20] = arg21;j.args[21] = arg22;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob23(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      j.args[20] = arg21;j.args[21] = arg22;j.args[22] = arg23;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob26(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                    void *arg26,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      j.args[20] = arg21;j.args[21] = arg22;j.args[22] = arg23;j.args[23] = arg24;
      j.args[24] = arg25;j.args[25] = arg26;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}
unsigned ThreadPool::assignJob33(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                    void *arg26, void *arg27, void *arg28, void *arg29, void *arg30,
                    void *arg31, void *arg32, void *arg33,
                    void (*f)(void)) {
  auto l1 = unique_lock<mutex>(available_mutex);
  //cerr << "l1---\n";
  // find a thread which isn't busy
  for (unsigned i{ 0u }; i < numThreads; ++i) {
    if (available[i]) {
      auto l2 = unique_lock<mutex>(mutexes[i]);
      auto &j = jobs[i];
      j.num_args = num_args;
      j.f = f;
      j.args[0] = arg1;j.args[1] = arg2;j.args[2] = arg3;j.args[3] = arg4;
      j.args[4] = arg5;j.args[5] = arg6;j.args[6] = arg7;j.args[7] = arg8;
      j.args[8] = arg9;j.args[9] = arg10;j.args[10] = arg11;j.args[11] = arg12;
      j.args[12] = arg13;j.args[13] = arg14;j.args[14] = arg15;j.args[15] = arg16;
      j.args[16] = arg17;j.args[17] = arg18;j.args[18] = arg19;j.args[19] = arg20;
      j.args[20] = arg21;j.args[21] = arg22;j.args[22] = arg23;j.args[23] = arg24;
      j.args[24] = arg25;j.args[25] = arg26;j.args[26] = arg27;j.args[27] = arg28;
      j.args[28] = arg29;j.args[29] = arg30;j.args[30] = arg31;j.args[31] = arg32;
      j.args[32] = arg33;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}


// spin until thread with threadID has finished
void ThreadPool::join(unsigned threadID) {
  // DEBUG(console_mutex.lock());
  // DEBUG(puts("ThreadPool::join()"));
  // DEBUG(console_mutex.unlock());
  // cerr << "do join------------\n";
  // (console_mutex.lock());
  // (cerr << "ThreadPool::join() id: " << threadID << "\n");
  // (console_mutex.unlock());

  assert(threadID >= 0);
  // assert(threadID < numThreads);
  if (threadID >= numThreads) return;

  // wait until the thread which was supposed to do our job has finished
  while (hasJobs[threadID]) {
    this_thread::yield();
  }

  // aquire the available_mutex before changing available
  auto l = unique_lock<mutex>(available_mutex);

  // let the ThreadPool know that the thread with threadID is free
  available[threadID] = true;
}

static ThreadPool tp{};

static thread_local unsigned spawnCount{ 0u };
static thread_local pair<unsigned, unsigned> taskJobPairs[numThreads];

static inline bool updateJobID(const unsigned task, const unsigned jobID) {
  const bool success{ jobID < numThreads };
  if (success) {
    // cerr << "spawnCount: " << spawnCount << ", numThreads: " << numThreads << "\n";
    // assert(spawnCount < numThreads);
    if (spawnCount < numThreads) {
      taskJobPairs[spawnCount] = make_pair(task, jobID);
      ++spawnCount;
    } else { // spawnCount >= numThreads
      taskJobPairs[spawnCount - 1] = make_pair(task, jobID);
    }
    
    // cerr << "updateJobID: make_pair ( task: " << task << ", jobID: " << jobID << ")...\n";
    
  }
  return success;
}

 void spawn(const unsigned task, void (*f)(void)) {
  unsigned jobID = tp.assignJob(0u, nullptr, nullptr, nullptr, nullptr, nullptr,
                                nullptr, nullptr, nullptr, f);
  //cout << "assignJon0...\n";
  if (!updateJobID(task, jobID)) {
    f();
  } else {
    // usleep(10);
    
  }
  
}

 void spawn(const unsigned task, void (*f)(void *), void *arg1) {
  unsigned jobID = tp.assignJob(1u, arg1, nullptr, nullptr, nullptr, nullptr,
                                nullptr, nullptr, nullptr, (void (*)(void))f);
  // cerr << "assignJon1...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    f(arg1);
  } else {
    // usleep(10);
    // join(task);
  }
}

 void spawn(const unsigned task, void (*f)(void *, void *), void *arg1,
           void *arg2) {
  unsigned jobID = tp.assignJob(2u, arg1, arg2, nullptr, nullptr, nullptr,
                                nullptr, nullptr, nullptr, (void (*)(void))f);
  //cerr << "assignJob2...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    // cerr << "assignJob2...SerialExe-task:" << task <<  "\n";
    f(arg1, arg2);
  } else {
    // cerr << "assignJob2...ParallelExe-task:" << task <<  "\n";
    // usleep(10);
    
  }
}

 void spawn(const unsigned task, void (*f)(void *, void *, void *), void *arg1,
           void *arg2, void *arg3) {
  unsigned jobID = tp.assignJob(3u, arg1, arg2, arg3, nullptr, nullptr, nullptr,
                                nullptr, nullptr, (void (*)(void))f);
  // cerr << "assignJob3...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3);
  } else {
    // usleep(10);
    
  }
}

 void spawn(const unsigned task, void (*f)(void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4) {
  // cerr << "spwan4: %x" << arg4 << "\n";
  unsigned jobID = tp.assignJob(4u, arg1, arg2, arg3, arg4, nullptr, nullptr,
                                nullptr, nullptr, (void (*)(void))f);
  // cerr << "assignJob4...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    // cerr << "assignJob4...SerialExe-task:" << task <<  "\n";
    f(arg1, arg2, arg3, arg4);
  } else {
    // cerr << "assignJob4...ParallelExe-task:" << task <<  "\n";
    // usleep(10);
    // join(task);
  }
}

 void spawn(const unsigned task,
           void (*f)(void *, void *, void *, void *, void *), void *arg1,
           void *arg2, void *arg3, void *arg4, void *arg5) {
  unsigned jobID = tp.assignJob(5u, arg1, arg2, arg3, arg4, arg5, nullptr,
                                nullptr, nullptr, (void (*)(void))f);
  // cerr << "assignJon5...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    // cerr << "assignJob5...SerialExe-task:" << task <<  "\n";
    f(arg1, arg2, arg3, arg4, arg5);
  } else {
    // usleep(10);
    
  }
}

 void spawn(const unsigned task,
           void (*f)(void *, void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6) {
  unsigned jobID = tp.assignJob(6u, arg1, arg2, arg3, arg4, arg5, arg6, nullptr,
                                nullptr, (void (*)(void))f);
  // cerr << "assignJon6...task:" << task <<  "\n";
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6);
  } else {
    // usleep(10);
    
  }
}

 void spawn(const unsigned task,
           void (*f)(void *, void *, void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7) {
  unsigned jobID = tp.assignJob(7u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                nullptr, (void (*)(void))f);
  //cout << "assignJon7...\n";
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
  } else {
    // 
  }
}

 void spawn(const unsigned task, void (*f)(void *, void *, void *, void *,
                                          void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8) {
  unsigned jobID = tp.assignJob(8u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, (void (*)(void))f);
  //cout << "assignJon8...\n";
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9) {
  unsigned jobID = tp.assignJob9(9u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
  } else {
    // 
  }
} 

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10) {
  unsigned jobID = tp.assignJob10(10u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11) {
  unsigned jobID = tp.assignJob11(11u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
  } else {
    // 
  }
}

 void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12) {
  // cerr << "---in spawn 121\n";
  unsigned jobID = tp.assignJob12(12u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, (void (*)(void))f);
  // cerr << "---in spawn 122\n";
  if (!updateJobID(task, jobID)) {
    cerr << "---in spawn 12\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
  } else {
    // 
  }
  // cerr << "---in spawn 123\n";
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13) {
  unsigned jobID = tp.assignJob13(13u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, (void (*)(void))f);
      
  if (!updateJobID(task, jobID)) {
    cerr << "---in spawn 13\n"; 
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
  } else {
    //
    
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14) {
  unsigned jobID = tp.assignJob14(14u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15) {
  unsigned jobID = tp.assignJob15(15u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16) {
  unsigned jobID = tp.assignJob16(16u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17) {
  unsigned jobID = tp.assignJob17(17u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18) {
  unsigned jobID = tp.assignJob18(18u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18);
  } else {
    // 
  }
}
 void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19) {
  unsigned jobID = tp.assignJob19(19u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20) {
  unsigned jobID = tp.assignJob20(20u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20);
  } else {
    // 
  }
}


void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
           void *arg21) {
  unsigned jobID = tp.assignJob21(21u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20, arg21);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
           void *arg21, void *arg22) {
  unsigned jobID = tp.assignJob22(22u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
           void *arg21, void *arg22, void *arg23) {
  unsigned jobID = tp.assignJob23(23u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23);
  } else {
    // 
  }
}

    
void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
           void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, 
           void *arg26) {
  unsigned jobID = tp.assignJob26(26u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23,
                                arg24, arg25, arg26, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26);
  } else {
    // 
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *, void *, void *,
                                          void *, void *, void *),
           void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
           void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
           void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
           void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
           void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, 
           void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
           void *arg31, void *arg32, void *arg33) {
  unsigned jobID = tp.assignJob33(33u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
                                arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23,
                                arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
    arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27,
    arg28, arg29, arg30, arg31, arg32, arg33);
  } else {
    // 
    cerr << "---in spawn 331\n";
  }
}



 void join(const unsigned task) {
  // join with and remove all jobs in taskJobPairs which match task
  
  // cerr << "want join.task.." << task << "\n";
  // for (unsigned i = 0; i < numThreads; i++) {
  //   cerr << "pair: " << taskJobPairs[i].first << ", " << taskJobPairs[i].second << "\n";
  // }
  auto *end = remove_if(taskJobPairs, taskJobPairs + spawnCount,
                        [task](const pair<unsigned, unsigned> &p) {
    const bool join{ p.first == task };
    if (join) {
      // cerr << "task: " << task << " is joined...\n";
      tp.join(p.second);
    }
    return join;
  });
  assert(end - taskJobPairs >= 0 && end - taskJobPairs <= numThreads);
  spawnCount = end - taskJobPairs;
}
