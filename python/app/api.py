from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class RESTful(Resource):
    def get(self):
        # return JSON which has our information in it
        return {
                'items' : ['item1',
                           'item2',
                           'item3',
                           'item4']
               }

api.add_resource(RESTful, '/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
