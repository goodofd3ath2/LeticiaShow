/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PerguntaDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leticia
 */
public class Jogo {

    private List<Pergunta> perguntaList;
    private Integer pontuacao;
    private Integer pulos;

    public Jogo() {
        this.pontuacao = 10;
        this.pulos = 3;
    }

    public List<Pergunta> getPerguntaList() {
        return perguntaList;
    }

    public void setPerguntaList(List<Pergunta> perguntaList) {
        this.perguntaList = perguntaList;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao = pontuacao;
    }

    public Integer getPulos() {
        return pulos;
    }

    public void setPulos(Integer pulos) {
        this.pulos = pulos;
    }

    public Integer getAcerto() {
        Integer acerto = 0;
        if (this.pontuacao == 0) {
            acerto = 1000;
        }
        return acerto;
    }

    public Integer getErro() {
        //se ele erra ele gaNHA METADE DO QUE ELE TEM
        //SE ELE N TEM NADA OU SE VAI PRA 1000000 ELE N GANHA NADA SE ERRAr
        Integer erro = 0;
        return erro;
    }

    public void iniciar() {

        {

            try {
                PerguntaDAO dao = new PerguntaDAO();
                this.setPerguntaList(dao.listar());
            } catch (Exception ex) {
                Logger.getLogger(Jogo.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public boolean confirmar(String opcaomarcada) {
        if (opcaomarcada.equals(this.getPerguntaList().get(0).getCerta())) {
            this.getPerguntaList().remove(0);
            this.setPontuacao(this.getAcerto());
            return true;
        } else {
            return false;
        }
    }
    
    public boolean pular(){
        
        if(this.pulos!=0)
        {
            this.pulos--;
            this.getPerguntaList().remove(0);
            return true;
        }
        else
        {
            return false;
        }
    }
            

}
