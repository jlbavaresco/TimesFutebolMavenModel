
package br.edu.ifsul.testes;

import br.edu.ifsul.modelo.Cidade;
import br.edu.ifsul.modelo.Jogador;
import br.edu.ifsul.modelo.Pessoa;
import br.edu.ifsul.modelo.Time;
import br.edu.ifsul.modelo.Usuario;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorgebavaresco@ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
public class TestePersistirListaJogadores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TimesFutebolMavenModelPU");
        EntityManager em = emf.createEntityManager();
        Time time = em.find(Time.class, 1);
        Jogador j = em.find(Jogador.class, 3);
        time.adicionarJogador(j);     
        em.getTransaction().begin();
        em.persist(time);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

}
