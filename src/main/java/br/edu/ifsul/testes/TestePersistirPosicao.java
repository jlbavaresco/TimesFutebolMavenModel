package br.edu.ifsul.testes;

import br.edu.ifsul.modelo.Estado;
import br.edu.ifsul.modelo.Posicao;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorgebavaresco@ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
public class TestePersistirPosicao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TimesFutebolMavenModelPU");
        EntityManager em = emf.createEntityManager();
        Posicao p = new Posicao();
        p.setNome("Goleiro");
        Posicao p2 = new Posicao();
        p2.setNome("Zagueiro");
        Posicao p3 = new Posicao();
        p3.setNome("Lateral Direito");
        Posicao p4 = new Posicao();
        p4.setNome("Lateral Esquerdo");
        Posicao p5 = new Posicao();
        p5.setNome("Volante");
        Posicao p6 = new Posicao();
        p6.setNome("Meio Campo");
        em.getTransaction().begin();
        em.persist(p);
        em.persist(p2);
        em.persist(p3);
        em.persist(p4);
        em.persist(p5);
        em.persist(p6);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

}
