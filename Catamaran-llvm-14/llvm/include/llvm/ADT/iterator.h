#ifndef LLVM_ADT_ITERATOR_H
#define LLVM_ADT_ITERATOR_H

#include <iterator>

namespace llvm {

/// \brief A minimal stand-in for the iterator facade class introduced after
/// LLVM 3.4.
///
/// This backports the small subset of the upstream API that  Catamaran's LLVM
/// fork expects: support for forward iterators that rely on CRTP to provide the
/// actual iteration primitives.
template <typename DerivedT, typename IteratorCategoryT, typename ValueT,
          typename DifferenceTypeT = std::ptrdiff_t, typename PointerT = ValueT *,
          typename ReferenceT = ValueT &>
class iterator_facade_base
    : public std::iterator<IteratorCategoryT, ValueT, DifferenceTypeT, PointerT,
                           ReferenceT> {
protected:
  DerivedT &derived() { return *static_cast<DerivedT *>(this); }
  const DerivedT &derived() const {
    return *static_cast<const DerivedT *>(this);
  }

public:
  ReferenceT operator*() const { return derived().operator*(); }
  PointerT operator->() const { return derived().operator->(); }

  DerivedT &operator++() {
    derived().operator++();
    return derived();
  }

  DerivedT operator++(int) {
    DerivedT Tmp = derived();
    ++(*this);
    return Tmp;
  }

  bool operator==(const DerivedT &RHS) const {
    return derived().operator==(RHS);
  }

  bool operator!=(const DerivedT &RHS) const { return !(*this == RHS); }
};

} // end namespace llvm

#endif // LLVM_ADT_ITERATOR_H


