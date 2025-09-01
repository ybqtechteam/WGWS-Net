import os

from argparse import ArgumentParser

def get_args():
    parser = ArgumentParser(description="Rename")
    parser.add_argument("--dir", type=str, help="Percorso dell'immagine da elaborare.")
    parser.add_argument("--pattern", type=str, nargs='+', default=None, help="Lista di immagini da elaborare.", required=True)
    return parser.parse_args()


if __name__ == "__main__":
    args = get_args()
    path = args.dir

    pattern : list = args.pattern


    filename : str
    for filename in os.listdir(path):
        
        for s in pattern:
            if s in filename:
                new_name = filename.replace(s, '')
                old_path = os.path.join(path, filename)
                new_path = os.path.join(path, new_name)
                os.rename(old_path, new_path)
                print(f"Rinominato: {filename} -> {new_name}")
