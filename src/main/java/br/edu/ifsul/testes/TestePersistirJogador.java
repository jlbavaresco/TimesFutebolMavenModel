
package br.edu.ifsul.testes;

import br.edu.ifsul.modelo.Estado;
import br.edu.ifsul.modelo.Jogador;
import br.edu.ifsul.modelo.Posicao;
import br.edu.ifsul.modelo.Time;
import java.util.Calendar;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorgebavaresco@ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
public class TestePersistirJogador {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TimesFutebolMavenModelPU");
        EntityManager em = emf.createEntityManager();
        Jogador j = new Jogador();
        j.setNome("Lucas");
        j.setAltura(1.84);
        j.setPeso(80.500);
        j.setCpf("908.316.230-39");
        j.setNascimento(Calendar.getInstance());
        j.setPosicao(em.find(Posicao.class, 1));
        j.setTime(em.find(Time.class, 1));
        em.getTransaction().begin();
        em.persist(j);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

}
