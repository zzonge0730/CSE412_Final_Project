#include <stddef.h>
#include <stdint.h>

void __asan_load1(void *p) {}
void __asan_load2(void *p) {}
void __asan_load4(void *p) {}
void __asan_load8(void *p) {}
void __asan_load16(void *p) {}
void __asan_loadN(void *p, size_t n) {}

void __asan_store1(void *p) {}
void __asan_store2(void *p) {}
void __asan_store4(void *p) {}
void __asan_store8(void *p) {}
void __asan_store16(void *p) {}
void __asan_storeN(void *p, size_t n) {}

void __asan_handle_no_return() {}
void __asan_report_load1(uint64_t p) {}
void __asan_report_load2(uint64_t p) {}
void __asan_report_load4(uint64_t p) {}
void __asan_report_load8(uint64_t p) {}
void __asan_report_load16(uint64_t p) {}
void __asan_report_load_n(uint64_t p, size_t n) {}

void __asan_report_store1(uint64_t p) {}
void __asan_report_store2(uint64_t p) {}
void __asan_report_store4(uint64_t p) {}
void __asan_report_store8(uint64_t p) {}
void __asan_report_store16(uint64_t p) {}
void __asan_report_store_n(uint64_t p, size_t n) {}

void __asan_register_globals(void *globals, size_t n) {}
void __asan_unregister_globals(void *globals, size_t n) {}
void __asan_version_mismatch_check_v8() {}
void __asan_init() {}

// LLVM 17 additions
void __asan_register_elf_globals(void *flag, void *start, void *stop) {}
void __asan_unregister_elf_globals(void *flag, void *start, void *stop) {}
