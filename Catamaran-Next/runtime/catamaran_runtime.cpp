#include <thread>
#include <iostream>
#include <functional>
#include <chrono>

extern "C" {

// 1. i32 arg
void __catamaran_async_run_i32(void (*func)(int), int arg) {
    // std::cout << "[Runtime] Spawning thread for func " << (void*)func << " with arg " << arg << std::endl;
    std::thread t([func, arg]() {
        // std::cout << "[Thread " << std::this_thread::get_id() << "] Starting task (i32)..." << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
        func(arg);
    });
    t.detach();
}

// 2. void*, void*, void* args
void __catamaran_async_run_ppp(void (*func)(void*, void*, void*), void* a, void* b, void* c) {
    // std::cout << "[Runtime] Spawning thread for func " << (void*)func << " (ppp)" << std::endl;
    std::thread t([func, a, b, c]() {
        // std::cout << "[Thread " << std::this_thread::get_id() << "] Starting task (ppp)..." << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
        func(a, b, c);
    });
    t.detach();
}

// Test functions
void catamaran_meta_check(int val) {
    std::cout << "[Metadata] Check i32: " << val << " (Thread ID: " << std::this_thread::get_id() << ")" << std::endl;
}

void catamaran_meta_check_ppp(void* a, void* b, void* c) {
    std::cout << "[Metadata] Check ppp: " << a << ", " << b << ", " << c << " (Thread ID: " << std::this_thread::get_id() << ")" << std::endl;
}

}
