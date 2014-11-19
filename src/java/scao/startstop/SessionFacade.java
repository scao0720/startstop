/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scao.startstop;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Sabina
 */
@Stateless
public class SessionFacade extends AbstractFacade<Session> {
    @PersistenceContext(unitName = "startstopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SessionFacade() {
        super(Session.class);
    }
    public List<Session> findByUsername(String username) {
    return em.createNamedQuery("Sessions.findByUsername", Session.class).setParameter("username", username).getResultList();
} 
    
}
