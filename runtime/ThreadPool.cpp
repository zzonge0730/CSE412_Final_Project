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

  // case 32u: {
  //   auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *,
  //                      void *, void *, void *, void *, void *, void *,
  //                      void *, void *, void *, void *, void *, void *,
  //                      void *, void *, void *, void *, void *, void *,
  //                      void *, void *, void *, void *, void *, void *,
  //                      void *))f;
  //   g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
  //   args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
  //   args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
  //   args[27], args[28], args[29], args[30],args[31]);
  //   return;
  // }
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
  case 48u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47]);
    return;
  }

  case 60u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59]);
    return;
  }

  case 73u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72]);
    return;
  }

  case 85u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84]);
    return;
  }

  case 90u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84],args[85], args[86], args[87], args[88], args[89]);
    return;
  }

  case 100u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84],args[85], args[86], args[87], args[88], args[89],
    args[90], args[91], args[92], args[93], args[94], args[95], args[96], args[97], args[98],
    args[99]);
    return;
  }
  case 117u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84],args[85], args[86], args[87], args[88], args[89],
    args[90], args[91], args[92], args[93], args[94], args[95], args[96], args[97], args[98],
    args[99], args[100], args[101], args[102],args[103], args[104], args[105], args[106], args[107],
    args[108], args[109], args[110], args[111],args[112], args[113], args[114], args[115], args[116]);
    return;
  }

  case 130u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8],
    args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17],
    args[18], args[19], args[20], args[21],args[22], args[23], args[24], args[25], args[26],
    args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35],
    args[36], args[37], args[38], args[39],args[40], args[41], args[42], args[43], args[44],
    args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53],
    args[54], args[55], args[56], args[57],args[58], args[59], args[60], args[61], args[62],
    args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71],
    args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84],args[85], args[86], args[87], args[88], args[89],
    args[90], args[91], args[92], args[93], args[94], args[95], args[96], args[97], args[98],
    args[99], args[100], args[101], args[102],args[103], args[104], args[105], args[106], args[107],
    args[108], args[109], args[110], args[111],args[112], args[113], args[114], args[115], args[116],
    args[117], args[118], args[119], args[120],args[121], args[122], args[123], args[124], args[125],
    args[126], args[127], args[128], args[129]);
    return;
  }

    case 205u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21],args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121],args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204] );
    return;
  }

  case 217u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21],args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121],args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204], args[205], args[206], args[207], args[208], args[209], args[210], args[211], args[212],args[213], args[214], args[215], args[216]);
    return;
  }

  case 226u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21],args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121],args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204], args[205], args[206], args[207], args[208], args[209], args[210], args[211], args[212],args[213], args[214], args[215], args[216], args[217], args[218], args[219], args[220], 
    args[221],args[222], args[223], args[224], args[225]);
    return;
  }

  case 229u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21],args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121],args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204], args[205], args[206], args[207], args[208], args[209], args[210], args[211], args[212],args[213], args[214], args[215], args[216], args[217], args[218], args[219], args[220], 
    args[221],args[222], args[223], args[224], args[225], args[226], args[227], args[228]);
    return;
  }

  case 469u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21], args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121], args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204], args[205], args[206], args[207], args[208], args[209], args[210], args[211], args[212],args[213], args[214], args[215], args[216], args[217], args[218], args[219], args[220], 
    args[221], args[222], args[223], args[224], args[225], args[226], args[227], args[228], args[229], args[230],args[231], args[232], args[233], args[234], args[235], args[236], args[237], args[238], args[239],args[240], 
    args[241], args[242], args[243], args[244], args[245], args[246], args[247], args[248],args[249], args[250], args[251], args[252], args[253], args[254], args[255], args[256], args[257],args[258], args[259], args[260], 
    args[261], args[262], args[263], args[264], args[265], args[266], args[267], args[268], args[269], args[270], args[271], args[272], args[273], args[274], args[275],args[276], args[277], args[278], args[279], args[280],
    args[281], args[282], args[283], args[284], args[285], args[286], args[287], args[288], args[289], args[290], args[291], args[292], args[293], args[294], args[295],args[296], args[297], args[298], args[299], args[300],
    args[301], args[302], args[303], args[304], args[305], args[306], args[307], args[308], args[309], args[310], args[311], args[312], args[313], args[314], args[315], args[316], args[317], args[118], args[319], args[320], 
    args[321], args[322], args[323], args[324], args[325], args[326], args[327], args[328], args[329], args[330], args[331], args[332], args[333], args[334], args[335], args[336], args[337], args[138], args[339], args[340], 
    args[341], args[342], args[343], args[344], args[345], args[346], args[347], args[348], args[349], args[350], args[351], args[352], args[353], args[354], args[355], args[356], args[357], args[158], args[359], args[360], 
    args[361], args[362], args[363], args[364], args[365], args[366], args[367], args[368], args[369], args[370], args[371], args[372], args[373], args[374], args[375], args[376], args[377], args[178], args[379], args[380],
    args[381], args[382], args[383], args[384], args[385], args[386], args[387], args[388], args[389], args[390], args[391], args[392], args[393], args[394], args[395], args[396], args[397], args[198], args[399], args[400],
    args[401], args[402], args[403], args[404], args[405], args[406], args[407], args[408], args[409], args[410], args[411], args[412], args[413], args[414], args[415], args[416], args[417], args[218], args[419], args[420], 
    args[421], args[422], args[423], args[424], args[425], args[426], args[427], args[428], args[429], args[430], args[431], args[432], args[433], args[434], args[435], args[436], args[437], args[438], args[439], args[440], 
    args[441], args[442], args[443], args[444], args[445], args[446], args[447], args[448], args[449], args[450], args[451], args[452], args[453], args[454], args[455], args[456], args[457], args[458], args[459], args[460], 
    args[461], args[462], args[463], args[464], args[465], args[466], args[467], args[468]);
    return;
  }

  case 510u: {
    auto g = (void (*)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *))f;
    g(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12],args[13], args[14], args[15], args[16], args[17], args[18], args[19], args[20], 
    args[21], args[22], args[23], args[24], args[25], args[26], args[27], args[28], args[29], args[30],args[31], args[32], args[33], args[34], args[35], args[36], args[37], args[38], args[39],args[40], 
    args[41], args[42], args[43], args[44], args[45], args[46], args[47], args[48],args[49], args[50], args[51], args[52], args[53], args[54], args[55], args[56], args[57],args[58], args[59], args[60], 
    args[61], args[62], args[63], args[64], args[65], args[66],args[67], args[68], args[69], args[70], args[71], args[72], args[73], args[74], args[75],args[76], args[77], args[78], args[79], args[80],
    args[81], args[82], args[83], args[84], args[85], args[86],args[87], args[88], args[89], args[90], args[91], args[92], args[93], args[94], args[95],args[96], args[97], args[98], args[99], args[100],
    args[101], args[102], args[103], args[104], args[105], args[106], args[107], args[108], args[109], args[110], args[111], args[112],args[113], args[114], args[115], args[116], args[117], args[118], args[119], args[120], 
    args[121], args[122], args[123], args[124], args[125], args[126], args[127], args[128], args[129], args[130],args[131], args[132], args[133], args[134], args[135], args[136], args[137], args[138], args[139],args[140], 
    args[141], args[142], args[143], args[144], args[145], args[146], args[147], args[148],args[149], args[150], args[151], args[152], args[153], args[154], args[155], args[156], args[157],args[158], args[159], args[160], 
    args[161], args[162], args[163], args[164], args[165], args[166],args[167], args[168], args[169], args[170], args[171], args[172], args[173], args[174], args[175],args[176], args[177], args[178], args[179], args[180],
    args[181], args[182], args[183], args[184], args[185], args[186],args[187], args[188], args[189], args[190], args[191], args[192], args[193], args[194], args[195],args[196], args[197], args[198], args[199], args[200],
    args[201], args[202], args[203], args[204], args[205], args[206], args[207], args[208], args[209], args[210], args[211], args[212],args[213], args[214], args[215], args[216], args[217], args[218], args[219], args[220], 
    args[221], args[222], args[223], args[224], args[225], args[226], args[227], args[228], args[229], args[230],args[231], args[232], args[233], args[234], args[235], args[236], args[237], args[238], args[239],args[240], 
    args[241], args[242], args[243], args[244], args[245], args[246], args[247], args[248],args[249], args[250], args[251], args[252], args[253], args[254], args[255], args[256], args[257],args[258], args[259], args[260], 
    args[261], args[262], args[263], args[264], args[265], args[266], args[267], args[268], args[269], args[270], args[271], args[272], args[273], args[274], args[275],args[276], args[277], args[278], args[279], args[280],
    args[281], args[282], args[283], args[284], args[285], args[286], args[287], args[288], args[289], args[290], args[291], args[292], args[293], args[294], args[295],args[296], args[297], args[298], args[299], args[300],
    args[301], args[302], args[303], args[304], args[305], args[306], args[307], args[308], args[309], args[310], args[311], args[312], args[313], args[314], args[315], args[316], args[317], args[118], args[319], args[320], 
    args[321], args[322], args[323], args[324], args[325], args[326], args[327], args[328], args[329], args[330], args[331], args[332], args[333], args[334], args[335], args[336], args[337], args[138], args[339], args[340], 
    args[341], args[342], args[343], args[344], args[345], args[346], args[347], args[348], args[349], args[350], args[351], args[352], args[353], args[354], args[355], args[356], args[357], args[158], args[359], args[360], 
    args[361], args[362], args[363], args[364], args[365], args[366], args[367], args[368], args[369], args[370], args[371], args[372], args[373], args[374], args[375], args[376], args[377], args[178], args[379], args[380],
    args[381], args[382], args[383], args[384], args[385], args[386], args[387], args[388], args[389], args[390], args[391], args[392], args[393], args[394], args[395], args[396], args[397], args[198], args[399], args[400],
    args[401], args[402], args[403], args[404], args[405], args[406], args[407], args[408], args[409], args[410], args[411], args[412], args[413], args[414], args[415], args[416], args[417], args[218], args[419], args[420], 
    args[421], args[422], args[423], args[424], args[425], args[426], args[427], args[428], args[429], args[430], args[431], args[432], args[433], args[434], args[435], args[436], args[437], args[438], args[439], args[440], 
    args[441], args[442], args[443], args[444], args[445], args[446], args[447], args[448], args[449], args[450], args[451], args[452], args[453], args[454], args[455], args[456], args[457], args[458], args[459], args[460], 
    args[461], args[462], args[463], args[464], args[465], args[466], args[467], args[468], args[469], args[470], args[471], args[472], args[473], args[474], args[475], args[476], args[477], args[478], args[479], args[480],
    args[481], args[482], args[483], args[484], args[485], args[486], args[487], args[488], args[489], args[490], args[491], args[492], args[493], args[494], args[495], args[496], args[497], args[498], args[499], args[500], 
    args[501], args[502], args[503], args[504], args[505], args[506], args[507], args[508], args[509]);

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
  // unsigned assignJob32(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
  //                   void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
  //                   void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
  //                   void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
  //                   void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
  //                   void *arg26, void *arg27, void *arg28, void *arg29, void *arg30,
  //                   void *arg31, void *arg32,
  //                   void (*f)(void));
  unsigned assignJob33(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                    void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
                    void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
                    void *arg16, void *arg17, void *arg18, void *arg19, void *arg20,
                    void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                    void *arg26, void *arg27, void *arg28, void *arg29, void *arg30,
                    void *arg31, void *arg32, void *arg33,
                    void (*f)(void));
  unsigned assignJob48(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void (*f)(void));
  unsigned assignJob60(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void (*f)(void));                                           
  unsigned assignJob73(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void (*f)(void));

  unsigned assignJob85(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80, void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void (*f)(void));
  unsigned assignJob90(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80, void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90, void (*f)(void));
  unsigned assignJob100(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80, void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, void (*f)(void));
  unsigned assignJob117(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80, void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110,
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void (*f)(void));
 
  unsigned assignJob130(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40, void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80, void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110,
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, void (*f)(void));


  unsigned assignJob205(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205,
                       void (*f)(void));

  unsigned assignJob217(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void (*f)(void));

  unsigned assignJob226(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void *arg218, void *arg219, void *arg220, void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226,
                       void (*f)(void));
  unsigned assignJob229(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void *arg218, void *arg219, void *arg220, void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229,
                       void (*f)(void));

  unsigned assignJob469(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469, void (*f)(void));

  unsigned assignJob510(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469, void *arg470,
                       void *arg471, void *arg472, void *arg473, void *arg474, void *arg475, void *arg476, void *arg477, void *arg478, void *arg479, void *arg480,
                       void *arg481, void *arg482, void *arg483, void *arg484, void *arg485, void *arg486, void *arg487, void *arg488, void *arg489, void *arg490,
                       void *arg491, void *arg492, void *arg493, void *arg494, void *arg495, void *arg496, void *arg497, void *arg498, void *arg499, void *arg500, 
                       void *arg501, void *arg502, void *arg503, void *arg504, void *arg505, void *arg506, void *arg507, void *arg508, void *arg509, void *arg510, void (*f)(void));

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

