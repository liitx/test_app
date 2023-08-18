from typing import Union

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return [{"itemId": 3, "q": "test-data"}]

@app.get("/items/{itemId}")
def read_item(itemId: int, q: Union[str, None]):
    return [{"itemId": itemId, "q": q}]

# "/" + "items/INT'?q=STRING'"
# OPTIONAL PARAMETER; nullable


# http://127.0.0.1:8000/items/5?q=someQuery