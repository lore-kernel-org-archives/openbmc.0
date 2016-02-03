Return-Path: <austenc@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AA5431A0220
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:31:49 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 2 Feb 2016 23:31:47 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 23:31:45 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8ADBC19D8040
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 23:19:44 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u136VjqQ25559146
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:31:45 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u136VjdA005582
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:31:45 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u136VhqU005525
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:31:44 -0700
Message-Id: <201602030631.u136VhqU005525@d03av01.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 3 Feb 2016 01:31:43 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 3 Feb 2016 01:31:42 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 3 Feb 2016 06:31:40 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 3 Feb 2016 06:31:39 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016020306325123-31640 ;
 Wed, 3 Feb 2016 06:32:51 +0000 
In-Reply-To: <877fimibu3.fsf@gamma.ozlabs.ibm.com>
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot
From: "Chris Austen" <austenc@us.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Wed, 3 Feb 2016 06:31:38 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <877fimibu3.fsf@gamma.ozlabs.ibm.com>,
 <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 13075
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
x-cbid: 16020306-0005-0000-0000-00001C0ACCCE
X-IBM-ISS-SpamDetectors: Score=0.425523; BY=0.293795; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.425523; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004873; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654483; UDB=6.00296565; UTC=2016-02-03
 06:31:40
x-cbparentid: 16020306-5938-0000-0000-000001E7646E
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Wed, 03 Feb 2016 06:31:50 -0000

=20


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: Daniel Axtens=20
Sent by: "openbmc"=20
Date: 02/02/2016 11:48PM
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Chris Austen <austenc@us.ibm.com>
>
> The event service stores the events from the host. =C2=A0Before this comm=
it all the code was in memory. =C2=A0That meant once a reboot occured you l=
ost the logs. =C2=A0With this commit I am storing all logs to the file syst=
em. =C2=A0This refactoring also enables a test suite. =C2=A0The suite can b=
e invoked by 'make test; ./test'.
>
> 1) /var/sys/obmc/events/x
> 2) logs are stored in binary and saved

A couple of broad design questions, and apologies if I've missed some of
the 'backstory' here:

=C2=A0- Can this log grow unboundedly? Do we need to support logrotate? Do =
we
=C2=A0=C2=A0 need to enable it now? Will this code deal with the file chang=
ing
=C2=A0=C2=A0 underneath it when it's rotated?

=C2=A0- Is there a compelling reason to store the logs in binary? Can we
=C2=A0=C2=A0 store then in text? Or do we have existing tooling to decode t=
hem?

Regards,
Daniel

CA: A log rotate concept seems reasonable.=C2=A0 I can open an issue to ens=
ure that happens.=C2=A0 Any traditional readings on the subject?

CA: The Binary thought process is as follows (and I'm not married to the id=
ea)
=C2=A0 1) The debug developer data is presented as an array of bytes.=C2=A0=
 So I stored it as an array of bytes.=C2=A0=20
=C2=A0 2) Why an array of bytes and not a string?=C2=A0 Well debug data can=
 be up to 2K.=C2=A0 Converting it to ascii makes each log stored as 4K.=C2=
=A0=20
=C2=A0 3) REST is the customer visible interface. no need for anyone outsid=
e of the service/support team to be relying on any internals



> 3) Each log now has a timestamp of when the log reached the service
> 4) I added a caching mechanism to reduce the io traffic if the the method=
 is simply being called to capture the next parameter
