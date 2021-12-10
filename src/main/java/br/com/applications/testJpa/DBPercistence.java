package br.com.applications.testJpa;

import br.com.applications.enumeration.AddressType;
import br.com.applications.enumeration.GenderType;
import br.com.applications.enumeration.TelephoneType;
import br.com.applications.model.Address;
import br.com.applications.model.EmailEntity;
import br.com.applications.model.Phone;
import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Getter
@Setter
public class DBPercistence {


    //   @Autowired
    //   private OrderRepository orderRepository;

//    @Autowired
//    private CategoryRepository categoryRepository;

    // @Autowired
    // private ProductRepository productRepository;

    //  @Autowired
    // private OrderItemRepository orderItemRepository;

    @Enumerated(EnumType.STRING)
    public static GenderType genderType;

    @Autowired
    public StudentRepository studentRepository;

    // @Autowired
    // public UserRepository userRepository;

    public void percistGeneralData() {


        // TODO Auto-generated method stub

//        Category cat1 = new Category(null, "Electronics");
//        Category cat2 = new Category(null, "Books");
//        Category cat3 = new Category(null, "Computers");

//        Product p1 = new Product(null, "The Lord of the Rings", "Lorem ipsum dolor sit amet, consectetur.", 90.5, "");
//        Product p2 = new Product(null, "Smart TV", "Nulla eu imperdiet purus. Maecenas ante.", 2190.0, "");
//        Product p3 = new Product(null, "Macbook Pro", "Nam eleifend maximus tortor, at mollis.", 1250.0, "");
//        Product p4 = new Product(null, "PC Gamer", "Donec aliquet odio ac rhoncus cursus.", 1200.0, "");
//        Product p5 = new Product(null, "Rails for Dummies", "Cras fringilla convallis sem vel faucibus.", 100.99, "");
//
//        categoryRepository.saveAll(Arrays.asList(cat1, cat2, cat3));
//        productRepository.saveAll(Arrays.asList(p1, p2, p3, p4, p5));
//
//        p1.getCategories().add(cat2);
//        p2.getCategories().add(cat1);
//        p2.getCategories().add(cat3);
//        p3.getCategories().add(cat3);
//        p4.getCategories().add(cat3);
//        p5.getCategories().add(cat2);
//
//        productRepository.saveAll(Arrays.asList(p1, p2, p3, p4, p5));
//
//        User u1 = new User(null, "Maria Brown", "maria@gmail.com", "988888888", "123456");
//        User u2 = new User(null, "Alex Green", "alex@gmail.com", "977777777", "123456");
//
//        Order o1 = new Order(null, Instant.parse("2019-06-20T19:53:07Z"), OrderStatus.PAID, u1);
//        Order o2 = new Order(null, Instant.parse("2019-07-21T03:42:10Z"), OrderStatus.WAITTING_PAYMENT, u2);
//        Order o3 = new Order(null, Instant.parse("2019-07-22T15:21:22Z"), OrderStatus.WAITTING_PAYMENT, u1);
//
//        userRepository.saveAll(Arrays.asList(u1, u2));
//        orderRepository.saveAll(Arrays.asList(o1, o2, o3));
//
//        OrdemItem oi1 = new OrdemItem(o1, p1, 2, p1.getPrice());
//        OrdemItem oi2 = new OrdemItem(o1, p3, 1, p3.getPrice());
//        OrdemItem oi3 = new OrdemItem(o2, p3, 2, p3.getPrice());
//        OrdemItem oi4 = new OrdemItem(o3, p5, 2, p5.getPrice());
//
//        orderItemRepository.saveAll(Arrays.asList(oi1, oi2, oi3, oi4));
//        Payment pay1 = new Payment(null, Instant.parse("2019-06-20T21:53:07Z"), o1);
//        o1.setPayment(pay1);
//
//        orderRepository.save(o1);
    }

