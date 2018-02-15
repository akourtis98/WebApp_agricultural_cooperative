package services;

import dao.AccountDao;
import database.Account;
import database.Users;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService
{

    @Autowired
    private AccountDao accountDAO;

    public int setMoneyToMember(double money, Users user)
    {
        return accountDAO.setMoneyToMember(money, user);
    }

    public double getAmountFromId(int id)
    {
        return accountDAO.getAmountFromId(id);
    }

    public double getShareMoneyFromId(int id)
    {
        return accountDAO.getShareMoneyFromId(id);
    }

    public List<Account> getAllAccounts()
    {
        return accountDAO.getAllAccounts();
    }

    public int removeMoneyFromAdmin(double money, int id)
    {
        return accountDAO.removeMoneyFromAdmin(money, id);
    }

    public int removeShareMoneyFromAdmin(double money, int id)
    {
        return accountDAO.removeShareMoneyFromAdmin(money, id);
    }

    public int setMoneyForShare(double money, int id)
    {
        return accountDAO.setMoneyForShare(money, id);
    }

}
