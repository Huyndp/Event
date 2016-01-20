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
    public class EventUsersController : ApiController
    {
        private EventEntities db = new EventEntities();

        // GET: api/EventUsers
        public IQueryable<EventUser> GetEventUsers()
        {
            return db.EventUsers;
        }

        // GET: api/EventUsers/5
        [ResponseType(typeof(EventUser))]
        public async Task<IHttpActionResult> GetEventUser(int id)
        {
            EventUser eventUser = await db.EventUsers.FindAsync(id);
            if (eventUser == null)
            {
                return NotFound();
            }

            return Ok(eventUser);
        }

        // PUT: api/EventUsers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutEventUser(int id, EventUser eventUser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != eventUser.EventID)
            {
                return BadRequest();
            }

            db.Entry(eventUser).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EventUserExists(id))
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

        // POST: api/EventUsers
        [ResponseType(typeof(EventUser))]
        public async Task<IHttpActionResult> PostEventUser(EventUser eventUser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.EventUsers.Add(eventUser);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (EventUserExists(eventUser.EventID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = eventUser.EventID }, eventUser);
        }

        // DELETE: api/EventUsers/5
        [ResponseType(typeof(EventUser))]
        public async Task<IHttpActionResult> DeleteEventUser(int id)
        {
            EventUser eventUser = await db.EventUsers.FindAsync(id);
            if (eventUser == null)
            {
                return NotFound();
            }

            db.EventUsers.Remove(eventUser);
            await db.SaveChangesAsync();

            return Ok(eventUser);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EventUserExists(int id)
        {
            return db.EventUsers.Count(e => e.EventID == id) > 0;
        }
    }
}