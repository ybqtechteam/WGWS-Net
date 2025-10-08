import os

for i in os.listdir('data/Realsnow85'):
    command = f"bash run.sh {i}"
    os.system(command)
    print('--------')