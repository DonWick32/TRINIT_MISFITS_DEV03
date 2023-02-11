import unittest
from database import Farmer, Enthusiast, Expert, UserIn, UserOut, get_users, add_user, update_user, delete_user

class TestDatabaseMethods(unittest.TestCase):
    def setUp(self):
        self.user_data = UserIn(
            name='John Doe',
            phone_number='+1234567890',
            email='johndoe@example.com',
            region='North America',
            language='English',
            password='password'
        )

    def test_get_users(self):
        add_user(Farmer, self.user_data)
        users = get_users(Farmer)
        self.assertGreater(len(users), 0)
        self.assertIsInstance(users[0], UserOut)

    def test_add_user(self):
        add_user(Enthusiast, self.user_data)
        users = get_users(Enthusiast)
        self.assertEqual(len(users), 1)

    def test_update_user(self):
        add_user(Expert, self.user_data)
        update_user(Expert, 1, UserIn(region='South America', name=self.user_data['name'], phone_number=self.user_data['phone_number'], email=self.user_data['email'], language=self.user_data['language'], password=self.user_data['password']))
        users = get_users(Expert)
        self.assertEqual(users[0].region, 'South America')

    def test_delete_user(self):
        add_user(Farmer, self.user_data)
        delete_user(Farmer, 1)
        users = get_users(Farmer)
        self.assertEqual(len(users), 0)

if __name__ == '__main__':
    unittest.main()
