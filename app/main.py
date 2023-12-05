from flask import Flask
import redis,os

app=Flask(__name__)



@app.route("/")
def main():

    return f"Hello"




# port=os.environ.get("PORT")
# if port==None:
#     app.run("0.0.0.0",port=8080)
# app.run("0.0.0.0",port=port)



