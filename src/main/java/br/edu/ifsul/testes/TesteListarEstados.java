
package br.edu.ifsul.testes;

import br.edu.ifsul.modelo.Estado;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorgebavaresco@ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
public class TesteListarEstados {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TimesFutebolMavenModelPU");
        EntityManager em = emf.createEntityManager();
        List<Estado> lista = 
                em.createQuery("from Estado order by id")
                        .setMaxResults(30).
                        setFirstResult(30).
                        getResultList();
        for (Estado e : lista){
            System.out.println("ID: " + e.getId() + " Nome: " + e.getNome() + " UF: " + e.getUf());
        }
      
        em.close();
        emf.close();
    }

}
