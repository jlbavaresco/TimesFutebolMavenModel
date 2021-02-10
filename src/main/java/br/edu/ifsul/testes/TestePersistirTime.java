
package br.edu.ifsul.testes;

import br.edu.ifsul.modelo.Cidade;
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
public class TestePersistirTime {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TimesFutebolMavenModelPU");
        EntityManager em = emf.createEntityManager();
        Time time = new Time();
        time.setNome("Grêmio FBPA");
        time.setHistoria("Time fundado em 1903 na cidade de Porto Alegre");
        time.setDataFundacao(new GregorianCalendar(1903, Calendar.SEPTEMBER, 15));
        time.setCidade(em.find(Cidade.class, 1));
        time.setTecnico(em.find(Pessoa.class, 1));
        time.setUsuario(em.find(Usuario.class,"jlbavaresco"));
   
        em.getTransaction().begin();
        em.persist(time);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

}
