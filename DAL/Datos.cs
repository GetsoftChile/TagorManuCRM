using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;
using System.Data.Common;

namespace DAL
{
    public class Datos
    {
        Database db = DatabaseFactory.CreateDatabase();

        public string getValUsuario(string usuario, string contrasena)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_validaUsuario");
            db.AddInParameter(cmd, "@usuario", DbType.String, usuario);
            db.AddInParameter(cmd, "@contrasena", DbType.String, contrasena);

            try
            {
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }
        
        public DataSet getBuscarEmailCasilla(string idEmail)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarEmailCasilla");
            
            db.AddInParameter(cmd, "@idEmail", DbType.String, idEmail);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la casilla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la casilla, " + ex.Message, ex);
            }
        }
        
        public DataSet getBuscarCategoriaServicio(string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarCategoriaServicio");

            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la categoria servicio, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la categoria servicio, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarMensaje(string idMensaje)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarMensaje");

            db.AddInParameter(cmd, "@idMensaje", DbType.String, idMensaje);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el mensaje, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el mensaje, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarComuna(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarComuna");

            if (nombre == string.Empty)
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la comuna, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la comuna, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarUsuarioPorLogin(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioLogin");

            if (nombre == string.Empty)
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }


        //Usuarios
        public DataSet getBuscarUsuario(string login, string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuario");


            if (nombre == string.Empty)
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, "%" + nombre + "%");
            }



            if (login == string.Empty)
            {
                db.AddInParameter(cmd, "@login", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@login", DbType.String, "%" + login + "%");
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarUsuarioPorIdZonas(string idZonas, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioPorIdZonas");


            if (idZonas == string.Empty)
            {
                db.AddInParameter(cmd, "@idZonas", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZonas", DbType.String, idZonas);
            }
            
            db.AddInParameter(cmd, "@activo", DbType.String, activo);
            

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }
        

        public DataSet getBuscarUsuarioExporte()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioExporte");

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario exporte, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario exporte, " + ex.Message, ex);
            }
        }


        public void setEliminarUsuario(string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarUsuario");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar el usuario, " + ex.Message, ex);
            }
        }

        public void setEditarContrasena(string idUsuario, string contrasena)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarContrasena");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            db.AddInParameter(cmd, "@contrasena", DbType.String, contrasena);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el usuario, " + ex.Message, ex);
            }
        }

        public void setEditarUsuario(string idUsuario, string usuario, string contrasena, string email,
            string perfil, string nombre, string activo, string idEmpresa, string idArea, string idSucursal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarUsuario");

            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            db.AddInParameter(cmd, "@usuario", DbType.String, usuario);
            db.AddInParameter(cmd, "@contrasena", DbType.String, contrasena);
            db.AddInParameter(cmd, "@email", DbType.String, email);
            db.AddInParameter(cmd, "@perfil", DbType.String, perfil);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);
            if (idEmpresa == "0")
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            }


            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el usuario, " + ex.Message, ex);
            }
        }

        public string setIngresarUsuario(string usuario, string contrasena, string email,
            string perfil, string nombre, string activo, string idEmpresa, string idArea, string idSucursal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarUsuario");
            db.AddInParameter(cmd, "@usuario", DbType.String, usuario);
            db.AddInParameter(cmd, "@contrasena", DbType.String, contrasena);
            db.AddInParameter(cmd, "@email", DbType.String, email);
            db.AddInParameter(cmd, "@perfil", DbType.String, perfil);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            if (idEmpresa == "0")
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            }

            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            try
            {
                string valor;
                valor = db.ExecuteScalar(cmd).ToString();

                //db.ExecuteNonQuery(cmd);

                return valor;
                //db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el usuario, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarParametro(string idParametro)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarParametro");
            db.AddInParameter(cmd, "@idParametro", DbType.String, idParametro);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el parámetro, " + ex.Message, ex);
            }
        }


        public void setEditarParametro(string idParametro, string emailCC, string nombreCampo1, string nombreCampo2,
            string nombreCampo3, string nombreCampo4, string nombreCampo5, string gestionAdjunto)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarParametro");

            db.AddInParameter(cmd, "@idParametro", DbType.String, idParametro);
            db.AddInParameter(cmd, "@emailCC", DbType.String, emailCC);
            db.AddInParameter(cmd, "@nombreCampo1", DbType.String, nombreCampo1);
            db.AddInParameter(cmd, "@nombreCampo2", DbType.String, nombreCampo2);
            db.AddInParameter(cmd, "@nombreCampo3", DbType.String, nombreCampo3);
            db.AddInParameter(cmd, "@nombreCampo4", DbType.String, nombreCampo4);
            db.AddInParameter(cmd, "@nombreCampo5", DbType.String, nombreCampo5);
            db.AddInParameter(cmd, "@gestionAdjunto", DbType.String, gestionAdjunto);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
        }



        //tabla 1

        public DataSet getBuscarTabla1(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTabla1");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tabla 1, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tabla 1, " + ex.Message, ex);
            }
        }



        public void setEditarTabla1(string idCampo, string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTabla1");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
        }

        public void setIngresarZonaPorUsuario(string idZona, string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarZonasPorUsuario");

            db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar las zonas por usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar las zonas por usuario, " + ex.Message, ex);
            }
        }

        public void setIngresarTabla1(string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTabla1");

            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
        }

        public void setEliminarTabla1(string idCampo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTabla1");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
        }


        //tabla 2

        public DataSet getBuscarTabla2(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTabla2");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tabla 2, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tabla 2, " + ex.Message, ex);
            }
        }



        public void setEditarTabla2(string idCampo, string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTabla2");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la tabla, " + ex.Message, ex);
            }
        }


        public void setIngresarTabla2(string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTabla2");

            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
        }

        public void setEliminarTabla2(string idCampo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTabla2");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
        }


        //INICIO tabla 3
        public DataSet getBuscarTabla3(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTabla3");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarMotivoCierrePorIdTipo(string idTipo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarMotivoCierrePorIdTipo");
            db.AddInParameter(cmd, "@idTipoCierre", DbType.String, idTipo);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar motivo cierre, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar motivo cierre, " + ex.Message, ex);
            }
        }

        public void setEditarTabla3(string idCampo, string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTabla3");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
        }


        public void setIngresarTabla3(string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTabla3");

            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
        }

        public void setEliminarTabla3(string idCampo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTabla3");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
        }
        //FIN TABLA 3




        //INICIO tabla 4
        public DataSet getBuscarTabla4(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTabla4");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
        }



        public void setEditarTabla4(string idCampo, string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTabla4");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
        }


        public void setIngresarTabla4(string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTabla4");

            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
        }

        public void setEliminarTabla4(string idCampo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTabla4");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
        }
        //FIN TABLA 4




        //INICIO tabla 5
        public DataSet getBuscarTabla5(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTabla5");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tabla, " + ex.Message, ex);
            }
        }



        public void setEditarTabla5(string idCampo, string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTabla5");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el parámetro, " + ex.Message, ex);
            }
        }


        public void setIngresarTabla5(string nombre, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTabla5");

            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la tabla, " + ex.Message, ex);
            }
        }

        public void setEliminarTabla5(string idCampo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTabla5");

            db.AddInParameter(cmd, "@idCampo", DbType.String, idCampo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la tabla, " + ex.Message, ex);
            }
        }
        //FIN TABLA 5



        //CANAL


        public DataSet getBuscarCanal(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarCanal");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el canal, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el canal, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarCanalPorTipoCliente(string clientExt, string clientInt, string sb, string pu)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarCanalPorTipoCliente");

            if (clientExt == string.Empty)
            {
                db.AddInParameter(cmd, "@cliExt", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@cliExt", DbType.String, clientExt);
            }

            if (clientInt == string.Empty)
            {
                db.AddInParameter(cmd, "@cliInt", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@cliInt", DbType.String, clientInt);
            }

            if (sb == string.Empty)
            {
                db.AddInParameter(cmd, "@sb", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@sb", DbType.String, sb);
            }

            if (pu == string.Empty)
            {
                db.AddInParameter(cmd, "@pu", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@pu", DbType.String, pu);
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el canal, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el canal, " + ex.Message, ex);
            }
        }


        public DataSet getGenerarDashboard(string idUsuario, string idArea, string tipo, string idPerfil ,string idSucursal, string idCategoriaServicio)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_GenerarDashboard");

            if (idUsuario == string.Empty)
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            db.AddInParameter(cmd, "@idPerfil", DbType.String, idPerfil);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);

            db.AddInParameter(cmd, "@idCategoriaServicio", DbType.String, idCategoriaServicio);
            


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el dashboard, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el dashboard, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarEstatus(string idEmpresa)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTipo");
            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el estatus, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el estatus, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarNivel1(string clase, string idArea)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarNivel1");
            db.AddInParameter(cmd, "@clase", DbType.String, clase);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            //db.AddInParameter(cmd, "@clienteInterno", DbType.String, clienteInterno);
            //db.AddInParameter(cmd, "@clienteExterno", DbType.String, clienteExterno);
            //db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el nivel 1, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el nivel 1, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarNivel2(string tipo,string idArea, string nivel1)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarNivel2");
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@clase", DbType.String, tipo);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el nivel 2, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el nivel 2, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarNivel3(string tipo, string idArea, string nivel1, string nivel2)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarNivel3");
            db.AddInParameter(cmd, "@clase", DbType.String, tipo);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el nivel 1, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el nivel 1, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarNivel4(string tipo, string idArea, string nivel1, string nivel2, string nivel3)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarNivel4");
            db.AddInParameter(cmd, "@clase", DbType.String, tipo);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            db.AddInParameter(cmd, "@nivel3", DbType.String, nivel3);
            
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el nivel 4, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el nivel 4, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarSubEstatus(string nivel1)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarSubEstatus");
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el sub estatus, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el sub estatus, " + ex.Message, ex);
            }
        }

        public DataSet getNivel3(string nivel1, string nivel2)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarEstatusSeguimiento");

            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el estatus seguimiento, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el estatus seguimiento, " + ex.Message, ex);
            }
        }


        public DataSet getNivel4(string nivel1, string nivel2, string nivel3)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarNivel4");

            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            db.AddInParameter(cmd, "@nivel3", DbType.String, nivel3);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el nivel 4, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el nivel 4, " + ex.Message, ex);
            }
        }


        public DataSet getContarGestiones(string idUsuario, string fechaDesde, string fechaHasta,
            string campo1, string idEstado, string tipo, string idCanal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_ContarGestiones");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }


            if (campo1 == "0")
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, campo1);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }



            if (tipo == "0")
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            }


            if (idCanal == "0")
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, idCanal);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el estatus seguimiento, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el estatus seguimiento, " + ex.Message, ex);
            }
        }

        


        public DataSet getBuscarDetalleOt(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado, string nivel1)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarDetalleOT");

            if (idUsuario == "0" || idUsuario.Trim() == "")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (nivel1 == string.Empty || nivel1 == "TOTAL")
            {
                db.AddInParameter(cmd, "@nivel1", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el reporte de OT, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el reporte de OT, " + ex.Message, ex);
            }
        }


        public DataSet getReporteTickets(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado)
        {
            //@fechaDesde varchar(10),@fechaHasta varchar(10),@idArea int,@idUsuario varchar(10),@idSucursal int, @idZona varchar(20),
            //@idLocal varchar(10), @idEstado int
            DbCommand cmd = db.GetStoredProcCommand("stp_ReporteTickets");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }
            
            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }
            
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el reporte de OT, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el reporte de OT, " + ex.Message, ex);
            }
        }


        public DataSet getReporteTicketsPorUsuario(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_ReporteTicketsPorUsuario");
            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el reporte de usuarios, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el reporte de usuarios, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarGestionesExporte(string idUsuario, string fechaDesde, string fechaHasta, string campo1, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarGestionesExporte");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }


            if (campo1 == "0")
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, campo1);
            }


            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
        }



        public DataSet getGraficoGestiones(string idUsuario, string fechaDesde, string fechaHasta, string campo1, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_GraficoContarGestiones");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (campo1 == "0")
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@campo1", DbType.String, campo1);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarGestionesDeriva(string idEstatus, string idSubEstatus, string idEstatusSeguimiento)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarDerivaPorGestion");

            db.AddInParameter(cmd, "@idEstatus", DbType.String, idEstatus);
            db.AddInParameter(cmd, "@idSubEstatus", DbType.String, idSubEstatus);
            db.AddInParameter(cmd, "@idEstatusSeguimiento", DbType.String, idEstatusSeguimiento);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarDetalleGestiones(string idTipificacion, string idUsuario, string tipo, string idCanal,
            string fechaDesde, string fechaHasta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarGestionesPorIdTipificacion");
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (tipo == "0")
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            }

            if (idCanal == "0")
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, idCanal);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el detalle de las gestiones, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el detalle de las gestiones, " + ex.Message, ex);
            }
        }

        //gestion
        public string setIngresarGestion(string idUsuario, string idEstatus, string idSubEstatus,
            string idEstatusSeguimiento, string idCampo1, string idCampo2, string idCampo3, string idCampo4,
            string idCampo5, string textoCampo1, string textoCampo2, string textoCampo3,
            string textoCampo4, string textoCampo5, string observacion,
            string telefonoAsociado, string idCanal, string ruta, string ruta2, string ruta3,
            string fechaAgend, string tipo, string llamadoID, string llamadoRut)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarGestion");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            db.AddInParameter(cmd, "@idEstatus", DbType.String, idEstatus);
            db.AddInParameter(cmd, "@idSubEstatus", DbType.String, idSubEstatus);
            db.AddInParameter(cmd, "@idEstatusSeguimiento", DbType.String, idEstatusSeguimiento);
            db.AddInParameter(cmd, "@idCampo1", DbType.String, idCampo1);
            db.AddInParameter(cmd, "@idCampo2", DbType.String, idCampo2);
            db.AddInParameter(cmd, "@idCampo3", DbType.String, idCampo3);
            db.AddInParameter(cmd, "@idCampo4", DbType.String, idCampo4);
            db.AddInParameter(cmd, "@idCampo5", DbType.String, idCampo5);
            db.AddInParameter(cmd, "@textoCampo1", DbType.String, textoCampo1);
            db.AddInParameter(cmd, "@textoCampo2", DbType.String, textoCampo2);
            db.AddInParameter(cmd, "@textoCampo3", DbType.String, textoCampo3);
            db.AddInParameter(cmd, "@textoCampo4", DbType.String, textoCampo4);
            db.AddInParameter(cmd, "@textoCampo5", DbType.String, textoCampo5);

            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);
            db.AddInParameter(cmd, "@telefonoAsociado", DbType.String, telefonoAsociado);
            db.AddInParameter(cmd, "@idCanal", DbType.String, idCanal);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);
            db.AddInParameter(cmd, "@ruta2", DbType.String, ruta2);
            db.AddInParameter(cmd, "@ruta3", DbType.String, ruta3);
            db.AddInParameter(cmd, "@fechaAgend", DbType.String, fechaAgend);
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);

            db.AddInParameter(cmd, "@llamadoID", DbType.String, llamadoID);
            db.AddInParameter(cmd, "@llamadoRut", DbType.String, llamadoRut);
            try
            {
                string valor;
                valor = db.ExecuteScalar(cmd).ToString();
                return valor;
                //db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
        }


        //gestion
        public string setIngresarGestionInicial(string idUsuario, string telefonoAsociado,
            string llamadoId, string llamadorRut, string llamadoParam1, string llamadoParam2)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresoGestionInicial");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            db.AddInParameter(cmd, "@telefonoAsociado", DbType.String, telefonoAsociado);
            db.AddInParameter(cmd, "@llamadoId", DbType.String, llamadoId);
            db.AddInParameter(cmd, "@llamadorRut", DbType.String, llamadorRut);
            db.AddInParameter(cmd, "@llamadoParam1", DbType.String, llamadoParam1);
            db.AddInParameter(cmd, "@llamadoParam2", DbType.String, llamadoParam2);

            try
            {
                string valor;
                valor = db.ExecuteScalar(cmd).ToString();
                return valor;
                //db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
        }


        public void setEditarGestion(string idGestion, string idUsuario, string idCampo1, string idCampo2, string idCampo3, string idCampo4,
            string idCampo5, string textoCampo1, string textoCampo2, string textoCampo3,
            string textoCampo4, string textoCampo5, string observacion,
            string telefonoAsociado, string idCanal, string ruta,
            string fechaAgend, string tipo, string llamadoID, string llamadoRut, string idTicketInsistencia,
            string idEmpresa, string usuarioFirma, string rutCliente, string idTipificacion, string nivel1)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarGestion");

            db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            db.AddInParameter(cmd, "@idCampo1", DbType.String, idCampo1);
            db.AddInParameter(cmd, "@idCampo2", DbType.String, idCampo2);
            db.AddInParameter(cmd, "@idCampo3", DbType.String, idCampo3);
            db.AddInParameter(cmd, "@idCampo4", DbType.String, idCampo4);
            db.AddInParameter(cmd, "@idCampo5", DbType.String, idCampo5);
            db.AddInParameter(cmd, "@textoCampo1", DbType.String, textoCampo1);
            db.AddInParameter(cmd, "@textoCampo2", DbType.String, textoCampo2);
            db.AddInParameter(cmd, "@textoCampo3", DbType.String, textoCampo3);
            db.AddInParameter(cmd, "@textoCampo4", DbType.String, textoCampo4);
            db.AddInParameter(cmd, "@textoCampo5", DbType.String, textoCampo5);

            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);
            db.AddInParameter(cmd, "@telefonoAsociado", DbType.String, telefonoAsociado);
            db.AddInParameter(cmd, "@idCanal", DbType.String, idCanal);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);
            db.AddInParameter(cmd, "@fechaAgend", DbType.String, fechaAgend);
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);

            db.AddInParameter(cmd, "@llamadoID", DbType.String, llamadoID);
            db.AddInParameter(cmd, "@llamadoRut", DbType.String, llamadoRut);
            db.AddInParameter(cmd, "@idTicketInsistencia", DbType.String, idTicketInsistencia);
            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            db.AddInParameter(cmd, "@usuarioFirma", DbType.String, usuarioFirma);
            db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la gestión, " + ex.Message, ex);
            }
        }


        public void setEditarRutaFotoUsuario(int idUsuario, string ruta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarRutaFotoUsuario");

            db.AddInParameter(cmd, "@idUsuario", DbType.Int16, idUsuario);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la gestion, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la gestión, " + ex.Message, ex);
            }
        }


        public void setEditarRutaArchivoGestion(int idGestion, string ruta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarRutaArchivoGestion");

            db.AddInParameter(cmd, "@idGestion", DbType.Int16, idGestion);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la gestion, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la gestión, " + ex.Message, ex);
            }
        }

        public void setEditarRutaArchivoGestion2(int idGestion, string ruta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarRutaArchivoGestion2");

            db.AddInParameter(cmd, "@idGestion", DbType.Int16, idGestion);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la gestion, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la gestión, " + ex.Message, ex);
            }
        }

        public void setEditarRutaArchivoAtencionHistorico(int idAtencion, int Correlativo, string ruta1, string ruta2, string rutaOT)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarAtencionHistoricoRutaArchivo");

            db.AddInParameter(cmd, "@idAtencion", DbType.Int16, idAtencion);
            db.AddInParameter(cmd, "@correlativo", DbType.Int16, Correlativo);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta1);
            db.AddInParameter(cmd, "@ruta2", DbType.String, ruta2);
            db.AddInParameter(cmd, "@ruta3", DbType.String, rutaOT);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la ruta dle historico, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la ruta del historico, " + ex.Message, ex);
            }
        }


        public string setIngresarTicket(string rutCliente, string idUsuarioAsignado, string idUsuarioCreacion,
            string idEstadoAtencion,
            string observacion, string idEmpleado, string idGestion, string idMarca,
            string idSucursal, string tipo, string nivel1, string idEmpresa, string idTipificacion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTicket");
            db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);
            db.AddInParameter(cmd, "@idUsuarioAsignado", DbType.String, idUsuarioAsignado);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@idEstadoAtencion", DbType.String, idEstadoAtencion);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);
            db.AddInParameter(cmd, "@idEmpleado", DbType.String, idEmpleado);
            db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);
            db.AddInParameter(cmd, "@idMarca", DbType.String, idMarca);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);




            try
            {
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarClientePrincipal(string razonSocial, string rut)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarClientePrincipal");

            if (razonSocial == "")
            {
                db.AddInParameter(cmd, "@razonSocial", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@razonSocial", DbType.String, "%" + razonSocial + "%");
            }

            if (rut == "")
            {
                db.AddInParameter(cmd, "@rut", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@rut", DbType.String, "%" + rut + "%");
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el cliente, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el cliente, " + ex.Message, ex);
            }
        }


        public void setIngresarContacto(string nomContacto, string rutCliente, string email1,
            string email2, string celular, string telefono1, string telefono2)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarContacto");
            db.AddInParameter(cmd, "@nomContacto", DbType.String, nomContacto);
            db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);
            db.AddInParameter(cmd, "@email1", DbType.String, email1);
            db.AddInParameter(cmd, "@email2", DbType.String, email2);
            db.AddInParameter(cmd, "@celular", DbType.String, celular);
            db.AddInParameter(cmd, "@telefono1", DbType.String, telefono1);
            db.AddInParameter(cmd, "@telefono2", DbType.String, telefono2);
            //db.AddInParameter(cmd, "@cargo", DbType.String, cargo);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el contacto, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el contacto, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarContacto(string rutCliente)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarContacto");
            db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar contacto, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar contacto, " + ex.Message, ex);
            }
        }


        public void setIngresarCliente(string rutCliente, string nombre, string idUsuarioCreacion, string fono, string celular, string email, string activo, string comuna, string direccion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarCliente");
            db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@fono", DbType.String, fono);
            db.AddInParameter(cmd, "@celular", DbType.String, celular);
            db.AddInParameter(cmd, "@email", DbType.String, email);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);

            db.AddInParameter(cmd, "@comuna", DbType.String, comuna);
            db.AddInParameter(cmd, "@direccion", DbType.String, direccion);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el cliente, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el cliente, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarClientePorRut(string rut)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarClientePorRut");
            db.AddInParameter(cmd, "@rut", DbType.String, rut);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el cliente, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el cliente, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarTicketBuscador(string idAtencion, string nombre, string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscador");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, "%" + idAtencion + "%");

            if (nombre == string.Empty)
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, "%" + nombre + "%");
            }

            if (idUsuario == string.Empty)
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarTicketBuscadorPorIdTicketUsuario(string idAtencion, string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorPorIdTicketIdUsuario");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }






        public DataSet getBuscarTicketBuscadorPorIdTicket(string idAtencion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorPorIdTicket");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTicketBuscadorPorCliente(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorPorCliente");

            if (nombre == string.Empty)
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, "%" + nombre + "%");
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTicketBuscadorPorRut(string rut)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorPorRut");

            if (rut == string.Empty)
            {
                db.AddInParameter(cmd, "@rutCliente", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@rutCliente", DbType.String, rut);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }
        
        public DataSet getBuscarTicketBuscadorParametros(string idUsuarioCreacion, string usuarioAsig, string fechaDesde, string fechaHasta, 
            string idEstado, string clase, string idArea, string idSucursal, string idTicket, string codLocal, string idCategoriaServicio)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorParametros");

            if (usuarioAsig == "0" || usuarioAsig == string.Empty)
            {
                db.AddInParameter(cmd, "@usuarioAsig", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@usuarioAsig", DbType.String, usuarioAsig);
            }


            if (idUsuarioCreacion == "0" || idUsuarioCreacion == string.Empty)
            {
                db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            }


            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            if (clase == "0")
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, clase);
            }
            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }
            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }
            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (codLocal == "0")
            {
                db.AddInParameter(cmd, "@codLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@codLocal", DbType.String, codLocal);
            }
            
            if (idTicket == string.Empty)
            {
                db.AddInParameter(cmd, "@idTicket", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);
            }

            if (idCategoriaServicio == "0")
            {
                db.AddInParameter(cmd, "@idCategoriaServicio", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCategoriaServicio", DbType.String, idCategoriaServicio);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }
        
        //        (@idGestion varchar(10),@rutCliente varchar(20),@nombreCliente varchar(100),
        //@fechaDesde varchar(10),@fechaHasta varchar(10),@idEmpresa varchar(10),@idCanal varchar(10))

        public DataSet getBuscarGestionesBuscador(string idUsuario, string idGestion, string rutCliente, string nombreCliente, string fechaDesde, string fechaHasta, string idEmpresa, string idCanal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarGestionesUsuario");

            if (idUsuario == string.Empty)
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idGestion == string.Empty)
            {
                db.AddInParameter(cmd, "@idGestion", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);
            }

            if (rutCliente == string.Empty)
            {
                db.AddInParameter(cmd, "@rutCliente", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@rutCliente", DbType.String, rutCliente);
            }


            if (nombreCliente == string.Empty)
            {
                db.AddInParameter(cmd, "@nombreCliente", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nombreCliente", DbType.String, "%" + nombreCliente + "%");
            }

            if (idEmpresa == "0")
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            }

            if (idCanal == "0")
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCanal", DbType.String, idCanal);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTipificacionesPorIdEstatus(string idEstatus, string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTipificacionPorIdEstatus");


            if (string.IsNullOrEmpty(idEstatus))
            {
                db.AddInParameter(cmd, "@nivel1", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@nivel1", DbType.String, idEstatus);
            }

            if (string.IsNullOrEmpty(idUsuario))
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
        }












        public DataSet getBuscarEstadoAtencion()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarEstadoAtencion");

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el estado, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el estado, " + ex.Message, ex);
            }
        }

        

        public DataSet getBuscarTicketBuscadorParametrosExporte(string idUsuarioCreacion, string usuarioAsig, string fechaDesde, string fechaHasta,
            string idEstado, string clase, string idArea, string idSucursal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketBuscadorParametrosExporte");

            if (usuarioAsig == "0" || usuarioAsig == string.Empty)
            {
                db.AddInParameter(cmd, "@usuarioAsig", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@usuarioAsig", DbType.String, usuarioAsig);
            }


            if (idUsuarioCreacion == "0" || idUsuarioCreacion == string.Empty)
            {
                db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            }


            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            if (clase == "0")
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, clase);
            }
            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }
            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }
            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarTicketResumen(string fechaDesde, string fechaHasta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketResumen");

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarPerfil(string nombre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarPerfil");
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el perfil, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el perfil, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarArea()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarArea");

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el area, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el area, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTicket(string idAtencion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicket");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTicketHistorico(string idAtencion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarTicketHistorico");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarUsuarioPorIdPerfil(string idPerfil)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarUsuarioPorIdPerfil");
            db.AddInParameter(cmd, "@idPerfil", DbType.String, idPerfil);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar usuario, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarGestionPorIdTicket(string idTicket)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarGestionPorIdTicket");
            db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }



        public DataSet getBuscarUsuarioPorId(string id)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarUsuarioPorId");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, id);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el ticket, " + ex.Message, ex);
            }
        }





        public DataSet getBuscarConfiguracionExporte()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarConfiguracionExporte");

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la configuracion, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la configuracion, " + ex.Message, ex);
            }
        }

        //


        public DataSet getBuscarTipificacionPorIdEstatusIdSubEstatusIdEstatusGestion(string nivel1, string nivel2, string nivel3, string nivel4)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTipificacionPorNivel1Nivel2Nivel3Nivel4");
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            db.AddInParameter(cmd, "@nivel3", DbType.String, nivel3);
            db.AddInParameter(cmd, "@nivel4", DbType.String, nivel4);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
        }

        //
        public DataSet getBuscarTipificacionPorId(string idTipificacion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTipificacionPorId");
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la tipificación, " + ex.Message, ex);
            }
        }




        public string setIngresarTicketHistorico(string idAtencion, string idUsuarioCreacion, string idUsuarioAsignado,
            string idEstadoAtencion, string observacion, string fechaAgend)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTicketHistorico");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@idUsuarioAsignado", DbType.String, idUsuarioAsignado);
            db.AddInParameter(cmd, "@idEstadoAtencion", DbType.String, idEstadoAtencion);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);

            if (fechaAgend == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, fechaAgend);
            }


            try
            {
                //db.ExecuteNonQuery(cmd);
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el ticket historico, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el ticket historico, " + ex.Message, ex);
            }
        }

        public void setEditarTicketInsistencia(string idTicket)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTicketInsistencia");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idTicket);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
        }


        public void setEditarTicket(string idTicket, string idEstado,
            string idEmpleado, string fechaAgend, string idMotivoCierre)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarTicket");
            db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);
            db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            db.AddInParameter(cmd, "@idEmpleado", DbType.String, idEmpleado);

            if (idMotivoCierre == string.Empty)
            {
                db.AddInParameter(cmd, "@idMotivoCierre", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idMotivoCierre", DbType.String, idMotivoCierre);
            }

            if (fechaAgend == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, fechaAgend);
            }

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el ticket, " + ex.Message, ex);
            }
        }


        public void setEditarEmailTicket(string idTicket, string idEmail)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarEmailTicket");
            db.AddInParameter(cmd, "@idEmail", DbType.String, idEmail);
            db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
        }
        
        public void setEditarGestionPorId(string idTicket, string idGestion,
            string observacion, string idCampo1, string idCampo2, string idCampo3,
            string idCampo4, string idCampo5)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarGestionPorId");
            db.AddInParameter(cmd, "@id", DbType.String, idTicket);
            db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);
            db.AddInParameter(cmd, "@idCampo1", DbType.String, idCampo1);
            db.AddInParameter(cmd, "@idCampo2", DbType.String, idCampo2);
            db.AddInParameter(cmd, "@idCampo3", DbType.String, idCampo3);
            db.AddInParameter(cmd, "@idCampo4", DbType.String, idCampo4);
            db.AddInParameter(cmd, "@idCampo5", DbType.String, idCampo5);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
        }

        public void setEditarGestion(string idGestion, string ruta)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarGestionRutaArchivo");
            db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);
            db.AddInParameter(cmd, "@ruta", DbType.String, ruta);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la gestión, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la gestión, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarTipoMotivoCierre()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTipoMotivoCierre");
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("Error al buscar el tipo motivo cierre, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar el tipo motivo cierre, " + ex.Message, ex);
            }
        }

        //buscar configuración - sjara

        public DataSet getBuscarConfiguracion()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_buscarConfiguracion");
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("Error al buscar la configuración, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar la configuración, " + ex.Message, ex);
            }
        }

        public void setEditarConfiguracion(string idTipificacion, string clase, string idArea, string nivel1, string nivel2, string nivel3, string nivel4 )
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarConfiguracion");

            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);
            db.AddInParameter(cmd, "@clase", DbType.String, clase);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            db.AddInParameter(cmd, "@nivel3", DbType.String, nivel3);
            db.AddInParameter(cmd, "@nivel4", DbType.String, nivel4);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la cofiguración, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la configuración, " + ex.Message, ex);
            }
        }




        public DataSet getBuscarGrupo()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarGrupo");



            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la empresa, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la empresa, " + ex.Message, ex);
            }
        }


        //EMPRESA


        public DataSet getBuscarEmpresa(string idEmpresa)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarEmpresa");


            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la empresa, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la empresa, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarUsuarioPorIdArea(string idArea)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioPorIdArea");
            if (idArea == string.Empty)
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }

        
        public DataSet getBuscarEmailPorTicket(string idTicket)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarEmailPorTicket");
            if (idTicket == string.Empty)
            {
                db.AddInParameter(cmd, "@idTicket", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);
            }
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el email, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el email, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarUsuarioPorIdLocalIdPerfil(string idLocal, string idPerfil)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioPorIdLocalIdPerfil");

            db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            db.AddInParameter(cmd, "@idPerfil", DbType.String, idPerfil);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el usuario, " + ex.Message, ex);
            }
        }


        
        public DataSet getBuscarLocalAsignadoPorIdUsuarioIdPerfil(string IdUsuario, string idPerfil)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarLocalAsignadoPorIdUsuarioIdPerfil");

            db.AddInParameter(cmd, "@IdUsuario", DbType.String, IdUsuario);
            //db.AddInParameter(cmd, "@idPerfil", DbType.String, idPerfil);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el Local, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el Local, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarUsuarioAsignadoPorIdLocalIdPerfil(string IdLocal, string idPerfil, string idArea)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarUsuarioAsignadoPorIdLocalIdPerfil");

            db.AddInParameter(cmd, "@IdLocal", DbType.String, IdLocal);
            db.AddInParameter(cmd, "@idPerfil", DbType.String, idPerfil);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el Local, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el Local, " + ex.Message, ex);
            }
        }
        
        public DataSet getBuscarAVGTiempoResolucion(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado, string tipo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarAVGTiempoResolucion");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }

            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el reporte de OT's, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el reporte de ot, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarTicketExporte(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarTicketExporte");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }


            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el reporte de tickets, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el reporte de tickets, " + ex.Message, ex);
            }
        }

        public void setEliminarGestion(string idGestion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarGestion");

            db.AddInParameter(cmd, "@idGestion", DbType.String, idGestion);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la gestión, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la gestión, " + ex.Message, ex);
            }
        }


        public void setEliminarOT(string idOt)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarOT");

            db.AddInParameter(cmd, "@idOt", DbType.String, idOt);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la OT, ERROR: " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la OT, ERROR: " + ex.Message, ex);
            }
        }


        public void setEliminarTicket(string idTicket)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTicket");

            db.AddInParameter(cmd, "@idTicket", DbType.String, idTicket);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar el ticket, " + ex.Message, ex);
            }
        }

        

        public DataSet getBuscarLocalPorId(string idLocal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarLocalPorId");

            db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el local, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el local, " + ex.Message, ex);
            }
        }

        
        public DataSet getBuscarLocalPorCod(string codLocal)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarLocalPorCod");

            db.AddInParameter(cmd, "@codLocal", DbType.String, codLocal);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el local, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el local, " + ex.Message, ex);
            }
        }


        public DataSet getBuscarZona(string idZona, string nombreZona)
        {
       
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarZona");

            db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            db.AddInParameter(cmd, "@nombreZona", DbType.String, nombreZona);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
        }

        
        public DataSet getBuscarLocalPorZona(string idZona, string idCoordinador)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarLocalPorZona");
            if (idZona=="0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }
            if (idCoordinador == "0")
            {
                db.AddInParameter(cmd, "@idCoordinador", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCoordinador", DbType.String, idCoordinador);
            }

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarZonaPorIdUsuario(string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarZonaPorIdUsuario");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar las zonas, " + ex.Message, ex);
            }
        }

        public DataSet getBuscarSucursal(string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarSucursal");
            db.AddInParameter(cmd, "@activo", DbType.String, activo);
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar las sucursales, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar las sucursales, " + ex.Message, ex);
            }
        }
        

        public string setIngresarOT(string idTipificacion, string idUsuarioCreacion, string idUsuarioAsignado,
            string idEstadoAtencion, string observacion, string tipo, string nivel1, string idEmpresa, string clase,
            string local, string telefonoAsociado, string solicitadoPor, 
            string idZona, string idArea,string fechaAgendamiento, string idSucursal, string idCategoriaServicio)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarOT");
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@idUsuarioAsignado", DbType.String, idUsuarioAsignado);
            db.AddInParameter(cmd, "@idEstadoAtencion", DbType.String, idEstadoAtencion);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);

            if (clase=="C")
            {
                db.AddInParameter(cmd, "@fechaAgendamiento", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaAgendamiento", DbType.String, fechaAgendamiento);
            }
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            db.AddInParameter(cmd, "@clase", DbType.String, clase);
            db.AddInParameter(cmd, "@local", DbType.String, local);
            db.AddInParameter(cmd, "@telefonoAsociado", DbType.String, telefonoAsociado);
            db.AddInParameter(cmd, "@solicitadoPor", DbType.String, solicitadoPor);
            db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);

            if (idCategoriaServicio=="0")
            {
                db.AddInParameter(cmd, "@idCategoriaServicio", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idCategoriaServicio", DbType.String, idCategoriaServicio);
            }
            

            try
            {
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la OT " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la OT " + ex.Message, ex);
            }
        }



        public void setEditarGestionPorId(string idTicket, string observacion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EditarGestionPorId");
            db.AddInParameter(cmd, "@id", DbType.String, idTicket);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);


            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar el ticket, " + ex.Message, ex);
            }
        }


        public void setEliminarTipificacion(string idTipificacion)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarTipificacion");
            db.AddInParameter(cmd, "@idTipificacion", DbType.String, idTipificacion);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar la mantencion, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar la mantencion, " + ex.Message, ex);
            }
        }
        
        public void setEliminarZonasPorUsuario(string idUsuario)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_EliminarZonasPorUsuario");
            db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);

            try
            {
                db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar las zonas del usuario, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar las zonas del usuario, " + ex.Message, ex);
            }
        }
        public string setIngresarTicketHistorico(string idAtencion, string idUsuarioCreacion, string idUsuarioAsignado,
            string idEstadoAtencion, string observacion, string fechaAgend, string obsCliente)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarTicketHistorico_13102016");
            db.AddInParameter(cmd, "@idAtencion", DbType.String, idAtencion);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@idUsuarioAsignado", DbType.String, idUsuarioAsignado);
            db.AddInParameter(cmd, "@idEstadoAtencion", DbType.String, idEstadoAtencion);
            db.AddInParameter(cmd, "@observacion", DbType.String, observacion);
            db.AddInParameter(cmd, "@obsCliente", DbType.String, obsCliente);
            if (fechaAgend == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaAgend", DbType.String, fechaAgend);
            }


            try
            {
                //db.ExecuteNonQuery(cmd);
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el ticket historico, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el ticket historico, " + ex.Message, ex);
            }
        }



        public void setIngresarMensaje(string idMensaje, string mensaje, string activo)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarMensaje");
            db.AddInParameter(cmd, "@idMensaje", DbType.String, idMensaje);
            db.AddInParameter(cmd, "@mensaje", DbType.String, mensaje);
            db.AddInParameter(cmd, "@activo", DbType.String, activo);
            try
            {
                db.ExecuteNonQuery(cmd);
                //string val = db.ExecuteScalar(cmd).ToString();
                //return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("Error al ingresar, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al ingresar, " + ex.Message, ex);
            }
        }

        public void setIngresarMantencion(string idEmpresa, string nivel1, string nivel2, 
            string nivel3 ,string nivel4, string clase, string idArea)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_IngresarMantencion");
            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            db.AddInParameter(cmd, "@nivel1", DbType.String, nivel1);
            db.AddInParameter(cmd, "@nivel2", DbType.String, nivel2);
            db.AddInParameter(cmd, "@nivel3", DbType.String, nivel3);
            db.AddInParameter(cmd, "@nivel4", DbType.String, nivel4);
            db.AddInParameter(cmd, "@clase", DbType.String, clase);
            db.AddInParameter(cmd, "@idArea", DbType.String, idArea);

            try
            {
                db.ExecuteNonQuery(cmd);
                //string val = db.ExecuteScalar(cmd).ToString();
                //return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("Error al ingresar, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al ingresar, " + ex.Message, ex);
            }
        }

        public DataSet getCantidadTicketPorTipoYArea(string idUsuario, string fechaDesde, string fechaHasta, string idArea, string idSucursal, string idZona,
            string idLocal, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_CantidadTicketPorTipoYArea");

            if (idUsuario == "0")
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idUsuario", DbType.String, idUsuario);
            }

            if (fechaDesde == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaDesde", DbType.String, fechaDesde);
            }

            if (fechaHasta == string.Empty)
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@fechaHasta", DbType.String, fechaHasta);
            }

            if (idArea == "0")
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idArea", DbType.String, idArea);
            }

            if (idSucursal == "0")
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            }

            if (idZona == "0")
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idZona", DbType.String, idZona);
            }

            if (idLocal == "0")
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idLocal", DbType.String, idLocal);
            }

            if (idEstado == "0")
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, null);
            }
            else
            {
                db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            }
            
            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo exportar las gestiones, " + ex.Message, ex);
            }
        }

    }
}
