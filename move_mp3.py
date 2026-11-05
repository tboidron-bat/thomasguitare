from pathlib import Path
import shutil

root = Path.cwd()
destination = root / "mp3"
destination.mkdir(exist_ok=True)

files = [
    p for p in root.rglob("*")
    if p.is_file()
    and p.suffix.lower() == ".mp3"
    and destination not in p.parents
]

moved = 0

for src in files:
    target = destination / src.name

    if target.exists():
        prefix = src.parent.name
        target = destination / f"{prefix}_{src.name}"

        counter = 1
        while target.exists():
            target = destination / f"{prefix}_{counter}_{src.name}"
            counter += 1

    print(f"{src.relative_to(root)} -> {target.relative_to(root)}")
    shutil.move(str(src), str(target))
    moved += 1

print(f"\n{moved} fichier(s) déplacé(s).")
