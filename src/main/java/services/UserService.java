package services;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import database.Users;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Service
public class UserService
{

    @Autowired
    private UserDao userDAO;

    public Users findByUserName(String login)
    {
        return userDAO.findByUserName(login);
    }

    public Users getUserById()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        int userID = userDAO.findByUserName(auth.getName()).getId();

        return userDAO.getByUserId(userID);
    }

    public int getUserIdByRole(String role)
    {
        return userDAO.getUserIdByRole(role);
    }

    public Boolean registerUser(String username, String password, String email, String address)
    {
        List results = userDAO.checkIfUserExist(username);

        if (results == null)
        {
            Users newUser = new Users();
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setEmail(email);
            newUser.setAddress(address);
            newUser.setRole("CLIENT");

            userDAO.addUser(newUser);

            return true;
        }

        return false;
    }

    public List<Users> getAllMembers()
    {
        return userDAO.getAllMembers();
    }
}
