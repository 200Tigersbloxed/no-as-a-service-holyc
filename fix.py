import json

with open("reasons.json", "r", encoding="utf-8") as f:
    data = json.load(f)


with open("reasons.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
