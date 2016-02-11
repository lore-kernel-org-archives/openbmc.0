Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C7FFD1A0038
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 17:48:40 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 10 Feb 2016 23:48:39 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 Feb 2016 23:48:38 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id BF17E3E40030
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 23:48:37 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1B6mbh328573696
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 23:48:37 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1B6mbQF013525
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 23:48:37 -0700
Received: from birb.localdomain ([9.83.0.6])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1B6mRRG013124; Wed, 10 Feb 2016 23:48:36 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id BE6A32286E20; Thu, 11 Feb 2016 17:48:24 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v2] Event Logs to survive a reboot
In-Reply-To: <1454987424-17512-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454987424-17512-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454987424-17512-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 11 Feb 2016 17:48:24 +1100
Message-ID: <877fibpwsn.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021106-0025-0000-0000-000021408211
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 06:48:41 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Chris Austen <austenc@us.ibm.com>
>
> The event service stores the events from the host.  Before this commit all the code was in memory.  That meant once a reboot occured you lost the logs.  With this commit I am storing all logs to the file system.  This refactoring also enables a test suite.  The suite can be invoked by 'make test; ./test'.
>
> 1) /var/sys/obmc/events/x

/var/sys ?

> --- /dev/null
> +++ b/event_messaged.C
> @@ -0,0 +1,58 @@
> +#include <iostream>
> +#include "message.H"
> +#include "event_messaged_sdbus.h"

missing (C) header.

> --- /dev/null
> +++ b/event_messaged_sdbus.c
> @@ -0,0 +1,442 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +#include "message.H"
> +#include "list.h"
> +#include "event_messaged_sdbus.h"
> +#include <syslog.h>
> +
> +/*****************************************************************************/
> +/* This set of functions are responsible for interactions with events over   */
> +/* dbus.  Logs come in a couple of different ways...                         */ 
> +/*     1) From the calls from acceptHostMessage, acceptTestMessage           */
> +/*     2) At startup and logs that exist alreafy are re-added                */
> +/*                                                                           */
> +/* event_record_t when loaded contain all strings and data stream for a log  */
> +/*                                                                           */
> +/* Functions naming convention                                               */
> +/*     prop_x    : callable dbus properties.                                 */
> +/*     method_x  : callable dbus functions.                                  */
> +/*                                                                           */
> +/*****************************************************************************/
> +
> +
> +
> +sd_bus      *bus   = NULL;
> +sd_bus_slot *slot  = NULL;
> +List        *glist = NULL;
> +
> +event_record_t *gCachedRec = NULL;
> +
> +static int remove_log_from_dbus(Node *node);
> +
> +typedef struct messageEntry_t {
> +
> +	size_t         logid;
> +	sd_bus_slot   *messageslot;
> +	sd_bus_slot   *deleteslot;
> +	event_manager *em;
> +
> +} messageEntry_t;
> +
> +
> +static void message_entry_close(messageEntry_t *m) {
> +	free(m);
> +	return;
> +}
> +
> +static void message_entry_new(messageEntry_t **m, uint16_t logid, event_manager *em) {
> +	*m          = malloc(sizeof(messageEntry_t));
> +	(*m)->logid = logid;
> +	(*m)->em    = em;
> +	return;
> +}
> +
> +// After calling this function the gCachedRec will be set
> +static event_record_t* message_record_open(event_manager *em, uint16_t logid) {
> +
> +	int r = 0;
> +	event_record_t *rec;
> +
> +	// A simple caching technique because each 
> +	// property needs to extract data from the
> +	// same data blob.  
> +	if (gCachedRec == NULL) {
> +		if (message_load_log(em, logid, &rec)) {
> +			gCachedRec = rec;
> +			return gCachedRec;
> +		} else 
> +			return NULL;
> +	}

trailing whitespace.


> +static int prop_message(sd_bus *bus,
> +                       const char *path,
> +                       const char *interface,
> +                       const char *property,
> +                       sd_bus_message *reply,
> +                       void *userdata,
> +                       sd_bus_error *error) {
> +
> +	int r=0;
> +	messageEntry_t *m = (messageEntry_t*) userdata;
> +	char *p;
> +	struct tm *tm_info;
> +    char buffer[32];
> +    event_record_t *rec;

Looks like indentation is inconsistent.

> +
> +	rec = message_record_open(m->em, m->logid);
> +
> +	if (!rec) {
> +		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
> +		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
> +        return -1;
> +	}
> +
> +	if (!strncmp("message", property, 7))
> +		p = rec->message;
> +	else if (!strncmp("severity", property, 8))
> +		p = rec->severity;
> +	else if (!strncmp("association", property, 11))
> +		p = rec->association;
> +	else if (!strncmp("reported_by", property, 11))
> +		p = rec->reportedby;
> +	else if (!strncmp("time", property, 4)) {
> +		tm_info = localtime(&rec->timestamp);
> +		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm_info);
> +		p    = buffer;
> +	}
> +	else
> +		p = "";
> +
> +	r = sd_bus_message_append(reply, "s", p);
> +	if (r < 0) {
> +	    fprintf(stderr,"Error building array for property %s\n", strerror(-r));
> +	}
> +
> +
> +	return r;
> +}
> +
> +
> +static int prop_message_dd(sd_bus *bus,
> +                       const char *path,
> +                       const char *interface,
> +                       const char *property,
> +                       sd_bus_message *reply,
> +                       void *userdata,
> +                       sd_bus_error *error) {
> +
> +    event_record_t *rec;
> +    messageEntry_t *m = (messageEntry_t*) userdata;
> +
> +
> +	rec = message_record_open(m->em, m->logid);
> +
> +	if (!rec) {
> +		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
> +        return -1;
> +    }
> +	return sd_bus_message_append_array(reply, 'y', rec->p, rec->n);
> +}
> +
> +/////////////////////////////////////////////////////////////
> +// Receives an array of bytes as an esel error log
> +// returns the messageid in 2 byte format
> +//  

