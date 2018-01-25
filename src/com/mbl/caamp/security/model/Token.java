package com.mbl.caamp.security.model;

import net.softengine.service.Christopher;
import net.softengine.model.User;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Copyright &copy; 2017-2018 Soft Engine Inc.  (www.soft-engine.net)
 * <p>
 * Original author: Khomeni
 * Date: 21/11/2017 12:56 PM
 * Last modification by: Khomeni: Khomeni
 * Last modification on 21/11/2017: 21/11/2017 12:56 PM
 * Current revision: 1.0.0: 1.1 $
 * <p>
 * Revision History:
 * ------------------
 */

@Entity
@Table(name = "SEC_TOKEN", uniqueConstraints = @UniqueConstraint(columnNames = {"username"}))
public class Token implements Serializable {

    public Token() {
    }

    public Token(String username, String password) {
        Christopher christopher = new Christopher(username);
        this.username = username;
        this.password = christopher.encrypt(password);
    }

    private static final long serialVersionUID = -2020752748932592756L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String username;

    private String password;

    @Transient
    private String brCode;

    @OneToOne
    @JoinColumn(name = "user")
    private User user;

    public static void main(String[] args) {
        // Token token = new Token("mak", "man");
        // java.lang.System.out.println(token.getPassword());
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getBrCode() {
        return brCode;
    }

    public void setBrCode(String brCode) {
        this.brCode = brCode;
    }

    private String getDecPassword() {
        Christopher christopher = new Christopher(this.username);
        return "";// christopher.decrypt(password);
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
