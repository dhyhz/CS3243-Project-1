## Author: Andy Chan E0175610@u.nus.edu
## Edited by E0175538@u.nus.edu
import csv
from decimal import Decimal

DIMENSION = 0
HEURISTIC = 1
IS_SOLVABLE = 2
TIME_TAKEN = 3
PATH_COST = 4
NODES_VISITED = 5
UNIQUE_NODES_IN_QUEUE = 6
ALL_NODES_IN_QUEUE = 7

if __name__ == "__main__":

    BFS_counter = 0
    misplaced_counter = 0
    manhattan_counter = 0
    euclidean_counter = 0
    counter = 0


    # Time taken | Path Cost | Nodes Visited | No. of unique nodes in queue | No. of nodes in queue
    BFS_info = [0, 0, 0, 0, 0]
    misplaced_info = [0, 0, 0, 0, 0]
    manhattan_info = [0, 0, 0, 0, 0]
    euclidean_info = [0, 0, 0, 0, 0]

    #with open('n_3.tsv') as tsvfile:
    #with open('n_4.tsv') as tsvfile: #Select one
    #with open('n_5.tsv') as tsvfile:
        reader = csv.reader(tsvfile, delimiter='\t')
        for row in reader:
            if counter > 4500:
                break
            if row[IS_SOLVABLE]:
                if row[HEURISTIC] == "Manhattan_distance":
                    manhattan_counter += 1
                    manhattan_info[0] += Decimal(row[TIME_TAKEN])
                    manhattan_info[1] += Decimal(row[PATH_COST])
                    manhattan_info[2] += Decimal(row[NODES_VISITED])
                    manhattan_info[3] += Decimal(row[UNIQUE_NODES_IN_QUEUE])
                    manhattan_info[4] += Decimal(row[ALL_NODES_IN_QUEUE])
                elif row[HEURISTIC] == "Euclidean_distance":
                    euclidean_counter += 1
                    euclidean_info[0] += Decimal(row[TIME_TAKEN])
                    euclidean_info[1] += Decimal(row[PATH_COST])
                    euclidean_info[2] += Decimal(row[NODES_VISITED])
                    euclidean_info[3] += Decimal(row[UNIQUE_NODES_IN_QUEUE])
                    euclidean_info[4] += Decimal(row[ALL_NODES_IN_QUEUE])
                elif row[HEURISTIC] == "Misplaced_tiles":
                    misplaced_counter += 1
                    misplaced_info[0] += Decimal(row[TIME_TAKEN])
                    misplaced_info[1] += Decimal(row[PATH_COST])
                    misplaced_info[2] += Decimal(row[NODES_VISITED])
                    misplaced_info[3] += Decimal(row[UNIQUE_NODES_IN_QUEUE])
                    misplaced_info[4] += Decimal(row[ALL_NODES_IN_QUEUE])
                elif row[HEURISTIC] == "BFS":
                    BFS_counter += 1
                    BFS_info[0] += Decimal(row[TIME_TAKEN])
                    BFS_info[1] += Decimal(row[PATH_COST])
                    BFS_info[2] += Decimal(row[NODES_VISITED])
                    BFS_info[3] += Decimal(row[UNIQUE_NODES_IN_QUEUE])
                    BFS_info[4] += Decimal(row[ALL_NODES_IN_QUEUE])
                else:
                    raise Exception("Error")
            counter = counter + 1
        
        for i in range(5):
            manhattan_info[i] /= manhattan_counter
            manhattan_info[i] = int(manhattan_info[i])
            
            euclidean_info[i] /= euclidean_counter
            euclidean_info[i] = int(euclidean_info[i])

            misplaced_info[i] /= misplaced_counter
            misplaced_info[i] = int(misplaced_info[i])

            BFS_info[i] /= BFS_counter #Comment out for n = 4,5
            BFS_info[i] = int(BFS_info[i])

        print("Average time taken for Manhattan: {} ms".format(manhattan_info[0]))
        print("Average time taken for Euclidean: {} ms".format(euclidean_info[0]))
        print("Average time taken for Misplaced: {} ms".format(misplaced_info[0]))
        print("Average time taken for BFS: {} ms".format(BFS_info[0]))
        print()

        print("Average goal of depth node for Manhattan: {}".format(manhattan_info[1]))
        print("Average goal of depth node for Euclidean: {}".format(euclidean_info[1]))
        print("Average goal of depth node for Misplaced: {}".format(misplaced_info[1]))
        print("Average goal of depth node for BFS: {}".format(BFS_info[1]))
        print()

        print("Average nodes visited for Manhattan: {}".format(manhattan_info[2]))
        print("Average nodes visited for Euclidean: {}".format(euclidean_info[2]))
        print("Average nodes visited for Misplaced: {}".format(misplaced_info[2]))
        print("Average nodes visited for BFS: {}".format(BFS_info[2]))
        print()

        print("Average no. of unique nodes in queue for Manhattan: {}".format(manhattan_info[3]))
        print("Average no. of unique nodes in queue for Euclidean: {}".format(euclidean_info[3]))
        print("Average no. of unique nodes in queue for Misplaced: {}".format(misplaced_info[3]))
        print("Average no. of unique nodes in queue for BFS: {}".format(BFS_info[3]))
        print()

        print("Average no. of nodes in queue for Manhattan: {}".format(manhattan_info[4]))
        print("Average no. of nodes in queue for Euclidean: {}".format(euclidean_info[4]))
        print("Average no. of nodes in queue for Misplaced: {}".format(misplaced_info[4]))
        print("Average no. of nodes in queue for BFS: {}".format(BFS_info[4]))
        print()
        
        print(misplaced_counter)
        print(manhattan_counter)
        print(euclidean_counter)
        print(BFS_counter)
