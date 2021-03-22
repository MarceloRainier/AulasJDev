package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.Telefones;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	private DaoTelefones daoTelefones = new DaoTelefones();

	public TelefonesServlets() {
		super();
	}

	/* ------------------- Início do método doGet ----------------------------- */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String acao = request.getParameter("acao");
			String user = request.getParameter("user");

			if (user != null) {
				BeanCursoJsp usuario = daoUsuario.consultar(user);

				if (acao.equalsIgnoreCase("addTelefone")) {

					request.getSession().setAttribute("userEscolhido", usuario);
					request.setAttribute("userEscolhido", usuario);
					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(usuario.getId()));
					view.forward(request, response); // dispara o redirecionamento

				} else if (acao.equalsIgnoreCase("deleteTelefone")) {

					String telefoneId = request.getParameter("telefoneId");
					daoTelefones.delete(telefoneId);

					BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("msg", "Registro removido com sucesso");
					view.forward(request, response); // dispara o redirecionamento
				}
			} else {
				//RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response); // dispara o redirecionamento
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/* ------------------- Fim do método doGet ----------------------------- */
	
	/* ------------------- Início do método doPost ----------------------------- */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// recuperando o usu�rio da sess�o ativa
			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");

			String acao = request.getParameter("acao");

			if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {

				if (numero == null || (numero != null && numero.isEmpty())) {

					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("msg", "Informe o numero do telefone!");
					view.forward(request, response); // dispara o redirecionamento
				} else {

					Telefones telefone = new Telefones();
					telefone.setNumero(numero);
					telefone.setTipo(tipo);
					telefone.setUsuario(beanCursoJsp.getId());

					daoTelefones.salvar(telefone);

					// como foi aberta uma sess�o para acesso ao bd, temos que guardar essa sess�o
					// para que possamos usar enquanto estivermos trabalhando num mesmo registro
					request.getSession().setAttribute("userEscolhido", beanCursoJsp);
					request.setAttribute("userEscolhido", beanCursoJsp);

					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("msg", "Registro salvo com sucesso");
					view.forward(request, response); // dispara o redirecionamento
				}

			} else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/* ------------------- Fim do método doPost ----------------------------- */
}
