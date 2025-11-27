#!/usr/bin/env python3
"""
Lightweight helper to measure short-running benchmarks with high precision.

Usage:
  ./scripts/measure_precise.py --runs 10 -- label ./binary arg1 arg2 ...

It prints per-run timings plus best/average at the end.
"""

import argparse
import subprocess
import time
from statistics import mean


def main() -> None:
  parser = argparse.ArgumentParser(description="Precise runtime sampler")
  parser.add_argument("--runs", type=int, default=10, help="Number of repetitions")
  parser.add_argument("label", help="Label to print alongside results")
  parser.add_argument("command", nargs=argparse.REMAINDER,
                      help="Command to execute (everything after label)")
  args = parser.parse_args()

  if not args.command:
    raise SystemExit("No command provided")

  times = []
  for i in range(1, args.runs + 1):
    start = time.perf_counter()
    subprocess.run(args.command, check=True)
    elapsed = time.perf_counter() - start
    times.append(elapsed)
    print(f"Run {i:02d}: {elapsed:.6f}s")

  print(f"\n[{args.label}] best={min(times):.6f}s avg={mean(times):.6f}s")


if __name__ == "__main__":
  main()