> 5) You will notice a mixture of c/c++. =C2=A0This is because I want the t=
est infrastructure to take advantage of c++ features
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
> =C2=A0Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02=
9 ++--
> =C2=A0event=5Fmessaged.C =C2=A0 =C2=A0 =C2=A0 | =C2=A044 +++++
> =C2=A0event=5Fmessaged.c =C2=A0 =C2=A0 =C2=A0 | 341 ---------------------=
------------------
> =C2=A0event=5Fmessaged=5Fsdbus.c | 425 ++++++++++++++++++++++++++++++++++=
+++++++++++++++
> =C2=A0event=5Fmessaged=5Fsdbus.h | =C2=A014 ++
> =C2=A0message.C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 224 +++=
+++++++++++++++++++++++
> =C2=A0message.H =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A06=
0 +++++++
> =C2=A0test.C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A092 +++++++++++
> =C2=A08 files changed, 878 insertions(+), 351 deletions(-)
> =C2=A0create mode 100644 event=5Fmessaged.C
> =C2=A0delete mode 100644 event=5Fmessaged.c
> =C2=A0create mode 100644 event=5Fmessaged=5Fsdbus.c
> =C2=A0create mode 100644 event=5Fmessaged=5Fsdbus.h
> =C2=A0create mode 100644 message.C
> =C2=A0create mode 100644 message.H
> =C2=A0create mode 100644 test.C
>
> diff --git a/Makefile b/Makefile
> index 4c2ba9b..903ac06 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,27 +1,36 @@
> -TEST =C2=A0 =C2=A0 =C2=A0=3D listfunc
> -OBJS=5FTEST =3D $(TEST).o
> =C2=A0
> -EXE =C2=A0 =C2=A0 =3D event=5Fmessaged
> +TEST =C2=A0 =C2=A0 =C2=A0=3D test
> =C2=A0
> -OBJS =C2=A0 =C2=A0=3D $(EXE).o =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list.o 	 \
> +EXE =C2=A0 =C2=A0 =C2=A0 =3D event=5Fmessaged
> +EXE=5FOBJS =C2=A0=3D $(EXE).o message.o event=5Fmessaged=5Fsdbus.o list.o
> =C2=A0
> +OBJS=5FTEST =3D $(TEST).o message.o
> +
> +CPPFLAGS =C2=A0+=3D -g -fpic -Wall -std=3Dc++11
> =C2=A0
> =C2=A0DEPPKGS =3D libsystemd
> -CC =C2=A0 =C2=A0 =C2=A0?=3D $(CROSS=5FCOMPILE)gcc
> =C2=A0INCLUDES +=3D $(shell pkg-config --cflags $(DEPPKGS))=20
> =C2=A0LIBS +=3D $(shell pkg-config --libs $(DEPPKGS))
> =C2=A0
> +
> +
> =C2=A0all: $(EXE)
> =C2=A0
> =C2=A0%.o : %.c=20
> =C2=A0	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
> =C2=A0
> -$(EXE): $(OBJS)
> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +%.o : %.C
> +	$(CXX) -c $< $(CPPFLAGS) -o $@
> +
> +
> +$(EXE): $(EXE=5FOBJS)
> +	$(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
> +
> =C2=A0
> =C2=A0$(TEST): $(OBJS=5FTEST)
> -	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +	$(CXX) $^ $(LDFLAGS) -o $@
> =C2=A0
> =C2=A0clean:
> -	rm -f $(OBJS) $(EXE) *.o *.d
> +	rm -f $(TEST) *.o *.so $(EXE)
> +
> +
> diff --git a/event=5Fmessaged.C b/event=5Fmessaged.C
> new file mode 100644
> index 0000000..4376431
> --- /dev/null
> +++ b/event=5Fmessaged.C
> @@ -0,0 +1,44 @@
> +#include <iostream>
> +#include "message.H"
> +#include "event=5Fmessaged=5Fsdbus.h"
> +
> +const char *glogname =3D "/var/lib/obmc/events";
> +
> +using namespace std;
> +
> +
> +// Walk through all the saved logs and reload them in to dbus objects
> +// Needed because on a reboot the existing logs need to be reloaded
> +int load=5Fexisting=5Fevents(void) {
> +
> + =C2=A0 =C2=A0event=5Flog=5Flist log=5Flist;
> + =C2=A0 =C2=A0uint16=5Ft =C2=A0 =C2=A0 =C2=A0 logid=3D0;
> +
> + =C2=A0 =C2=A0while (message=5Fget=5Fnext=5Flog(&logid, &log=5Flist)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0send=5Flog=5Fto=5Fdbus(logid);
> + =C2=A0 =C2=A0}
> + =C2=A0 =C2=A0
> + =C2=A0 =C2=A0return 0;
> +}
> +
> +int main(int argc, char *argv[]) {
> +
> + =C2=A0 =C2=A0int rc =3D 0;
> +
> + =C2=A0 =C2=A0if ((rc =3D build=5Fbus()) < 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Event Messager failed to co=
nnect to dbus rc=3D%d", rc);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0if ((rc =3D load=5Fexisting=5Fevents()) < 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Event Messager failed add p=
revious logs to dbus rc=3D%d", rc);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto finish;
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0rc =3D start=5Fevent=5Fmonitor();
> +
> + =C2=A0 =C2=A0finish:
> + =C2=A0 =C2=A0cleanup=5Fevent=5Fmonitor();
> +
> + =C2=A0 =C2=A0return rc;
> +}
> \ No newline at end of file
> diff --git a/event=5Fmessaged.c b/event=5Fmessaged.c
> deleted file mode 100644
> index 0c75e3a..0000000
> --- a/event=5Fmessaged.c
> +++ /dev/null
> @@ -1,341 +0,0 @@
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -#include <stddef.h>
> -#include <systemd/sd-bus.h>
> -#include "list.h"
> -
> -uint16=5Ft g=5Flogid =3D 0;
> -sd=5Fbus *bus =3D NULL;
> -List *glist;
> -
> -
> -int create=5Fnew=5Flog=5Fevent(void *userdata,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *message,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *severity,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *association,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *reportedby,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8=5Ft *p,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 size=5Ft n);
> -
> -typedef struct messageEntry=5Ft {
> -	char =C2=A0 =C2=A0*message;
> -	char =C2=A0 =C2=A0*severity;
> -	char =C2=A0 =C2=A0*reportedby;
> -	char =C2=A0 =C2=A0*association;
> -	uint8=5Ft *debugbytes;
> -	size=5Ft =C2=A0 debuglength;
> -	size=5Ft =C2=A0 logid;
> -
> -	sd=5Fbus=5Fslot *messageslot;
> -	sd=5Fbus=5Fslot *deleteslot;
> -
> -} messageEntry=5Ft;
> -
> -
> -void message=5Fstorage=5Fdelete(messageEntry=5Ft *m) {
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
> -	r =3D sd=5Fbus=5Femit=5Fobject=5Fremoved(bus, path);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
> -		return;
> -	}
> -
> -	sd=5Fbus=5Fslot=5Funref(m->messageslot);
> -	sd=5Fbus=5Fslot=5Funref(m->deleteslot);
> -
> -	free(m);
> -
> -	return;
> -}
> -
> -
> -
> -void message=5Fadd(messageEntry=5Ft **n,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *mess=
age,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *seve=
rity,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *asso=
ciation,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *repo=
rtedby,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=5Ft =C2=A0 =
=C2=A0 =C2=A0logid,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8=5Ft =C2=A0=
 =C2=A0*data,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=5Ft =C2=A0 =
=C2=A0 =C2=A0datalen)
> -{
> -
> -	messageEntry=5Ft *p =3D *n =3D malloc(sizeof(messageEntry=5Ft));
> -
> -	asprintf(&(*n)->message, =C2=A0 =C2=A0 "%s", message);
> -	asprintf(&(*n)->severity, =C2=A0 =C2=A0"%s", severity);
> -	asprintf(&(*n)->association, "%s", association);
> -	asprintf(&(*n)->reportedby, =C2=A0"%s", reportedby);
> -
> -	(*n)->logid =C2=A0 =C2=A0 =C2=A0 =3D logid;
> -	(*n)->debugbytes =C2=A0=3D (uint8=5Ft*) malloc (datalen);
> -	(*n)->debuglength =3D datalen;
> -	memcpy((*n)->debugbytes, data, datalen);
> -
> -	(*n)->messageslot =3D NULL;
> -	(*n)->deleteslot =C2=A0=3D NULL;
> -	return;
> -}
> -
> -
> -static int get=5Fmessage=5Fdd(sd=5Fbus *bus,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *path,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *interface,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const char *property,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fmessage *reply,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0void *userdata,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Ferror *error) {
> -
> -	int r;
> -	messageEntry=5Ft *p =3D (messageEntry=5Ft *)userdata;
> -=09
> -	r =3D sd=5Fbus=5Fmessage=5Fappend=5Farray(reply, 'y', p->debugbytes, p-=
>debuglength);
> -	if (r < 0) {
> -	 =C2=A0printf("Error building array for property %s\n", strerror(-r));
> -	}
> -
> -	return r;
> -}
> -
> -
> -/////////////////////////////////////////////////////////////
> -// Receives an array of bytes as an esel error log
> -// returns the messageid in 2 byte format
> -// =C2=A0
> -// =C2=A0S1 - Message - Simple sentence about the fail
> -// =C2=A0S2 - Severity - How bad of a problem is this
> -// =C2=A0S3 - Association - sensor path
> -// =C2=A0ay - Detailed data - developer debug information
> -//
> -/////////////////////////////////////////////////////////////
> -static int method=5Faccept=5Fhost=5Fmessage(sd=5Fbus=5Fmessage *m,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fer=
ror *ret=5Ferror) {
> -
> -	char *message, *severity, *association;
> -	size=5Ft =C2=A0 n =3D 4;
> -	uint8=5Ft *p;
> -	int r;
> -
> -	r =3D sd=5Fbus=5Fmessage=5Fread(m, "sss", &message, &severity, &associa=
tion);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror=
(-r));
> -		return r;
> -	}
> -
> -	r =3D sd=5Fbus=5Fmessage=5Fread=5Farray(m, 'y', (const void **)&p, &n);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", =
strerror(-r));
> -		return r;
> -	}
> -
> -	create=5Fnew=5Flog=5Fevent(userdata, message, severity, association, "H=
ost", p, n);
> -
> -	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", g=5Flogid);
> -}
> -
> -
> -static int method=5Faccept=5Ftest=5Fmessage(sd=5Fbus=5Fmessage *m,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fer=
ror *ret=5Ferror) {
> -
> -	uint8=5Ft p[] =3D {0x30, 0x32, 0x34, 0x36};
> -
> -	create=5Fnew=5Flog=5Fevent(userdata, "Testing Message", "Info", "Associ=
ation", "Test", p, 4);
> -
> -	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", g=5Flogid);
> -}
> -
> -
> -static int method=5Fclearall(sd=5Fbus=5Fmessage *m, void *userdata, sd=
=5Fbus=5Ferror *ret=5Ferror) {
> -
> -	Node *n;
> -
> -	// This deletes one log at a time and seeing how the
> -	// list shrinks using the NULL works fine here
> -	while (n =3D list=5Fget=5Fnext=5Fnode(glist, NULL)) {
> -		message=5Fstorage=5Fdelete(n->data);
> -		list=5Fdelete=5Fnode(glist, n);
> -	}
> -
> -	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", 0);
> -}
> -
> -
> -static int method=5Fdeletelog(sd=5Fbus=5Fmessage *m, void *userdata, sd=
=5Fbus=5Ferror *ret=5Ferror) {
> -
> -	Node *n =3D (Node*)userdata;
> -
> -	message=5Fstorage=5Fdelete(n->data);
> -	list=5Fdelete=5Fnode(glist, n);
> -
> -	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", 0);
> -}
> -
> -
> -
> -static const sd=5Fbus=5Fvtable recordlog=5Fvtable[] =3D {
> -	SD=5FBUS=5FVTABLE=5FSTART(0),
> -	SD=5FBUS=5FMETHOD("acceptHostMessage", "sssay", "q", method=5Faccept=5F=
host=5Fmessage, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> -	SD=5FBUS=5FMETHOD("acceptTestMessage", NULL, "q", method=5Faccept=5Ftes=
t=5Fmessage, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> -	SD=5FBUS=5FMETHOD("Clear", NULL, "q", method=5Fclearall, SD=5FBUS=5FVTA=
BLE=5FUNPRIVILEGED),
> -	SD=5FBUS=5FVTABLE=5FEND
> -};
> -
> -static const sd=5Fbus=5Fvtable log=5Fvtable[] =3D {
> -	SD=5FBUS=5FVTABLE=5FSTART(0),
> -	SD=5FBUS=5FPROPERTY("Association", "s", NULL, offsetof(messageEntry=5Ft=
, association), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> -	SD=5FBUS=5FPROPERTY("Message", =C2=A0"s", NULL, offsetof(messageEntry=
=5Ft, message), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> -	SD=5FBUS=5FPROPERTY("Severity", "s", NULL, offsetof(messageEntry=5Ft, s=
everity), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> -	SD=5FBUS=5FPROPERTY("Reported=5FBy", "s", NULL, offsetof(messageEntry=
=5Ft, reportedby), =C2=A0SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> -	SD=5FBUS=5FPROPERTY("DevelopmentData", "ay", get=5Fmessage=5Fdd,0, SD=
=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> -	SD=5FBUS=5FVTABLE=5FEND
> -};
> -
> -
> -static const sd=5Fbus=5Fvtable recordlog=5Fdelete=5Fvtable[] =3D {
> -	SD=5FBUS=5FVTABLE=5FSTART(0),
> -	SD=5FBUS=5FMETHOD("Delete", NULL, "q", method=5Fdeletelog, SD=5FBUS=5FV=
TABLE=5FUNPRIVILEGED),
> -	SD=5FBUS=5FVTABLE=5FEND
> -};
> -
> -uint16=5Ft get=5Fnew=5Flog=5Fnumber() {
> -	return ++g=5Flogid;
> -}
> -
> -int create=5Fnew=5Flog=5Fevent(void *userdata,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *message,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *severity,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *association,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const char *reportedby,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8=5Ft *p,=20
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 size=5Ft n) {
> -	char loglocation[64];
> -	int r;
> -	messageEntry=5Ft *m;
> -	Node *node;
> -	uint16=5Ft logid =3D get=5Fnew=5Flog=5Fnumber();
> -
> -
> -	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events=
/%d", logid);
> -
> -	message=5Fadd(&m, message, severity, association, reportedby, logid, p,=
 n);
> -
> -	node =3D list=5Fadd=5Fnode(glist, m);
> -
> -	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->messageslot,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.record",
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 log=5Fvtable,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 m);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation=
, strerror(-r));
> -		message=5Fstorage=5Fdelete(m);
> -		list=5Fdelete=5Flast=5Fnode(glist);
> -		return 0;
> -	}
> -
> -	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->deleteslot,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.Object.Delete",
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog=5Fdelete=5Fvtable,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 node);
> -
> -	printf("Event Log added %s\n", loglocation);
> -
> -	r =3D sd=5Fbus=5Femit=5Fobject=5Fadded(bus, loglocation);
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
> -int start=5Fevent=5Frecording(void) {
> -
> -	int r;
> -
> -	sd=5Fbus=5Fslot *slot;
> -
> -	/* Connect to the user bus this time */
> -	r =3D sd=5Fbus=5Fopen=5Fsystem(&bus);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -
> -	/* Install the object */
> -	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &slot,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "/org/openbmc/records/events", =C2=A0/* object =
path */
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.recordlog", =C2=A0 /* interface na=
me */
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog=5Fvtable,
> -	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -=09
> -	/* Take a well-known service name so that clients can find us */
> -	r =3D sd=5Fbus=5Frequest=5Fname(bus, "org.openbmc.records.events", 0);
> -	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> -		goto finish;
> -	}
> -
> -	r =3D sd=5Fbus=5Fadd=5Fobject=5Fmanager(bus, NULL, "/org/openbmc/record=
s/events") ;
> -	if (r < 0) {
> -		fprintf(stderr, "Object Manager failure =C2=A0%s\n", strerror(-r));
> -		return 0;
> -	}
> -
> -	for (;;) {
> -		r =3D sd=5Fbus=5Fprocess(bus, NULL);
> -		if (r < 0) {
> -			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> -			goto finish;
> -		}
> -		if (r > 0)
> -			continue;
> -
> -		r =3D sd=5Fbus=5Fwait(bus, (uint64=5Ft) -1);
> -		if (r < 0) {
> -			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> -			goto finish;
> -		}
> -	}
> -	finish:
> -		sd=5Fbus=5Fslot=5Funref(slot);
> -		sd=5Fbus=5Funref(bus);
> -
> -	return r < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> -}
> -
> -
> -int main(int argc, char *argv[]) {
> -
> -	glist =3D list=5Fcreate();
> -	return start=5Fevent=5Frecording();
> -}
> \ No newline at end of file
> diff --git a/event=5Fmessaged=5Fsdbus.c b/event=5Fmessaged=5Fsdbus.c
> new file mode 100644
> index 0000000..fa83e5c
> --- /dev/null
> +++ b/event=5Fmessaged=5Fsdbus.c
> @@ -0,0 +1,425 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +#include "message.H"
> +#include "list.h"
> +#include "event=5Fmessaged=5Fsdbus.h"
> +
> +/***********************************************************************=
******/
> +/* This set of functions are responsible for interactions with events ov=
er =C2=A0 */
> +/* dbus. =C2=A0Logs come in a couple of different ways... =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */=20
> +/* =C2=A0 =C2=A0 1) From the calls from acceptHostMessage, acceptTestMes=
sage =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/* =C2=A0 =C2=A0 2) At startup and logs that exist alreafy are re-added =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/* event=5Frecord=5Ft when loaded contain all strings and data stream fo=
r a log =C2=A0*/
> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/* Functions naming convention =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/* =C2=A0 =C2=A0 prop=5Fx =C2=A0 =C2=A0: callable dbus properties. =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/* =C2=A0 =C2=A0 method=5Fx =C2=A0: callable dbus functions. =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +/***********************************************************************=
******/
> +
> +
> +
> +sd=5Fbus =C2=A0 =C2=A0 =C2=A0*bus =C2=A0 =3D NULL;
> +sd=5Fbus=5Fslot *slot =C2=A0=3D NULL;
> +List =C2=A0 =C2=A0 =C2=A0 =C2=A0*glist =3D NULL;
> +
> +event=5Frecord=5Ft *gCachedRec =3D NULL;
> +
> +static int remove=5Flog=5Ffrom=5Fdbus(Node *node);
> +
> +typedef struct messageEntry=5Ft {
> +
> +	size=5Ft =C2=A0 =C2=A0 =C2=A0 logid;
> +	sd=5Fbus=5Fslot *messageslot;
> +	sd=5Fbus=5Fslot *deleteslot;
> +
> +} messageEntry=5Ft;
> +
> +
> +static void message=5Fentry=5Fclose(messageEntry=5Ft *m) {
> +	free(m);
> +	return;
> +}
> +
> +static void message=5Fentry=5Fnew(messageEntry=5Ft **m, uint16=5Ft logid=
) {
> +	*m =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D malloc(sizeof(messageEntry=5Ft=
));
> +	(*m)->logid =3D logid;
> +	return;
> +}
> +
> +// After calling this function the gCachedRec will be set
> +static event=5Frecord=5Ft* message=5Frecord=5Fopen(uint16=5Ft logid) {
> +
> +	int r =3D 0;
> +	event=5Frecord=5Ft *rec;
> +
> +	// A simple caching technique because each=20
> +	// property needs to extract data from the
> +	// same data blob. =C2=A0
> +	if (gCachedRec =3D=3D NULL) {
> +		if (message=5Fload=5Flog(logid, &rec)) {
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
> +		message=5Ffree=5Flog(gCachedRec);
> +		gCachedRec =3D NULL;
> +
> +		r =3D message=5Fload=5Flog(logid, &rec);
> +		if (r)
> +			gCachedRec =3D rec;
> +	}
> +
> +	return (r ? gCachedRec : NULL);
> +}
> +
> +
> +
> +static int prop=5Fmessage(sd=5Fbus *bus,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *path,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *interface,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *property,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd=5Fbus=5Fmessage *reply,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void *userdata,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd=5Fbus=5Ferror *error) {
> +
> +	int r=3D0;
> +	messageEntry=5Ft *m =3D (messageEntry=5Ft*) userdata;
> +	char *p;
> +	struct tm *tm=5Finfo;
> + =C2=A0 =C2=A0char buffer[32];
> + =C2=A0 =C2=A0event=5Frecord=5Ft *rec;
> +
> +	rec =3D message=5Frecord=5Fopen(m->logid);
> +
> +	if (!rec) {
> +		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
> +		sd=5Fbus=5Ferror=5Fset(error, =C2=A0SD=5FBUS=5FERROR=5FFILE=5FNOT=5FFO=
UND,"Could not find log file");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> +	}
> +
> +	if (!strncmp("Message", property, 7))=20
> +		p =3D rec->message;
> +	else if (!strncmp("Severity", property, 8))
> +		p =3D rec->severity;
> +	else if (!strncmp("Association", property, 11))
> +		p =3D rec->association;
> +	else if (!strncmp("Reported=5FBy", property, 11))
> +		p =3D rec->reportedby;
> +	else if (!strncmp("Time", property, 4)) {
> +		tm=5Finfo =3D localtime(&rec->timestamp);
> +		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm=5Finfo);
> +		p =C2=A0 =C2=A0=3D buffer;
> +	}
> +	else
> +		p =3D "";
> +
> +	r =3D sd=5Fbus=5Fmessage=5Fappend(reply, "s", p);
> +	if (r < 0) {
> +	 =C2=A0 =C2=A0fprintf(stderr,"Error building array for property %s\n", =
strerror(-r));
> +	}
> +
> +
> +	return r;
> +}
> +
> +
> +static int prop=5Fmessage=5Fdd(sd=5Fbus *bus,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *path,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *interface,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const char *property,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd=5Fbus=5Fmessage *reply,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void *userdata,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sd=5Fbus=5Ferror *error) {
> +
> + =C2=A0 =C2=A0event=5Frecord=5Ft *rec;
> + =C2=A0 =C2=A0messageEntry=5Ft *m =3D (messageEntry=5Ft*) userdata;
> +
> +	rec =3D message=5Frecord=5Fopen(m->logid);
> +
> +	if (!rec) {
> +		sd=5Fbus=5Ferror=5Fset(error, =C2=A0SD=5FBUS=5FERROR=5FFILE=5FNOT=5FFO=
UND,"Could not find log file");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> + =C2=A0 =C2=A0}
> +	return sd=5Fbus=5Fmessage=5Fappend=5Farray(reply, 'y', rec->p, rec->n);
> +}
> +
> +/////////////////////////////////////////////////////////////
> +// Receives an array of bytes as an esel error log
> +// returns the messageid in 2 byte format
> +// =C2=A0
> +// =C2=A0S1 - Message - Simple sentence about the fail
> +// =C2=A0S2 - Severity - How bad of a problem is this
> +// =C2=A0S3 - Association - sensor path
> +// =C2=A0ay - Detailed data - developer debug information
> +//
> +/////////////////////////////////////////////////////////////
> +static int method=5Faccept=5Fhost=5Fmessage(sd=5Fbus=5Fmessage *m,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fer=
ror *ret=5Ferror) {
> +
> +	char *message, *severity, *association;
> +	size=5Ft =C2=A0 n =3D 4;
> +	uint8=5Ft *p;
> +	int r;
> +	uint16=5Ft logid;
> +	event=5Frecord=5Ft rec;
> +
> +	r =3D sd=5Fbus=5Fmessage=5Fread(m, "sss", &message, &severity, &associa=
tion);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror=
(-r));
> +		return r;
> +	}
> +
> +	r =3D sd=5Fbus=5Fmessage=5Fread=5Farray(m, 'y', (const void **)&p, &n);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", =
strerror(-r));
> +		return r;
> +	}
> +
> + =C2=A0 =C2=A0rec.message =C2=A0 =C2=A0 =3D (char*) message;
> + =C2=A0 =C2=A0rec.severity =C2=A0 =C2=A0=3D (char*) severity;
> + =C2=A0 =C2=A0rec.association =3D (char*) association;
> + =C2=A0 =C2=A0rec.reportedby =C2=A0=3D (char*) "Host";
> + =C2=A0 =C2=A0rec.p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8=5Ft*) =
p;
> + =C2=A0 =C2=A0rec.n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D n;
> +
> +
> +	logid =3D message=5Fcreate=5Fnew=5Flog=5Fevent(&rec);
> +
> +	if (logid)=20
> +		r =3D send=5Flog=5Fto=5Fdbus(logid);
> +
> +	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", logid);
> +}
> +
> +
> +static int method=5Faccept=5Ftest=5Fmessage(sd=5Fbus=5Fmessage *m,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdat=
a,=20
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fer=
ror *ret=5Ferror) {
> +
> +	uint8=5Ft p[] =3D {0x30, 0x32, 0x34, 0x36};
> +	uint16=5Ft logid;
> +	event=5Frecord=5Ft rec;
> +
> + =C2=A0 =C2=A0rec.message =C2=A0 =C2=A0 =3D (char*) "Testing Message";
> + =C2=A0 =C2=A0rec.severity =C2=A0 =C2=A0=3D (char*) "Info";
> + =C2=A0 =C2=A0rec.association =3D (char*) "Association";
> + =C2=A0 =C2=A0rec.reportedby =C2=A0=3D (char*) "Test";
> + =C2=A0 =C2=A0rec.p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8=5Ft*) =
p;
> + =C2=A0 =C2=A0rec.n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sizeof(*p);
> +
> +	logid =3D message=5Fcreate=5Fnew=5Flog=5Fevent(&rec);
> +	send=5Flog=5Fto=5Fdbus(logid);
> +
> +	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", logid);
> +}
> +
> +
> +static int method=5Fclearall(sd=5Fbus=5Fmessage *m, void *userdata, sd=
=5Fbus=5Ferror *ret=5Ferror) {
> +	Node *n;
> +	messageEntry=5Ft *p;
> +=09
> +	// This deletes one log at a time and seeing how the
> +	// list shrinks using the NULL works fine here
> +	while (n =3D list=5Fget=5Fnext=5Fnode(glist, NULL)) {
> +		p =3D (messageEntry=5Ft *) n->data;
> +		message=5Fdelete=5Flog(p->logid);
> +		remove=5Flog=5Ffrom=5Fdbus(n);
> +	}
> +
> +	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", 0);
> +}
> +
> +
> +static int method=5Fdeletelog(sd=5Fbus=5Fmessage *m, void *userdata, sd=
=5Fbus=5Ferror *ret=5Ferror) {
> +
> +	Node *n =3D (Node*)userdata;
> +	messageEntry=5Ft *p =3D (messageEntry=5Ft *) n->data;
> +
> +	message=5Fdelete=5Flog(p->logid);
> +	remove=5Flog=5Ffrom=5Fdbus(n);
> +	return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "q", 0);
> +}
> +
> +
> +
> +static const sd=5Fbus=5Fvtable recordlog=5Fvtable[] =3D {
> +	SD=5FBUS=5FVTABLE=5FSTART(0),
> +	SD=5FBUS=5FMETHOD("acceptHostMessage", "sssay", "q", method=5Faccept=5F=
host=5Fmessage, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> +	SD=5FBUS=5FMETHOD("acceptTestMessage", NULL, "q", method=5Faccept=5Ftes=
t=5Fmessage, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> +	SD=5FBUS=5FMETHOD("Clear", NULL, "q", method=5Fclearall, SD=5FBUS=5FVTA=
BLE=5FUNPRIVILEGED),
> +	SD=5FBUS=5FVTABLE=5FEND
> +};
> +
> +static const sd=5Fbus=5Fvtable log=5Fvtable[] =3D {
> +	SD=5FBUS=5FVTABLE=5FSTART(0), =C2=A0=20
> +	SD=5FBUS=5FPROPERTY("Association", =C2=A0 =C2=A0 =C2=A0"s", prop=5Fmess=
age, 0, SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FPROPERTY("Message", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"s", p=
rop=5Fmessage, 0, SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FPROPERTY("Severity", =C2=A0 =C2=A0 =C2=A0 =C2=A0 "s", prop=
=5Fmessage, 0, SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FPROPERTY("Reported=5FBy", =C2=A0 =C2=A0 =C2=A0"s", prop=5Fme=
ssage, 0, SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FPROPERTY("Time", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "=
s", prop=5Fmessage, 0, SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FPROPERTY("DevelopmentData", "ay", prop=5Fmessage=5Fdd ,0, SD=
=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +	SD=5FBUS=5FVTABLE=5FEND
> +};
> +
> +
> +static const sd=5Fbus=5Fvtable recordlog=5Fdelete=5Fvtable[] =3D {
> +	SD=5FBUS=5FVTABLE=5FSTART(0),
> +	SD=5FBUS=5FMETHOD("delete", NULL, "q", method=5Fdeletelog, SD=5FBUS=5FV=
TABLE=5FUNPRIVILEGED),
> +	SD=5FBUS=5FVTABLE=5FEND
> +};
> +
> +static int remove=5Flog=5Ffrom=5Fdbus(Node *node) {
> +=09
> +	messageEntry=5Ft *p =3D (messageEntry=5Ft *) node->data;
> +	int r;
> +	char buffer[32];
> +
> +	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->l=
ogid);
> +
> +	printf("Attempting to delete %s\n", buffer);
> +
> +	r =3D sd=5Fbus=5Femit=5Fobject=5Fremoved(bus, buffer);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
> +		return -1;
> +	}=09
> +	sd=5Fbus=5Fslot=5Funref(p->messageslot);
> +	sd=5Fbus=5Fslot=5Funref(p->deleteslot);
> +
> +	message=5Fentry=5Fclose(p);
> +	list=5Fdelete=5Fnode(glist, node);
> +
> +	return 0;
> +}
> +
> +int send=5Flog=5Fto=5Fdbus(const uint16=5Ft logid) {
> +
> +	char loglocation[64];
> +	int r;
> +	messageEntry=5Ft *m;
> +	Node *node;
> +
> +
> +	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events=
/%d", logid);
> +
> +	message=5Fentry=5Fnew(&m, logid);
> +
> +	node =3D list=5Fadd=5Fnode(glist, m);
> +
> +	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->messageslot,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.record",
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 log=5Fvtable,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 m);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation=
, strerror(-r));
> +		message=5Fentry=5Fclose(m);
> +		list=5Fdelete=5Flast=5Fnode(glist);
> +		return 0;
> +	}
> +
> +	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &m->deleteslot,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 loglocation,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.Object.Delete",
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog=5Fdelete=5Fvtable,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 node);
> +=09
> +	printf("Event Log added %s\n", loglocation);
> +
> +	r =3D sd=5Fbus=5Femit=5Fobject=5Fadded(bus, loglocation);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
> +		return 0;
> +	}
> +
> +	return logid;
> +}
> +
> +
> +int start=5Fevent=5Fmonitor(void) {
> +
> +	int r;
> +
> +	for (;;) {
> +
> +		r =3D sd=5Fbus=5Fprocess(bus, NULL);
> +		if (r < 0) {
> +			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> +			break;
> +		}
> +
> +		if (r > 0)
> +			continue;
> +
> +		r =3D sd=5Fbus=5Fwait(bus, (uint64=5Ft) -1);
> +		if (r < 0) {
> +			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> +			break;
> +		}
> +	}
> +
> +	return r < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> +}
> +
> +
> +/* Only thing we are doing in this function is to get a connection on th=
e dbus */
> +int build=5Fbus(void) {
> +
> +	int r =3D 0;
> +
> +	glist =3D list=5Fcreate();
> +	/* Connect to the system bus */
> +	r =3D sd=5Fbus=5Fopen=5Fsystem(&bus);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Install the object */
> +	r =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &slot,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "/org/openbmc/records/events", =C2=A0/* object =
path */
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "org.openbmc.recordlog", =C2=A0 /* interface na=
me */
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 recordlog=5Fvtable,
> +	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> +		goto finish;
> +	}
> +
> +	/* Take a well-known service name so that clients can find us */
> +	r =3D sd=5Fbus=5Frequest=5Fname(bus, "org.openbmc.records.events", 0);
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> +	}=09
> +=09
> +	/* You want to add an object manager to support deleting stuff =C2=A0*/
> +	/* without it, dbus can show interfaces that no longer exist */
> +	r =3D sd=5Fbus=5Fadd=5Fobject=5Fmanager(bus, NULL, "/org/openbmc/record=
s/events");
> +	if (r < 0) {
> +		fprintf(stderr, "Object Manager failure =C2=A0%s\n", strerror(-r));
> +	}
> +
> +
> +	finish:
> +	return r < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> +}
> +
> +void cleanup=5Fevent=5Fmonitor(void) {
> +	sd=5Fbus=5Fslot=5Funref(slot);
> +	sd=5Fbus=5Funref(bus);
> +}
> \ No newline at end of file
> diff --git a/event=5Fmessaged=5Fsdbus.h b/event=5Fmessaged=5Fsdbus.h
> new file mode 100644
> index 0000000..a6aac94
> --- /dev/null
> +++ b/event=5Fmessaged=5Fsdbus.h
> @@ -0,0 +1,14 @@
> +#include <stddef.h>
> +
> +#ifdef =5F=5Fcplusplus
> +extern "C" =C2=A0{
> +#endif
> +	int start=5Fevent=5Fmonitor(void);
> +	int build=5Fbus(void);
> +	int send=5Flog=5Fto=5Fdbus(const uint16=5Ft logid);
> +	void cleanup=5Fevent=5Fmonitor(void);
> +#ifdef =5F=5Fcplusplus
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
> +const uint32=5Ft g=5Feyecatcher =3D 0x4F424D43; // OBMC
> +const uint16=5Ft g=5Fversion =C2=A0 =C2=A0=3D 1;
> +
> +struct logheader=5Ft {
> + =C2=A0 =C2=A0uint32=5Ft eyecatcher;
> + =C2=A0 =C2=A0uint16=5Ft version;
> + =C2=A0 =C2=A0uint16=5Ft logid;
> + =C2=A0 =C2=A0time=5Ft =C2=A0 timestamp;
> + =C2=A0 =C2=A0uint16=5Ft detailsoffset;
> + =C2=A0 =C2=A0uint16=5Ft messagelen;
> + =C2=A0 =C2=A0uint16=5Ft severitylen;
> + =C2=A0 =C2=A0uint16=5Ft associationlen;
> + =C2=A0 =C2=A0uint16=5Ft reportedbylen;
> + =C2=A0 =C2=A0uint16=5Ft debugdatalen;
> +};
> +
> +uint16=5Ft g=5Flogid =3D 0;
> +
> +extern const char *glogname;
> +
> +static uint16=5Ft get=5Fnew=5Flog=5Fnumber(void) {
> + =C2=A0 =C2=A0return ++g=5Flogid;
> +}
> +
> +static void update=5Flatest=5Flogid(uint16=5Ft logid) {
> + =C2=A0 =C2=A0if (logid > g=5Flogid)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0g=5Flogid =3D logid;
> + =C2=A0 =C2=A0return;
> +}
> +
> +inline uint16=5Ft GETLEN(const char *s) {
> + =C2=A0 =C2=A0return (uint16=5Ft) (1 + strlen(s));
> +}
> +
> +static uint16=5Ft create=5Flog=5Fevent(event=5Frecord=5Ft *rec) {
> +
> + =C2=A0 =C2=A0std::ostringstream buffer;
> + =C2=A0 =C2=A0ofstream myfile;
> + =C2=A0 =C2=A0logheader=5Ft hdr;
> +
> +
> + =C2=A0 =C2=A0buffer << glogname << "/" << int(rec->logid) ;
> +
> + =C2=A0 =C2=A0cout << buffer.str() << endl;
> +
> + =C2=A0 =C2=A0hdr.eyecatcher =C2=A0 =C2=A0 =3D g=5Feyecatcher;
> + =C2=A0 =C2=A0hdr.version =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D g=5Fversion;
> + =C2=A0 =C2=A0hdr.logid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D rec->logid;
> + =C2=A0 =C2=A0hdr.timestamp =C2=A0 =C2=A0 =C2=A0=3D time(NULL);
> + =C2=A0 =C2=A0hdr.detailsoffset =C2=A0=3D offsetof(logheader=5Ft, messag=
elen);
> + =C2=A0 =C2=A0hdr.messagelen =C2=A0 =C2=A0 =3D GETLEN(rec->message);
> + =C2=A0 =C2=A0hdr.severitylen =C2=A0 =C2=A0=3D GETLEN(rec->severity);
> + =C2=A0 =C2=A0hdr.associationlen =3D GETLEN(rec->association);
> + =C2=A0 =C2=A0hdr.reportedbylen =C2=A0=3D GETLEN(rec->reportedby);
> + =C2=A0 =C2=A0hdr.debugdatalen =C2=A0 =3D rec->n;
> +
> + =C2=A0 =C2=A0myfile.open(buffer.str() , ios::out|ios::binary);
> + =C2=A0 =C2=A0myfile.write((char*) &hdr, sizeof(hdr));
> + =C2=A0 =C2=A0myfile.write((char*) rec->message, hdr.messagelen);
> + =C2=A0 =C2=A0myfile.write((char*) rec->severity, hdr.severitylen);
> + =C2=A0 =C2=A0myfile.write((char*) rec->association, hdr.associationlen);
> + =C2=A0 =C2=A0myfile.write((char*) rec->reportedby, hdr.reportedbylen);
> + =C2=A0 =C2=A0myfile.write((char*) rec->p, hdr.debugdatalen);
> + =C2=A0 =C2=A0myfile.close();
> +
> + =C2=A0 =C2=A0return rec->logid;
> +}
> +
> +static int is=5Ffile=5Fa=5Flog(string str) {
> +
> + =C2=A0 =C2=A0std::ostringstream buffer;
> + =C2=A0 =C2=A0ifstream f;
> + =C2=A0 =C2=A0logheader=5Ft hdr;
> +
> + =C2=A0 =C2=A0if (!str.compare("."))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> + =C2=A0 =C2=A0if (!str.compare(".."))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> +
> + =C2=A0 =C2=A0buffer << glogname << "/" << str;
> +
> + =C2=A0 =C2=A0f.open( buffer.str(), ios::binary);
> +
> + =C2=A0 =C2=A0if (!f.good()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0f.read((char*)&hdr, sizeof(hdr));
> +
> + =C2=A0 =C2=A0if (hdr.eyecatcher !=3D g=5Feyecatcher)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> +
> + =C2=A0 =C2=A0return 1;
> +}
> +
> +
> +
> +int message=5Fload=5Flog(uint16=5Ft logid, event=5Frecord=5Ft **rec) {
> +
> + =C2=A0 =C2=A0std::ostringstream buffer;
> + =C2=A0 =C2=A0ifstream f;
> + =C2=A0 =C2=A0logheader=5Ft hdr;
> +
> + =C2=A0 =C2=A0buffer << glogname << "/" << int(logid);
> +
> + =C2=A0 =C2=A0f.open( buffer.str(), ios::binary);
> +
> + =C2=A0 =C2=A0if (!f.good()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0*rec =3D new event=5Frecord=5Ft;
> +
> + =C2=A0 =C2=A0f.read((char*)&hdr, sizeof(hdr));
> +
> + =C2=A0 =C2=A0(*rec)->logid =C2=A0 =C2=A0 =3D hdr.logid;
> + =C2=A0 =C2=A0(*rec)->timestamp =3D hdr.timestamp;
> +
> +
> + =C2=A0 =C2=A0(*rec)->message =3D new char[hdr.messagelen];
> + =C2=A0 =C2=A0f.read((*rec)->message, hdr.messagelen);
> +
> + =C2=A0 =C2=A0(*rec)->severity =3D new char[hdr.severitylen];
> + =C2=A0 =C2=A0f.read((*rec)->severity, hdr.severitylen);
> +
> + =C2=A0 =C2=A0(*rec)->association =3D new char[hdr.associationlen];
> + =C2=A0 =C2=A0f.read((*rec)->association, hdr.associationlen);
> +
> + =C2=A0 =C2=A0(*rec)->reportedby =3D new char[hdr.reportedbylen];
> + =C2=A0 =C2=A0f.read((*rec)->reportedby, hdr.reportedbylen);
> +
> + =C2=A0 =C2=A0(*rec)->p =3D new uint8=5Ft[hdr.debugdatalen];
> + =C2=A0 =C2=A0f.read((char*)(*rec)->p, hdr.debugdatalen);
> + =C2=A0 =C2=A0(*rec)->n =3D hdr.debugdatalen;
> +
> +
> + =C2=A0 =C2=A0f.close();
> + =C2=A0 =C2=A0return logid;
> +}
> +
> +void message=5Ffree=5Flog(event=5Frecord=5Ft *rec) {
> +
> + =C2=A0 =C2=A0delete[] rec->message;
> + =C2=A0 =C2=A0delete[] rec->severity;
> + =C2=A0 =C2=A0delete[] rec->association;
> + =C2=A0 =C2=A0delete[] rec->reportedby;
> + =C2=A0 =C2=A0delete[] rec->p;
> + =C2=A0 =C2=A0delete rec;
> +
> + =C2=A0 =C2=A0return ;
> +}
> +
> +int message=5Fdelete=5Flog(uint16=5Ft logid) {
> +
> + =C2=A0 =C2=A0std::stringstream buffer;
> + =C2=A0 =C2=A0string s;
> +
> + =C2=A0 =C2=A0buffer << glogname << "/" << int(logid);
> +
> + =C2=A0 =C2=A0s =3D buffer.str();
> + =C2=A0 =C2=A0std::remove(s.c=5Fstr());
> +
> + =C2=A0 =C2=A0return 0;
> +}
> +
> +
> +int message=5Fget=5Fnext=5Flog(uint16=5Ft *logid, event=5Flog=5Flist *lo=
g=5Flist) {
> +
> + =C2=A0 =C2=A0std::ostringstream buffer;
> + =C2=A0 =C2=A0struct dirent *ent;
> +
> + =C2=A0 =C2=A0if (*logid=3D=3D0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0log=5Flist->dirp =3D opendir(glogname);
> +
> + =C2=A0 =C2=A0if(log=5Flist->dirp)
> + =C2=A0 =C2=A0{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0do {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ent =3D readdir(log=5Flist->di=
rp);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ent =3D=3D NULL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0string str(ent->d=5Fname);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is=5Ffile=5Fa=5Flog(str)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*logid =3D (uint=
16=5Ft) atoi(str.c=5Fstr());
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update=5Flatest=
=5Flogid(*logid);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0} while( 1 );
> + =C2=A0 =C2=A0}=20
> + =C2=A0 =C2=A0else
> + =C2=A0 =C2=A0{=20
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cerr << "Error opening directory" << glognam=
e << endl;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ent =C2=A0 =C2=A0=3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*logid =3D 0;
> + =C2=A0 =C2=A0}
> + =C2=A0 =C2=A0return =C2=A0((ent =3D=3D NULL) ? 0 : 1);
> +}
> +
> +
> +uint16=5Ft message=5Fcreate=5Fnew=5Flog=5Fevent(event=5Frecord=5Ft *rec)=
 {
> +
> + =C2=A0 =C2=A0rec->logid =3D get=5Fnew=5Flog=5Fnumber();
> + =C2=A0 =C2=A0return create=5Flog=5Fevent(rec);
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
> +#ifdef =5F=5Fcplusplus
> + =C2=A0 =C2=A0#include <cstdint>
> +#else
> + =C2=A0 =C2=A0#include <stdint.h>
> +#endif
> +
> +
> +#ifdef =5F=5Fcplusplus
> + =C2=A0 =C2=A0struct event=5Flog=5Flist {
> +#else
> + =C2=A0 =C2=A0typedef struct =5Fevent=5Flog=5Flist { =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0DIR *dirp;
> +#ifdef =5F=5Fcplusplus
> + =C2=A0 =C2=A0};
> +#else =C2=A0 =C2=A0
> + =C2=A0 =C2=A0} event=5Flog=5Flist;
> +#endif
> +
> +
> +#ifdef =5F=5Fcplusplus
> + =C2=A0 =C2=A0struct event=5Frecord=5Ft {
> +#else =C2=A0 =C2=A0=20
> + =C2=A0 =C2=A0typedef struct =5Fevent=5Frecord=5Ft {
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *message;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *severity;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *association;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0char *reportedby;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8=5Ft *p;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0size=5Ft n;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0// These get filled in for you
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0time=5Ft =C2=A0timestamp; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0int16=5Ft logid;
> +#ifdef =5F=5Fcplusplus
> + =C2=A0 =C2=A0};
> +#else =C2=A0 =C2=A0=20
> + =C2=A0 =C2=A0} event=5Frecord=5Ft;
> +#endif
> +
> +
> +#ifdef =5F=5Fcplusplus
> +extern "C" =C2=A0{
> +#endif
> +
> +
> +uint16=5Ft message=5Fcreate=5Fnew=5Flog=5Fevent(event=5Frecord=5Ft *rec);
> +int =C2=A0 =C2=A0 =C2=A0message=5Fload=5Flog(uint16=5Ft logid, event=5Fr=
ecord=5Ft **rec);
> +void =C2=A0 =C2=A0 message=5Ffree=5Flog(event=5Frecord=5Ft *rec);
> +int =C2=A0 =C2=A0 =C2=A0message=5Fget=5Fnext=5Flog(uint16=5Ft *logid, ev=
ent=5Flog=5Flist *log=5Flist);
> +int =C2=A0 =C2=A0 =C2=A0message=5Fdelete=5Flog(uint16=5Ft logid);
> +
> +#ifdef =5F=5Fcplusplus
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
> +#define ASSERT(a,b) =C2=A0if(a!=3Db) {cout << "ASSERT ERROR: line " << =
=5F=5FLINE=5F=5F << endl; exit(1);}
> +
> +void build=5Fevent=5Frecord(event=5Frecord=5Ft *rec,
> +						uint16=5Ft logid,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *message,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *severity,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *association,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const char *reportedby,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const uint8=5Ft *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0size=5Ft n) {
> +
> +
> + =C2=A0 =C2=A0rec->message =C2=A0 =C2=A0 =3D (char*) message;
> + =C2=A0 =C2=A0rec->severity =C2=A0 =C2=A0=3D (char*) severity;
> + =C2=A0 =C2=A0rec->association =3D (char*) association;
> + =C2=A0 =C2=A0rec->reportedby =C2=A0=3D (char*) reportedby;
> + =C2=A0 =C2=A0rec->p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (uint8=5Ft*)=
 p;
> + =C2=A0 =C2=A0rec->n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D n;
> +
> + =C2=A0 =C2=A0return;
> +}
> +
> +int load=5Fexisting=5Fevents(void) {
> +
> +	event=5Flog=5Flist log=5Flist;
> +	uint16=5Ft =C2=A0 =C2=A0 =C2=A0 logid=3D0;
> +	event=5Frecord=5Ft *rec;
> +
> +	cout << "Loading event log... ";
> +
> +	while (message=5Fget=5Fnext=5Flog(&logid, &log=5Flist)) {
> +		cout << " " << int(logid);
> +		message=5Fload=5Flog(logid, &rec);
> +
> +		cout << rec->message << endl;
> +
> +		message=5Ffree=5Flog(rec);
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
> +	uint8=5Ft p[] =3D {0x3, 0x32, 0x34, 0x36};
> +	event=5Frecord=5Ft rec, *prec;
> +	event=5Flog=5Flist log=5Flist;
> +	uint16=5Ft logid=3D0;
> +	int i;
> +
> +	build=5Fevent=5Frecord(&rec,0, "Testing Message1", "Info", "Association=
", "Test", p, 4);
> +	ASSERT(message=5Fcreate=5Fnew=5Flog=5Fevent(&rec),1);
> +	build=5Fevent=5Frecord(&rec,0, "Testing Message2", "Info", "/dev", "Tes=
t", p, 4);
> +	ASSERT(message=5Fcreate=5Fnew=5Flog=5Fevent(&rec),2);
> +	build=5Fevent=5Frecord(&rec,0, "Testing Message3", "Info", "Association=
", "Test", p, 4);
> +	ASSERT(message=5Fcreate=5Fnew=5Flog=5Fevent(&rec),3);
> +
> +	ASSERT(message=5Fload=5Flog(13, &prec), 0);
> +	ASSERT(message=5Fload=5Flog(1, &prec), 1); message=5Ffree=5Flog(prec);
> +
> +	// Test the number of valid logs so far
> +	i =3D 0;
> +	while (message=5Fget=5Fnext=5Flog(&logid, &log=5Flist)) {
> +
> +
> +		cout << int(logid) << endl;
> +		i++;
> +	}
> +	//ASSERT(i,3);
> +
> +	cout << "LOADLOG TEST" << endl;
> +
> +	load=5Fexisting=5Fevents();
> +
> +	message=5Fdelete=5Flog(1);
> +
> +	return rc;
> +}
> \ No newline at end of file
> --=20
> 2.6.4
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


[attachment "signature.asc" removed by Chris Austen/Austin/IBM]
