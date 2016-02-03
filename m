Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com
 [IPv6:2607:f8b0:4003:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9185A1A0220
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:08:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0fJIVVjb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Ggryr493; 
 dkim-atps=neutral
Received: by mail-ob0-x243.google.com with SMTP id tr5so696475obc.2
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 22:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=7waYiWcii4H77YQMMCQGxzlRQpb3RXvLze8ShcPTgBM=;
 b=0fJIVVjbPkCakpmE8JaLIG9Ojdii/Dk0MKo4WQ+h23FUqQBjFWxWhj6OiSjVuPz5JW
 p7zbgl7gSUXelSeas0gBhfRkKnF0n7lAd9GtL4bjyU/m+KIXT+XLi0CCKfw3u+4j5Wlf
 77e8TvhxT2ef8NtoXRa8KxoYCFQMpT/2nZFwa4M5BEENOCyLtQR0n//PPNcDQ84/IXMC
 6W+0MSxkGfJo0VJMpRQQmo60evANDdWhkl3C23MK3o8C5gsyIAL5rzbJf7NRMsAlj3uH
 DbSFf9Vzp7dKtG+mGvDRoyAiIUzpvecBNiLStVfYH70M2py6DCaVx0ieQzzG/WP8cD/X
 VmYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type:content-transfer-encoding;
 bh=7waYiWcii4H77YQMMCQGxzlRQpb3RXvLze8ShcPTgBM=;
 b=Ggryr493vogc+YItbGHotQRof4HA6F/EpexReOQKVWoHBzNO+brd5mEhOoH5aXX5op
 9cWnQ4ypj06pRq52sTqXaG24Wy95vzXyB3lAK4NC12Oo1DE7yG99HwwvrD4bOPDDL2rT
 QgRxKs0gxaD8uNah0ZLjNz84r2+prD/hV0cL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type
 :content-transfer-encoding;
 bh=7waYiWcii4H77YQMMCQGxzlRQpb3RXvLze8ShcPTgBM=;
 b=IzqMnulpr70DXN32Eol1/ltPB7bMIy402riO/5mwicdjuCEvcCOvR426s0B9E1YmUc
 rtHoaUJiawSV2t9bvwuBMvwxjj0pfwxHK8+rWVcBRpee2gk0vzpysPbQT8PsBoCSs2rA
 RLcECuOYE4HJRJU7dgDwLdlys5ZPfdFucZv2nLMNU7EbidW+MUfnLug1Rv0r+WwBHrcs
 jPG73Tnm8kJTTNKDslHvczOBavXDcYq4VQu0sF7s16mk6Be0HKXWjAL8hFu2OsaU9E52
 PRBX/h4fvcbJB4balj9aTLurL1vd2T7EvlPf6Bk4iQl1MNxvGIapOW4+mDSPWd1vG2Dv
 eCnA==
X-Gm-Message-State: AG10YORQ1aK668whpBJwFXEfPg1OtlX9i/zJhSfNwgse08Xw1mp5CkzAWVxMvpAb3ac6ybWNn1eBMhp3x11h8g==
X-Received: by 10.182.45.227 with SMTP id q3mr28745606obm.55.1454479736161;
 Tue, 02 Feb 2016 22:08:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 2 Feb 2016 22:08:36 -0800 (PST)
In-Reply-To: <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Feb 2016 17:08:36 +1100
X-Google-Sender-Auth: caSVnYraV9rDm7qSWBwzNWkIIkw
Message-ID: <CACPK8Xfo3u46VaTj2xaY1ab=9EcMQtjb3Tqghpuus+FNqSX=vw@mail.gmail.com>
Subject: Re: [PATCH phosphor-event] Event Logs to survive a reboot
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 03 Feb 2016 06:09:00 -0000

On Wed, Feb 3, 2016 at 3:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> The event service stores the events from the host.  Before this commit al=
l the code was in memory.  That meant once a reboot occured you lost the lo=
gs.  With this commit I am storing all logs to the file system.  This refac=
toring also enables a test suite.  The suite can be invoked by 'make test; =
./test'.

'make check' is commonly used instead of test. Either way, the make
target should run the test for you.

>
> 1) /var/sys/obmc/events/x

/var/log is generally where logs are stored.

> 2) logs are stored in binary and saved
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

Should this go into a README?

> ---
>  Makefile               |  29 ++--
>  event_messaged.C       |  44 +++++
>  event_messaged.c       | 341 ---------------------------------------

It looks like you've moved and modified this file in the same commit.
The move should be a separate commit, so we can review the code
changes.

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
>
> -EXE     =3D event_messaged
> +TEST      =3D test
>
> -OBJS    =3D $(EXE).o   \
> -          list.o        \
> +EXE       =3D event_messaged
> +EXE_OBJS  =3D $(EXE).o message.o event_messaged_sdbus.o list.o
>
> +OBJS_TEST =3D $(TEST).o message.o
> +
> +CPPFLAGS  +=3D -g -fpic -Wall -std=3Dc++11
>
>  DEPPKGS =3D libsystemd
> -CC      ?=3D $(CROSS_COMPILE)gcc
>  INCLUDES +=3D $(shell pkg-config --cflags $(DEPPKGS))
>  LIBS +=3D $(shell pkg-config --libs $(DEPPKGS))
>
> +
> +
>  all: $(EXE)
>
>  %.o : %.c
>         $(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
>
> -$(EXE): $(OBJS)
> -       $(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +%.o : %.C
> +       $(CXX) -c $< $(CPPFLAGS) -o $@
> +
> +
> +$(EXE): $(EXE_OBJS)
> +       $(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
> +
>
>  $(TEST): $(OBJS_TEST)
> -       $(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +       $(CXX) $^ $(LDFLAGS) -o $@
>
>  clean:
> -       rm -f $(OBJS) $(EXE) *.o *.d
> +       rm -f $(TEST) *.o *.so $(EXE)
> +
> +
> diff --git a/event_messaged.C b/event_messaged.C
> new file mode 100644
> index 0000000..4376431
> --- /dev/null
> +++ b/event_messaged.C

This file only contains C, so perhaps make it a C file?

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

Extra whitespace.

> +// Walk through all the saved logs and reload them in to dbus objects
> +// Needed because on a reboot the existing logs need to be reloaded
> +int load_existing_events(void) {
> +
> +    event_log_list log_list;
> +    uint16_t       logid=3D0;

Don't initalise this here.

> +
> +    while (message_get_next_log(&logid, &log_list)) {
> +        send_log_to_dbus(logid);
> +    }
> +
> +    return 0;
> +}
> +
> +int main(int argc, char *argv[]) {
> +
> +    int rc =3D 0;

Don't initalise this here.

> +
> +    if ((rc =3D build_bus()) < 0) {

This is more readable:

 rc =3D build_bus();
 if (rc < 0)

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

This should not be indented.

> +    cleanup_event_monitor();
> +
> +    return rc;
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

This should be lower case.

> +
> +static uint16_t create_log_event(event_record_t *rec) {
> +
> +    std::ostringstream buffer;
> +    ofstream myfile;
> +    logheader_t hdr;
