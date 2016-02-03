Return-Path: <dja@axtens.net>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 745991A0221
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 00:21:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=dUuMNRzP; 
 dkim-atps=neutral
Received: by mail-pa0-x22c.google.com with SMTP id ho8so13571473pac.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2016 05:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-type;
 bh=Aq7gp7Nh+0fWbXVYKK5XqKIQuvWLMBWSCeMZ+X4f85k=;
 b=dUuMNRzPPPbB54fSWESG4cbZwLDIViZeLzZYOBwa/mNHPeTV63VdKpUEQJqZl1YnBV
 1RtoGc2aMq9wjAB8rwr0X5dCnqtp+ZFCWXoxPtu34tfTQVmosaiw5F1Z58j/n4VyYV+A
 qwFIwfeQyeBIFFoAVEjE+F4vK2InaA2hePupw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=Aq7gp7Nh+0fWbXVYKK5XqKIQuvWLMBWSCeMZ+X4f85k=;
 b=G50dtE/kxrZnzoe/LzewhITKAbpfBcVYbOB63nzMNtjp1cEY+Vd2WQSdscgH9gJJBH
 utNg2cASX8fxA9PgipMyZu4Nj4UC9xrrzJrDkpfwtLSzH1tAwM6d/CzTOv5LQsJrB+A4
 ZGWslYvOjEaQfcQNVVYh10LqNHPsADDRZLhxHxCqzmtUGaF7i68iijUnABpdCv42SYgW
 uFLP1jAH8qHqmuFxqMD9vYDCecNXztOur5twfHUq46tBxuFEpt6lEik4A8EKu6rCFFLC
 6x8zAGK3Zd8CY6AZ/GsgoJbouc6OV44m4BUmnY89ttmBU7GmUt7mXzQOPNMk4Ei3lRqS
 eOQw==
X-Gm-Message-State: AG10YOTgxZ1uGLcLCju0xvezTLgvkhD/1EcvM05QhrFfAfx8/3QQ+uZq7+mvwOx2bTDdyQ==
X-Received: by 10.66.54.78 with SMTP id h14mr2051568pap.59.1454505692215;
 Wed, 03 Feb 2016 05:21:32 -0800 (PST)
Received: from localhost ([118.127.100.46])
 by smtp.gmail.com with ESMTPSA id m16sm5822698pfi.75.2016.02.03.05.21.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2016 05:21:31 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot
In-Reply-To: <201602030631.u136VieM002880@d01av03.pok.ibm.com>
References: <877fimibu3.fsf@gamma.ozlabs.ibm.com>
 <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201602030631.u136VieM002880@d01av03.pok.ibm.com>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Thu, 04 Feb 2016 00:21:10 +1100
Message-ID: <871t8uhqux.fsf@gamma.ozlabs.ibm.com>
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
X-List-Received-Date: Wed, 03 Feb 2016 13:21:37 -0000

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Chris,

>
> CA: A log rotate concept seems reasonable.=C2=A0 I can open an issue to e=
nsure that happens.=C2=A0 Any traditional readings on the subject?

Traditionally in linux-land you'd stick a single log file in /var/log,
and use a program called logrotate to rotate it. Logrotate takes a
configuration snippet in /etc somewhere and then automatically can deal
with moving files, keeping a certain number, archiving old logs, sending
signals to processes so they know they've been rotated and can re-open
the log file, etc, etc. `man logrotate` is a good start: it'll be
running on any desktop or server linux system.

>
> CA: The Binary thought process is as follows (and I'm not married to the =
idea)
> =C2=A0 1) The debug developer data is presented as an array of bytes.=C2=
=A0 So I stored it as an array of bytes.=C2=A0=20
> =C2=A0 2) Why an array of bytes and not a string?=C2=A0 Well debug data c=
an be up to 2K.=C2=A0 Converting it to ascii makes each log stored as 4K.=
=C2=A0=20
> =C2=A0 3) REST is the customer visible interface. no need for anyone outs=
ide of the service/support team to be relying on any internals
>
>
Hmm. These are decent points. My concern is that we then:
 - need to maintain the tool to decode them
 - suffer from increased debug turnaround.

I'm not clear on the disk-space limits in BMC land - 2k to 4k seems small to
me but maybe it's a real issue in the BMC case.

I'm not married to text logs either, but I think we should generally
prefer them to binary logs where there's not a compelling reason
otherwise.

Thanks for your helpful and thoughtful responses!

Regards,
Daniel

