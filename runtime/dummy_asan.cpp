#include <stdio.h>

// Dummy implementations for ASAN load/store checks
// These are needed because we are running ASAN instrumentation
// without the full ASAN runtime library to isolate the
// parallelization overhead/behavior.

extern "C" {

void __asan_load1(void *addr) { }
void __asan_load2(void *addr) { }
void __asan_load4(void *addr) { }
void __asan_load8(void *addr) { }
void __asan_load16(void *addr) { }
void __asan_loadN(void *addr, size_t size) { }

void __asan_store1(void *addr) { }
void __asan_store2(void *addr) { }
void __asan_store4(void *addr) { }
void __asan_store8(void *addr) { }
void __asan_store16(void *addr) { }
void __asan_storeN(void *addr, size_t size) { }

// Dummy implementations for ASAN report functions (if needed)
void __asan_report_load1(unsigned long addr) { }
void __asan_report_load2(unsigned long addr) { }
void __asan_report_load4(unsigned long addr) { }
void __asan_report_load8(unsigned long addr) { }
void __asan_report_load16(unsigned long addr) { }
void __asan_report_store1(unsigned long addr) { }
void __asan_report_store2(unsigned long addr) { }
void __asan_report_store4(unsigned long addr) { }
void __asan_report_store8(unsigned long addr) { }
void __asan_report_store16(unsigned long addr) { }

// Dummy implementations for ASAN global registration functions
void __asan_register_elf_globals(void *start, void *stop) { }
void __asan_unregister_elf_globals(void *start, void *stop) { }
void __asan_register_globals(void *start, size_t n) { }
void __asan_unregister_globals(void *start, size_t n) { }

// Other potential ASAN runtime functions
void __asan_init() { }
void __asan_version_mismatch_check_v8() { }

}

