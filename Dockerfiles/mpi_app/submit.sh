#!/bin/bash
# submit.sh

echo "running MPI app"
mpirun -np $3 ./pi
