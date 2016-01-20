using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using YTicket.API2.Models;

namespace YTicket.API2.Controllers
{
    public class EventUserRolesController : ApiController
    {
        private EventEntities db = new EventEntities();

        // GET: api/EventUserRoles
        public IQueryable<EventUserRole> GetEventUserRoles()
        {
            return db.EventUserRoles;
        }

        // GET: api/EventUserRoles/5
        [ResponseType(typeof(EventUserRole))]
        public async Task<IHttpActionResult> GetEventUserRole(int id)
        {
            EventUserRole eventUserRole = await db.EventUserRoles.FindAsync(id);
            if (eventUserRole == null)
            {
                return NotFound();
            }

            return Ok(eventUserRole);
        }

        // PUT: api/EventUserRoles/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutEventUserRole(int id, EventUserRole eventUserRole)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != eventUserRole.ID)
            {
                return BadRequest();
            }

            db.Entry(eventUserRole).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EventUserRoleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/EventUserRoles
        [ResponseType(typeof(EventUserRole))]
        public async Task<IHttpActionResult> PostEventUserRole(EventUserRole eventUserRole)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.EventUserRoles.Add(eventUserRole);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = eventUserRole.ID }, eventUserRole);
        }

        // DELETE: api/EventUserRoles/5
        [ResponseType(typeof(EventUserRole))]
        public async Task<IHttpActionResult> DeleteEventUserRole(int id)
        {
            EventUserRole eventUserRole = await db.EventUserRoles.FindAsync(id);
            if (eventUserRole == null)
            {
                return NotFound();
            }

            db.EventUserRoles.Remove(eventUserRole);
            await db.SaveChangesAsync();

            return Ok(eventUserRole);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EventUserRoleExists(int id)
        {
            return db.EventUserRoles.Count(e => e.ID == id) > 0;
        }
    }
}