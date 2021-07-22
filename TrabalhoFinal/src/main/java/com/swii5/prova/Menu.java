/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swii5.prova;

/**
 *
 * @author Bruno
 */
public class Menu {
    
    public String Menu(){
        String ret="<nav class='navbar navbar-expand-lg navbar-dark cor'>" +
                   "    <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarTogglerDemo03' aria-controls='navbarTogglerDemo03' aria-expanded='false' aria-label='Toggle navigation'>" +
                   "        <span class='navbar-toggler-icon'></span>" +
                   "    </button>" +
                   "    <div class='collapse navbar-collapse' id='navbarTogglerDemo03' >" +
                   "        <ul class='navbar-nav mr-auto mt-2 mt-lg-0'>" +
                   "            <li class='nav-item'>" +
                   "                <a class='nav-link active' href='/Prova'>Home</a>" +
                   "            </li>" +
                   "            <li class='nav-item dropdown'>" +
                   "                <a class='nav-link dropdown-toggle' href='#' id='navbardropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='color:white'>Vendedor</a>" +
                   "                <div class='dropdown-menu' aria-labelledby='navbardropdown'>" +
                   "                    <a class='nav-link active' href='/Prova/Vendedor/Cadastrar.jsp' style='color:black'>Cadastrar Vendedor</a>" +
                   "                    <a class='nav-link active' href='/Prova/Vendedor/Listar.jsp' style='color:black'>Listar Vendedores</a>" +
                   "                </div>" +
                   "            </li>" +
                   "            <li class='nav-item dropdown'>" +
                   "                <a class='nav-link dropdown-toggle' href='#' id='navbardropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='color:white'>Cliente</a>" +
                   "                <div class='dropdown-menu' aria-labelledby='navbardropdown'>" +
                   "                    <a class='nav-link active' href='/Prova/Cliente/Cadastrar.jsp' style='color:black'>Cadastrar Cliente</a>" +
                   "                    <a class='nav-link active' href='/Prova/Cliente/Listar.jsp' style='color:black'>Listar Clientes</a>" +
                   "                </div>" +
                   "            </li>" +
                   "            <li class='nav-item dropdown'>" +
                   "                <a class='nav-link dropdown-toggle' href='#' id='navbardropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='color:white'>Ordem de Venda</a>" +
                   "                <div class='dropdown-menu' aria-labelledby='navbardropdown'>" +
                   "                    <a class='nav-link active' href='/Prova/Venda/Cadastrar.jsp' style='color:black'>Cadastrar Ordem de Venda</a>" +
                   "                    <a class='nav-link active' href='/Prova/Venda/Listar.jsp' style='color:black'>Listar Ordens de Vendas</a>" +
                   "                </div>" +
                   "            </li>" +
                   "            <li class='nav-item'>" +
                   "                <a class='nav-link active' href='/Prova/Creditos.jsp'>Créditos</a>" +
                   "            </li>" +
                   "        </ul>" +
                   "    </div>" +
                   "</nav>";
        
        return ret;
    }
}
