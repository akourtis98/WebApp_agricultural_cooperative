package dao;

import database.Users;
import java.util.List;

public interface UserDaoImpl
{
    public Users findByUserName(String login);
    
    public Users getByUserId(int userId);
    
    public int getUserIdByRole(String role);
    
    public void addUser(Users newUser);  
    
    public List<Users> getAllMembers();
    
    public List<Users> checkIfUserExist(String username);
}
