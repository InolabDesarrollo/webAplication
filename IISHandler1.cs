﻿using System;
using System.Web;

namespace INOLAB_OC
{
    public class IISHandler1 : IHttpHandler
    {
        /// <summary>
        /// Debe configurar este controlador en el archivo Web.config de su 
        ///  web y registrarlo en IIS para poder usarlo. Para obtener más información
        /// consulte el vínculo siguiente: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Devuelve false si el controlador administrado no se puede reutilizar para otra solicitud.
            // Suele ser false si hay información de estado reservada por solicitud.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            //Escriba aquí la implementación del controlador.
        }

        #endregion
    }
}
