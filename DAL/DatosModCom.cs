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

        public DataSet getBuscarMaterial(string idMaterial)
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


        public void setEliminarMaterial(string idMaterial)
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


        public void setInUpMaterial(string idMaterial, string nombre, string tipo, string unidad,string idUsuarioIngreso, string idUsuarioModificacion)
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
        
    }
}
