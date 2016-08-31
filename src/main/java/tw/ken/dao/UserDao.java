package tw.ken.dao;

import tw.ken.model.User;

public interface UserDao {
	 
    User findById(int id);
     
    User findBySSO(String sso);
     
}