trailing whitespace

> +//  S1 - Message - Simple sentence about the fail
> +//  S2 - Severity - How bad of a problem is this
> +//  S3 - Association - sensor path
> +//  ay - Detailed data - developer debug information
> +//
> +/////////////////////////////////////////////////////////////

Use /* */ for multi-line comments.

> +static int method_accept_host_message(sd_bus_message *m,
> +                                      void *userdata,
> +                                      sd_bus_error *ret_error) {
> +
> +	char *message, *severity, *association, *s;
> +	size_t   n = 4;
> +	uint8_t *p;
> +	int r;
> +	uint16_t logid;
> +	event_record_t rec;
> +	event_manager *em = (event_manager *) userdata;
> +
> +	r = sd_bus_message_read(m, "sss", &message, &severity, &association);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror(-r));
> +		return r;
> +	}
> +
> +	r = sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", strerror(-r));
> +		return r;
> +	}
> +
> +    rec.message     = (char*) message;
> +    rec.severity    = (char*) severity;
> +    rec.association = (char*) association;
> +    rec.reportedby  = (char*) "Host";
> +    rec.p           = (uint8_t*) p;
> +    rec.n           = n;
> +
> +    asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
> +	syslog(LOG_NOTICE, s);
> +	free(s);
> +
> +	logid = message_create_new_log_event(em, &rec);
> +
> +	if (logid) 
> +		r = send_log_to_dbus(em, logid);
> +
> +	return sd_bus_reply_method_return(m, "q", logid);
> +}
> +
> +
> +static int method_accept_test_message(sd_bus_message *m,
> +                                      void *userdata,
> +                                      sd_bus_error *ret_error) {
> +
> +	//  Random debug data including, ascii, null, >signed int, max
> +	uint8_t p[] = {0x30, 0x00, 0x13, 0x7F, 0x88, 0xFF};
> +	char *s;
> +	uint16_t logid;
> +	event_record_t rec;
> +	event_manager *em = (event_manager *) userdata;
> +
> +	rec.message     = (char*) "A Test event log just happened";
> +	rec.severity    = (char*) "Info";
> +	rec.association = (char*) "/org/openbmc/inventory/system/chassis/motherboard/dimm3 " \
> +	                          "/org/openbmc/inventory/system/chassis/motherboard/dimm2";
> +	rec.reportedby  = (char*) "Test";
> +	rec.p           = (uint8_t*) p;
> +	rec.n           = 6;
> +
> +
> +	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
> +	syslog(LOG_NOTICE, s);
> +	free(s);
> +
> +	logid = message_create_new_log_event(em, &rec);
> +	send_log_to_dbus(em, logid);
> +
> +	return sd_bus_reply_method_return(m, "q", logid);
> +}
> +
> +
> +static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +	Node *n;
> +	messageEntry_t *p;
> +	
> +	// This deletes one log at a time and seeing how the
> +	// list shrinks using the NULL works fine here
> +	while (n = list_get_next_node(glist, NULL)) {
> +		p = (messageEntry_t *) n->data;
> +		message_delete_log(p->em, p->logid);
> +		remove_log_from_dbus(n);
> +	}
> +
> +	return sd_bus_reply_method_return(m, "q", 0);
> +}
> +
> +
> +static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +
> +	Node *n = (Node*)userdata;
> +	messageEntry_t *p = (messageEntry_t *) n->data;
> +
> +	message_delete_log(p->em, p->logid);
> +	remove_log_from_dbus(n);
> +	return sd_bus_reply_method_return(m, "q", 0);
> +}
> +
> +
> +
> +static const sd_bus_vtable recordlog_vtable[] = {
> +	SD_BUS_VTABLE_START(0),
> +	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_METHOD("clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_VTABLE_END
> +};
> +
> +static const sd_bus_vtable log_vtable[] = {
> +	SD_BUS_VTABLE_START(0),   
> +	SD_BUS_PROPERTY("association",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("message",          "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("severity",         "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("reported_by",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("time",             "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("debug_data", "ay", prop_message_dd ,0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_VTABLE_END
> +};
> +
> +
> +static const sd_bus_vtable recordlog_delete_vtable[] = {
> +	SD_BUS_VTABLE_START(0),
> +	SD_BUS_METHOD("delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_VTABLE_END
> +};
> +
> +static int remove_log_from_dbus(Node *node) {
> +
> +	messageEntry_t *p = (messageEntry_t *) node->data;
> +	int r;
> +	char buffer[32];
> +
> +	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->logid);
> +
> +	printf("Attempting to delete %s\n", buffer);
> +
> +	r = sd_bus_emit_object_removed(bus, buffer);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
> +		return -1;
> +	}	
> +	sd_bus_slot_unref(p->messageslot);
> +	sd_bus_slot_unref(p->deleteslot);
> +
> +	message_entry_close(p);
> +	list_delete_node(glist, node);
> +
> +	return 0;
> +}
> +
> +int send_log_to_dbus(event_manager *em, const uint16_t logid) {
> +
> +	char loglocation[64];
> +	int r;
> +	messageEntry_t *m;
> +	Node *node;
> +
> +
> +	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
> +
> +	message_entry_new(&m, logid, em);
> +
> +	node = list_add_node(glist, m);
> +
> +	r = sd_bus_add_object_vtable(bus,
> +	                             &m->messageslot,
> +	                             loglocation,
> +	                             "org.openbmc.record",
> +	                             log_vtable,
> +	                             m);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
> +		message_entry_close(m);
> +		list_delete_last_node(glist);
> +		return 0;
> +	}
> +
> +	r = sd_bus_add_object_vtable(bus,
> +	                             &m->deleteslot,
> +	                             loglocation,
> +	                             "org.openbmc.Object.Delete",
> +	                             recordlog_delete_vtable,
> +	                             node);
> +	
> +	printf("Event Log added %s\n", loglocation);
> +
> +	r = sd_bus_emit_object_added(bus, loglocation);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
> +		return 0;
> +	}
> +
> +	return logid;
> +}
> +
> +
> +int start_event_monitor(void) {
> +
> +	int r;
> +
> +	for (;;) {
> +
> +		r = sd_bus_process(bus, NULL);
> +		if (r < 0) {
> +			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> +			break;
> +		}
> +
> +		if (r > 0)
> +			continue;
> +
> +		r = sd_bus_wait(bus, (uint64_t) -1);
> +		if (r < 0) {
> +			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> +			break;
> +		}
> +	}
> +
> +	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> +}
> +
> +
> +/* Only thing we are doing in this function is to get a connection on the dbus */
> +int build_bus(event_manager *em) {
> +
> +	int r = 0;
> +
> +	glist = list_create();
> +	/* Connect to the system bus */
> +	r = sd_bus_open_system(&bus);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Install the object */
> +	r = sd_bus_add_object_vtable(bus,
> +	                             &slot,
> +	                             "/org/openbmc/records/events",  /* object path */
> +	                             "org.openbmc.recordlog",   /* interface name */
> +	                             recordlog_vtable,
> +	                             em);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Take a well-known service name so that clients can find us */
> +	r = sd_bus_request_name(bus, "org.openbmc.records.events", 0);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> +	}	
> +	
> +	/* You want to add an object manager to support deleting stuff  */
> +	/* without it, dbus can show interfaces that no longer exist */
> +	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events");
> +	if (r < 0) {
> +		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
> +	}
> +
> +
> +	finish:
> +	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> +}
> +
> +void cleanup_event_monitor(void) {
> +	sd_bus_slot_unref(slot);
> +	sd_bus_unref(bus);
> +}
> \ No newline at end of file
> diff --git a/event_messaged_sdbus.h b/event_messaged_sdbus.h
> new file mode 100644
> index 0000000..69a00a6
> --- /dev/null
> +++ b/event_messaged_sdbus.h
> @@ -0,0 +1,14 @@
> +#include <stddef.h>
> +
> +#ifdef __cplusplus
> +extern "C"  {
> +#endif
> +	int start_event_monitor(void);
> +	int build_bus(event_manager *em);
> +	int send_log_to_dbus(event_manager *em, const uint16_t logid);
> +	void cleanup_event_monitor(void);
> +#ifdef __cplusplus
> +}
> +#endif
> +
> +
> diff --git a/message.C b/message.C
> new file mode 100644
> index 0000000..a3fe8b8
> --- /dev/null
> +++ b/message.C
> @@ -0,0 +1,291 @@
> +#include <iostream>
> +#include <fstream>
> +#include <iomanip>
> +#include <cstdint>
> +#include <string>
> +#include <sys/types.h> 
> +#include <dirent.h> 
> +#include <sstream>
> +#include <sys/stat.h>
> +#include <cstring>
> +#include "message.H"
> +#include <time.h>
> +#include <stddef.h>
> +#include <cstdio>
> +
> +const uint32_t g_eyecatcher = 0x4F424D43; // OBMC
> +const uint16_t g_version    = 1;
> +
> +struct logheader_t {
> +    uint32_t eyecatcher;
> +    uint16_t version;
> +    uint16_t logid;
> +    time_t   timestamp;
> +    uint16_t detailsoffset;
> +    uint16_t messagelen;
> +    uint16_t severitylen;
> +    uint16_t associationlen;
> +    uint16_t reportedbylen;
> +    uint16_t debugdatalen;
> +};
> +
> +
> +
> +event_manager::event_manager(string path) {
> +    uint16_t x;
> +
> +    eventpath = path;
> +
> +    latestid = 0;
> +    dirp = NULL;
> +    logcount = 0;
> +
> +    // examine the files being managed and advance latestid to that value
> +    while ( (x = next_log())  ) {
> +        logcount++;
> +        if ( x > latestid )
> +            latestid = x;
> +    }
> +
> +    return;
> +}

If there's an error reading dir, you'll return 0 into latestId and then
when a log is written, you'll overwrite log id 1.

> +
> +event_manager::~event_manager() {
> +
> +    if (dirp) {
> +        closedir(dirp);
> +    }
> +
> +    return;
> +}
> +
> +bool event_manager::is_file_a_log(string str) {
> +
> +    std::ostringstream buffer;
> +    ifstream f;
> +    logheader_t hdr;
> +
> +    if (!str.compare("."))
> +        return 0;
> +    if (!str.compare(".."))
> +        return 0;
> +
> +    buffer << eventpath << "/" << str;
> +
> +    f.open( buffer.str(), ios::binary);
> +
> +    if (!f.good()) {
> +        return 0;
> +    }
> +
> +    f.read((char*)&hdr, sizeof(hdr));

How do you handle EIO and others?

> +
> +    if (hdr.eyecatcher != g_eyecatcher)
> +        return 0;
> +
> +    return 1;

You're returning a number where the method returns bool.

> +}
> +
> +uint16_t event_manager::log_count(void) {
> +    return logcount;
> +}
> +uint16_t event_manager::latest_log_id(void) {
> +    return latestid;
> +}
> +uint16_t event_manager::new_log_id(void) {
> +    return ++latestid;
> +}

How are these going to cope if the underlying FS is modified?

> +void event_manager::next_log_refresh(void) {
> +    if (dirp) {
> +        closedir(dirp);
> +        dirp = NULL;
> +    }
> +    return;
> +}
> +
> +uint16_t event_manager::next_log(void) {
> +
> +    std::ostringstream buffer;
> +    struct dirent *ent;
> +    uint16_t id;
> +
> +
> +    if (dirp == NULL)
> +        dirp = opendir(eventpath.c_str());
> +
> +    if (dirp) {
> +        do {
> +            ent = readdir(dirp);
> +
> +            if (ent == NULL)
> +                break;
> +
> +            string str(ent->d_name);
> +
> +            if (is_file_a_log(str)) {
> +                id = (uint16_t) atoi(str.c_str());
> +                break;
> +            }
> +
> +        } while( 1 );

Why not use scandir instead?

> +    } else {
> +        cerr << "Error opening directory " << eventpath << endl;
> +        ent    = NULL;
> +        id = 0;
> +    }
> +
> +    if (ent == NULL) {
> +        closedir(dirp);
> +        dirp = NULL;
> +    }
> +
> +    return  ((ent == NULL) ? 0 : id);
> +}

What if directory is empty?

> +
> +
> +uint16_t event_manager::create(event_record_t *rec) {
> +
> +    rec->logid = new_log_id();
> +    rec->timestamp = time(NULL);
> +    return create_log_event(rec);
> +}
> +
> +inline uint16_t getlen(const char *s) {
> +    return (uint16_t) (1 + strlen(s));
> +}

Why not size_t - that's kind of what it's for.

> +size_t event_manager::get_managed_size(void) {
> +    DIR *dirp;
> +    std::ostringstream buffer;
> +    struct dirent *ent;
> +    ifstream f;
> +
> +    size_t db_size = 0;
> +
> +    dirp = opendir(eventpath.c_str());
> +
> +    if (dirp) {
> +        while ( (ent = readdir(dirp)) != NULL ) {
> +
> +            string str(ent->d_name);
> +
> +            if (is_file_a_log(str)) {
> +
> +                buffer.str("");
> +                buffer << eventpath << "/" << str.c_str();
> +
> +                f.open(buffer.str() , ios::in|ios::binary|ios::ate);
> +                db_size += f.tellg();
> +                f.close();
> +            }
> +        }
> +    }
> +
> +    closedir(dirp);
> +
> +    return  (db_size);
> +}
> +
> +uint16_t event_manager::create_log_event(event_record_t *rec) {
> +
> +    std::ostringstream buffer;
> +    ofstream myfile;
> +    logheader_t hdr = {0};
> +
> +    buffer << eventpath << "/" << int(rec->logid) ;
> +
> +    hdr.eyecatcher     = g_eyecatcher;
> +    hdr.version        = g_version;
> +    hdr.logid          = rec->logid;
> +    hdr.timestamp      = rec->timestamp;
> +    hdr.detailsoffset  = offsetof(logheader_t, messagelen);
> +    hdr.messagelen     = getlen(rec->message);
> +    hdr.severitylen    = getlen(rec->severity);
> +    hdr.associationlen = getlen(rec->association);
> +    hdr.reportedbylen  = getlen(rec->reportedby);
> +    hdr.debugdatalen   = rec->n;
> +
> +    myfile.open(buffer.str() , ios::out|ios::binary);
> +    myfile.write((char*) &hdr, sizeof(hdr));
> +    myfile.write((char*) rec->message, hdr.messagelen);
> +    myfile.write((char*) rec->severity, hdr.severitylen);
> +    myfile.write((char*) rec->association, hdr.associationlen);
> +    myfile.write((char*) rec->reportedby, hdr.reportedbylen);
> +    myfile.write((char*) rec->p, hdr.debugdatalen);
> +    myfile.close();
> +
> +    logcount++;
> +
> +    return rec->logid;
> +}

If you hit ENOSPC, you'll die really badly. Same with EIO and others.

with no limit on the number you can store, the host could just fill up
the BMC disk and probably cause it to not boot anymore.


> +int event_manager::open(uint16_t logid, event_record_t **rec) {
> +
> +    std::ostringstream buffer;
> +    ifstream f;
> +    logheader_t hdr;
> +
> +    buffer << eventpath << "/" << int(logid);
> +
> +    f.open( buffer.str(), ios::binary );
> +
> +    if (!f.good()) {
> +        return 0;
> +    }
> +
> +    *rec = new event_record_t;
> +
> +    f.read((char*)&hdr, sizeof(hdr));
> +
> +    (*rec)->logid     = hdr.logid;
> +    (*rec)->timestamp = hdr.timestamp;
> +
> +
> +    (*rec)->message = new char[hdr.messagelen];
> +    f.read((*rec)->message, hdr.messagelen);
> +
> +    (*rec)->severity = new char[hdr.severitylen];
> +    f.read((*rec)->severity, hdr.severitylen);
> +
> +    (*rec)->association = new char[hdr.associationlen];
> +    f.read((*rec)->association, hdr.associationlen);
> +
> +    (*rec)->reportedby = new char[hdr.reportedbylen];
> +    f.read((*rec)->reportedby, hdr.reportedbylen);
> +
> +    (*rec)->p = new uint8_t[hdr.debugdatalen];
> +    f.read((char*)(*rec)->p, hdr.debugdatalen);
> +    (*rec)->n = hdr.debugdatalen;
> +
> +
> +    f.close();
> +    return logid;
> +}

Endian conversion?

> +void event_manager::close(event_record_t *rec) {
> +
> +    delete[] rec->message;
> +    delete[] rec->severity;
> +    delete[] rec->association;
> +    delete[] rec->reportedby;
> +    delete[] rec->p;
> +    delete rec;
> +
> +    logcount--;
> +    return ;
> +}
> +
> +int event_manager::remove(uint16_t logid) {
> +
> +    std::stringstream buffer;
> +    string s;
> +
> +    buffer << eventpath << "/" << int(logid);
> +
> +    s = buffer.str();
> +    std::remove(s.c_str());
> +
> +    return 0;
> +}

Error handling?

> diff --git a/message.H b/message.H
> new file mode 100644
> index 0000000..96c7544
> --- /dev/null
> +++ b/message.H
> @@ -0,0 +1,89 @@
> +

(C) header missing

> +#include <dirent.h>
> +#include <time.h>
> +
> +#ifdef __cplusplus
> +    #include <cstdint>
> +    #include <string>
> +
> +    using namespace std;
> +
> +#else
> +    #include <stdint.h>
> +#endif
> +
> +
> +
> +#ifdef __cplusplus
> +    struct event_record_t {
> +#else     
> +    typedef struct _event_record_t {
> +#endif
> +        char *message;
> +        char *severity;
> +        char *association;
> +        char *reportedby;
> +        uint8_t *p;
> +        size_t n;
> +
> +        // These get filled in for you
> +        time_t  timestamp;        
> +        int16_t logid;
> +#ifdef __cplusplus
> +    };
> +
> +#else     
> +    } event_record_t;
> +#endif

Trailing whitespace. The #ifdef is incredibly ugly and you don't need it.

> diff --git a/test.C b/test.C
> new file mode 100644
> index 0000000..f731fd1
> --- /dev/null
> +++ b/test.C
> @@ -0,0 +1,114 @@
> +#include <iostream>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <string>
> +
> +#include "message.H"
> +
> +using namespace std;
> +
> +string eventspath = "./events";
> +
> +#define ASSERT(a,b,c)  if(b!=c) {cout << "ASSERT ERROR: line " <<
> __LINE__ << endl; exit(1);} else { cout << "Passed: " << a << endl;}

err... #include <assert.h>


-- 
Stewart Smith
OPAL Architect, IBM.
