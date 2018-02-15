package dao;

import database.Account;
import database.Users;
import java.util.List;

public interface AccountDaoImpl {

    public int setMoneyToMember(double money, Users user);

    public double getAmountFromId(int id);

    public double getShareMoneyFromId(int id);

    public List<Account> getAllAccounts();

    public int removeMoneyFromAdmin(double money, int id);
    
    public int removeShareMoneyFromAdmin(double money, int id);

    public int setMoneyForShare(double money, int id);

}
