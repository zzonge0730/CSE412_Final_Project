#ifndef LLVM_ADT_ITERATOR_RANGE_H
#define LLVM_ADT_ITERATOR_RANGE_H

#include <type_traits>

namespace llvm {

template <typename IteratorT>
class iterator_range {
  IteratorT BeginIter;
  IteratorT EndIter;

public:
  iterator_range(IteratorT Begin, IteratorT End)
      : BeginIter(Begin), EndIter(End) {}

  template <typename OtherIteratorT,
            typename = typename std::enable_if<
                std::is_convertible<OtherIteratorT, IteratorT>::value>::type>
  iterator_range(const iterator_range<OtherIteratorT> &Other)
      : BeginIter(Other.begin()), EndIter(Other.end()) {}

  IteratorT begin() const { return BeginIter; }
  IteratorT end() const { return EndIter; }
};

template <typename IteratorT>
iterator_range<IteratorT> make_range(IteratorT Begin, IteratorT End) {
  return iterator_range<IteratorT>(Begin, End);
}

template <typename Container>
iterator_range<typename Container::iterator> make_range(Container &C) {
  return iterator_range<typename Container::iterator>(C.begin(), C.end());
}

template <typename Container>
iterator_range<typename Container::const_iterator>
make_range(const Container &C) {
  return iterator_range<typename Container::const_iterator>(C.begin(),
                                                           C.end());
}

} // namespace llvm

#endif // LLVM_ADT_ITERATOR_RANGE_H

