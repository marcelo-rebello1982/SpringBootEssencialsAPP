//package br.com.applications.interfaces;
//
//import com.fasterxml.jackson.annotation.JsonFormat;
//import com.fasterxml.jackson.annotation.JsonProperty;
//
//import java.io.Serializable;
//
//@JsonFormat(shape = JsonFormat.Shape.STRING)
//public enum EnumEstados implements  EnumModel{
//
//
//    @JsonProperty("AC")
//    AC("Acre", "AC"),
//
//    @JsonProperty("AL")
//    AL("Alagoas", "AL"),
//
//    @JsonProperty("AP")
//    AP("Amapá", "AP"),
//
//    @JsonProperty("AM")
//    AM("Amazonas", "AM"),
//
//    @JsonProperty("BA")
//    BA("Bahia", "BA"),
//
//    @JsonProperty("CE")
//    CE("Ceará", "CE"),
//
//    @JsonProperty("DF")
//    DF("Distrito Federal", "DF"),
//
//    @JsonProperty("ES")
//    ES("Espírito Santo", "ES"),
//
//    @JsonProperty("GO")
//    GO("Goiás", "GO"),
//
//    @JsonProperty("MA")
//    MA("Maranhão", "MA"),
//
//    @JsonProperty("MT")
//    MT("Mato Grosso", "MT"),
//
//    @JsonProperty("MS")
//    MS("Mato Grosso do Sul", "MS"),
//
//    @JsonProperty("MG")
//    MG("Minas Gerais", "MG"),
//
//    @JsonProperty("PA")
//    PA("Pará", "PA"),
//
//    @JsonProperty("PB")
//    PB("Paraíba", "PB"),
//
//    @JsonProperty("PR")
//    PR("Paraná", "PR"),
//
//    @JsonProperty("PE")
//    PE("Pernambuco", "PE"),
//
//    @JsonProperty("PI")
//    PI("Piauí", "PI"),
//
//    @JsonProperty("RJ")
//    RJ("Rio de Janeiro", "RJ"),
//
//    @JsonProperty("RN")
//    RN("Rio Grande do Norte", "RN"),
//
//    @JsonProperty("RS")
//    RS("Rio Grande do Sul", "RS"),
//
//    @JsonProperty("RO")
//    RO("Rondônia", "RO"),
//
//    @JsonProperty("RR")
//    RR("Roraima", "RR"),
//
//    @JsonProperty("SC")
//    SC("Santa Catarina", "SC"),
//
//    @JsonProperty("SP")
//    SP("São Paulo", "SP"),
//
//    @JsonProperty("SE")
//    SE("Sergipe", "SE"),
//
//    @JsonProperty("TO")
//    TO("Tocantins", "TO");
//
//    private String nome;
//    private String sigla;
//
//    private EnumEstados(String nome, String sigla) {
//        this.nome = nome;
//        this.sigla = sigla;
//    }
//
//
//    public String getNome() {
//        return nome;
//    }
//
//    public String getSigla() {
//        return sigla;
//    }
//
//    public static EnumEstados getPorSigla(String sigla){
//        for(EnumEstados e: values()){
//            if(e.getSigla().equalsIgnoreCase(sigla)){
//                return e;
//            }
//        }
//
//        return null;
//    }
//
//    @Override
//    public Serializable getCodigo() {
//        return getSigla();
//    }
//}