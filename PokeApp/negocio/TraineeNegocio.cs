using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TraineeNegocio
    {

        public int insertarNuevo(Trainee nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametros("@email", nuevo.Email);
                datos.setearParametros("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }
        public bool Login(Trainee trainee)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select Id, Email, Pass, Admin from USERS Where Email = @Email and Pass = @Pass");
                datos.setearParametros("@Email", trainee.Email);
                datos.setearParametros("@Pass", trainee.Pass);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    trainee.Id = (int)datos.Lector["Id"];
                    trainee.Admin = (bool)datos.Lector["Admin"];
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
