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
    
    public class DatosModCom
    {
        Database db = DatabaseFactory.CreateDatabase();

        public DataSet GetBuscarMaterial(string idMaterial)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_BuscarMaterial");

            db.AddInParameter(cmd, "@idMaterial", DbType.String, idMaterial);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
        }
        public DataSet GetBuscarMaterialPorTipo(string tipo)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_BuscarMaterialPorTipo");

            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
        }
        public DataSet GetBuscarMaterialPorSolicitud(int IdSolicitudMaterial)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_BuscarMaterialPorSolicitud");

            db.AddInParameter(cmd, "@IdSolicitudMaterial", DbType.String, IdSolicitudMaterial);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar el material, " + ex.Message, ex);
            }
        }

        public DataSet GetBuscarSolicitudCompraPorId(int idSolicitud)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_BuscarSolicitudCompraPorId");

            db.AddInParameter(cmd, "@idSolicitud", DbType.String, idSolicitud);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar la solicitud, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar la solicitud, " + ex.Message, ex);
            }
        }

        public DataSet GetBuscarTipoMaterial(int? idTipo)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_BuscarTipoMaterial");

            db.AddInParameter(cmd, "@idTipo", DbType.String, idTipo);

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar el tipo, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar  el tipo, " + ex.Message, ex);
            }
        }
        
        public void SetEliminarMaterial(string idMaterial)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_EliminarMaterial");
            db.AddInParameter(cmd, "@idMaterial", DbType.String, idMaterial);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar el material, " + ex.Message, ex);
            }
        }


        public void SetInUpMaterial(string idMaterial, string nombre, string tipo, string unidad,string idUsuarioIngreso, string idUsuarioModificacion)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_IngresarMaterial");

            db.AddInParameter(cmd, "@idMaterial", DbType.String, idMaterial);
            db.AddInParameter(cmd, "@nombre", DbType.String, nombre);
            db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
            db.AddInParameter(cmd, "@unidad", DbType.String, unidad);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioIngreso);
            db.AddInParameter(cmd, "@idUsuarioModificacion", DbType.String, idUsuarioModificacion);
            
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el material, " + ex.Message, ex);
            }
        }

        public string  SetInSolicitudCompra(string idEmpresa, string codObra, string idBodega, string idEstado, string idUsuarioAsignado, string idUsuarioCreacion, string idSucursal)
        {
            //@idEmpresa int,@codObra varchar(10),@idBodega int,@idEstado int,@idUsuarioAsignado int,@idUsuarioCreacion int,@idSucursal int
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_InSolicitudCompra");

            db.AddInParameter(cmd, "@idEmpresa", DbType.String, idEmpresa);
            db.AddInParameter(cmd, "@codObra", DbType.String, codObra);
            db.AddInParameter(cmd, "@idBodega", DbType.String, idBodega);
            db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            db.AddInParameter(cmd, "@idUsuarioAsignado", DbType.String, idUsuarioAsignado);
            db.AddInParameter(cmd, "@idUsuarioCreacion", DbType.String, idUsuarioCreacion);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);

            try
            {
                string val = db.ExecuteScalar(cmd).ToString();
                return val;
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar la solicitud, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar la solicitud, " + ex.Message, ex);
            }
        }


        public void SetUpSolicitudCompra(string idSolicitudMateriales, string idSucursal, string codObra, string idEstado)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_UpSolicitudCompra");

            db.AddInParameter(cmd, "@idSolicitudMateriales", DbType.String, idSolicitudMateriales);
            db.AddInParameter(cmd, "@idSucursal", DbType.String, idSucursal);
            db.AddInParameter(cmd, "@codObra", DbType.String, codObra);
            db.AddInParameter(cmd, "@idEstado", DbType.String, idEstado);
            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo editar la solicitud, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo editar la solicitud, " + ex.Message, ex);
            }
        }

        public void SetInMaterialSolicitud(string IdSolicitudMateriales, string idMaterial, string cantidad)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_InMaterialSolicitud");

            db.AddInParameter(cmd, "@IdSolicitudMateriales", DbType.String, IdSolicitudMateriales);
            db.AddInParameter(cmd, "@idMaterial", DbType.String, idMaterial);
            db.AddInParameter(cmd, "@cantidad", DbType.String, cantidad);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo ingresar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo ingresar el material, " + ex.Message, ex);
            }
        }
        public void SetDelMaterialSolicitud(string IdSolicitudMateriales, string correlativo)
        {
            DbCommand cmd = db.GetStoredProcCommand("Com_stp_EliminarMaterialSolicitud");

            db.AddInParameter(cmd, "@IdSolicitudMateriales", DbType.String, IdSolicitudMateriales);
            db.AddInParameter(cmd, "@correlativo", DbType.String, correlativo);

            try
            {
                db.ExecuteNonQuery(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo eliminar el material, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar el material, " + ex.Message, ex);
            }
        }
        
    }
}