    public void percistStudent() {

//        Calendar dateOfBirth1 = Calendar.getInstance();
//        dateOfBirth1.set(1982, 06, 14);

//        Calendar dateOfBirth2 = Calendar.getInstance();
//        dateOfBirth1.set(1982, 02, 12);
//
//        Calendar dateOfBirth = Calendar.getInstance();
//        dateOfBirth.set(1990, 7, 21);

        LocalDate dateBirthMarcelo = LocalDate.of(1982, 6, 14);
        Student student1 = new Student("Marcelo Paulo Rebello Martins", "27769157803", new EmailEntity("mp.rebello.martins@gmail.com"), "Developer",
                dateBirthMarcelo, GenderType.M, new Phone(12, "991976552", "Vivo", TelephoneType.CEL),
                new Address("Avenida Antonio Pinheiro Junior, 1805", "Casa 50", "Pindamonhangaba", "Jardim Cristina", "SP", "12400000", AddressType.RES));

        LocalDate dateBirthPatricia = LocalDate.of(1982, 2, 12);
        Student student2 = new Student("Patricia Cinti Ramos Martins", "30158469810", new EmailEntity("patymorr@hotmail.com"), "SAP Analist",
                dateBirthPatricia, GenderType.F, new Phone(12, "36431881", "Vivo", TelephoneType.REC),
                new Address("Rua Tipuanas, 64", "Village Paineiras", "Pindamonhangaba", "Socorro", "SP", "12412060", AddressType.CORR));

        Student student3 = new Student("Adelina dos Santos Rebello", "06558416875", new EmailEntity("adelinarebello@gmail.com"),
                "Do Lar");
        Student student4 = new Student("José Roberto", "07212854425", new EmailEntity("n.a.info@hotmail.com"), "Autonomo De TI");
        Student student5 = new Student("Carlos do Nascimento Moura", "54468548703", new EmailEntity("carlos.nascimento@gmail.com"),
                "Analista de Infra");
        Student student6 = new Student("André Henrique Souza Mendes", "20165469840", new EmailEntity("andre.mendesr@bol.com.br"),
                "Analista de Suporte");
        Student student7 = new Student("Anderson Silva Junior", "55568485215", new EmailEntity("anderson.silva@uol.com.br"), "Mecanico");
        Student student8 = new Student("José Moura Carlos", "22305659803", new EmailEntity("n.a.info@hotmail.com"),
                "Programador de circuitos");
        Student student9 = new Student("Anderson do Nascimento JR", "45215584523", new EmailEntity("anderson.nasc@gmail.com"),
                "Instrutor de BI");
        Student student10 = new Student("Alfredo Henrique siqueira Campos", "65526448752", new EmailEntity("alfredo.siqueira@gmail.com"),
                "Encanador");
        Student student11 = new Student("Sandro Come Villas", "54275454235", new EmailEntity("sandro.comes@hotmail.com"), "Pedreiro");
        Student student12 = new Student("Roberto De Moura Enernest", "13236654185", new EmailEntity("roberto.ernesto@hotmail.com"),
                "Construtor Civil");
        Student student13 = new Student("Carlos Mandarova De Oliveira", "26515483213", new EmailEntity("carlos.oliveira@yahoo.com.br"),
                "Analista de Recursos");
        Student student14 = new Student("José Claudio Martins", "57565454520", new EmailEntity("joseclaudio@gmail.com"),
                "Analista de Suporte");
        Student student15 = new Student("Cesar Henrique Nascimento Santos", "54621546898", new EmailEntity("cesarhenrique@terra.com.br"),
                "Web Desingner");
        Student student16 = new Student("Carlos Butoso Neto", "62056468542", new EmailEntity("carlos.butoso@hotmail.com"), "Autonomo");
        Student student17 = new Student("Adriano De Reis Oliveira", "45423568703", new EmailEntity("mp.rebello.martins@gmail.com"),
                "Pintor");
        Student student18 = new Student("Jorge Del Salto", "15435185524", new EmailEntity("jorgesalto@t2m.com"), "Analista de Suporte");
        Student student19 = new Student("José Francisco Carlos Souza", "27765424804", new EmailEntity("josefrancisco@tendnet.com"),
                "Médico");
        Student student20 = new Student("Erivaldo Henrique Mello", "33555245245", new EmailEntity("erivaldo@hotmail.com"), "Dentista");
        Student student21 = new Student("Sandro Pereira Barbosa", "45215654543", new EmailEntity("mp.rebello.martins@gmail.com"),
                "Frentista");
        Student student22 = new Student("Marcelino Henrique Reinz", "22468897220", new EmailEntity("marcelino.reinz@mwl.com"),
                "Eletricista");
        Student student23 = new Student("Olavo Batista Odonoel", "30157563599", new EmailEntity("olavobatista@terra.com.br"),
                "Borracheiro");
        Student student24 = new Student("José Francisco Nascimento Costa", "54468548803",
                new EmailEntity("francisco.nascimneto@infosec.com"), "Técnico de TI");
        Student student25 = new Student("Erisberto De Souza", "31963554543", new EmailEntity("erisberto@modasinfo.com.br"),
                "Analista de RH");
        Student student26 = new Student("Maria Andrezza Ramos Mello", "61105415244", new EmailEntity("maria.andrezza@previdencia.com.br"), "Analista de Infra");
        Student student27 = new Student("Maria Carla De Oliveria Souza", "35100546564", new EmailEntity("carlaolieira@mipseg.com.br"),
                "Lavadora");
        Student student28 = new Student("José Ribas Francisco Costa", "35566410754", new EmailEntity("jose.ribas@securittyl.com"),
                "Copeiro");
        Student student29 = new Student("Sandra Evelino Adal", "52105654454", new EmailEntity("sandra@ig.com.br"), "Cozinheira");
        Student student30 = new Student("Marcos Marcolino Souza", "61554283454", new EmailEntity("marcos.info@hotmail.com"),
                "Desembargador");

        Student student31 = new Student("Evelino dos Santos Reis", "54425625481", new EmailEntity("evelino.reis@hotmail.com"), "Desembargador");
        Student student32 = new Student("Alberto Henrique Mello", "34198125445", new EmailEntity("erivaldo@hotmail.com"), "Dentista");
        Student student33 = new Student("Sandro Pereira Barbosa", "32564874523", new EmailEntity("mp.rebello.martins@gmail.com"),
                "Frentista");
        Student student34 = new Student("Marcelino Henrique Reinz", "10215458720", new EmailEntity("marcelino.reinz@mwl.com"),
                "Eletricista");
        Student student35 = new Student("Olavo Batista Odonoel", "20132564599", new EmailEntity("olavobatista@terra.com.br"),
                "Borracheiro");
        Student student36 = new Student("José Francisco Nascimento Costa", "45312886603",
                new EmailEntity("francisco.nascimneto@infosec.com"), "Técnico de TI");
        Student student37 = new Student("Erisberto De Souza", "47582454543", new EmailEntity("erisberto@modasinfo.com.br"),
                "Analista de RH");
        Student student38 = new Student("Maria Andrezza Ramos Mello", "43546765444", new EmailEntity("maria.andrezza@previdencia.com.br"), "Analista de Infra");
        Student student39 = new Student("Maria Carla De Oliveria Souza", "35343546664", new EmailEntity("carlaolieira@mipseg.com.br"), "Lavadora");
        Student student40 = new Student("José Ribas Francisco Costa", "12687565444", new EmailEntity("jose.ribas@securittyl.com"),
                "Copeiro");
        Student student41 = new Student("Sandra Evelino Abdal", "55345677854", new EmailEntity("sandra@ig.com.br"), "Cozinheira");
        Student student42 = new Student("Marcos Marcolino Souza Mendez", "61589784454", new EmailEntity("marcos.info@hotmail.com"),
                "esembargador");

        Student student43 = new Student("Marcolino Neto Souza", "61554425374", new EmailEntity("marcos.info@hotmail.com"), "Desembargador");

        Student student44 = new Student("Evelin dos Santos Reis", "54456346712", new EmailEntity("evelino.reis@hotmail.com"), "Desembargador");
        Student student45 = new Student("Jerivaldo Henrique Mello", "95544745544", new EmailEntity("erivaldo@hotmail.com"), "Dentista");
        Student student46 = new Student("Sandra Pereira Barbosa Mello", "45215647583", new EmailEntity("mp.rebello.martins@gmail.com"),
                "Frentista");
        Student student47 = new Student("Marcelino Henrique Reinz", "14346723260", new EmailEntity("marcelino.reinz@mwl.com"),
                "Eletricista");

        Student student48 = new Student("Marcelli Carlos Henrique Reinz", "24897654460", new EmailEntity("marcelino.reinz@mwl.com"),
                "Eletricista");

        Student student49 = new Student("Olavo Odonoel", "23535788459", new EmailEntity("olavobatista@terra.com.br"),
                "Borracheiro");
        Student student50 = new Student("Erisberto De Ramos", "89568547343", new EmailEntity("erisberto@modasinfo.com.br"),
                "Analista de RH");
        Student student51 = new Student("Maria Andrezza Mello Vergueiro", "56756845244",
                new EmailEntity("maria.andrezza@previdencia.com.br"), "Analista de Infra");
        Student student52 = new Student("Maria Carla De Souza Teixeira", "33678967764", new EmailEntity("carlaolieira@mipseg.com.br"), "Lavadora");
        Student student53 = new Student("José Ribas Francisco Costa", "12354769067", new EmailEntity("jose.ribas@securittyl.com"),
                "Copeiro");
        Student student54 = new Student("Francisco Oliveira Costa Junior", "12345489953",
                new EmailEntity("francisco.olveira@infosec.com"), "Técnico de TI");
        Student student55 = new Student("Carlos Alberto Francisco Nascimento Costa", "23490678566",
                new EmailEntity("carlos.alberto@infosec.com"), "Técnico de TI");
        Student student56 = new Student("José Costa", "12470676453",
                new EmailEntity("jose.costa@infinit.net"), "Técnico de TI");
        Student student57 = new Student("José Teixeira Oliveira Salgado", "12378756533",
                new EmailEntity("jose.salgado.t@infosecurity.com"), "Técnico de TI");
        Student student58 = new Student("Marcos de Julio Paula", "12378903463",
                new EmailEntity("nascimneto.paula@band.com.tv"), "Técnico de TI");
        Student student59 = new Student("Adriana Ferreir Bicudo", "89056345603",
                new EmailEntity("adriana-ferreira@infomaster.com.br"), "Técnico de TI");
        Student student60 = new Student("Carlos Reis de Mouta Filho", "67456899703",
                new EmailEntity("carlos.moura@hello.com"), "Técnico de TI");


        Student student61 = new Student("Patricia Carneiro Souza", "56514725752", new EmailEntity("patriciamello@sapenginner.com"),
                "Analista de Implantação SAP");

        Student student62 = new Student("Juliano Lima Oliveira", "27349147803", new EmailEntity("juliano.lima@latam.com"), "Enginner",
                GenderType.M, new Phone(12, "994652223", TelephoneType.CEL));

        Student student63 = new Student("Juliano Lima Oliveira", "21458465789", new EmailEntity("juliano.lima@latam.com"), "Enginner",
                GenderType.M, new Phone(12, "976545587", TelephoneType.CEL),
                new Address("Av do Juliano Lima de Oliveira", "Pindamonhangaba", "Centro", "SP", "12400000",
                        AddressType.RES));


        LocalDate dateBirthCarlosHenrique = LocalDate.of(1980, 4, 16);
        Student student64 = new Student("Carlos Henrique Oliveira", "30158469818", new EmailEntity("carlos.henrique@latam.com"), "Enginner",
                dateBirthCarlosHenrique, GenderType.M, new Phone(18, "955486518", "Carlos Henrique", TelephoneType.CEL),
                new Address("Avenida do Carlos Henrique", "Cidade do carlos henrique", "Centro", "SP", "12400000", AddressType.RES));


        List<Student> students = new ArrayList<>(Arrays.asList(student1, student2, student3, student4, student5, student6, student7, student8, student9, student10,
                student11, student12, student13, student14, student15, student16, student17, student18, student19, student20, student21, student22, student23, student24
                , student25, student26, student27, student28, student29, student30, student31, student32, student33, student34, student35, student36, student37, student38
                , student39, student40, student41, student42, student43, student44, student45, student46, student47, student48, student49, student50, student51, student52
                , student53, student54, student55, student56, student57, student58, student59, student60, student61, student62, student63, student64));

        studentRepository.saveAll(students);
    }
}