unsigned ThreadPool::assignJob73(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void (*f)(void)) {

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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob48(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void (*f)(void)) {

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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;


}

unsigned ThreadPool::assignJob60(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60, void (*f)(void)) {

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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;


}

unsigned ThreadPool::assignJob85(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void (*f)(void)) {

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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;


}

unsigned ThreadPool::assignJob90(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90, void (*f)(void)) {

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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;


}

unsigned ThreadPool::assignJob100(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100,
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;

}
unsigned ThreadPool::assignJob117(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void (*f)(void)) {
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;

}
unsigned ThreadPool::assignJob130(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;

}

unsigned ThreadPool::assignJob205(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, 
                       void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, 
                       void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25,
                       void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35,
                       void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45,
                       void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55,
                       void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205,
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;

}

unsigned ThreadPool::assignJob217(unsigned num_args,void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void (*f)(void)){
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;j.args[205] = arg206;j.args[206] = arg207;j.args[207] = arg208;
      j.args[208] = arg209;j.args[209] = arg210;j.args[210] = arg211;j.args[211] = arg212;
      j.args[212] = arg213;j.args[213] = arg214;j.args[214] = arg215;j.args[215] = arg216;
      j.args[216] = arg217;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob226(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void *arg218, void *arg219, void *arg220, void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void (*f)(void)){
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;j.args[205] = arg206;j.args[206] = arg207;j.args[207] = arg208;
      j.args[208] = arg209;j.args[209] = arg210;j.args[210] = arg211;j.args[211] = arg212;
      j.args[212] = arg213;j.args[213] = arg214;j.args[214] = arg215;j.args[215] = arg216;
      j.args[216] = arg217;j.args[217] = arg218;j.args[218] = arg219;j.args[219] = arg220;
      j.args[220] = arg221;j.args[221] = arg222;j.args[222] = arg223;j.args[223] = arg224;
      j.args[224] = arg225;j.args[225] = arg226;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob229(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50, void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65,
                       void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75,
                       void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, 
                       void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95,
                       void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, 
                       void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, 
                       void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125,
                       void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135,
                       void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145,
                       void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155,
                       void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165,
                       void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175,
                       void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, 
                       void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195,
                       void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217,
                       void *arg218, void *arg219, void *arg220, void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void (*f)(void)){
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;j.args[205] = arg206;j.args[206] = arg207;j.args[207] = arg208;
      j.args[208] = arg209;j.args[209] = arg210;j.args[210] = arg211;j.args[211] = arg212;
      j.args[212] = arg213;j.args[213] = arg214;j.args[214] = arg215;j.args[215] = arg216;
      j.args[216] = arg217;j.args[217] = arg218;j.args[218] = arg219;j.args[219] = arg220;
      j.args[220] = arg221;j.args[221] = arg222;j.args[222] = arg223;j.args[223] = arg224;
      j.args[224] = arg225;j.args[225] = arg226;j.args[226] = arg227;j.args[227] = arg228;
      j.args[228] = arg229;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob469(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469, void (*f)(void)){
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;j.args[205] = arg206;j.args[206] = arg207;j.args[207] = arg208;
      j.args[208] = arg209;j.args[209] = arg210;j.args[210] = arg211;j.args[211] = arg212;
      j.args[212] = arg213;j.args[213] = arg214;j.args[214] = arg215;j.args[215] = arg216;
      j.args[216] = arg217;j.args[217] = arg218;j.args[218] = arg219;j.args[219] = arg220;
      j.args[220] = arg221;j.args[221] = arg222;j.args[222] = arg223;j.args[223] = arg224;
      j.args[224] = arg225;j.args[225] = arg226;j.args[226] = arg227;j.args[227] = arg228;
      j.args[228] = arg229;j.args[229] = arg230;j.args[230] = arg231;j.args[231] = arg232;
      j.args[232] = arg233;j.args[233] = arg234;j.args[234] = arg235;j.args[235] = arg236;
      j.args[236] = arg237;j.args[237] = arg238;j.args[238] = arg239;j.args[239] = arg240;
      j.args[240] = arg241;j.args[241] = arg242;j.args[242] = arg243;j.args[243] = arg244;
      j.args[244] = arg245;j.args[245] = arg246;j.args[246] = arg247;j.args[247] = arg248;
      j.args[248] = arg249;j.args[249] = arg250;j.args[250] = arg251;j.args[251] = arg252;
      j.args[252] = arg253;j.args[253] = arg254;j.args[254] = arg255;j.args[255] = arg256;
      j.args[256] = arg257;j.args[257] = arg258;j.args[258] = arg259;j.args[259] = arg260;
      j.args[260] = arg261;j.args[261] = arg262;j.args[262] = arg263;j.args[263] = arg264;
      j.args[264] = arg265;j.args[265] = arg266;j.args[266] = arg267;j.args[267] = arg268;
      j.args[268] = arg269;j.args[269] = arg270;j.args[270] = arg271;j.args[271] = arg272;
      j.args[272] = arg273;j.args[273] = arg274;j.args[274] = arg275;j.args[275] = arg276;
      j.args[276] = arg277;j.args[277] = arg278;j.args[278] = arg279;j.args[279] = arg280;
      j.args[280] = arg281;j.args[281] = arg282;j.args[282] = arg283;j.args[283] = arg284;
      j.args[284] = arg285;j.args[285] = arg286;j.args[286] = arg287;j.args[287] = arg288;
      j.args[288] = arg289;j.args[289] = arg290;j.args[290] = arg291;j.args[291] = arg292;
      j.args[292] = arg293;j.args[293] = arg294;j.args[294] = arg295;j.args[295] = arg296;
      j.args[296] = arg297;j.args[297] = arg298;j.args[298] = arg299;j.args[299] = arg300;
      j.args[300] = arg301;j.args[301] = arg302;j.args[302] = arg303;j.args[303] = arg304;
      j.args[304] = arg305;j.args[305] = arg306;j.args[306] = arg307;j.args[307] = arg308;
      j.args[308] = arg309;j.args[309] = arg310;j.args[310] = arg311;j.args[311] = arg312;
      j.args[312] = arg313;j.args[313] = arg314;j.args[314] = arg315;j.args[315] = arg316;
      j.args[316] = arg317;j.args[317] = arg318;j.args[318] = arg319;j.args[319] = arg320;
      j.args[320] = arg321;j.args[321] = arg322;j.args[322] = arg323;j.args[323] = arg324;
      j.args[324] = arg325;j.args[325] = arg326;j.args[326] = arg327;j.args[327] = arg328;
      j.args[328] = arg329;j.args[329] = arg330;j.args[330] = arg331;j.args[331] = arg332;
      j.args[332] = arg333;j.args[333] = arg334;j.args[334] = arg335;j.args[335] = arg336;
      j.args[336] = arg337;j.args[337] = arg338;j.args[338] = arg339;j.args[339] = arg340;
      j.args[340] = arg341;j.args[341] = arg342;j.args[342] = arg343;j.args[343] = arg344;
      j.args[344] = arg345;j.args[345] = arg346;j.args[346] = arg347;j.args[347] = arg348;
      j.args[348] = arg349;j.args[349] = arg350;j.args[350] = arg351;j.args[351] = arg352;
      j.args[352] = arg353;j.args[353] = arg354;j.args[354] = arg355;j.args[355] = arg356;
      j.args[356] = arg357;j.args[357] = arg358;j.args[358] = arg359;j.args[359] = arg360;
      j.args[360] = arg361;j.args[361] = arg362;j.args[362] = arg363;j.args[363] = arg364;
      j.args[364] = arg365;j.args[365] = arg366;j.args[366] = arg367;j.args[367] = arg368;
      j.args[368] = arg369;j.args[369] = arg370;j.args[370] = arg371;j.args[371] = arg372;
      j.args[372] = arg373;j.args[373] = arg374;j.args[374] = arg375;j.args[375] = arg376;
      j.args[376] = arg377;j.args[377] = arg378;j.args[378] = arg379;j.args[379] = arg380;
      j.args[380] = arg381;j.args[381] = arg382;j.args[382] = arg383;j.args[383] = arg384;
      j.args[384] = arg385;j.args[385] = arg386;j.args[386] = arg387;j.args[387] = arg388;
      j.args[388] = arg389;j.args[389] = arg390;j.args[390] = arg391;j.args[391] = arg392;
      j.args[392] = arg393;j.args[393] = arg394;j.args[394] = arg395;j.args[395] = arg396;
      j.args[396] = arg397;j.args[397] = arg398;j.args[398] = arg399;j.args[399] = arg400;
      j.args[400] = arg401;j.args[401] = arg402;j.args[402] = arg403;j.args[403] = arg404;
      j.args[404] = arg405;j.args[405] = arg406;j.args[406] = arg407;j.args[407] = arg408;
      j.args[408] = arg409;j.args[409] = arg410;j.args[410] = arg411;j.args[411] = arg412;
      j.args[412] = arg413;j.args[413] = arg414;j.args[414] = arg415;j.args[415] = arg416;
      j.args[416] = arg417;j.args[417] = arg418;j.args[418] = arg419;j.args[419] = arg420;
      j.args[420] = arg421;j.args[421] = arg422;j.args[422] = arg423;j.args[423] = arg424;
      j.args[424] = arg425;j.args[425] = arg426;j.args[426] = arg427;j.args[427] = arg428;
      j.args[428] = arg429;j.args[429] = arg430;j.args[430] = arg431;j.args[431] = arg432;
      j.args[432] = arg433;j.args[433] = arg434;j.args[434] = arg435;j.args[435] = arg436;
      j.args[436] = arg437;j.args[437] = arg438;j.args[438] = arg439;j.args[439] = arg440;
      j.args[440] = arg441;j.args[441] = arg442;j.args[442] = arg443;j.args[443] = arg444;
      j.args[444] = arg445;j.args[445] = arg446;j.args[446] = arg447;j.args[447] = arg448;
      j.args[448] = arg449;j.args[449] = arg450;j.args[450] = arg451;j.args[451] = arg452;
      j.args[452] = arg453;j.args[453] = arg454;j.args[454] = arg455;j.args[455] = arg456;
      j.args[456] = arg457;j.args[457] = arg458;j.args[458] = arg459;j.args[459] = arg460;
      j.args[460] = arg461;j.args[461] = arg462;j.args[462] = arg463;j.args[463] = arg464;
      j.args[464] = arg465;j.args[465] = arg466;j.args[466] = arg467;j.args[467] = arg468;
      j.args[468] = arg469;
      hasJobs[i] = true;
      available[i] = false;
      return i;
    }
  }
  return UINT_MAX;
}

unsigned ThreadPool::assignJob510(unsigned num_args, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469, void *arg470,
                       void *arg471, void *arg472, void *arg473, void *arg474, void *arg475, void *arg476, void *arg477, void *arg478, void *arg479, void *arg480,
                       void *arg481, void *arg482, void *arg483, void *arg484, void *arg485, void *arg486, void *arg487, void *arg488, void *arg489, void *arg490,
                       void *arg491, void *arg492, void *arg493, void *arg494, void *arg495, void *arg496, void *arg497, void *arg498, void *arg499, void *arg500, 
                       void *arg501, void *arg502, void *arg503, void *arg504, void *arg505, void *arg506, void *arg507, void *arg508, void *arg509, void *arg510, void (*f)(void)){
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
      j.args[32] = arg33;j.args[33] = arg34;j.args[34] = arg35;j.args[35] = arg36;
      j.args[36] = arg37;j.args[37] = arg38;j.args[38] = arg39;j.args[39] = arg40;
      j.args[40] = arg41;j.args[41] = arg42;j.args[42] = arg43;j.args[43] = arg44;
      j.args[44] = arg45;j.args[45] = arg46;j.args[46] = arg47;j.args[47] = arg48;
      j.args[48] = arg49;j.args[49] = arg50;j.args[50] = arg51;j.args[51] = arg52;
      j.args[52] = arg53;j.args[53] = arg54;j.args[54] = arg55;j.args[55] = arg56;
      j.args[56] = arg57;j.args[57] = arg58;j.args[58] = arg59;j.args[59] = arg60;
      j.args[60] = arg61;j.args[61] = arg62;j.args[62] = arg63;j.args[63] = arg64;
      j.args[64] = arg65;j.args[65] = arg66;j.args[66] = arg67;j.args[67] = arg68;
      j.args[68] = arg69;j.args[69] = arg70;j.args[70] = arg71;j.args[71] = arg72;
      j.args[72] = arg73;j.args[73] = arg74;j.args[74] = arg75;j.args[75] = arg76;
      j.args[76] = arg77;j.args[77] = arg78;j.args[78] = arg79;j.args[79] = arg80;
      j.args[80] = arg81;j.args[81] = arg82;j.args[82] = arg83;j.args[83] = arg84;
      j.args[84] = arg85;j.args[85] = arg86;j.args[86] = arg87;j.args[87] = arg88;
      j.args[88] = arg89;j.args[89] = arg90;j.args[90] = arg91;j.args[91] = arg92;
      j.args[92] = arg93;j.args[93] = arg94;j.args[94] = arg95;j.args[95] = arg96;
      j.args[96] = arg97;j.args[97] = arg98;j.args[98] = arg99;j.args[99] = arg100;
      j.args[100] = arg101;j.args[101] = arg102;j.args[102] = arg103;j.args[103] = arg104;
      j.args[104] = arg105;j.args[105] = arg106;j.args[106] = arg107;j.args[107] = arg108;
      j.args[108] = arg109;j.args[109] = arg110;j.args[110] = arg111;j.args[111] = arg112;
      j.args[112] = arg113;j.args[113] = arg114;j.args[114] = arg115;j.args[115] = arg116;
      j.args[116] = arg117;j.args[117] = arg118;j.args[118] = arg119;j.args[119] = arg120;
      j.args[120] = arg121;j.args[121] = arg122;j.args[122] = arg123;j.args[123] = arg124;
      j.args[124] = arg125;j.args[125] = arg126;j.args[126] = arg127;j.args[127] = arg128;
      j.args[128] = arg129;j.args[129] = arg130;j.args[130] = arg131;j.args[131] = arg132;
      j.args[132] = arg133;j.args[133] = arg134;j.args[134] = arg135;j.args[135] = arg136;
      j.args[136] = arg137;j.args[137] = arg138;j.args[138] = arg139;j.args[139] = arg140;
      j.args[140] = arg141;j.args[141] = arg142;j.args[142] = arg143;j.args[143] = arg144;
      j.args[144] = arg145;j.args[145] = arg146;j.args[146] = arg147;j.args[147] = arg148;
      j.args[148] = arg149;j.args[149] = arg150;j.args[150] = arg151;j.args[151] = arg152;
      j.args[152] = arg153;j.args[153] = arg154;j.args[154] = arg155;j.args[155] = arg156;
      j.args[156] = arg157;j.args[157] = arg158;j.args[158] = arg159;j.args[159] = arg160;
      j.args[160] = arg161;j.args[161] = arg162;j.args[162] = arg163;j.args[163] = arg164;
      j.args[164] = arg165;j.args[165] = arg166;j.args[166] = arg167;j.args[167] = arg168;
      j.args[168] = arg169;j.args[169] = arg170;j.args[170] = arg171;j.args[171] = arg172;
      j.args[172] = arg173;j.args[173] = arg174;j.args[174] = arg175;j.args[175] = arg176;
      j.args[176] = arg177;j.args[177] = arg178;j.args[178] = arg179;j.args[179] = arg180;
      j.args[180] = arg181;j.args[181] = arg182;j.args[182] = arg183;j.args[183] = arg184;
      j.args[184] = arg185;j.args[185] = arg186;j.args[186] = arg187;j.args[187] = arg188;
      j.args[188] = arg189;j.args[189] = arg190;j.args[190] = arg191;j.args[191] = arg192;
      j.args[192] = arg193;j.args[193] = arg194;j.args[194] = arg195;j.args[195] = arg196;
      j.args[196] = arg197;j.args[197] = arg198;j.args[198] = arg199;j.args[199] = arg200;
      j.args[200] = arg201;j.args[201] = arg202;j.args[202] = arg203;j.args[203] = arg204;
      j.args[204] = arg205;j.args[205] = arg206;j.args[206] = arg207;j.args[207] = arg208;
      j.args[208] = arg209;j.args[209] = arg210;j.args[210] = arg211;j.args[211] = arg212;
      j.args[212] = arg213;j.args[213] = arg214;j.args[214] = arg215;j.args[215] = arg216;
      j.args[216] = arg217;j.args[217] = arg218;j.args[218] = arg219;j.args[219] = arg220;
      j.args[220] = arg221;j.args[221] = arg222;j.args[222] = arg223;j.args[223] = arg224;
      j.args[224] = arg225;j.args[225] = arg226;j.args[226] = arg227;j.args[227] = arg228;
      j.args[228] = arg229;j.args[229] = arg230;j.args[230] = arg231;j.args[231] = arg232;
      j.args[232] = arg233;j.args[233] = arg234;j.args[234] = arg235;j.args[235] = arg236;
      j.args[236] = arg237;j.args[237] = arg238;j.args[238] = arg239;j.args[239] = arg240;
      j.args[240] = arg241;j.args[241] = arg242;j.args[242] = arg243;j.args[243] = arg244;
      j.args[244] = arg245;j.args[245] = arg246;j.args[246] = arg247;j.args[247] = arg248;
      j.args[248] = arg249;j.args[249] = arg250;j.args[250] = arg251;j.args[251] = arg252;
      j.args[252] = arg253;j.args[253] = arg254;j.args[254] = arg255;j.args[255] = arg256;
      j.args[256] = arg257;j.args[257] = arg258;j.args[258] = arg259;j.args[259] = arg260;
      j.args[260] = arg261;j.args[261] = arg262;j.args[262] = arg263;j.args[263] = arg264;
      j.args[264] = arg265;j.args[265] = arg266;j.args[266] = arg267;j.args[267] = arg268;
      j.args[268] = arg269;j.args[269] = arg270;j.args[270] = arg271;j.args[271] = arg272;
      j.args[272] = arg273;j.args[273] = arg274;j.args[274] = arg275;j.args[275] = arg276;
      j.args[276] = arg277;j.args[277] = arg278;j.args[278] = arg279;j.args[279] = arg280;
      j.args[280] = arg281;j.args[281] = arg282;j.args[282] = arg283;j.args[283] = arg284;
      j.args[284] = arg285;j.args[285] = arg286;j.args[286] = arg287;j.args[287] = arg288;
      j.args[288] = arg289;j.args[289] = arg290;j.args[290] = arg291;j.args[291] = arg292;
      j.args[292] = arg293;j.args[293] = arg294;j.args[294] = arg295;j.args[295] = arg296;
      j.args[296] = arg297;j.args[297] = arg298;j.args[298] = arg299;j.args[299] = arg300;
      j.args[300] = arg301;j.args[301] = arg302;j.args[302] = arg303;j.args[303] = arg304;
      j.args[304] = arg305;j.args[305] = arg306;j.args[306] = arg307;j.args[307] = arg308;
      j.args[308] = arg309;j.args[309] = arg310;j.args[310] = arg311;j.args[311] = arg312;
      j.args[312] = arg313;j.args[313] = arg314;j.args[314] = arg315;j.args[315] = arg316;
      j.args[316] = arg317;j.args[317] = arg318;j.args[318] = arg319;j.args[319] = arg320;
      j.args[320] = arg321;j.args[321] = arg322;j.args[322] = arg323;j.args[323] = arg324;
      j.args[324] = arg325;j.args[325] = arg326;j.args[326] = arg327;j.args[327] = arg328;
      j.args[328] = arg329;j.args[329] = arg330;j.args[330] = arg331;j.args[331] = arg332;
      j.args[332] = arg333;j.args[333] = arg334;j.args[334] = arg335;j.args[335] = arg336;
      j.args[336] = arg337;j.args[337] = arg338;j.args[338] = arg339;j.args[339] = arg340;
      j.args[340] = arg341;j.args[341] = arg342;j.args[342] = arg343;j.args[343] = arg344;
      j.args[344] = arg345;j.args[345] = arg346;j.args[346] = arg347;j.args[347] = arg348;
      j.args[348] = arg349;j.args[349] = arg350;j.args[350] = arg351;j.args[351] = arg352;
      j.args[352] = arg353;j.args[353] = arg354;j.args[354] = arg355;j.args[355] = arg356;
      j.args[356] = arg357;j.args[357] = arg358;j.args[358] = arg359;j.args[359] = arg360;
      j.args[360] = arg361;j.args[361] = arg362;j.args[362] = arg363;j.args[363] = arg364;
      j.args[364] = arg365;j.args[365] = arg366;j.args[366] = arg367;j.args[367] = arg368;
      j.args[368] = arg369;j.args[369] = arg370;j.args[370] = arg371;j.args[371] = arg372;
      j.args[372] = arg373;j.args[373] = arg374;j.args[374] = arg375;j.args[375] = arg376;
      j.args[376] = arg377;j.args[377] = arg378;j.args[378] = arg379;j.args[379] = arg380;
      j.args[380] = arg381;j.args[381] = arg382;j.args[382] = arg383;j.args[383] = arg384;
      j.args[384] = arg385;j.args[385] = arg386;j.args[386] = arg387;j.args[387] = arg388;
      j.args[388] = arg389;j.args[389] = arg390;j.args[390] = arg391;j.args[391] = arg392;
      j.args[392] = arg393;j.args[393] = arg394;j.args[394] = arg395;j.args[395] = arg396;
      j.args[396] = arg397;j.args[397] = arg398;j.args[398] = arg399;j.args[399] = arg400;
      j.args[400] = arg401;j.args[401] = arg402;j.args[402] = arg403;j.args[403] = arg404;
      j.args[404] = arg405;j.args[405] = arg406;j.args[406] = arg407;j.args[407] = arg408;
      j.args[408] = arg409;j.args[409] = arg410;j.args[410] = arg411;j.args[411] = arg412;
      j.args[412] = arg413;j.args[413] = arg414;j.args[414] = arg415;j.args[415] = arg416;
      j.args[416] = arg417;j.args[417] = arg418;j.args[418] = arg419;j.args[419] = arg420;
      j.args[420] = arg421;j.args[421] = arg422;j.args[422] = arg423;j.args[423] = arg424;
      j.args[424] = arg425;j.args[425] = arg426;j.args[426] = arg427;j.args[427] = arg428;
      j.args[428] = arg429;j.args[429] = arg430;j.args[430] = arg431;j.args[431] = arg432;
      j.args[432] = arg433;j.args[433] = arg434;j.args[434] = arg435;j.args[435] = arg436;
      j.args[436] = arg437;j.args[437] = arg438;j.args[438] = arg439;j.args[439] = arg440;
      j.args[440] = arg441;j.args[441] = arg442;j.args[442] = arg443;j.args[443] = arg444;
      j.args[444] = arg445;j.args[445] = arg446;j.args[446] = arg447;j.args[447] = arg448;
      j.args[448] = arg449;j.args[449] = arg450;j.args[450] = arg451;j.args[451] = arg452;
      j.args[452] = arg453;j.args[453] = arg454;j.args[454] = arg455;j.args[455] = arg456;
      j.args[456] = arg457;j.args[457] = arg458;j.args[458] = arg459;j.args[459] = arg460;
      j.args[460] = arg461;j.args[461] = arg462;j.args[462] = arg463;j.args[463] = arg464;
      j.args[464] = arg465;j.args[465] = arg466;j.args[466] = arg467;j.args[467] = arg468;
      j.args[468] = arg469;j.args[469] = arg470;j.args[470] = arg471;j.args[471] = arg472;
      j.args[472] = arg473;j.args[473] = arg474;j.args[474] = arg475;j.args[475] = arg476;
      j.args[476] = arg477;j.args[477] = arg478;j.args[478] = arg479;j.args[479] = arg480;
      j.args[480] = arg481;j.args[481] = arg482;j.args[482] = arg483;j.args[483] = arg484;
      j.args[484] = arg485;j.args[485] = arg486;j.args[486] = arg487;j.args[487] = arg488;
      j.args[488] = arg489;j.args[489] = arg490;j.args[490] = arg491;j.args[491] = arg492;
      j.args[492] = arg493;j.args[493] = arg494;j.args[494] = arg495;j.args[495] = arg496;
      j.args[496] = arg497;j.args[497] = arg498;j.args[498] = arg499;j.args[499] = arg500;
      j.args[500] = arg501;j.args[501] = arg502;j.args[502] = arg503;j.args[503] = arg504;
      j.args[504] = arg505;j.args[505] = arg506;j.args[506] = arg507;j.args[507] = arg508;
      j.args[508] = arg509;j.args[509] = arg510;
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

// void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *,
//                                           void *, void *, void *, void *, void *,
//                                           void *, void *, void *, void *, void *,
//                                           void *, void *, void *, void *, void *,
//                                           void *, void *, void *, void *, void *,
//                                           void *, void *, void *, void *, void *,
//                                           void *, void *),
//            void *arg1, void *arg2, void *arg3, void *arg4, void *arg5,
//            void *arg6, void *arg7, void *arg8, void *arg9, void *arg10,
//            void *arg11, void *arg12, void *arg13, void *arg14, void *arg15,
//            void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
//            void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, 
//            void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
//            void *arg31, void *arg32) {
//   unsigned jobID = tp.assignJob32(32u, arg1, arg2, arg3, arg4, arg5, arg6, arg7,
//                                 arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
//                                 arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23,
//                                 arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, (void (*)(void))f);
//   if (!updateJobID(task, jobID)) {
//     f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14,
//     arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27,
//     arg28, arg29, arg30, arg31, arg32);
//   } else {
//     // 
//   }
// }

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

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48) {
  unsigned jobID = tp.assignJob48(48u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60) {
  unsigned jobID = tp.assignJob60(60u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
                       arg56, arg57, arg58, arg59, arg60, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
      arg56, arg57, arg58, arg59, arg60);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73) {
  unsigned jobID = tp.assignJob73(73u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
                       arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
      arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85) {
  unsigned jobID = tp.assignJob85(85u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
                       arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75,
                       arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
      arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75,
      arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90) {
  unsigned jobID = tp.assignJob90(90u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
                       arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75,
                       arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
                       arg86, arg87, arg88, arg89, arg90, (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55,
      arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75,
      arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100) {
  unsigned jobID = tp.assignJob100(100u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117) {
  unsigned jobID = tp.assignJob117(117u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130) {
  unsigned jobID = tp.assignJob130(130u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205) {
  unsigned jobID = tp.assignJob205(205u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
                       arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
                       arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
      arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
      arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
      arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
      arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
      arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217) {
  unsigned jobID = tp.assignJob217(217u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
                       arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
                       arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
                       arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
      arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
      arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
      arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
      arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
      arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
      arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226) {
  unsigned jobID = tp.assignJob226(226u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
                       arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
                       arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
                       arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
      arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
      arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
      arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
      arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
      arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
      arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
      arg221, arg222, arg223, arg224, arg225, arg226);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229) {
  unsigned jobID = tp.assignJob229(229u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
                                arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
                                arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
                       arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
                       arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85, 
                       arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
                       arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
                       arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
                       arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
                       arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15,
      arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, 
      arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45,
      arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61, arg62, arg63, arg64, arg65,
      arg66, arg67, arg68, arg69, arg70, arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80, arg81, arg82, arg83, arg84, arg85,
      arg86, arg87, arg88, arg89, arg90, arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
      arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, arg111, arg112, arg113, arg114, arg115, 
      arg116, arg117, arg118, arg119, arg120, arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
      arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140, arg141, arg142, arg143, arg144, arg145,
      arg146, arg147, arg148, arg149, arg150, arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
      arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170, arg171, arg172, arg173, arg174, arg175,
      arg176, arg177, arg178, arg179, arg180, arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
      arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, arg201, arg202, arg203, arg204, arg205,
      arg206, arg207, arg208, arg209, arg210, arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
      arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

// 469
void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469) {
  unsigned jobID = tp.assignJob469(469u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, 
                       arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, 
                       arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, 
                       arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40,
                       arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50,
                       arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60,
                       arg61, arg62, arg63, arg64, arg65, arg66, arg67, arg68, arg69, arg70,
                       arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80,
                       arg81, arg82, arg83, arg84, arg85, arg86, arg87, arg88, arg89, arg90,
                       arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, 
                       arg111, arg112, arg113, arg114, arg115, arg116, arg117, arg118, arg119, arg120, 
                       arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140,
                       arg141, arg142, arg143, arg144, arg145, arg146, arg147, arg148, arg149, arg150,
                       arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170,
                       arg171, arg172, arg173, arg174, arg175, arg176, arg177, arg178, arg179, arg180,
                       arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, 
                       arg201, arg202, arg203, arg204, arg205, arg206, arg207, arg208, arg209, arg210, 
                       arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229, arg230, 
                       arg231, arg232, arg233, arg234, arg235, arg236, arg237, arg238, arg239, arg240, 
                       arg241, arg242, arg243, arg244, arg245, arg246, arg247, arg248, arg249, arg250, 
                       arg251, arg252, arg253, arg254, arg255, arg256, arg257, arg258, arg259, arg260, 
                       arg261, arg262, arg263, arg264, arg265, arg266, arg267, arg268, arg269, arg270,
                       arg271, arg272, arg273, arg274, arg275, arg276, arg277, arg278, arg279, arg280,
                       arg281, arg282, arg283, arg284, arg285, arg286, arg287, arg288, arg289, arg290,
                       arg291, arg292, arg293, arg294, arg295, arg296, arg297, arg298, arg299, arg300,
                       arg301, arg302, arg303, arg304, arg305, arg306, arg307, arg308, arg309, arg310,
                       arg311, arg312, arg313, arg314, arg315, arg316, arg317, arg318, arg319, arg320,
                       arg321, arg322, arg323, arg324, arg325, arg326, arg327, arg328, arg329, arg330, 
                       arg331, arg332, arg333, arg334, arg335, arg336, arg337, arg338, arg339, arg340, 
                       arg341, arg342, arg343, arg344, arg345, arg346, arg347, arg348, arg349, arg350, 
                       arg351, arg352, arg353, arg354, arg355, arg356, arg357, arg358, arg359, arg360, 
                       arg361, arg362, arg363, arg364, arg365, arg366, arg367, arg368, arg369, arg370,
                       arg371, arg372, arg373, arg374, arg375, arg376, arg377, arg378, arg379, arg380,
                       arg381, arg382, arg383, arg384, arg385, arg386, arg387, arg388, arg389, arg390,
                       arg391, arg392, arg393, arg394, arg395, arg396, arg397, arg398, arg399, arg400,
                       arg401, arg402, arg403, arg404, arg405, arg406, arg407, arg408, arg409, arg410,
                       arg411, arg412, arg413, arg414, arg415, arg416, arg417, arg418, arg419, arg420,
                       arg421, arg422, arg423, arg424, arg425, arg426, arg427, arg428, arg429, arg430, 
                       arg431, arg432, arg433, arg434, arg435, arg436, arg437, arg438, arg439, arg440, 
                       arg441, arg442, arg443, arg444, arg445, arg446, arg447, arg448, arg449, arg450, 
                       arg451, arg452, arg453, arg454, arg455, arg456, arg457, arg458, arg459, arg460,
                       arg461, arg462, arg463, arg464, arg465, arg466, arg467, arg468, arg469,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, 
                       arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, 
                       arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, 
                       arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40,
                       arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50,
                       arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60,
                       arg61, arg62, arg63, arg64, arg65, arg66, arg67, arg68, arg69, arg70,
                       arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80,
                       arg81, arg82, arg83, arg84, arg85, arg86, arg87, arg88, arg89, arg90,
                       arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, 
                       arg111, arg112, arg113, arg114, arg115, arg116, arg117, arg118, arg119, arg120, 
                       arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140,
                       arg141, arg142, arg143, arg144, arg145, arg146, arg147, arg148, arg149, arg150,
                       arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170,
                       arg171, arg172, arg173, arg174, arg175, arg176, arg177, arg178, arg179, arg180,
                       arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, 
                       arg201, arg202, arg203, arg204, arg205, arg206, arg207, arg208, arg209, arg210, 
                       arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229, arg230, 
                       arg231, arg232, arg233, arg234, arg235, arg236, arg237, arg238, arg239, arg240, 
                       arg241, arg242, arg243, arg244, arg245, arg246, arg247, arg248, arg249, arg250, 
                       arg251, arg252, arg253, arg254, arg255, arg256, arg257, arg258, arg259, arg260, 
                       arg261, arg262, arg263, arg264, arg265, arg266, arg267, arg268, arg269, arg270,
                       arg271, arg272, arg273, arg274, arg275, arg276, arg277, arg278, arg279, arg280,
                       arg281, arg282, arg283, arg284, arg285, arg286, arg287, arg288, arg289, arg290,
                       arg291, arg292, arg293, arg294, arg295, arg296, arg297, arg298, arg299, arg300,
                       arg301, arg302, arg303, arg304, arg305, arg306, arg307, arg308, arg309, arg310,
                       arg311, arg312, arg313, arg314, arg315, arg316, arg317, arg318, arg319, arg320,
                       arg321, arg322, arg323, arg324, arg325, arg326, arg327, arg328, arg329, arg330, 
                       arg331, arg332, arg333, arg334, arg335, arg336, arg337, arg338, arg339, arg340, 
                       arg341, arg342, arg343, arg344, arg345, arg346, arg347, arg348, arg349, arg350, 
                       arg351, arg352, arg353, arg354, arg355, arg356, arg357, arg358, arg359, arg360, 
                       arg361, arg362, arg363, arg364, arg365, arg366, arg367, arg368, arg369, arg370,
                       arg371, arg372, arg373, arg374, arg375, arg376, arg377, arg378, arg379, arg380,
                       arg381, arg382, arg383, arg384, arg385, arg386, arg387, arg388, arg389, arg390,
                       arg391, arg392, arg393, arg394, arg395, arg396, arg397, arg398, arg399, arg400,
                       arg401, arg402, arg403, arg404, arg405, arg406, arg407, arg408, arg409, arg410,
                       arg411, arg412, arg413, arg414, arg415, arg416, arg417, arg418, arg419, arg420,
                       arg421, arg422, arg423, arg424, arg425, arg426, arg427, arg428, arg429, arg430, 
                       arg431, arg432, arg433, arg434, arg435, arg436, arg437, arg438, arg439, arg440, 
                       arg441, arg442, arg443, arg444, arg445, arg446, arg447, arg448, arg449, arg450, 
                       arg451, arg452, arg453, arg454, arg455, arg456, arg457, arg458, arg459, arg460,
                       arg461, arg462, arg463, arg464, arg465, arg466, arg467, arg468, arg469);
  } else {
    // 
    // cerr << "---in spawn 331\n";
  }
}

// 510
void spawn(const unsigned task, void (*f)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *,
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, 
                       void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *), 
                       void *arg1, void *arg2, void *arg3, void *arg4, void *arg5, void *arg6, void *arg7, void *arg8, void *arg9, void *arg10, 
                       void *arg11, void *arg12, void *arg13, void *arg14, void *arg15, void *arg16, void *arg17, void *arg18, void *arg19, void *arg20, 
                       void *arg21, void *arg22, void *arg23, void *arg24, void *arg25, void *arg26, void *arg27, void *arg28, void *arg29, void *arg30, 
                       void *arg31, void *arg32, void *arg33, void *arg34, void *arg35, void *arg36, void *arg37, void *arg38, void *arg39, void *arg40,
                       void *arg41, void *arg42, void *arg43, void *arg44, void *arg45, void *arg46, void *arg47, void *arg48, void *arg49, void *arg50,
                       void *arg51, void *arg52, void *arg53, void *arg54, void *arg55, void *arg56, void *arg57, void *arg58, void *arg59, void *arg60,
                       void *arg61, void *arg62, void *arg63, void *arg64, void *arg65, void *arg66, void *arg67, void *arg68, void *arg69, void *arg70,
                       void *arg71, void *arg72, void *arg73, void *arg74, void *arg75, void *arg76, void *arg77, void *arg78, void *arg79, void *arg80,
                       void *arg81, void *arg82, void *arg83, void *arg84, void *arg85, void *arg86, void *arg87, void *arg88, void *arg89, void *arg90,
                       void *arg91, void *arg92, void *arg93, void *arg94, void *arg95, void *arg96, void *arg97, void *arg98, void *arg99, void *arg100, 
                       void *arg101, void *arg102, void *arg103, void *arg104, void *arg105, void *arg106, void *arg107, void *arg108, void *arg109, void *arg110, 
                       void *arg111, void *arg112, void *arg113, void *arg114, void *arg115, void *arg116, void *arg117, void *arg118, void *arg119, void *arg120, 
                       void *arg121, void *arg122, void *arg123, void *arg124, void *arg125, void *arg126, void *arg127, void *arg128, void *arg129, void *arg130, 
                       void *arg131, void *arg132, void *arg133, void *arg134, void *arg135, void *arg136, void *arg137, void *arg138, void *arg139, void *arg140,
                       void *arg141, void *arg142, void *arg143, void *arg144, void *arg145, void *arg146, void *arg147, void *arg148, void *arg149, void *arg150,
                       void *arg151, void *arg152, void *arg153, void *arg154, void *arg155, void *arg156, void *arg157, void *arg158, void *arg159, void *arg160,
                       void *arg161, void *arg162, void *arg163, void *arg164, void *arg165, void *arg166, void *arg167, void *arg168, void *arg169, void *arg170,
                       void *arg171, void *arg172, void *arg173, void *arg174, void *arg175, void *arg176, void *arg177, void *arg178, void *arg179, void *arg180,
                       void *arg181, void *arg182, void *arg183, void *arg184, void *arg185, void *arg186, void *arg187, void *arg188, void *arg189, void *arg190,
                       void *arg191, void *arg192, void *arg193, void *arg194, void *arg195, void *arg196, void *arg197, void *arg198, void *arg199, void *arg200, 
                       void *arg201, void *arg202, void *arg203, void *arg204, void *arg205, void *arg206, void *arg207, void *arg208, void *arg209, void *arg210, 
                       void *arg211, void *arg212, void *arg213, void *arg214, void *arg215, void *arg216, void *arg217, void *arg218, void *arg219, void *arg220, 
                       void *arg221, void *arg222, void *arg223, void *arg224, void *arg225, void *arg226, void *arg227, void *arg228, void *arg229, void *arg230, 
                       void *arg231, void *arg232, void *arg233, void *arg234, void *arg235, void *arg236, void *arg237, void *arg238, void *arg239, void *arg240, 
                       void *arg241, void *arg242, void *arg243, void *arg244, void *arg245, void *arg246, void *arg247, void *arg248, void *arg249, void *arg250, 
                       void *arg251, void *arg252, void *arg253, void *arg254, void *arg255, void *arg256, void *arg257, void *arg258, void *arg259, void *arg260, 
                       void *arg261, void *arg262, void *arg263, void *arg264, void *arg265, void *arg266, void *arg267, void *arg268, void *arg269, void *arg270,
                       void *arg271, void *arg272, void *arg273, void *arg274, void *arg275, void *arg276, void *arg277, void *arg278, void *arg279, void *arg280,
                       void *arg281, void *arg282, void *arg283, void *arg284, void *arg285, void *arg286, void *arg287, void *arg288, void *arg289, void *arg290,
                       void *arg291, void *arg292, void *arg293, void *arg294, void *arg295, void *arg296, void *arg297, void *arg298, void *arg299, void *arg300,
                       void *arg301, void *arg302, void *arg303, void *arg304, void *arg305, void *arg306, void *arg307, void *arg308, void *arg309, void *arg310,
                       void *arg311, void *arg312, void *arg313, void *arg314, void *arg315, void *arg316, void *arg317, void *arg318, void *arg319, void *arg320,
                       void *arg321, void *arg322, void *arg323, void *arg324, void *arg325, void *arg326, void *arg327, void *arg328, void *arg329, void *arg330, 
                       void *arg331, void *arg332, void *arg333, void *arg334, void *arg335, void *arg336, void *arg337, void *arg338, void *arg339, void *arg340, 
                       void *arg341, void *arg342, void *arg343, void *arg344, void *arg345, void *arg346, void *arg347, void *arg348, void *arg349, void *arg350, 
                       void *arg351, void *arg352, void *arg353, void *arg354, void *arg355, void *arg356, void *arg357, void *arg358, void *arg359, void *arg360, 
                       void *arg361, void *arg362, void *arg363, void *arg364, void *arg365, void *arg366, void *arg367, void *arg368, void *arg369, void *arg370,
                       void *arg371, void *arg372, void *arg373, void *arg374, void *arg375, void *arg376, void *arg377, void *arg378, void *arg379, void *arg380,
                       void *arg381, void *arg382, void *arg383, void *arg384, void *arg385, void *arg386, void *arg387, void *arg388, void *arg389, void *arg390,
                       void *arg391, void *arg392, void *arg393, void *arg394, void *arg395, void *arg396, void *arg397, void *arg398, void *arg399, void *arg400,
                       void *arg401, void *arg402, void *arg403, void *arg404, void *arg405, void *arg406, void *arg407, void *arg408, void *arg409, void *arg410,
                       void *arg411, void *arg412, void *arg413, void *arg414, void *arg415, void *arg416, void *arg417, void *arg418, void *arg419, void *arg420,
                       void *arg421, void *arg422, void *arg423, void *arg424, void *arg425, void *arg426, void *arg427, void *arg428, void *arg429, void *arg430, 
                       void *arg431, void *arg432, void *arg433, void *arg434, void *arg435, void *arg436, void *arg437, void *arg438, void *arg439, void *arg440, 
                       void *arg441, void *arg442, void *arg443, void *arg444, void *arg445, void *arg446, void *arg447, void *arg448, void *arg449, void *arg450, 
                       void *arg451, void *arg452, void *arg453, void *arg454, void *arg455, void *arg456, void *arg457, void *arg458, void *arg459, void *arg460,
                       void *arg461, void *arg462, void *arg463, void *arg464, void *arg465, void *arg466, void *arg467, void *arg468, void *arg469, void *arg470,
                       void *arg471, void *arg472, void *arg473, void *arg474, void *arg475, void *arg476, void *arg477, void *arg478, void *arg479, void *arg480,
                       void *arg481, void *arg482, void *arg483, void *arg484, void *arg485, void *arg486, void *arg487, void *arg488, void *arg489, void *arg490,
                       void *arg491, void *arg492, void *arg493, void *arg494, void *arg495, void *arg496, void *arg497, void *arg498, void *arg499, void *arg500, 
                       void *arg501, void *arg502, void *arg503, void *arg504, void *arg505, void *arg506, void *arg507, void *arg508, void *arg509, void *arg510
                       ) {
  unsigned jobID = tp.assignJob510(510u, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, 
                       arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, 
                       arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, 
                       arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40,
                       arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50,
                       arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60,
                       arg61, arg62, arg63, arg64, arg65, arg66, arg67, arg68, arg69, arg70,
                       arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80,
                       arg81, arg82, arg83, arg84, arg85, arg86, arg87, arg88, arg89, arg90,
                       arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, 
                       arg111, arg112, arg113, arg114, arg115, arg116, arg117, arg118, arg119, arg120, 
                       arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140,
                       arg141, arg142, arg143, arg144, arg145, arg146, arg147, arg148, arg149, arg150,
                       arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170,
                       arg171, arg172, arg173, arg174, arg175, arg176, arg177, arg178, arg179, arg180,
                       arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, 
                       arg201, arg202, arg203, arg204, arg205, arg206, arg207, arg208, arg209, arg210, 
                       arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229, arg230, 
                       arg231, arg232, arg233, arg234, arg235, arg236, arg237, arg238, arg239, arg240, 
                       arg241, arg242, arg243, arg244, arg245, arg246, arg247, arg248, arg249, arg250, 
                       arg251, arg252, arg253, arg254, arg255, arg256, arg257, arg258, arg259, arg260, 
                       arg261, arg262, arg263, arg264, arg265, arg266, arg267, arg268, arg269, arg270,
                       arg271, arg272, arg273, arg274, arg275, arg276, arg277, arg278, arg279, arg280,
                       arg281, arg282, arg283, arg284, arg285, arg286, arg287, arg288, arg289, arg290,
                       arg291, arg292, arg293, arg294, arg295, arg296, arg297, arg298, arg299, arg300,
                       arg301, arg302, arg303, arg304, arg305, arg306, arg307, arg308, arg309, arg310,
                       arg311, arg312, arg313, arg314, arg315, arg316, arg317, arg318, arg319, arg320,
                       arg321, arg322, arg323, arg324, arg325, arg326, arg327, arg328, arg329, arg330, 
                       arg331, arg332, arg333, arg334, arg335, arg336, arg337, arg338, arg339, arg340, 
                       arg341, arg342, arg343, arg344, arg345, arg346, arg347, arg348, arg349, arg350, 
                       arg351, arg352, arg353, arg354, arg355, arg356, arg357, arg358, arg359, arg360, 
                       arg361, arg362, arg363, arg364, arg365, arg366, arg367, arg368, arg369, arg370,
                       arg371, arg372, arg373, arg374, arg375, arg376, arg377, arg378, arg379, arg380,
                       arg381, arg382, arg383, arg384, arg385, arg386, arg387, arg388, arg389, arg390,
                       arg391, arg392, arg393, arg394, arg395, arg396, arg397, arg398, arg399, arg400,
                       arg401, arg402, arg403, arg404, arg405, arg406, arg407, arg408, arg409, arg410,
                       arg411, arg412, arg413, arg414, arg415, arg416, arg417, arg418, arg419, arg420,
                       arg421, arg422, arg423, arg424, arg425, arg426, arg427, arg428, arg429, arg430, 
                       arg431, arg432, arg433, arg434, arg435, arg436, arg437, arg438, arg439, arg440, 
                       arg441, arg442, arg443, arg444, arg445, arg446, arg447, arg448, arg449, arg450, 
                       arg451, arg452, arg453, arg454, arg455, arg456, arg457, arg458, arg459, arg460,
                       arg461, arg462, arg463, arg464, arg465, arg466, arg467, arg468, arg469, arg470,
                       arg471, arg472, arg473, arg474, arg475, arg476, arg477, arg478, arg479, arg480,
                       arg481, arg482, arg483, arg484, arg485, arg486, arg487, arg488, arg489, arg490,
                       arg491, arg492, arg493, arg494, arg495, arg496, arg497, arg498, arg499, arg500, 
                       arg501, arg502, arg503, arg504, arg505, arg506, arg507, arg508, arg509, arg510,
                       (void (*)(void))f);
  if (!updateJobID(task, jobID)) {
    // cerr << "---in spawn 33\n";
    f(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, 
                       arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, 
                       arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, 
                       arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40,
                       arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50,
                       arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60,
                       arg61, arg62, arg63, arg64, arg65, arg66, arg67, arg68, arg69, arg70,
                       arg71, arg72, arg73, arg74, arg75, arg76, arg77, arg78, arg79, arg80,
                       arg81, arg82, arg83, arg84, arg85, arg86, arg87, arg88, arg89, arg90,
                       arg91, arg92, arg93, arg94, arg95, arg96, arg97, arg98, arg99, arg100, 
                       arg101, arg102, arg103, arg104, arg105, arg106, arg107, arg108, arg109, arg110, 
                       arg111, arg112, arg113, arg114, arg115, arg116, arg117, arg118, arg119, arg120, 
                       arg121, arg122, arg123, arg124, arg125, arg126, arg127, arg128, arg129, arg130, 
                       arg131, arg132, arg133, arg134, arg135, arg136, arg137, arg138, arg139, arg140,
                       arg141, arg142, arg143, arg144, arg145, arg146, arg147, arg148, arg149, arg150,
                       arg151, arg152, arg153, arg154, arg155, arg156, arg157, arg158, arg159, arg160,
                       arg161, arg162, arg163, arg164, arg165, arg166, arg167, arg168, arg169, arg170,
                       arg171, arg172, arg173, arg174, arg175, arg176, arg177, arg178, arg179, arg180,
                       arg181, arg182, arg183, arg184, arg185, arg186, arg187, arg188, arg189, arg190,
                       arg191, arg192, arg193, arg194, arg195, arg196, arg197, arg198, arg199, arg200, 
                       arg201, arg202, arg203, arg204, arg205, arg206, arg207, arg208, arg209, arg210, 
                       arg211, arg212, arg213, arg214, arg215, arg216, arg217, arg218, arg219, arg220, 
                       arg221, arg222, arg223, arg224, arg225, arg226, arg227, arg228, arg229, arg230, 
                       arg231, arg232, arg233, arg234, arg235, arg236, arg237, arg238, arg239, arg240, 
                       arg241, arg242, arg243, arg244, arg245, arg246, arg247, arg248, arg249, arg250, 
                       arg251, arg252, arg253, arg254, arg255, arg256, arg257, arg258, arg259, arg260, 
                       arg261, arg262, arg263, arg264, arg265, arg266, arg267, arg268, arg269, arg270,
                       arg271, arg272, arg273, arg274, arg275, arg276, arg277, arg278, arg279, arg280,
                       arg281, arg282, arg283, arg284, arg285, arg286, arg287, arg288, arg289, arg290,
                       arg291, arg292, arg293, arg294, arg295, arg296, arg297, arg298, arg299, arg300,
                       arg301, arg302, arg303, arg304, arg305, arg306, arg307, arg308, arg309, arg310,
                       arg311, arg312, arg313, arg314, arg315, arg316, arg317, arg318, arg319, arg320,
                       arg321, arg322, arg323, arg324, arg325, arg326, arg327, arg328, arg329, arg330, 
                       arg331, arg332, arg333, arg334, arg335, arg336, arg337, arg338, arg339, arg340, 
                       arg341, arg342, arg343, arg344, arg345, arg346, arg347, arg348, arg349, arg350, 
                       arg351, arg352, arg353, arg354, arg355, arg356, arg357, arg358, arg359, arg360, 
                       arg361, arg362, arg363, arg364, arg365, arg366, arg367, arg368, arg369, arg370,
                       arg371, arg372, arg373, arg374, arg375, arg376, arg377, arg378, arg379, arg380,
                       arg381, arg382, arg383, arg384, arg385, arg386, arg387, arg388, arg389, arg390,
                       arg391, arg392, arg393, arg394, arg395, arg396, arg397, arg398, arg399, arg400,
                       arg401, arg402, arg403, arg404, arg405, arg406, arg407, arg408, arg409, arg410,
                       arg411, arg412, arg413, arg414, arg415, arg416, arg417, arg418, arg419, arg420,
                       arg421, arg422, arg423, arg424, arg425, arg426, arg427, arg428, arg429, arg430, 
                       arg431, arg432, arg433, arg434, arg435, arg436, arg437, arg438, arg439, arg440, 
                       arg441, arg442, arg443, arg444, arg445, arg446, arg447, arg448, arg449, arg450, 
                       arg451, arg452, arg453, arg454, arg455, arg456, arg457, arg458, arg459, arg460,
                       arg461, arg462, arg463, arg464, arg465, arg466, arg467, arg468, arg469, arg470,
                       arg471, arg472, arg473, arg474, arg475, arg476, arg477, arg478, arg479, arg480,
                       arg481, arg482, arg483, arg484, arg485, arg486, arg487, arg488, arg489, arg490,
                       arg491, arg492, arg493, arg494, arg495, arg496, arg497, arg498, arg499, arg500, 
                       arg501, arg502, arg503, arg504, arg505, arg506, arg507, arg508, arg509, arg510);
  } else {
    // 
    // cerr << "---in spawn 331\n";
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
