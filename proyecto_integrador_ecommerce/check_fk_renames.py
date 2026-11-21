import json

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

collisions = []
fk_renames = {} # table -> {old_col: new_col}

for t in tables:
    tbl = t['table']
    col_names = [c['name'] for c in t['columns']]
    renames = {}
    for fk in t['fks']:
        old_col = fk['col']
        if old_col.startswith('id_'):
            new_col = old_col[3:] # strip 'id_'
            if new_col in col_names and new_col != old_col:
                collisions.append((tbl, old_col, new_col))
            renames[old_col] = new_col
    if renames:
        fk_renames[tbl] = renames

print(f"Total tables with FKs to rename: {len(fk_renames)}")
print(f"Total name collisions: {len(collisions)}")
for c in collisions:
    print("  COLLISION:", c)
