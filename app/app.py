from flask import Flask
import pymysql
import os

pymysql.install_as_MySQLdb()
app = Flask(__name__)

@app.route("/")
def index():
    ## 現段階ではHTMLを返却するのみ
    return """
    <h1>Welcome to Fargate Container!</h1>
    <p>今後データベースには接続します</p>
    """
@app.route("/healthcheck")
def healthcheck():
    return "OK", 200
