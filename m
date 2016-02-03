Return-Path: <dja@axtens.net>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D2C9F1A0204
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 16:48:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=kS9ugYKL; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id n128so510261pfn.3
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=RrNKqyOA3qIJ2OTEuCSB6fdEjXS9VhsM1ni9KD7hvFY=;
 b=kS9ugYKLsQbg8O3vD01loC7WxmczYjCVPtdm+DK3iZ7yXAaIsyZAr95czAoKOTxf1a
 hbffFkxMPO9bVypamFFoWDW4BbZmEwpOz028c3cmQLsn9IO09njwy2S8S0TKZQwvH1Y5
 vjEaJmvb5CwN4i2/9zZVpmCRLdMglk8ez/FUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=RrNKqyOA3qIJ2OTEuCSB6fdEjXS9VhsM1ni9KD7hvFY=;
 b=Y/wOFP2N9boVTdlAVduhaoeeJ8IgzAlEs1yMzKpH5Szm/bPxRGU5T1RDqt5VsJ59Hh
 WlmONhpgBmFsN7okDEp8tgEDOM8bkkiZ6q54AJiY0C2KjXF+xoSUuwEOKQQ2ivr3PXma
 /H5SL2yN5lS+hXou+l5pslmNX/I8l3X2YjoGxYXQXi+/jQbB8byTPZvzbme7LbaSndPy
 ey1rwtcIJcXGe6ImRD1Hbc/tuiu9PIM0XlAzA6aUig98XD7qn/KEl+TZQghq0APyax+Y
 kPAjTiw+rMTR/uw21MFd5AWYZhbDWih1qpg11mDahMKQEiyrr0fsbvAeQZJ3Chj6RvvI
 lW1w==
X-Gm-Message-State: AG10YOSPYvUDjnHj4QGnzHoYeWt28m1LJlgAL7yr8cj933nGB7DUGaWPs1/DVgncGDEpgA==
X-Received: by 10.98.93.84 with SMTP id r81mr53691850pfb.64.1454478511260;
 Tue, 02 Feb 2016 21:48:31 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id e1sm6632073pas.1.2016.02.02.21.48.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2016 21:48:30 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot
In-Reply-To: <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 03 Feb 2016 16:48:04 +1100
Message-ID: <877fimibu3.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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
X-List-Received-Date: Wed, 03 Feb 2016 05:48:36 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Chris Austen <austenc@us.ibm.com>
>
> The event service stores the events from the host.  Before this commit al=
l the code was in memory.  That meant once a reboot occured you lost the lo=
gs.  With this commit I am storing all logs to the file system.  This refac=
toring also enables a test suite.  The suite can be invoked by 'make test; =
./test'.
>
> 1) /var/sys/obmc/events/x
> 2) logs are stored in binary and saved

A couple of broad design questions, and apologies if I've missed some of
the 'backstory' here:

 - Can this log grow unboundedly? Do we need to support logrotate? Do we
   need to enable it now? Will this code deal with the file changing
   underneath it when it's rotated?

 - Is there a compelling reason to store the logs in binary? Can we
   store then in text? Or do we have existing tooling to decode them?

Regards,
Daniel
> 3) Each log now has a timestamp of when the log reached the service
> 4) I added a caching mechanism to reduce the io traffic if the the method=
 is simply being called to capture the next parameter