>
>> 3) Each log now has a timestamp of when the log reached the service
>> 4) I added a caching mechanism to reduce the io traffic if the the metho=
d is simply being called to capture the next parameter
>> 5) You will notice a mixture of c/c++. =C2=A0This is because I want the =
test infrastructure to take advantage of c++ features
>>
>> Useful REST calls
>> ~~~~~~~~~~~~~~~~~
>> Note, dont forget to login first
>>
>> List all events
>> curl -k https://bmc/org/openbmc/records/events/
>>
>> Create an event log for testing purposes
>> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "=
{\"data\": []}" https://bmc/org/openbmc/records/events/action/acceptTestMes=
sage
>>
>> Delete an event
>> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "=
{\"data\": []}" https://bmc/org/openbmc/records/events/1/action/delete
>>
>> Delete all events
>> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "=
{\"data\": []}" https://bmc/org/openbmc/records/events/action/clear
>> ---
>> =C2=A0Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
29 ++--
>> =C2=A0event_messaged.C =C2=A0 =C2=A0 =C2=A0 | =C2=A044 +++++
>> =C2=A0event_messaged.c =C2=A0 =C2=A0 =C2=A0 | 341 ----------------------=
-----------------
>> =C2=A0event_messaged_sdbus.c | 425 +++++++++++++++++++++++++++++++++++++=
++++++++++++
>> =C2=A0event_messaged_sdbus.h | =C2=A014 ++
>> =C2=A0message.C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 224 ++=
++++++++++++++++++++++++
>> =C2=A0message.H =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
60 +++++++
>> =C2=A0test.C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A092 +++++++++++
>> =C2=A08 files changed, 878 insertions(+), 351 deletions(-)
>> =C2=A0create mode 100644 event_messaged.C
>> =C2=A0delete mode 100644 event_messaged.c
>> =C2=A0create mode 100644 event_messaged_sdbus.c
>> =C2=A0create mode 100644 event_messaged_sdbus.h
>> =C2=A0create mode 100644 message.C
>> =C2=A0create mode 100644 message.H
>> =C2=A0create mode 100644 test.C
>>
>> diff --git a/Makefile b/Makefile
>> index 4c2ba9b..903ac06 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1,27 +1,36 @@
>> -TEST =C2=A0 =C2=A0 =C2=A0=3D listfunc
>> -OBJS_TEST =3D $(TEST).o
>> =C2=A0
>> -EXE =C2=A0 =C2=A0 =3D event_messaged
>> +TEST =C2=A0 =C2=A0 =C2=A0=3D test
>> =C2=A0
>> -OBJS =C2=A0 =C2=A0=3D $(EXE).o =C2=A0 \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list.o 	 \
>> +EXE =C2=A0 =C2=A0 =C2=A0 =3D event_messaged
>> +EXE_OBJS =C2=A0=3D $(EXE).o message.o event_messaged_sdbus.o list.o
>> =C2=A0
>> +OBJS_TEST =3D $(TEST).o message.o
>> +
>> +CPPFLAGS =C2=A0+=3D -g -fpic -Wall -std=3Dc++11
>> =C2=A0
>> =C2=A0DEPPKGS =3D libsystemd
>> -CC =C2=A0 =C2=A0 =C2=A0?=3D $(CROSS_COMPILE)gcc
>> =C2=A0INCLUDES +=3D $(shell pkg-config --cflags $(DEPPKGS))=20
>> =C2=A0LIBS +=3D $(shell pkg-config --libs $(DEPPKGS))
>> =C2=A0
>> +
>> +
>> =C2=A0all: $(EXE)
>> =C2=A0
>> =C2=A0%.o : %.c=20
>> =C2=A0	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
>> =C2=A0
>> -$(EXE): $(OBJS)
>> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
>> +%.o : %.C
>> +	$(CXX) -c $< $(CPPFLAGS) -o $@
>> +
>> +
>> +$(EXE): $(EXE_OBJS)
>> +	$(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
>> +
>> =C2=A0
>> =C2=A0$(TEST): $(OBJS_TEST)
>> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
>> +	$(CXX) $^ $(LDFLAGS) -o $@
>> =C2=A0
>> =C2=A0clean:
>> -	rm -f $(OBJS) $(EXE) *.o *.d
>> +	rm -f $(TEST) *.o *.so $(EXE)
>> +
>> +
>> diff --git a/event_messaged.C b/event_messaged.C
>> new file mode 100644
>> index 0000000..4376431
>> --- /dev/null
>> +++ b/event_messaged.C
>> @@ -0,0 +1,44 @@
>> +#include <iostream>
>> +#include "message.H"
>> +#include "event_messaged_sdbus.h"
>> +
>> +const char *glogname =3D "/var/lib/obmc/events";
>> +
>> +using namespace std;
>> +
>> +
>> +// Walk through all the saved logs and reload them in to dbus objects
>> +// Needed because on a reboot the existing logs need to be reloaded
>> +int load_existing_events(void) {
>> +
>> + =C2=A0 =C2=A0event_log_list log_list;
>> + =C2=A0 =C2=A0uint16_t =C2=A0 =C2=A0 =C2=A0 logid=3D0;
>> +
>> + =C2=A0 =C2=A0while (message_get_next_log(&logid, &log_list)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0send_log_to_dbus(logid);
>> + =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0
>> + =C2=A0 =C2=A0return 0;
>> +}
>> +
>> +int main(int argc, char *argv[]) {
>> +
>> + =C2=A0 =C2=A0int rc =3D 0;
>> +
>> + =C2=A0 =C2=A0if ((rc =3D build_bus()) < 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Event Messager failed to c=
onnect to dbus rc=3D%d", rc);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;
>> + =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0if ((rc =3D load_existing_events()) < 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Event Messager failed add =
previous logs to dbus rc=3D%d", rc);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;
>> + =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0rc =3D start_event_monitor();
>> +
>> + =C2=A0 =C2=A0finish:
>> + =C2=A0 =C2=A0cleanup_event_monitor();
>> +
>> + =C2=A0 =C2=A0return rc;
>> +}
>> \ No newline at end of file
>> diff --git a/event_messaged.c b/event_messaged.c
>> deleted file mode 100644
>> index 0c75e3a..0000000
>> --- a/event_messaged.c
>> +++ /dev/null
>> @@ -1,341 +0,0 @@
>> -#include <stdio.h>
>> -#include <stdlib.h>
>> -#include <errno.h>
>> -#include <stddef.h>
>> -#include <systemd/sd-bus.h>
>> -#include "list.h"
>> -
>> -uint16_t g_logid =3D 0;
>> -sd_bus *bus =3D NULL;
>> -List *glist;
>> -
>> -
>> -int create_new_log_event(void *userdata,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *message,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *severity,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *association,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *reportedby,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8_t *p,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 size_t n);
>> -
>> -typedef struct messageEntry_t {
>> -	char =C2=A0 =C2=A0*message;
>> -	char =C2=A0 =C2=A0*severity;
>> -	char =C2=A0 =C2=A0*reportedby;
>> -	char =C2=A0 =C2=A0*association;
>> -	uint8_t *debugbytes;
>> -	size_t =C2=A0 debuglength;
>> -	size_t =C2=A0 logid;
>> -
>> -	sd_bus_slot *messageslot;
>> -	sd_bus_slot *deleteslot;
>> -
>> -} messageEntry_t;
>> -
>> -
>> -void message_storage_delete(messageEntry_t *m) {
>> -
>> -	char *path;
>> -	int r;
>> -
>> -	asprintf(&path, "/org/openbmc/records/events/%d", m->logid);
>> -
>> -
>> -	printf("Attempting to delete %s\n", path);
>> -
>> -	free(m->message);
>> -	free(m->severity);
>> -	free(m->reportedby);
>> -	free(m->association);
>> -	free(m->debugbytes);
>> -
>> -
>> -	r =3D sd_bus_emit_object_removed(bus, path);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r)=
);
>> -		return;
>> -	}
>> -
>> -	sd_bus_slot_unref(m->messageslot);
>> -	sd_bus_slot_unref(m->deleteslot);
>> -
>> -	free(m);
>> -
>> -	return;
>> -}
>> -
>> -
>> -
>> -void message_add(messageEntry_t **n,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *mes=
sage,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *sev=
erity,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ass=
ociation,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *rep=
ortedby,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =
=C2=A0 =C2=A0logid,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t =C2=A0 =
=C2=A0*data,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =
=C2=A0 =C2=A0datalen)
>> -{
>> -
>> -	messageEntry_t *p =3D *n =3D malloc(sizeof(messageEntry_t));
>> -
>> -	asprintf(&(*n)->message, =C2=A0 =C2=A0 "%s", message);
>> -	asprintf(&(*n)->severity, =C2=A0 =C2=A0"%s", severity);
>> -	asprintf(&(*n)->association, "%s", association);
>> -	asprintf(&(*n)->reportedby, =C2=A0"%s", reportedby);
>> -
>> -	(*n)->logid =C2=A0 =C2=A0 =C2=A0 =3D logid;
>> -	(*n)->debugbytes =C2=A0=3D (uint8_t*) malloc (datalen);
>> -	(*n)->debuglength =3D datalen;
>> -	memcpy((*n)->debugbytes, data, datalen);
>> -
>> -	(*n)->messageslot =3D NULL;
>> -	(*n)->deleteslot =C2=A0=3D NULL;
>> -	return;
>> -}
>> -
>> -
>> -static int get_message_dd(sd_bus *bus,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *path,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *interface,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *property,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sd_bus_message *reply,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0void *userdata,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sd_bus_error *error) {
>> -
>> -	int r;
>> -	messageEntry_t *p =3D (messageEntry_t *)userdata;
>> -=09
>> -	r =3D sd_bus_message_append_array(reply, 'y', p->debugbytes, p->debugl=
ength);
>> -	if (r < 0) {
>> -	 =C2=A0printf("Error building array for property %s\n", strerror(-r));
>> -	}
>> -
>> -	return r;
>> -}
>> -
>> -
>> -/////////////////////////////////////////////////////////////
>> -// Receives an array of bytes as an esel error log
>> -// returns the messageid in 2 byte format
>> -// =C2=A0
>> -// =C2=A0S1 - Message - Simple sentence about the fail
>> -// =C2=A0S2 - Severity - How bad of a problem is this
>> -// =C2=A0S3 - Association - sensor path
>> -// =C2=A0ay - Detailed data - developer debug information
>> -//
>> -/////////////////////////////////////////////////////////////
>> -static int method_accept_host_message(sd_bus_message *m,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_bus_error =
*ret_error) {
>> -
>> -	char *message, *severity, *association;
>> -	size_t =C2=A0 n =3D 4;
>> -	uint8_t *p;
>> -	int r;
>> -
>> -	r =3D sd_bus_message_read(m, "sss", &message, &severity, &association);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerro=
r(-r));
>> -		return r;
>> -	}
>> -
>> -	r =3D sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n",=
 strerror(-r));
>> -		return r;
>> -	}
>> -
>> -	create_new_log_event(userdata, message, severity, association, "Host",=
 p, n);
>> -
>> -	return sd_bus_reply_method_return(m, "q", g_logid);
>> -}
>> -
>> -
>> -static int method_accept_test_message(sd_bus_message *m,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_bus_error =
*ret_error) {
>> -
>> -	uint8_t p[] =3D {0x30, 0x32, 0x34, 0x36};
>> -
>> -	create_new_log_event(userdata, "Testing Message", "Info", "Association=
", "Test", p, 4);
>> -
>> -	return sd_bus_reply_method_return(m, "q", g_logid);
>> -}
>> -
>> -
>> -static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_er=
ror *ret_error) {
>> -
>> -	Node *n;
>> -
>> -	// This deletes one log at a time and seeing how the
>> -	// list shrinks using the NULL works fine here
>> -	while (n =3D list_get_next_node(glist, NULL)) {
>> -		message_storage_delete(n->data);
>> -		list_delete_node(glist, n);
>> -	}
>> -
>> -	return sd_bus_reply_method_return(m, "q", 0);
>> -}
>> -
>> -
>> -static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_e=
rror *ret_error) {
>> -
>> -	Node *n =3D (Node*)userdata;
>> -
>> -	message_storage_delete(n->data);
>> -	list_delete_node(glist, n);
>> -
>> -	return sd_bus_reply_method_return(m, "q", 0);
>> -}
>> -
>> -
>> -
>> -static const sd_bus_vtable recordlog_vtable[] =3D {
>> -	SD_BUS_VTABLE_START(0),
>> -	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_me=
ssage, SD_BUS_VTABLE_UNPRIVILEGED),
>> -	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_messa=
ge, SD_BUS_VTABLE_UNPRIVILEGED),
>> -	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRI=
VILEGED),
>> -	SD_BUS_VTABLE_END
>> -};
>> -
>> -static const sd_bus_vtable log_vtable[] =3D {
>> -	SD_BUS_VTABLE_START(0),
>> -	SD_BUS_PROPERTY("Association", "s", NULL, offsetof(messageEntry_t, ass=
ociation), SD_BUS_VTABLE_PROPERTY_CONST),
>> -	SD_BUS_PROPERTY("Message", =C2=A0"s", NULL, offsetof(messageEntry_t, m=
essage), SD_BUS_VTABLE_PROPERTY_CONST),
>> -	SD_BUS_PROPERTY("Severity", "s", NULL, offsetof(messageEntry_t, severi=
ty), SD_BUS_VTABLE_PROPERTY_CONST),
>> -	SD_BUS_PROPERTY("Reported_By", "s", NULL, offsetof(messageEntry_t, rep=
ortedby), =C2=A0SD_BUS_VTABLE_PROPERTY_CONST),
>> -	SD_BUS_PROPERTY("DevelopmentData", "ay", get_message_dd,0, SD_BUS_VTAB=
LE_PROPERTY_CONST),
>> -	SD_BUS_VTABLE_END
>> -};
>> -
>> -
>> -static const sd_bus_vtable recordlog_delete_vtable[] =3D {
>> -	SD_BUS_VTABLE_START(0),
>> -	SD_BUS_METHOD("Delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNP=
RIVILEGED),
>> -	SD_BUS_VTABLE_END
>> -};
>> -
>> -uint16_t get_new_log_number() {
>> -	return ++g_logid;
>> -}
>> -
>> -int create_new_log_event(void *userdata,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *message,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *severity,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *association,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *reportedby,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8_t *p,=20
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 size_t n) {
>> -	char loglocation[64];
>> -	int r;
>> -	messageEntry_t *m;
>> -	Node *node;
>> -	uint16_t logid =3D get_new_log_number();
>> -
>> -
>> -	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/event=
s/%d", logid);
>> -
>> -	message_add(&m, message, severity, association, reportedby, logid, p, =
n);
>> -
>> -	node =3D list_add_node(glist, m);
>> -
>> -	r =3D sd_bus_add_object_vtable(bus,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->messageslot,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.record",
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_vtable,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocatio=
n, strerror(-r));
>> -		message_storage_delete(m);
>> -		list_delete_last_node(glist);
>> -		return 0;
>> -	}
>> -
>> -	r =3D sd_bus_add_object_vtable(bus,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->deleteslot,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.Object.Delete",
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog_delete_vtable,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node);
>> -
>> -	printf("Event Log added %s\n", loglocation);
>> -
>> -	r =3D sd_bus_emit_object_added(bus, loglocation);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
>> -		return 0;
>> -	}
>> -
>> -
>> -
>> -	return logid;
>> -}
>> -
>> -
>> -int start_event_recording(void) {
>> -
>> -	int r;
>> -
>> -	sd_bus_slot *slot;
>> -
>> -	/* Connect to the user bus this time */
>> -	r =3D sd_bus_open_system(&bus);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r)=
);
>> -		goto finish;
>> -	}
>> -
>> -	/* Install the object */
>> -	r =3D sd_bus_add_object_vtable(bus,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &slot,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "/org/openbmc/records/events", =C2=A0/* object=
 path */
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.recordlog", =C2=A0 /* interface n=
ame */
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog_vtable,
>> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
>> -		goto finish;
>> -	}
>> -=09
>> -	/* Take a well-known service name so that clients can find us */
>> -	r =3D sd_bus_request_name(bus, "org.openbmc.records.events", 0);
>> -	if (r < 0) {
>> -		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
>> -		goto finish;
>> -	}
>> -
>> -	r =3D sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/event=
s") ;
>> -	if (r < 0) {
>> -		fprintf(stderr, "Object Manager failure =C2=A0%s\n", strerror(-r));
>> -		return 0;
>> -	}
>> -
>> -	for (;;) {
>> -		r =3D sd_bus_process(bus, NULL);
>> -		if (r < 0) {
>> -			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
>> -			goto finish;
>> -		}
>> -		if (r > 0)
>> -			continue;
>> -
>> -		r =3D sd_bus_wait(bus, (uint64_t) -1);
>> -		if (r < 0) {
>> -			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
>> -			goto finish;
>> -		}
>> -	}
>> -	finish:
>> -		sd_bus_slot_unref(slot);
>> -		sd_bus_unref(bus);
>> -
>> -	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>> -}
>> -
>> -
>> -int main(int argc, char *argv[]) {
>> -
>> -	glist =3D list_create();
>> -	return start_event_recording();
>> -}
>> \ No newline at end of file
>> diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
>> new file mode 100644
>> index 0000000..fa83e5c
>> --- /dev/null
>> +++ b/event_messaged_sdbus.c
>> @@ -0,0 +1,425 @@
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <errno.h>
>> +#include <stddef.h>
>> +#include <systemd/sd-bus.h>
>> +#include "message.H"
>> +#include "list.h"
>> +#include "event_messaged_sdbus.h"
>> +
>> +/**********************************************************************=
*******/
>> +/* This set of functions are responsible for interactions with events o=
ver =C2=A0 */
>> +/* dbus. =C2=A0Logs come in a couple of different ways... =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */=20
>> +/* =C2=A0 =C2=A0 1) From the calls from acceptHostMessage, acceptTestMe=
ssage =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/* =C2=A0 =C2=A0 2) At startup and logs that exist alreafy are re-added=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/* event_record_t when loaded contain all strings and data stream for a=
 log =C2=A0*/
>> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/* Functions naming convention =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/* =C2=A0 =C2=A0 prop_x =C2=A0 =C2=A0: callable dbus properties. =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/* =C2=A0 =C2=A0 method_x =C2=A0: callable dbus functions. =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> +/**********************************************************************=
*******/
>> +
>> +
>> +
>> +sd_bus =C2=A0 =C2=A0 =C2=A0*bus =C2=A0 =3D NULL;
>> +sd_bus_slot *slot =C2=A0=3D NULL;
>> +List =C2=A0 =C2=A0 =C2=A0 =C2=A0*glist =3D NULL;
>> +
>> +event_record_t *gCachedRec =3D NULL;
>> +
>> +static int remove_log_from_dbus(Node *node);
>> +
>> +typedef struct messageEntry_t {
>> +
>> +	size_t =C2=A0 =C2=A0 =C2=A0 logid;
>> +	sd_bus_slot *messageslot;
>> +	sd_bus_slot *deleteslot;
>> +
>> +} messageEntry_t;
>> +
>> +
>> +static void message_entry_close(messageEntry_t *m) {
>> +	free(m);
>> +	return;
>> +}
>> +
>> +static void message_entry_new(messageEntry_t **m, uint16_t logid) {
>> +	*m =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D malloc(sizeof(messageEntry_t)=
);
>> +	(*m)->logid =3D logid;
>> +	return;
>> +}
>> +
>> +// After calling this function the gCachedRec will be set
>> +static event_record_t* message_record_open(uint16_t logid) {
>> +
>> +	int r =3D 0;
>> +	event_record_t *rec;
>> +
>> +	// A simple caching technique because each=20
>> +	// property needs to extract data from the
>> +	// same data blob. =C2=A0
>> +	if (gCachedRec =3D=3D NULL) {
>> +		if (message_load_log(logid, &rec)) {
>> +			gCachedRec =3D rec;
>> +			return gCachedRec;
>> +		} else=20
>> +			return NULL;
>> +	}=20
>> +
>> +	if (logid =3D=3D gCachedRec->logid) {
>> +		r =3D 1;
>> +
>> +	} else {
>> +		message_free_log(gCachedRec);
>> +		gCachedRec =3D NULL;
>> +
>> +		r =3D message_load_log(logid, &rec);
>> +		if (r)
>> +			gCachedRec =3D rec;
>> +	}
>> +
>> +	return (r ? gCachedRec : NULL);
>> +}
>> +
>> +
>> +
>> +static int prop_message(sd_bus *bus,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *path,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *interface,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *property,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd_bus_message *reply,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void *userdata,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd_bus_error *error) {
>> +
>> +	int r=3D0;
>> +	messageEntry_t *m =3D (messageEntry_t*) userdata;
>> +	char *p;
>> +	struct tm *tm_info;
>> + =C2=A0 =C2=A0char buffer[32];
>> + =C2=A0 =C2=A0event_record_t *rec;
>> +
>> +	rec =3D message_record_open(m->logid);
>> +
>> +	if (!rec) {
>> +		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
>> +		sd_bus_error_set(error, =C2=A0SD_BUS_ERROR_FILE_NOT_FOUND,"Could not =
find log file");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>> +	}
>> +
>> +	if (!strncmp("Message", property, 7))=20
>> +		p =3D rec->message;
>> +	else if (!strncmp("Severity", property, 8))
>> +		p =3D rec->severity;
>> +	else if (!strncmp("Association", property, 11))
>> +		p =3D rec->association;
>> +	else if (!strncmp("Reported_By", property, 11))
>> +		p =3D rec->reportedby;
>> +	else if (!strncmp("Time", property, 4)) {
>> +		tm_info =3D localtime(&rec->timestamp);
>> +		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm_info);
>> +		p =C2=A0 =C2=A0=3D buffer;
>> +	}
>> +	else
>> +		p =3D "";
>> +
>> +	r =3D sd_bus_message_append(reply, "s", p);
>> +	if (r < 0) {
>> +	 =C2=A0 =C2=A0fprintf(stderr,"Error building array for property %s\n",=
 strerror(-r));
>> +	}
>> +
>> +
>> +	return r;
>> +}
>> +
>> +
>> +static int prop_message_dd(sd_bus *bus,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *path,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *interface,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *property,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd_bus_message *reply,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void *userdata,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd_bus_error *error) {
>> +
>> + =C2=A0 =C2=A0event_record_t *rec;
>> + =C2=A0 =C2=A0messageEntry_t *m =3D (messageEntry_t*) userdata;
>> +
>> +	rec =3D message_record_open(m->logid);
>> +
>> +	if (!rec) {
>> +		sd_bus_error_set(error, =C2=A0SD_BUS_ERROR_FILE_NOT_FOUND,"Could not =
find log file");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>> + =C2=A0 =C2=A0}
>> +	return sd_bus_message_append_array(reply, 'y', rec->p, rec->n);
>> +}
>> +
>> +/////////////////////////////////////////////////////////////
>> +// Receives an array of bytes as an esel error log
>> +// returns the messageid in 2 byte format
>> +// =C2=A0
>> +// =C2=A0S1 - Message - Simple sentence about the fail
>> +// =C2=A0S2 - Severity - How bad of a problem is this
>> +// =C2=A0S3 - Association - sensor path
>> +// =C2=A0ay - Detailed data - developer debug information
>> +//
>> +/////////////////////////////////////////////////////////////
>> +static int method_accept_host_message(sd_bus_message *m,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_bus_error =
*ret_error) {
>> +
>> +	char *message, *severity, *association;
>> +	size_t =C2=A0 n =3D 4;
>> +	uint8_t *p;
>> +	int r;
>> +	uint16_t logid;
>> +	event_record_t rec;
>> +
>> +	r =3D sd_bus_message_read(m, "sss", &message, &severity, &association);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerro=
r(-r));
>> +		return r;
>> +	}
>> +
>> +	r =3D sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n",=
 strerror(-r));
>> +		return r;
>> +	}
>> +
>> + =C2=A0 =C2=A0rec.message =C2=A0 =C2=A0 =3D (char*) message;
>> + =C2=A0 =C2=A0rec.severity =C2=A0 =C2=A0=3D (char*) severity;
>> + =C2=A0 =C2=A0rec.association =3D (char*) association;
>> + =C2=A0 =C2=A0rec.reportedby =C2=A0=3D (char*) "Host";
>> + =C2=A0 =C2=A0rec.p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8_t*) p;
>> + =C2=A0 =C2=A0rec.n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D n;
>> +
>> +
>> +	logid =3D message_create_new_log_event(&rec);
>> +
>> +	if (logid)=20
>> +		r =3D send_log_to_dbus(logid);
>> +
>> +	return sd_bus_reply_method_return(m, "q", logid);
>> +}
>> +
>> +
>> +static int method_accept_test_message(sd_bus_message *m,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_bus_error =
*ret_error) {
>> +
>> +	uint8_t p[] =3D {0x30, 0x32, 0x34, 0x36};
>> +	uint16_t logid;
>> +	event_record_t rec;
>> +
>> + =C2=A0 =C2=A0rec.message =C2=A0 =C2=A0 =3D (char*) "Testing Message";
>> + =C2=A0 =C2=A0rec.severity =C2=A0 =C2=A0=3D (char*) "Info";
>> + =C2=A0 =C2=A0rec.association =3D (char*) "Association";
>> + =C2=A0 =C2=A0rec.reportedby =C2=A0=3D (char*) "Test";
>> + =C2=A0 =C2=A0rec.p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8_t*) p;
>> + =C2=A0 =C2=A0rec.n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sizeof(*p);
>> +
>> +	logid =3D message_create_new_log_event(&rec);
>> +	send_log_to_dbus(logid);
>> +
>> +	return sd_bus_reply_method_return(m, "q", logid);
>> +}
>> +
>> +
>> +static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_er=
ror *ret_error) {
>> +	Node *n;
>> +	messageEntry_t *p;
>> +=09
>> +	// This deletes one log at a time and seeing how the
>> +	// list shrinks using the NULL works fine here
>> +	while (n =3D list_get_next_node(glist, NULL)) {
>> +		p =3D (messageEntry_t *) n->data;
>> +		message_delete_log(p->logid);
>> +		remove_log_from_dbus(n);
>> +	}
>> +
>> +	return sd_bus_reply_method_return(m, "q", 0);
>> +}
>> +
>> +
>> +static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_e=
rror *ret_error) {
>> +
>> +	Node *n =3D (Node*)userdata;
>> +	messageEntry_t *p =3D (messageEntry_t *) n->data;
>> +
>> +	message_delete_log(p->logid);
>> +	remove_log_from_dbus(n);
>> +	return sd_bus_reply_method_return(m, "q", 0);
>> +}
>> +
>> +
>> +
>> +static const sd_bus_vtable recordlog_vtable[] =3D {
>> +	SD_BUS_VTABLE_START(0),
>> +	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_me=
ssage, SD_BUS_VTABLE_UNPRIVILEGED),
>> +	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_messa=
ge, SD_BUS_VTABLE_UNPRIVILEGED),
>> +	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRI=
VILEGED),
>> +	SD_BUS_VTABLE_END
>> +};
>> +
>> +static const sd_bus_vtable log_vtable[] =3D {
>> +	SD_BUS_VTABLE_START(0), =C2=A0=20
>> +	SD_BUS_PROPERTY("Association", =C2=A0 =C2=A0 =C2=A0"s", prop_message, =
0, SD_BUS_VTABLE_PROPERTY_CONST),
>> +	SD_BUS_PROPERTY("Message", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"s", prop=
_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
>> +	SD_BUS_PROPERTY("Severity", =C2=A0 =C2=A0 =C2=A0 =C2=A0 "s", prop_mess=
age, 0, SD_BUS_VTABLE_PROPERTY_CONST),
>> +	SD_BUS_PROPERTY("Reported_By", =C2=A0 =C2=A0 =C2=A0"s", prop_message, =
0, SD_BUS_VTABLE_PROPERTY_CONST),
>> +	SD_BUS_PROPERTY("Time", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "s",=
 prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
>> +	SD_BUS_PROPERTY("DevelopmentData", "ay", prop_message_dd ,0, SD_BUS_VT=
ABLE_PROPERTY_CONST),
>> +	SD_BUS_VTABLE_END
>> +};
>> +
>> +
>> +static const sd_bus_vtable recordlog_delete_vtable[] =3D {
>> +	SD_BUS_VTABLE_START(0),
>> +	SD_BUS_METHOD("delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNP=
RIVILEGED),
>> +	SD_BUS_VTABLE_END
>> +};
>> +
>> +static int remove_log_from_dbus(Node *node) {
>> +=09
>> +	messageEntry_t *p =3D (messageEntry_t *) node->data;
>> +	int r;
>> +	char buffer[32];
>> +
>> +	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->=
logid);
>> +
>> +	printf("Attempting to delete %s\n", buffer);
>> +
>> +	r =3D sd_bus_emit_object_removed(bus, buffer);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r)=
);
>> +		return -1;
>> +	}=09
>> +	sd_bus_slot_unref(p->messageslot);
>> +	sd_bus_slot_unref(p->deleteslot);
>> +
>> +	message_entry_close(p);
>> +	list_delete_node(glist, node);
>> +
>> +	return 0;
>> +}
>> +
>> +int send_log_to_dbus(const uint16_t logid) {
>> +
>> +	char loglocation[64];
>> +	int r;
>> +	messageEntry_t *m;
>> +	Node *node;
>> +
>> +
>> +	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/event=
s/%d", logid);
>> +
>> +	message_entry_new(&m, logid);
>> +
>> +	node =3D list_add_node(glist, m);
>> +
>> +	r =3D sd_bus_add_object_vtable(bus,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->messageslot,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.record",
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_vtable,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocatio=
n, strerror(-r));
>> +		message_entry_close(m);
>> +		list_delete_last_node(glist);
>> +		return 0;
>> +	}
>> +
>> +	r =3D sd_bus_add_object_vtable(bus,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->deleteslot,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.Object.Delete",
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog_delete_vtable,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node);
>> +=09
>> +	printf("Event Log added %s\n", loglocation);
>> +
>> +	r =3D sd_bus_emit_object_added(bus, loglocation);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
>> +		return 0;
>> +	}
>> +
>> +	return logid;
>> +}
>> +
>> +
>> +int start_event_monitor(void) {
>> +
>> +	int r;
>> +
>> +	for (;;) {
>> +
>> +		r =3D sd_bus_process(bus, NULL);
>> +		if (r < 0) {
>> +			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
>> +			break;
>> +		}
>> +
>> +		if (r > 0)
>> +			continue;
>> +
>> +		r =3D sd_bus_wait(bus, (uint64_t) -1);
>> +		if (r < 0) {
>> +			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
>> +			break;
>> +		}
>> +	}
>> +
>> +	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>> +}
>> +
>> +
>> +/* Only thing we are doing in this function is to get a connection on t=
he dbus */
>> +int build_bus(void) {
>> +
>> +	int r =3D 0;
>> +
>> +	glist =3D list_create();
>> +	/* Connect to the system bus */
>> +	r =3D sd_bus_open_system(&bus);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r)=
);
>> +		goto finish;
>> +	}
>> +
>> +	/* Install the object */
>> +	r =3D sd_bus_add_object_vtable(bus,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &slot,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "/org/openbmc/records/events", =C2=A0/* object=
 path */
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.recordlog", =C2=A0 /* interface n=
ame */
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog_vtable,
>> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
>> +		goto finish;
>> +	}
>> +
>> +	/* Take a well-known service name so that clients can find us */
>> +	r =3D sd_bus_request_name(bus, "org.openbmc.records.events", 0);
>> +	if (r < 0) {
>> +		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
>> +	}=09
>> +=09
>> +	/* You want to add an object manager to support deleting stuff =C2=A0*/
>> +	/* without it, dbus can show interfaces that no longer exist */
>> +	r =3D sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/event=
s");
>> +	if (r < 0) {
>> +		fprintf(stderr, "Object Manager failure =C2=A0%s\n", strerror(-r));
>> +	}
>> +
>> +
>> +	finish:
>> +	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>> +}
>> +
>> +void cleanup_event_monitor(void) {
>> +	sd_bus_slot_unref(slot);
>> +	sd_bus_unref(bus);
>> +}
>> \ No newline at end of file
>> diff --git a/event_messaged_sdbus.h b/event_messaged_sdbus.h
>> new file mode 100644
>> index 0000000..a6aac94
>> --- /dev/null
>> +++ b/event_messaged_sdbus.h
>> @@ -0,0 +1,14 @@
>> +#include <stddef.h>
>> +
>> +#ifdef __cplusplus
>> +extern "C" =C2=A0{
>> +#endif
>> +	int start_event_monitor(void);
>> +	int build_bus(void);
>> +	int send_log_to_dbus(const uint16_t logid);
>> +	void cleanup_event_monitor(void);
>> +#ifdef __cplusplus
>> +}
>> +#endif
>> +
>> +
>> diff --git a/message.C b/message.C
>> new file mode 100644
>> index 0000000..31a545a
>> --- /dev/null
>> +++ b/message.C
>> @@ -0,0 +1,224 @@
>> +#include <iostream>
>> +#include <fstream>
>> +#include <iomanip>
>> +#include <cstdint>
>> +#include <string>
>> +#include <sys/types.h>=20
>> +#include <dirent.h>=20
>> +#include <sstream>
>> +#include <sys/stat.h>
>> +#include <cstring>
>> +#include "message.H"
>> +#include <time.h>
>> +#include <stddef.h>
>> +#include <cstdio>
>> +
>> +using namespace std;
>> +
>> +const uint32_t g_eyecatcher =3D 0x4F424D43; // OBMC
>> +const uint16_t g_version =C2=A0 =C2=A0=3D 1;
>> +
>> +struct logheader_t {
>> + =C2=A0 =C2=A0uint32_t eyecatcher;
>> + =C2=A0 =C2=A0uint16_t version;
>> + =C2=A0 =C2=A0uint16_t logid;
>> + =C2=A0 =C2=A0time_t =C2=A0 timestamp;
>> + =C2=A0 =C2=A0uint16_t detailsoffset;
>> + =C2=A0 =C2=A0uint16_t messagelen;
>> + =C2=A0 =C2=A0uint16_t severitylen;
>> + =C2=A0 =C2=A0uint16_t associationlen;
>> + =C2=A0 =C2=A0uint16_t reportedbylen;
>> + =C2=A0 =C2=A0uint16_t debugdatalen;
>> +};
>> +
>> +uint16_t g_logid =3D 0;
>> +
>> +extern const char *glogname;
>> +
>> +static uint16_t get_new_log_number(void) {
>> + =C2=A0 =C2=A0return ++g_logid;
>> +}
>> +
>> +static void update_latest_logid(uint16_t logid) {
>> + =C2=A0 =C2=A0if (logid > g_logid)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0g_logid =3D logid;
>> + =C2=A0 =C2=A0return;
>> +}
>> +
>> +inline uint16_t GETLEN(const char *s) {
>> + =C2=A0 =C2=A0return (uint16_t) (1 + strlen(s));
>> +}
>> +
>> +static uint16_t create_log_event(event_record_t *rec) {
>> +
>> + =C2=A0 =C2=A0std::ostringstream buffer;
>> + =C2=A0 =C2=A0ofstream myfile;
>> + =C2=A0 =C2=A0logheader_t hdr;
>> +
>> +
>> + =C2=A0 =C2=A0buffer << glogname << "/" << int(rec->logid) ;
>> +
>> + =C2=A0 =C2=A0cout << buffer.str() << endl;
>> +
>> + =C2=A0 =C2=A0hdr.eyecatcher =C2=A0 =C2=A0 =3D g_eyecatcher;
>> + =C2=A0 =C2=A0hdr.version =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D g_version;
>> + =C2=A0 =C2=A0hdr.logid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D rec->logi=
d;
>> + =C2=A0 =C2=A0hdr.timestamp =C2=A0 =C2=A0 =C2=A0=3D time(NULL);
>> + =C2=A0 =C2=A0hdr.detailsoffset =C2=A0=3D offsetof(logheader_t, message=
len);
>> + =C2=A0 =C2=A0hdr.messagelen =C2=A0 =C2=A0 =3D GETLEN(rec->message);
>> + =C2=A0 =C2=A0hdr.severitylen =C2=A0 =C2=A0=3D GETLEN(rec->severity);
>> + =C2=A0 =C2=A0hdr.associationlen =3D GETLEN(rec->association);
>> + =C2=A0 =C2=A0hdr.reportedbylen =C2=A0=3D GETLEN(rec->reportedby);
>> + =C2=A0 =C2=A0hdr.debugdatalen =C2=A0 =3D rec->n;
>> +
>> + =C2=A0 =C2=A0myfile.open(buffer.str() , ios::out|ios::binary);
>> + =C2=A0 =C2=A0myfile.write((char*) &hdr, sizeof(hdr));
>> + =C2=A0 =C2=A0myfile.write((char*) rec->message, hdr.messagelen);
>> + =C2=A0 =C2=A0myfile.write((char*) rec->severity, hdr.severitylen);
>> + =C2=A0 =C2=A0myfile.write((char*) rec->association, hdr.associationlen=
);
>> + =C2=A0 =C2=A0myfile.write((char*) rec->reportedby, hdr.reportedbylen);
>> + =C2=A0 =C2=A0myfile.write((char*) rec->p, hdr.debugdatalen);
>> + =C2=A0 =C2=A0myfile.close();
>> +
>> + =C2=A0 =C2=A0return rec->logid;
>> +}
>> +
>> +static int is_file_a_log(string str) {
>> +
>> + =C2=A0 =C2=A0std::ostringstream buffer;
>> + =C2=A0 =C2=A0ifstream f;
>> + =C2=A0 =C2=A0logheader_t hdr;
>> +
>> + =C2=A0 =C2=A0if (!str.compare("."))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> + =C2=A0 =C2=A0if (!str.compare(".."))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> +
>> + =C2=A0 =C2=A0buffer << glogname << "/" << str;
>> +
>> + =C2=A0 =C2=A0f.open( buffer.str(), ios::binary);
>> +
>> + =C2=A0 =C2=A0if (!f.good()) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> + =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0f.read((char*)&hdr, sizeof(hdr));
>> +
>> + =C2=A0 =C2=A0if (hdr.eyecatcher !=3D g_eyecatcher)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> +
>> + =C2=A0 =C2=A0return 1;
>> +}
>> +
>> +
>> +
>> +int message_load_log(uint16_t logid, event_record_t **rec) {
>> +
>> + =C2=A0 =C2=A0std::ostringstream buffer;
>> + =C2=A0 =C2=A0ifstream f;
>> + =C2=A0 =C2=A0logheader_t hdr;
>> +
>> + =C2=A0 =C2=A0buffer << glogname << "/" << int(logid);
>> +
>> + =C2=A0 =C2=A0f.open( buffer.str(), ios::binary);
>> +
>> + =C2=A0 =C2=A0if (!f.good()) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> + =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0*rec =3D new event_record_t;
>> +
>> + =C2=A0 =C2=A0f.read((char*)&hdr, sizeof(hdr));
>> +
>> + =C2=A0 =C2=A0(*rec)->logid =C2=A0 =C2=A0 =3D hdr.logid;
>> + =C2=A0 =C2=A0(*rec)->timestamp =3D hdr.timestamp;
>> +
>> +
>> + =C2=A0 =C2=A0(*rec)->message =3D new char[hdr.messagelen];
>> + =C2=A0 =C2=A0f.read((*rec)->message, hdr.messagelen);
>> +
>> + =C2=A0 =C2=A0(*rec)->severity =3D new char[hdr.severitylen];
>> + =C2=A0 =C2=A0f.read((*rec)->severity, hdr.severitylen);
>> +
>> + =C2=A0 =C2=A0(*rec)->association =3D new char[hdr.associationlen];
>> + =C2=A0 =C2=A0f.read((*rec)->association, hdr.associationlen);
>> +
>> + =C2=A0 =C2=A0(*rec)->reportedby =3D new char[hdr.reportedbylen];
>> + =C2=A0 =C2=A0f.read((*rec)->reportedby, hdr.reportedbylen);
>> +
>> + =C2=A0 =C2=A0(*rec)->p =3D new uint8_t[hdr.debugdatalen];
>> + =C2=A0 =C2=A0f.read((char*)(*rec)->p, hdr.debugdatalen);
>> + =C2=A0 =C2=A0(*rec)->n =3D hdr.debugdatalen;
>> +
>> +
>> + =C2=A0 =C2=A0f.close();
>> + =C2=A0 =C2=A0return logid;
>> +}
>> +
>> +void message_free_log(event_record_t *rec) {
>> +
>> + =C2=A0 =C2=A0delete[] rec->message;
>> + =C2=A0 =C2=A0delete[] rec->severity;
>> + =C2=A0 =C2=A0delete[] rec->association;
>> + =C2=A0 =C2=A0delete[] rec->reportedby;
>> + =C2=A0 =C2=A0delete[] rec->p;
>> + =C2=A0 =C2=A0delete rec;
>> +
>> + =C2=A0 =C2=A0return ;
>> +}
>> +
>> +int message_delete_log(uint16_t logid) {
>> +
>> + =C2=A0 =C2=A0std::stringstream buffer;
>> + =C2=A0 =C2=A0string s;
>> +
>> + =C2=A0 =C2=A0buffer << glogname << "/" << int(logid);
>> +
>> + =C2=A0 =C2=A0s =3D buffer.str();
>> + =C2=A0 =C2=A0std::remove(s.c_str());
>> +
>> + =C2=A0 =C2=A0return 0;
>> +}
>> +
>> +
>> +int message_get_next_log(uint16_t *logid, event_log_list *log_list) {
>> +
>> + =C2=A0 =C2=A0std::ostringstream buffer;
>> + =C2=A0 =C2=A0struct dirent *ent;
>> +
>> + =C2=A0 =C2=A0if (*logid=3D=3D0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0log_list->dirp =3D opendir(glogname);
>> +
>> + =C2=A0 =C2=A0if(log_list->dirp)
>> + =C2=A0 =C2=A0{
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0do {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ent =3D readdir(log_list->dir=
p);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ent =3D=3D NULL)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0string str(ent->d_name);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_file_a_log(str)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*logid =3D (uin=
t16_t) atoi(str.c_str());
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_latest_l=
ogid(*logid);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0} while( 1 );
>> + =C2=A0 =C2=A0}=20
>> + =C2=A0 =C2=A0else
>> + =C2=A0 =C2=A0{=20
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cerr << "Error opening directory" << glogna=
me << endl;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ent =C2=A0 =C2=A0=3D NULL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*logid =3D 0;
>> + =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0return =C2=A0((ent =3D=3D NULL) ? 0 : 1);
>> +}
>> +
>> +
>> +uint16_t message_create_new_log_event(event_record_t *rec) {
>> +
>> + =C2=A0 =C2=A0rec->logid =3D get_new_log_number();
>> + =C2=A0 =C2=A0return create_log_event(rec);
>> +}
>> diff --git a/message.H b/message.H
>> new file mode 100644
>> index 0000000..26ebe19
>> --- /dev/null
>> +++ b/message.H
>> @@ -0,0 +1,60 @@
>> +
>> +#include <dirent.h>
>> +#include <time.h>
>> +
>> +#ifdef __cplusplus
>> + =C2=A0 =C2=A0#include <cstdint>
>> +#else
>> + =C2=A0 =C2=A0#include <stdint.h>
>> +#endif
>> +
>> +
>> +#ifdef __cplusplus
>> + =C2=A0 =C2=A0struct event_log_list {
>> +#else
>> + =C2=A0 =C2=A0typedef struct _event_log_list { =C2=A0 =C2=A0 =C2=A0 =C2=
=A0
>> +#endif
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0DIR *dirp;
>> +#ifdef __cplusplus
>> + =C2=A0 =C2=A0};
>> +#else =C2=A0 =C2=A0
>> + =C2=A0 =C2=A0} event_log_list;
>> +#endif
>> +
>> +
>> +#ifdef __cplusplus
>> + =C2=A0 =C2=A0struct event_record_t {
>> +#else =C2=A0 =C2=A0=20
>> + =C2=A0 =C2=A0typedef struct _event_record_t {
>> +#endif
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *message;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *severity;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *association;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *reportedby;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *p;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0// These get filled in for you
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0time_t =C2=A0timestamp; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0int16_t logid;
>> +#ifdef __cplusplus
>> + =C2=A0 =C2=A0};
>> +#else =C2=A0 =C2=A0=20
>> + =C2=A0 =C2=A0} event_record_t;
>> +#endif
>> +
>> +
>> +#ifdef __cplusplus
>> +extern "C" =C2=A0{
>> +#endif
>> +
>> +
>> +uint16_t message_create_new_log_event(event_record_t *rec);
>> +int =C2=A0 =C2=A0 =C2=A0message_load_log(uint16_t logid, event_record_t=
 **rec);
>> +void =C2=A0 =C2=A0 message_free_log(event_record_t *rec);
>> +int =C2=A0 =C2=A0 =C2=A0message_get_next_log(uint16_t *logid, event_log=
_list *log_list);
>> +int =C2=A0 =C2=A0 =C2=A0message_delete_log(uint16_t logid);
>> +
>> +#ifdef __cplusplus
>> +}
>> +#endif
>> diff --git a/test.C b/test.C
>> new file mode 100644
>> index 0000000..afd834e
>> --- /dev/null
>> +++ b/test.C
>> @@ -0,0 +1,92 @@
>> +#include <iostream>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <stdint.h>
>> +
>> +#include "message.H"
>> +using namespace std;
>> +
>> +const char *glogname =3D "./events";
>> +
>> +#define ASSERT(a,b) =C2=A0if(a!=3Db) {cout << "ASSERT ERROR: line " << =
__LINE__ << endl; exit(1);}
>> +
>> +void build_event_record(event_record_t *rec,
>> +						uint16_t logid,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *message,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *severity,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *association,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *reportedby,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const uint8_t *p,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0size_t n) {
>> +
>> +
>> + =C2=A0 =C2=A0rec->message =C2=A0 =C2=A0 =3D (char*) message;
>> + =C2=A0 =C2=A0rec->severity =C2=A0 =C2=A0=3D (char*) severity;
>> + =C2=A0 =C2=A0rec->association =3D (char*) association;
>> + =C2=A0 =C2=A0rec->reportedby =C2=A0=3D (char*) reportedby;
>> + =C2=A0 =C2=A0rec->p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8_t*) =
p;
>> + =C2=A0 =C2=A0rec->n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D n;
>> +
>> + =C2=A0 =C2=A0return;
>> +}
>> +
>> +int load_existing_events(void) {
>> +
>> +	event_log_list log_list;
>> +	uint16_t =C2=A0 =C2=A0 =C2=A0 logid=3D0;
>> +	event_record_t *rec;
>> +
>> +	cout << "Loading event log... ";
>> +
>> +	while (message_get_next_log(&logid, &log_list)) {
>> +		cout << " " << int(logid);
>> +		message_load_log(logid, &rec);
>> +
>> +		cout << rec->message << endl;
>> +
>> +		message_free_log(rec);
>> +	}
>> +	cout << endl;
>> +=09
>> +	return 0;
>> +}
>> +
>> +
>> +int main(int argc, char *argv[]) {
>> +
>> +	int rc =3D 0;
>> +
>> +	uint8_t p[] =3D {0x3, 0x32, 0x34, 0x36};
>> +	event_record_t rec, *prec;
>> +	event_log_list log_list;
>> +	uint16_t logid=3D0;
>> +	int i;
>> +
>> +	build_event_record(&rec,0, "Testing Message1", "Info", "Association", =
"Test", p, 4);
>> +	ASSERT(message_create_new_log_event(&rec),1);
>> +	build_event_record(&rec,0, "Testing Message2", "Info", "/dev", "Test",=
 p, 4);
>> +	ASSERT(message_create_new_log_event(&rec),2);
>> +	build_event_record(&rec,0, "Testing Message3", "Info", "Association", =
"Test", p, 4);
>> +	ASSERT(message_create_new_log_event(&rec),3);
>> +
>> +	ASSERT(message_load_log(13, &prec), 0);
>> +	ASSERT(message_load_log(1, &prec), 1); message_free_log(prec);
>> +
>> +	// Test the number of valid logs so far
>> +	i =3D 0;
>> +	while (message_get_next_log(&logid, &log_list)) {
>> +
>> +
>> +		cout << int(logid) << endl;
>> +		i++;
>> +	}
>> +	//ASSERT(i,3);
>> +
>> +	cout << "LOADLOG TEST" << endl;
>> +
>> +	load_existing_events();
>> +
>> +	message_delete_log(1);
>> +
>> +	return rc;
>> +}
>> \ No newline at end of file
>> --=20
>> 2.6.4
>>
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
> [attachment "signature.asc" removed by Chris Austen/Austin/IBM]

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsf7HAAoJEPC3R3P2I92FOnUP/jOavhVnTJqQ+Np6qmxK0B1R
rS5zff07H0yDUitegpoypu5NIffiuUIla4N1q30jhGqyEz2k/kIKETED38pkD2Mm
7/Wfpbw7mGQgfYMKeGBBe7YzGgRVNl2nS3JedkN6CA4t+1myIWt7U26PntaPvs1w
EwWCsccuive5WkFn5jIs2KeNkmWs5LS81b9gbGE7OnPP0mW9tk1pOKn9r87YQZle
DFrZkksIJLKr7I+MwVnNfBbXwPOeI8ZRtmTZf7022hudh0HtUUtnIxonS57GG9TA
VeZllFOKBz38Stdu2ibDuL9s2lvr5T4pU/LWW/TSi2QsKG/C/2bO5ID3ZrIpORyL
ceqf9AdJeDTxtcTWu0KvMa8Opn6qB0mhKvn2zSU0WY+CRU1p2vOU7U+5FoOv0NRl
qXHkPeJGvr+UBmX2s1z1FSZ7SnoqT4cr3d4/uXW2qdhbnCCj68ic74AdJhTwTELj
6IKvGHc+5FeGbvSW/MiX0snyalSqFGStWtmRhMXuJ9/jEBXXpoYRa0+soBSSURq4
vpj1+eh5/XIAsHPIIRq9SMAjkVA26zBeO0XDGlVSXZwhKjr3hj9lvMitQ6Zmh7Iq
P8Xio1XPP+KicP/R10sWYNOhth4T4tMoNyhf78eJuuvuW/iEIVNWjUPNs3+uJdst
F3DaEbHapB8I/LsEN8zq
=F56R
-----END PGP SIGNATURE-----
--=-=-=--
