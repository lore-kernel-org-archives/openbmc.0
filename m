Return-Path: <austenc@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 54FFC1A0220
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:22:31 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 2 Feb 2016 23:22:29 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 23:22:27 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9899719D803E
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 23:10:25 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u136MQgR30015730
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:22:26 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u136MQfZ025741
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:22:26 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u136MP0p025666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 23:22:25 -0700
Message-Id: <201602030622.u136MP0p025666@d03av02.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 3 Feb 2016 01:22:24 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 3 Feb 2016 01:22:22 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 3 Feb 2016 06:22:21 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 3 Feb 2016 06:22:20 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016020306235344-33371 ;
 Wed, 3 Feb 2016 06:23:53 +0000 
In-Reply-To: <CACPK8Xfo3u46VaTj2xaY1ab=9EcMQtjb3Tqghpuus+FNqSX=vw@mail.gmail.com>
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot
From: "Chris Austen" <austenc@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 3 Feb 2016 06:22:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8Xfo3u46VaTj2xaY1ab=9EcMQtjb3Tqghpuus+FNqSX=vw@mail.gmail.com>,
 <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 27547
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16020306-0005-0000-0000-00001C0ABA98
X-IBM-ISS-SpamDetectors: Score=0.425523; BY=0.257552; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.425523; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004873; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654481; UDB=6.00296563; UTC=2016-02-03
 06:22:20
x-cbparentid: 16020306-5920-0000-0000-000005F4442F
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
X-List-Received-Date: Wed, 03 Feb 2016 06:22:32 -0000

=20
Thanks for you insights, I issues this pull request specifically to get fee=
dback.=C2=A0 So here goes...

Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: Joel Stanley=20
Sent by: "openbmc"=20
Date: 02/03/2016 12:09AM
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot

On Wed, Feb 3, 2016 at 3:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> The event service stores the events from the host. =C2=A0Before this comm=
it all the code was in memory. =C2=A0That meant once a reboot occured you l=
ost the logs. =C2=A0With this commit I am storing all logs to the file syst=
em. =C2=A0This refactoring also enables a test suite. =C2=A0The suite can b=
e invoked by 'make test; ./test'.

'make check' is commonly used instead of test. Either way, the make
target should run the test for you.

CA: Sure I can make that change

>
> 1) /var/sys/obmc/events/x

/var/log is generally where logs are stored.

CA: Typical location for any log from any service? I would imagine a single=
 log file is standard and not a bunch of small ones.

> 2) logs are stored in binary and saved
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

Should this go into a README?

CA: Yes it will

> ---
> =C2=A0Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02=
9 ++--
> =C2=A0event=5Fmessaged.C =C2=A0 =C2=A0 =C2=A0 | =C2=A044 +++++
> =C2=A0event=5Fmessaged.c =C2=A0 =C2=A0 =C2=A0 | 341 ---------------------=
------------------

It looks like you've moved and modified this file in the same commit.
The move should be a separate commit, so we can review the code
changes.

CA: huge refactor best to review that in its entirety.=C2=A0 I could simply=
 rename it in a commit but that is kind of lame
=C2=A0

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
>
> -EXE =C2=A0 =C2=A0 =3D event=5Fmessaged
> +TEST =C2=A0 =C2=A0 =C2=A0=3D test
>
> -OBJS =C2=A0 =C2=A0=3D $(EXE).o =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list.o =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> +EXE =C2=A0 =C2=A0 =C2=A0 =3D event=5Fmessaged
> +EXE=5FOBJS =C2=A0=3D $(EXE).o message.o event=5Fmessaged=5Fsdbus.o list.o
>
> +OBJS=5FTEST =3D $(TEST).o message.o
> +
> +CPPFLAGS =C2=A0+=3D -g -fpic -Wall -std=3Dc++11
>
> =C2=A0DEPPKGS =3D libsystemd
> -CC =C2=A0 =C2=A0 =C2=A0?=3D $(CROSS=5FCOMPILE)gcc
> =C2=A0INCLUDES +=3D $(shell pkg-config --cflags $(DEPPKGS))
> =C2=A0LIBS +=3D $(shell pkg-config --libs $(DEPPKGS))
>
> +
> +
> =C2=A0all: $(EXE)
>
> =C2=A0%.o : %.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
>
> -$(EXE): $(OBJS)
> - =C2=A0 =C2=A0 =C2=A0 $(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +%.o : %.C
> + =C2=A0 =C2=A0 =C2=A0 $(CXX) -c $< $(CPPFLAGS) -o $@
> +
> +
> +$(EXE): $(EXE=5FOBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
> +
>
> =C2=A0$(TEST): $(OBJS=5FTEST)
> - =C2=A0 =C2=A0 =C2=A0 $(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> + =C2=A0 =C2=A0 =C2=A0 $(CXX) $^ $(LDFLAGS) -o $@
>
> =C2=A0clean:
> - =C2=A0 =C2=A0 =C2=A0 rm -f $(OBJS) $(EXE) *.o *.d
> + =C2=A0 =C2=A0 =C2=A0 rm -f $(TEST) *.o *.so $(EXE)
> +
> +
> diff --git a/event=5Fmessaged.C b/event=5Fmessaged.C
> new file mode 100644
> index 0000000..4376431
> --- /dev/null
> +++ b/event=5Fmessaged.C

This file only contains C, so perhaps make it a C file?

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

Extra whitespace.

> +// Walk through all the saved logs and reload them in to dbus objects
> +// Needed because on a reboot the existing logs need to be reloaded
> +int load=5Fexisting=5Fevents(void) {
> +
> + =C2=A0 =C2=A0event=5Flog=5Flist log=5Flist;
> + =C2=A0 =C2=A0uint16=5Ft =C2=A0 =C2=A0 =C2=A0 logid=3D0;

Don't initalise this here.
CA: ok

> +
> + =C2=A0 =C2=A0while (message=5Fget=5Fnext=5Flog(&logid, &log=5Flist)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0send=5Flog=5Fto=5Fdbus(logid);
> + =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0return 0;
> +}
> +
> +int main(int argc, char *argv[]) {
> +
> + =C2=A0 =C2=A0int rc =3D 0;

Don't initalise this here.
CA: ok

> +
> + =C2=A0 =C2=A0if ((rc =3D build=5Fbus()) < 0) {

This is more readable:
CA: ok

=C2=A0rc =3D build=5Fbus();
=C2=A0if (rc < 0)

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

This should not be indented.
CA: ok

> + =C2=A0 =C2=A0cleanup=5Fevent=5Fmonitor();
> +
> + =C2=A0 =C2=A0return rc;
> +}
> \ No newline at end of file


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

This should be lower case.
CA: ok

> +
> +static uint16=5Ft create=5Flog=5Fevent(event=5Frecord=5Ft *rec) {
> +
> + =C2=A0 =C2=A0std::ostringstream buffer;
> + =C2=A0 =C2=A0ofstream myfile;
> + =C2=A0 =C2=A0logheader=5Ft hdr;
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