> 5) You will notice a mixture of c/c++.  This is because I want the test i=
nfrastructure to take advantage of c++ features
>
> Useful REST calls
> ~~~~~~~~~~~~~~~~~
> Note, dont forget to login first
>
> List all events
> curl -k https://bmc/org/openbmc/records/events/
>
> Create an event log for testing purposes
> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{=
\"data\": []}" https://bmc/org/openbmc/records/events/action/acceptTestMess=
age
>
> Delete an event
> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{=
\"data\": []}" https://bmc/org/openbmc/records/events/1/action/delete
>
> Delete all events
> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{=
\"data\": []}" https://bmc/org/openbmc/records/events/action/clear
> ---
>  Makefile               |  29 ++--
>  event_messaged.C       |  44 +++++
>  event_messaged.c       | 341 ---------------------------------------
>  event_messaged_sdbus.c | 425 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  event_messaged_sdbus.h |  14 ++
>  message.C              | 224 ++++++++++++++++++++++++++
>  message.H              |  60 +++++++
>  test.C                 |  92 +++++++++++
>  8 files changed, 878 insertions(+), 351 deletions(-)
>  create mode 100644 event_messaged.C
>  delete mode 100644 event_messaged.c
>  create mode 100644 event_messaged_sdbus.c
>  create mode 100644 event_messaged_sdbus.h
>  create mode 100644 message.C
>  create mode 100644 message.H
>  create mode 100644 test.C
>
> diff --git a/Makefile b/Makefile
> index 4c2ba9b..903ac06 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,27 +1,36 @@
> -TEST      =3D listfunc
> -OBJS_TEST =3D $(TEST).o
>=20=20
> -EXE     =3D event_messaged
> +TEST      =3D test
>=20=20
> -OBJS    =3D $(EXE).o   \
> -          list.o 	 \
> +EXE       =3D event_messaged
> +EXE_OBJS  =3D $(EXE).o message.o event_messaged_sdbus.o list.o
>=20=20
> +OBJS_TEST =3D $(TEST).o message.o
> +
> +CPPFLAGS  +=3D -g -fpic -Wall -std=3Dc++11
>=20=20
>  DEPPKGS =3D libsystemd
> -CC      ?=3D $(CROSS_COMPILE)gcc
>  INCLUDES +=3D $(shell pkg-config --cflags $(DEPPKGS))=20
>  LIBS +=3D $(shell pkg-config --libs $(DEPPKGS))
>=20=20
> +
> +
>  all: $(EXE)
>=20=20
>  %.o : %.c=20
>  	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
>=20=20
> -$(EXE): $(OBJS)
> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +%.o : %.C
> +	$(CXX) -c $< $(CPPFLAGS) -o $@
> +
> +
> +$(EXE): $(EXE_OBJS)
> +	$(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
> +
>=20=20
>  $(TEST): $(OBJS_TEST)
> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +	$(CXX) $^ $(LDFLAGS) -o $@
>=20=20
>  clean:
> -	rm -f $(OBJS) $(EXE) *.o *.d
> +	rm -f $(TEST) *.o *.so $(EXE)
> +
> +
> diff --git a/event_messaged.C b/event_messaged.C
> new file mode 100644
> index 0000000..4376431
> --- /dev/null
> +++ b/event_messaged.C
> @@ -0,0 +1,44 @@
> +#include <iostream>
> +#include "message.H"
> +#include "event_messaged_sdbus.h"
> +
> +const char *glogname =3D "/var/lib/obmc/events";
> +
> +using namespace std;
> +
> +
> +// Walk through all the saved logs and reload them in to dbus objects
> +// Needed because on a reboot the existing logs need to be reloaded
> +int load_existing_events(void) {
> +
> +    event_log_list log_list;
> +    uint16_t       logid=3D0;
> +
> +    while (message_get_next_log(&logid, &log_list)) {
> +        send_log_to_dbus(logid);
> +    }
> +=20=20=20=20
> +    return 0;
> +}
> +
> +int main(int argc, char *argv[]) {
> +
> +    int rc =3D 0;
> +
> +    if ((rc =3D build_bus()) < 0) {
> +        fprintf(stderr, "Event Messager failed to connect to dbus rc=3D%=
d", rc);
> +        goto finish;
> +    }
> +
> +    if ((rc =3D load_existing_events()) < 0) {
> +        fprintf(stderr, "Event Messager failed add previous logs to dbus=
 rc=3D%d", rc);
> +        goto finish;
> +    }
> +
> +    rc =3D start_event_monitor();
> +
> +    finish:
> +    cleanup_event_monitor();
> +
> +    return rc;
> +}
> \ No newline at end of file
> diff --git a/event_messaged.c b/event_messaged.c
> deleted file mode 100644
> index 0c75e3a..0000000
> --- a/event_messaged.c
> +++ /dev/null
> @@ -1,341 +0,0 @@
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -#include <stddef.h>
> -#include <systemd/sd-bus.h>
> -#include "list.h"
> -
> -uint16_t g_logid =3D 0;
> -sd_bus *bus =3D NULL;
> -List *glist;
> -
> -
> -int create_new_log_event(void *userdata,
> -                         const char *message,
> -                         const char *severity,
> -                         const char *association,
> -                         const char *reportedby,
> -                         uint8_t *p,
> -                         size_t n);
> -
> -typedef struct messageEntry_t {
> -	char    *message;
> -	char    *severity;
> -	char    *reportedby;
> -	char    *association;
> -	uint8_t *debugbytes;
> -	size_t   debuglength;
> -	size_t   logid;
> -
> -	sd_bus_slot *messageslot;
> -	sd_bus_slot *deleteslot;
> -
> -} messageEntry_t;
> -
> -
> -void message_storage_delete(messageEntry_t *m) {
> -
> -	char *path;
> -	int r;
> -
> -	asprintf(&path, "/org/openbmc/records/events/%d", m->logid);
> -
> -
> -	printf("Attempting to delete %s\n", path);
> -
> -	free(m->message);
> -	free(m->severity);
> -	free(m->reportedby);
> -	free(m->association);
> -	free(m->debugbytes);
> -
> -
> -	r =3D sd_bus_emit_object_removed(bus, path);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
> -		return;
> -	}
> -
> -	sd_bus_slot_unref(m->messageslot);
> -	sd_bus_slot_unref(m->deleteslot);
> -
> -	free(m);
> -
> -	return;
> -}
> -
> -
> -
> -void message_add(messageEntry_t **n,=20
> -                const char *message,
> -                const char *severity,
> -                const char *association,
> -                const char *reportedby,
> -                size_t      logid,
> -                uint8_t    *data,
> -                size_t      datalen)
> -{
> -
> -	messageEntry_t *p =3D *n =3D malloc(sizeof(messageEntry_t));
> -
> -	asprintf(&(*n)->message,     "%s", message);
> -	asprintf(&(*n)->severity,    "%s", severity);
> -	asprintf(&(*n)->association, "%s", association);
> -	asprintf(&(*n)->reportedby,  "%s", reportedby);
> -
> -	(*n)->logid       =3D logid;
> -	(*n)->debugbytes  =3D (uint8_t*) malloc (datalen);
> -	(*n)->debuglength =3D datalen;
> -	memcpy((*n)->debugbytes, data, datalen);
> -
> -	(*n)->messageslot =3D NULL;
> -	(*n)->deleteslot  =3D NULL;
> -	return;
> -}
> -
> -
> -static int get_message_dd(sd_bus *bus,
> -                          const char *path,
> -                          const char *interface,
> -                          const char *property,
> -                          sd_bus_message *reply,
> -                          void *userdata,
> -                          sd_bus_error *error) {
> -
> -	int r;
> -	messageEntry_t *p =3D (messageEntry_t *)userdata;
> -=09
> -	r =3D sd_bus_message_append_array(reply, 'y', p->debugbytes, p->debugle=
ngth);
> -	if (r < 0) {
> -	  printf("Error building array for property %s\n", strerror(-r));
> -	}
> -
> -	return r;
> -}
> -
> -
> -/////////////////////////////////////////////////////////////
> -// Receives an array of bytes as an esel error log
> -// returns the messageid in 2 byte format
> -//=20=20
> -//  S1 - Message - Simple sentence about the fail
> -//  S2 - Severity - How bad of a problem is this
> -//  S3 - Association - sensor path
> -//  ay - Detailed data - developer debug information
> -//
> -/////////////////////////////////////////////////////////////
> -static int method_accept_host_message(sd_bus_message *m,=20
> -                                      void *userdata,=20
> -                                      sd_bus_error *ret_error) {
> -
> -	char *message, *severity, *association;
> -	size_t   n =3D 4;
> -	uint8_t *p;
> -	int r;
> -
> -	r =3D sd_bus_message_read(m, "sss", &message, &severity, &association);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror=
(-r));
> -		return r;
> -	}
> -
> -	r =3D sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", =
strerror(-r));
> -		return r;
> -	}
> -
> -	create_new_log_event(userdata, message, severity, association, "Host", =
p, n);
> -
> -	return sd_bus_reply_method_return(m, "q", g_logid);
> -}
> -
> -
> -static int method_accept_test_message(sd_bus_message *m,=20
> -                                      void *userdata,=20
> -                                      sd_bus_error *ret_error) {
> -
> -	uint8_t p[] =3D {0x30, 0x32, 0x34, 0x36};
> -
> -	create_new_log_event(userdata, "Testing Message", "Info", "Association"=
, "Test", p, 4);
> -
> -	return sd_bus_reply_method_return(m, "q", g_logid);
> -}
> -
> -
> -static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_err=
or *ret_error) {
> -
> -	Node *n;
> -
> -	// This deletes one log at a time and seeing how the
> -	// list shrinks using the NULL works fine here
> -	while (n =3D list_get_next_node(glist, NULL)) {
> -		message_storage_delete(n->data);
> -		list_delete_node(glist, n);
> -	}
> -
> -	return sd_bus_reply_method_return(m, "q", 0);
> -}
> -
> -
> -static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_er=
ror *ret_error) {
> -
> -	Node *n =3D (Node*)userdata;
> -
> -	message_storage_delete(n->data);
> -	list_delete_node(glist, n);
> -
> -	return sd_bus_reply_method_return(m, "q", 0);
> -}
> -
> -
> -
> -static const sd_bus_vtable recordlog_vtable[] =3D {
> -	SD_BUS_VTABLE_START(0),
> -	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_mes=
sage, SD_BUS_VTABLE_UNPRIVILEGED),
> -	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_messag=
e, SD_BUS_VTABLE_UNPRIVILEGED),
> -	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIV=
ILEGED),
> -	SD_BUS_VTABLE_END
> -};
> -
> -static const sd_bus_vtable log_vtable[] =3D {
> -	SD_BUS_VTABLE_START(0),
> -	SD_BUS_PROPERTY("Association", "s", NULL, offsetof(messageEntry_t, asso=
ciation), SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("Message",  "s", NULL, offsetof(messageEntry_t, message=
), SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("Severity", "s", NULL, offsetof(messageEntry_t, severit=
y), SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("Reported_By", "s", NULL, offsetof(messageEntry_t, repo=
rtedby),  SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("DevelopmentData", "ay", get_message_dd,0, SD_BUS_VTABL=
E_PROPERTY_CONST),
> -	SD_BUS_VTABLE_END
> -};
> -
> -
> -static const sd_bus_vtable recordlog_delete_vtable[] =3D {
> -	SD_BUS_VTABLE_START(0),
> -	SD_BUS_METHOD("Delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPR=
IVILEGED),
> -	SD_BUS_VTABLE_END
> -};
> -
> -uint16_t get_new_log_number() {
> -	return ++g_logid;
> -}
> -
> -int create_new_log_event(void *userdata,
> -                         const char *message,
> -                         const char *severity,
> -                         const char *association,
> -                         const char *reportedby,
> -                         uint8_t *p,=20
> -                         size_t n) {
> -	char loglocation[64];
> -	int r;
> -	messageEntry_t *m;
> -	Node *node;
> -	uint16_t logid =3D get_new_log_number();
> -
> -
> -	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events=
/%d", logid);
> -
> -	message_add(&m, message, severity, association, reportedby, logid, p, n=
);
> -
> -	node =3D list_add_node(glist, m);
> -
> -	r =3D sd_bus_add_object_vtable(bus,
> -	                             &m->messageslot,
> -	                             loglocation,
> -	                             "org.openbmc.record",
> -	                             log_vtable,
> -	                             m);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation=
, strerror(-r));
> -		message_storage_delete(m);
> -		list_delete_last_node(glist);
> -		return 0;
> -	}
> -
> -	r =3D sd_bus_add_object_vtable(bus,
> -	                             &m->deleteslot,
> -	                             loglocation,
> -	                             "org.openbmc.Object.Delete",
> -	                             recordlog_delete_vtable,
> -	                             node);
> -
> -	printf("Event Log added %s\n", loglocation);
> -
> -	r =3D sd_bus_emit_object_added(bus, loglocation);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
> -		return 0;
> -	}
> -
> -
> -
> -	return logid;
> -}
> -
> -
> -int start_event_recording(void) {
> -
> -	int r;
> -
> -	sd_bus_slot *slot;
> -
> -	/* Connect to the user bus this time */
> -	r =3D sd_bus_open_system(&bus);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -
> -	/* Install the object */
> -	r =3D sd_bus_add_object_vtable(bus,
> -	                             &slot,
> -	                             "/org/openbmc/records/events",  /* object =
path */
> -	                             "org.openbmc.recordlog",   /* interface na=
me */
> -	                             recordlog_vtable,
> -	                             NULL);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -=09
> -	/* Take a well-known service name so that clients can find us */
> -	r =3D sd_bus_request_name(bus, "org.openbmc.records.events", 0);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -
> -	r =3D sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events=
") ;
> -	if (r < 0) {
> -		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
> -		return 0;
> -	}
> -
> -	for (;;) {
> -		r =3D sd_bus_process(bus, NULL);
> -		if (r < 0) {
> -			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> -			goto finish;
> -		}
> -		if (r > 0)
> -			continue;
> -
> -		r =3D sd_bus_wait(bus, (uint64_t) -1);
> -		if (r < 0) {
> -			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> -			goto finish;
> -		}
> -	}
> -	finish:
> -		sd_bus_slot_unref(slot);
> -		sd_bus_unref(bus);
> -
> -	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> -}
> -
> -
> -int main(int argc, char *argv[]) {
> -
> -	glist =3D list_create();
> -	return start_event_recording();
> -}
> \ No newline at end of file
> diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
> new file mode 100644
> index 0000000..fa83e5c
> --- /dev/null
> +++ b/event_messaged_sdbus.c
> @@ -0,0 +1,425 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +#include "message.H"
> +#include "list.h"
> +#include "event_messaged_sdbus.h"
> +
> +/***********************************************************************=
******/
> +/* This set of functions are responsible for interactions with events ov=
er   */
> +/* dbus.  Logs come in a couple of different ways...                    =
     */=20
> +/*     1) From the calls from acceptHostMessage, acceptTestMessage      =
     */
> +/*     2) At startup and logs that exist alreafy are re-added           =
     */
> +/*                                                                      =
     */
> +/* event_record_t when loaded contain all strings and data stream for a =
log  */
> +/*                                                                      =
     */
> +/* Functions naming convention                                          =
     */
> +/*     prop_x    : callable dbus properties.                            =
     */
> +/*     method_x  : callable dbus functions.                             =
     */
> +/*                                                                      =
     */
> +/***********************************************************************=
******/
> +
> +
> +
> +sd_bus      *bus   =3D NULL;
> +sd_bus_slot *slot  =3D NULL;
> +List        *glist =3D NULL;
> +
> +event_record_t *gCachedRec =3D NULL;
> +
> +static int remove_log_from_dbus(Node *node);
> +
> +typedef struct messageEntry_t {
> +
> +	size_t       logid;
> +	sd_bus_slot *messageslot;
> +	sd_bus_slot *deleteslot;
> +
> +} messageEntry_t;
> +
> +
> +static void message_entry_close(messageEntry_t *m) {
> +	free(m);
> +	return;
> +}
> +
> +static void message_entry_new(messageEntry_t **m, uint16_t logid) {
> +	*m          =3D malloc(sizeof(messageEntry_t));
> +	(*m)->logid =3D logid;
> +	return;
> +}
> +
> +// After calling this function the gCachedRec will be set
> +static event_record_t* message_record_open(uint16_t logid) {
> +
> +	int r =3D 0;
> +	event_record_t *rec;
> +
> +	// A simple caching technique because each=20
> +	// property needs to extract data from the
> +	// same data blob.=20=20
> +	if (gCachedRec =3D=3D NULL) {
> +		if (message_load_log(logid, &rec)) {
> +			gCachedRec =3D rec;
> +			return gCachedRec;
> +		} else=20
> +			return NULL;
> +	}=20
> +
> +	if (logid =3D=3D gCachedRec->logid) {
> +		r =3D 1;
> +
> +	} else {
> +		message_free_log(gCachedRec);
> +		gCachedRec =3D NULL;
> +
> +		r =3D message_load_log(logid, &rec);
> +		if (r)
> +			gCachedRec =3D rec;
> +	}
> +
> +	return (r ? gCachedRec : NULL);
> +}
> +
> +
> +
> +static int prop_message(sd_bus *bus,
> +                       const char *path,
> +                       const char *interface,
> +                       const char *property,
> +                       sd_bus_message *reply,
> +                       void *userdata,
> +                       sd_bus_error *error) {
> +
> +	int r=3D0;
> +	messageEntry_t *m =3D (messageEntry_t*) userdata;
> +	char *p;
> +	struct tm *tm_info;
> +    char buffer[32];
> +    event_record_t *rec;
> +
> +	rec =3D message_record_open(m->logid);
> +
> +	if (!rec) {
> +		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
> +		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find l=
og file");
> +        return -1;
> +	}
> +
> +	if (!strncmp("Message", property, 7))=20
> +		p =3D rec->message;
> +	else if (!strncmp("Severity", property, 8))
> +		p =3D rec->severity;
> +	else if (!strncmp("Association", property, 11))
> +		p =3D rec->association;
> +	else if (!strncmp("Reported_By", property, 11))
> +		p =3D rec->reportedby;
> +	else if (!strncmp("Time", property, 4)) {
> +		tm_info =3D localtime(&rec->timestamp);
> +		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm_info);
> +		p    =3D buffer;
> +	}
> +	else
> +		p =3D "";
> +
> +	r =3D sd_bus_message_append(reply, "s", p);
> +	if (r < 0) {
> +	    fprintf(stderr,"Error building array for property %s\n", strerror(-=
r));
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
> +    messageEntry_t *m =3D (messageEntry_t*) userdata;
> +
> +	rec =3D message_record_open(m->logid);
> +
> +	if (!rec) {
> +		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find l=
og file");
> +        return -1;
> +    }
> +	return sd_bus_message_append_array(reply, 'y', rec->p, rec->n);
> +}
> +
> +/////////////////////////////////////////////////////////////
> +// Receives an array of bytes as an esel error log
> +// returns the messageid in 2 byte format
> +//=20=20
> +//  S1 - Message - Simple sentence about the fail
> +//  S2 - Severity - How bad of a problem is this
> +//  S3 - Association - sensor path
> +//  ay - Detailed data - developer debug information
> +//
> +/////////////////////////////////////////////////////////////
> +static int method_accept_host_message(sd_bus_message *m,
> +                                      void *userdata,
> +                                      sd_bus_error *ret_error) {
> +
> +	char *message, *severity, *association;
> +	size_t   n =3D 4;
> +	uint8_t *p;
> +	int r;
> +	uint16_t logid;
> +	event_record_t rec;
> +
> +	r =3D sd_bus_message_read(m, "sss", &message, &severity, &association);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror=
(-r));
> +		return r;
> +	}
> +
> +	r =3D sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", =
strerror(-r));
> +		return r;
> +	}
> +
> +    rec.message     =3D (char*) message;
> +    rec.severity    =3D (char*) severity;
> +    rec.association =3D (char*) association;
> +    rec.reportedby  =3D (char*) "Host";
> +    rec.p           =3D (uint8_t*) p;
> +    rec.n           =3D n;
> +
> +
> +	logid =3D message_create_new_log_event(&rec);
> +
> +	if (logid)=20
> +		r =3D send_log_to_dbus(logid);
> +
> +	return sd_bus_reply_method_return(m, "q", logid);
> +}
> +
> +
> +static int method_accept_test_message(sd_bus_message *m,
> +                                      void *userdata,=20
> +                                      sd_bus_error *ret_error) {
> +
> +	uint8_t p[] =3D {0x30, 0x32, 0x34, 0x36};
> +	uint16_t logid;
> +	event_record_t rec;
> +
> +    rec.message     =3D (char*) "Testing Message";
> +    rec.severity    =3D (char*) "Info";
> +    rec.association =3D (char*) "Association";
> +    rec.reportedby  =3D (char*) "Test";
> +    rec.p           =3D (uint8_t*) p;
> +    rec.n           =3D sizeof(*p);
> +
> +	logid =3D message_create_new_log_event(&rec);
> +	send_log_to_dbus(logid);
> +
> +	return sd_bus_reply_method_return(m, "q", logid);
> +}
> +
> +
> +static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_err=
or *ret_error) {
> +	Node *n;
> +	messageEntry_t *p;
> +=09
> +	// This deletes one log at a time and seeing how the
> +	// list shrinks using the NULL works fine here
> +	while (n =3D list_get_next_node(glist, NULL)) {
> +		p =3D (messageEntry_t *) n->data;
> +		message_delete_log(p->logid);
> +		remove_log_from_dbus(n);
> +	}
> +
> +	return sd_bus_reply_method_return(m, "q", 0);
> +}
> +
> +
> +static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_er=
ror *ret_error) {
> +
> +	Node *n =3D (Node*)userdata;
> +	messageEntry_t *p =3D (messageEntry_t *) n->data;
> +
> +	message_delete_log(p->logid);
> +	remove_log_from_dbus(n);
> +	return sd_bus_reply_method_return(m, "q", 0);
> +}
> +
> +
> +
> +static const sd_bus_vtable recordlog_vtable[] =3D {
> +	SD_BUS_VTABLE_START(0),
> +	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_mes=
sage, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_messag=
e, SD_BUS_VTABLE_UNPRIVILEGED),
> +	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIV=
ILEGED),
> +	SD_BUS_VTABLE_END
> +};
> +
> +static const sd_bus_vtable log_vtable[] =3D {
> +	SD_BUS_VTABLE_START(0),=20=20=20
> +	SD_BUS_PROPERTY("Association",      "s", prop_message, 0, SD_BUS_VTABLE=
_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("Message",          "s", prop_message, 0, SD_BUS_VTABLE=
_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("Severity",         "s", prop_message, 0, SD_BUS_VTABLE=
_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("Reported_By",      "s", prop_message, 0, SD_BUS_VTABLE=
_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("Time",             "s", prop_message, 0, SD_BUS_VTABLE=
_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("DevelopmentData", "ay", prop_message_dd ,0, SD_BUS_VTA=
BLE_PROPERTY_CONST),
> +	SD_BUS_VTABLE_END
> +};
> +
> +
> +static const sd_bus_vtable recordlog_delete_vtable[] =3D {
> +	SD_BUS_VTABLE_START(0),
> +	SD_BUS_METHOD("delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPR=
IVILEGED),
> +	SD_BUS_VTABLE_END
> +};
> +
> +static int remove_log_from_dbus(Node *node) {
> +=09
> +	messageEntry_t *p =3D (messageEntry_t *) node->data;
> +	int r;
> +	char buffer[32];
> +
> +	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->l=
ogid);
> +
> +	printf("Attempting to delete %s\n", buffer);
> +
> +	r =3D sd_bus_emit_object_removed(bus, buffer);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
> +		return -1;
> +	}=09
> +	sd_bus_slot_unref(p->messageslot);
> +	sd_bus_slot_unref(p->deleteslot);
> +
> +	message_entry_close(p);
> +	list_delete_node(glist, node);
> +
> +	return 0;
> +}
> +
> +int send_log_to_dbus(const uint16_t logid) {
> +
> +	char loglocation[64];
> +	int r;
> +	messageEntry_t *m;
> +	Node *node;
> +
> +
> +	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events=
/%d", logid);
> +
> +	message_entry_new(&m, logid);
> +
> +	node =3D list_add_node(glist, m);
> +
> +	r =3D sd_bus_add_object_vtable(bus,
> +	                             &m->messageslot,
> +	                             loglocation,
> +	                             "org.openbmc.record",
> +	                             log_vtable,
> +	                             m);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation=
, strerror(-r));
> +		message_entry_close(m);
> +		list_delete_last_node(glist);
> +		return 0;
> +	}
> +
> +	r =3D sd_bus_add_object_vtable(bus,
> +	                             &m->deleteslot,
> +	                             loglocation,
> +	                             "org.openbmc.Object.Delete",
> +	                             recordlog_delete_vtable,
> +	                             node);
> +=09
> +	printf("Event Log added %s\n", loglocation);
> +
> +	r =3D sd_bus_emit_object_added(bus, loglocation);
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
> +		r =3D sd_bus_process(bus, NULL);
> +		if (r < 0) {
> +			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> +			break;
> +		}
> +
> +		if (r > 0)
> +			continue;
> +
> +		r =3D sd_bus_wait(bus, (uint64_t) -1);
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
> +/* Only thing we are doing in this function is to get a connection on th=
e dbus */
> +int build_bus(void) {
> +
> +	int r =3D 0;
> +
> +	glist =3D list_create();
> +	/* Connect to the system bus */
> +	r =3D sd_bus_open_system(&bus);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Install the object */
> +	r =3D sd_bus_add_object_vtable(bus,
> +	                             &slot,
> +	                             "/org/openbmc/records/events",  /* object =
path */
> +	                             "org.openbmc.recordlog",   /* interface na=
me */
> +	                             recordlog_vtable,
> +	                             NULL);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Take a well-known service name so that clients can find us */
> +	r =3D sd_bus_request_name(bus, "org.openbmc.records.events", 0);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> +	}=09
> +=09
> +	/* You want to add an object manager to support deleting stuff  */
> +	/* without it, dbus can show interfaces that no longer exist */
> +	r =3D sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events=
");
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
> index 0000000..a6aac94
> --- /dev/null
> +++ b/event_messaged_sdbus.h
> @@ -0,0 +1,14 @@
> +#include <stddef.h>
> +
> +#ifdef __cplusplus
> +extern "C"  {
> +#endif
> +	int start_event_monitor(void);
> +	int build_bus(void);
> +	int send_log_to_dbus(const uint16_t logid);
> +	void cleanup_event_monitor(void);
> +#ifdef __cplusplus
> +}
> +#endif
> +
> +
> diff --git a/message.C b/message.C
> new file mode 100644
> index 0000000..31a545a
> --- /dev/null
> +++ b/message.C
> @@ -0,0 +1,224 @@
> +#include <iostream>
> +#include <fstream>
> +#include <iomanip>
> +#include <cstdint>
> +#include <string>
> +#include <sys/types.h>=20
> +#include <dirent.h>=20
> +#include <sstream>
> +#include <sys/stat.h>
> +#include <cstring>
> +#include "message.H"
> +#include <time.h>
> +#include <stddef.h>
> +#include <cstdio>
> +
> +using namespace std;
> +
> +const uint32_t g_eyecatcher =3D 0x4F424D43; // OBMC
> +const uint16_t g_version    =3D 1;
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
> +uint16_t g_logid =3D 0;
> +
> +extern const char *glogname;
> +
> +static uint16_t get_new_log_number(void) {
> +    return ++g_logid;
> +}
> +
> +static void update_latest_logid(uint16_t logid) {
> +    if (logid > g_logid)
> +        g_logid =3D logid;
> +    return;
> +}
> +
> +inline uint16_t GETLEN(const char *s) {
> +    return (uint16_t) (1 + strlen(s));
> +}
> +
> +static uint16_t create_log_event(event_record_t *rec) {
> +
> +    std::ostringstream buffer;
> +    ofstream myfile;
> +    logheader_t hdr;
> +
> +
> +    buffer << glogname << "/" << int(rec->logid) ;
> +
> +    cout << buffer.str() << endl;
> +
> +    hdr.eyecatcher     =3D g_eyecatcher;
> +    hdr.version        =3D g_version;
> +    hdr.logid          =3D rec->logid;
> +    hdr.timestamp      =3D time(NULL);
> +    hdr.detailsoffset  =3D offsetof(logheader_t, messagelen);
> +    hdr.messagelen     =3D GETLEN(rec->message);
> +    hdr.severitylen    =3D GETLEN(rec->severity);
> +    hdr.associationlen =3D GETLEN(rec->association);
> +    hdr.reportedbylen  =3D GETLEN(rec->reportedby);
> +    hdr.debugdatalen   =3D rec->n;
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
> +    return rec->logid;
> +}
> +
> +static int is_file_a_log(string str) {
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
> +    buffer << glogname << "/" << str;
> +
> +    f.open( buffer.str(), ios::binary);
> +
> +    if (!f.good()) {
> +        return 0;
> +    }
> +
> +    f.read((char*)&hdr, sizeof(hdr));
> +
> +    if (hdr.eyecatcher !=3D g_eyecatcher)
> +        return 0;
> +
> +    return 1;
> +}
> +
> +
> +
> +int message_load_log(uint16_t logid, event_record_t **rec) {
> +
> +    std::ostringstream buffer;
> +    ifstream f;
> +    logheader_t hdr;
> +
> +    buffer << glogname << "/" << int(logid);
> +
> +    f.open( buffer.str(), ios::binary);
> +
> +    if (!f.good()) {
> +        return 0;
> +    }
> +
> +    *rec =3D new event_record_t;
> +
> +    f.read((char*)&hdr, sizeof(hdr));
> +
> +    (*rec)->logid     =3D hdr.logid;
> +    (*rec)->timestamp =3D hdr.timestamp;
> +
> +
> +    (*rec)->message =3D new char[hdr.messagelen];
> +    f.read((*rec)->message, hdr.messagelen);
> +
> +    (*rec)->severity =3D new char[hdr.severitylen];
> +    f.read((*rec)->severity, hdr.severitylen);
> +
> +    (*rec)->association =3D new char[hdr.associationlen];
> +    f.read((*rec)->association, hdr.associationlen);
> +
> +    (*rec)->reportedby =3D new char[hdr.reportedbylen];
> +    f.read((*rec)->reportedby, hdr.reportedbylen);
> +
> +    (*rec)->p =3D new uint8_t[hdr.debugdatalen];
> +    f.read((char*)(*rec)->p, hdr.debugdatalen);
> +    (*rec)->n =3D hdr.debugdatalen;
> +
> +
> +    f.close();
> +    return logid;
> +}
> +
> +void message_free_log(event_record_t *rec) {
> +
> +    delete[] rec->message;
> +    delete[] rec->severity;
> +    delete[] rec->association;
> +    delete[] rec->reportedby;
> +    delete[] rec->p;
> +    delete rec;
> +
> +    return ;
> +}
> +
> +int message_delete_log(uint16_t logid) {
> +
> +    std::stringstream buffer;
> +    string s;
> +
> +    buffer << glogname << "/" << int(logid);
> +
> +    s =3D buffer.str();
> +    std::remove(s.c_str());
> +
> +    return 0;
> +}
> +
> +
> +int message_get_next_log(uint16_t *logid, event_log_list *log_list) {
> +
> +    std::ostringstream buffer;
> +    struct dirent *ent;
> +
> +    if (*logid=3D=3D0)
> +        log_list->dirp =3D opendir(glogname);
> +
> +    if(log_list->dirp)
> +    {
> +        do {
> +            ent =3D readdir(log_list->dirp);
> +
> +            if (ent =3D=3D NULL)
> +                break;
> +
> +            string str(ent->d_name);
> +
> +            if (is_file_a_log(str)) {
> +                *logid =3D (uint16_t) atoi(str.c_str());
> +                update_latest_logid(*logid);
> +                break;
> +            }
> +
> +        } while( 1 );
> +    }=20
> +    else
> +    {=20
> +        cerr << "Error opening directory" << glogname << endl;
> +        ent    =3D NULL;
> +        *logid =3D 0;
> +    }
> +    return  ((ent =3D=3D NULL) ? 0 : 1);
> +}
> +
> +
> +uint16_t message_create_new_log_event(event_record_t *rec) {
> +
> +    rec->logid =3D get_new_log_number();
> +    return create_log_event(rec);
> +}
> diff --git a/message.H b/message.H
> new file mode 100644
> index 0000000..26ebe19
> --- /dev/null
> +++ b/message.H
> @@ -0,0 +1,60 @@
> +
> +#include <dirent.h>
> +#include <time.h>
> +
> +#ifdef __cplusplus
> +    #include <cstdint>
> +#else
> +    #include <stdint.h>
> +#endif
> +
> +
> +#ifdef __cplusplus
> +    struct event_log_list {
> +#else
> +    typedef struct _event_log_list {=20=20=20=20=20=20=20=20
> +#endif
> +        DIR *dirp;
> +#ifdef __cplusplus
> +    };
> +#else=20=20=20=20
> +    } event_log_list;
> +#endif
> +
> +
> +#ifdef __cplusplus
> +    struct event_record_t {
> +#else=20=20=20=20=20
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
> +        time_t  timestamp;=20=20=20=20=20=20=20=20
> +        int16_t logid;
> +#ifdef __cplusplus
> +    };
> +#else=20=20=20=20=20
> +    } event_record_t;
> +#endif
> +
> +
> +#ifdef __cplusplus
> +extern "C"  {
> +#endif
> +
> +
> +uint16_t message_create_new_log_event(event_record_t *rec);
> +int      message_load_log(uint16_t logid, event_record_t **rec);
> +void     message_free_log(event_record_t *rec);
> +int      message_get_next_log(uint16_t *logid, event_log_list *log_list);
> +int      message_delete_log(uint16_t logid);
> +
> +#ifdef __cplusplus
> +}
> +#endif
> diff --git a/test.C b/test.C
> new file mode 100644
> index 0000000..afd834e
> --- /dev/null
> +++ b/test.C
> @@ -0,0 +1,92 @@
> +#include <iostream>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +
> +#include "message.H"
> +using namespace std;
> +
> +const char *glogname =3D "./events";
> +
> +#define ASSERT(a,b)  if(a!=3Db) {cout << "ASSERT ERROR: line " << __LINE=
__ << endl; exit(1);}
> +
> +void build_event_record(event_record_t *rec,
> +						uint16_t logid,
> +                        const char *message,
> +                        const char *severity,
> +                        const char *association,
> +                        const char *reportedby,
> +                        const uint8_t *p,
> +                        size_t n) {
> +
> +
> +    rec->message     =3D (char*) message;
> +    rec->severity    =3D (char*) severity;
> +    rec->association =3D (char*) association;
> +    rec->reportedby  =3D (char*) reportedby;
> +    rec->p           =3D (uint8_t*) p;
> +    rec->n           =3D n;
> +
> +    return;
> +}
> +
> +int load_existing_events(void) {
> +
> +	event_log_list log_list;
> +	uint16_t       logid=3D0;
> +	event_record_t *rec;
> +
> +	cout << "Loading event log... ";
> +
> +	while (message_get_next_log(&logid, &log_list)) {
> +		cout << " " << int(logid);
> +		message_load_log(logid, &rec);
> +
> +		cout << rec->message << endl;
> +
> +		message_free_log(rec);
> +	}
> +	cout << endl;
> +=09
> +	return 0;
> +}
> +
> +
> +int main(int argc, char *argv[]) {
> +
> +	int rc =3D 0;
> +
> +	uint8_t p[] =3D {0x3, 0x32, 0x34, 0x36};
> +	event_record_t rec, *prec;
> +	event_log_list log_list;
> +	uint16_t logid=3D0;
> +	int i;
> +
> +	build_event_record(&rec,0, "Testing Message1", "Info", "Association", "=
Test", p, 4);
> +	ASSERT(message_create_new_log_event(&rec),1);
> +	build_event_record(&rec,0, "Testing Message2", "Info", "/dev", "Test", =
p, 4);
> +	ASSERT(message_create_new_log_event(&rec),2);
> +	build_event_record(&rec,0, "Testing Message3", "Info", "Association", "=
Test", p, 4);
> +	ASSERT(message_create_new_log_event(&rec),3);
> +
> +	ASSERT(message_load_log(13, &prec), 0);
> +	ASSERT(message_load_log(1, &prec), 1); message_free_log(prec);
> +
> +	// Test the number of valid logs so far
> +	i =3D 0;
> +	while (message_get_next_log(&logid, &log_list)) {
> +
> +
> +		cout << int(logid) << endl;
> +		i++;
> +	}
> +	//ASSERT(i,3);
> +
> +	cout << "LOADLOG TEST" << endl;
> +
> +	load_existing_events();
> +
> +	message_delete_log(1);
> +
> +	return rc;
> +}
> \ No newline at end of file
> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsZSUAAoJEPC3R3P2I92FC9IQANp/5IWRSM8ySSAgqzQikmQb
u3HMuWWQ1yP5/3MgolJm+7uGl5ybvrTrlmM3YYCAPy0AdBlB8fN8duaMtKNcKZzJ
mhqwQghd0KM1cKiZ933aGmdQaFrBk/EqYBdsm3dZXVQUqEon8QtAPQ9WKjpT+7LY
2bCPTkB1VjEX0WQIAJSZ8dfmz52kOaB6ffyQ0v2VUVhMm26o9ixe9sO71vACHmWW
56tVp9Kux++382/o3jqaiCzCCj3rdp6I+dlte98NkDfagpzvlltnoxOqHX9Eoh54
XI4mGIV7Mi4PGKGVXoTd0WW6h/SXsOFUF8W/L4VATPV3M9jtPmCRNgB18tA4Knam
yLjGvZiWyVNFfn1xLiDvCZWiqm/aCUqpcX+ml8LDJocb5IQs7OhAOTV4ZNgtiLpB
1r4It5Nxyu8/pqiiR9/TUbUpyt47Sq9gf/iBNr2OCH8jarxiys+yDG2IbwP3S9pH
HnJqLSQLV3SopcZZPQaaDC4GSRas5UmFTwr96KPRHx0cAknWx1rReaF77+5+K+Gk
6cgmYnIXSxJvwGBG9bGoiZiIZIGD3skrS5t3isDwhS0rBAsmhsaRwgmmcdjxbBmq
Gzs18ctAXTQXPuYDOp4E+O3vlwB+Ewzxa/vNxPn0GHh/7kzQykk4PIWHkYhwe8Kq
OcbK7Ho5CJ/SwKULOTT+
=b8Rk
-----END PGP SIGNATURE-----
--=-=-=--
