package tw.ken.service;

import tw.ken.model.User;

public interface UserService {
	 
    User findById(int id);
     
    User findBySso(String sso);
     
}
