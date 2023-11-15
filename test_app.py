import unittest
from app import app

class TestMicroservice(unittest.TestCase):

    def setUp(self):
        # Create a test client
        self.app = app.test_client()

    def test_hello_world(self):
        # Send a GET request to the endpoint
        response = self.app.get('/')

        # Check if the status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

        # Check if the response data matches the expected string
        self.assertEqual(response.data.decode('utf-8'), 'Hello, World! This is a Python microservice.')

if __name__ == '__main__':
    unittest.main()