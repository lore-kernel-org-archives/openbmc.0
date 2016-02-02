Return-Path: <njames@us.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BA2011A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 15:12:59 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Mon, 1 Feb 2016 21:12:57 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 1 Feb 2016 21:12:55 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id C680B1FF0043
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 21:01:04 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u124Csnp27459604
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 21:12:54 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u124CsqS018666
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 21:12:54 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u124CrgD018631
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 21:12:54 -0700
Message-Id: <201602020412.u124CrgD018631@d03av03.boulder.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Mon, 1 Feb 2016 23:12:53 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 1 Feb 2016 23:12:51 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 2 Feb 2016 04:12:50 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 2 Feb 2016 04:12:47 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016020204135796-8446 ; Tue, 2 Feb 2016 04:13:57 +0000 
In-Reply-To: <20160202034239.GA2337@localhost.localdomain>
Subject: Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command,
 which call a
 dbus method, belongs to NETFUN_APP. 1. A method dbus_warm_reset() to talk
 with the dbus method 'warmRest'; 2. Also get service name by
 ipmid_get_sd_bus_connection() instead of object_mapper_get_connection();
 3. Register
 the ipmi command; 4. Add related .o to the Makefile; 5. Add wildcard
 function.
To: Sam Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 William <bjlinan@cn.ibm.com>
From: "Norman James" <njames@us.ibm.com>
Date: Mon, 1 Feb 2016 22:12:41 -0600
References: <1454308825-13334-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454308825-13334-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160202034239.GA2337@localhost.localdomain>
X-KeepSent: 62E7F988:2EF612A2-86257F4D:0016EED0;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 32171
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840"
x-cbid: 16020204-0025-0000-0000-000020F77971
X-IBM-ISS-SpamDetectors: Score=0.421136; BY=0.132429; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.421136; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004867; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00653964; UDB=6.00296253; UTC=2016-02-02
 04:12:48
x-cbparentid: 16020204-4778-0000-0000-000001D00173
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
X-List-Received-Date: Tue, 02 Feb 2016 04:13:00 -0000

--0__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840"


--1__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Too late.  Cyril had already approved this code.   If you want to step up
the priority on fixing the TODO, you could open an issue so we can make
sure it gets addressed in a timely fashion.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Sam Mendoza-Jonas <sam@mendozajonas.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org, William <bjlinan@cn.ibm.com>
Date:	02/01/2016 09:44 PM
Subject:	Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command,
            which call a dbus method, belongs to NETFUN=5FAPP. 1. A method
            dbus=5Fwarm=5Freset() to talk with the dbus method 'warmRest'; =
2.
            Also get service name by ipmid=5Fget=5Fsd=5Fbus=5Fconnection() =
instead
            of object=5Fmapper=5Fget=5Fconnection(); 3. Register the ipmi
            command; 4. Add related .o to the Makefile; 5. Add wildcard
            function.
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



Hi William, a question below;

On Mon, Feb 01, 2016 at 12:40:25AM -0600, OpenBMC Patches wrote:
> From: William <bjlinan@cn.ibm.com>
>
> ---
>  Makefile        |   1 +
>  globalhandler.C | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++
++++++
>  globalhandler.h |  12 ++++
>  3 files changed, 184 insertions(+)
>  create mode 100644 globalhandler.C
>  create mode 100644 globalhandler.h
>
> diff --git a/Makefile b/Makefile
> index 472bfaa..58e7310 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,6 +15,7 @@ LIB=5FAPP=5FOBJ =3D apphandler.o     \
>                ipmisensor.o     \
>                storageaddsel.o  \
>                transporthandler.o  \
> +              globalhandler.o
>
>  LIB=5FHOST=5FSRV=5FOBJ =3D host-services.o
>
> diff --git a/globalhandler.C b/globalhandler.C
> new file mode 100644
> index 0000000..e68ea79
> --- /dev/null
> +++ b/globalhandler.C
> @@ -0,0 +1,171 @@
> +#include "globalhandler.h"
> +#include "ipmid-api.h"
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +const char  *control=5Fobject=5Fname  =3D  "/org/openbmc/control/bmc0";
> +const char  *control=5Fintf=5Fname    =3D  "org.openbmc.control.Bmc";
> +
> +const char  *objectmapper=5Fservice=5Fname =3D  "org.openbmc.objectmappe=
r";
> +const char  *objectmapper=5Fobject=5Fname  =3D
"/org/openbmc/objectmapper/objectmapper";
> +const char  *objectmapper=5Fintf=5Fname    =3D
"org.openbmc.objectmapper.ObjectMapper";
> +
> +void register=5Fnetfn=5Fglobal=5Ffunctions() =5F=5Fattribute=5F=5F((cons=
tructor));
> +
> +int obj=5Fmapper=5Fget=5Fconnection(char** buf, const char* obj=5Fpath)
> +{
> +    sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> +    sd=5Fbus=5Fmessage *m =3D NULL;
> +    sd=5Fbus *bus =3D NULL;
> +    char *temp=5Fbuf =3D NULL, *intf =3D NULL;
> +    size=5Ft buf=5Fsize =3D 0;
> +    int r;
> +
> +    //Get the system bus where most system services are provided.
> +    bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to
call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at
the
> +     * end.
> +     */
> +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,
> +            objectmapper=5Fservice=5Fname,                      /* servi=
ce
to contact */
> +            objectmapper=5Fobject=5Fname,                       /* object
path */
> +            objectmapper=5Fintf=5Fname,                         /* inter=
face
name */
> +            "GetObject",                                    /* method
name */
> +            &error,                                         /* object to
return error in */
> +            &m,                                             /* return
message on success */
> +            "s",                                            /* input
signature */
> +            obj=5Fpath                                        /* first
argument */
> +            );
> +
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to issue method call: %s\n",
error.message);
> +        goto finish;
> +    }
> +
> +    // Get the key, aka, the connection name
> +    sd=5Fbus=5Fmessage=5Fread(m, "a{sas}", 1, &temp=5Fbuf, 1, &intf);
> +
> +		 /*
> +     * TODO: check the return code. Currently for no reason the message
> +     * parsing of object mapper is always complaining about
> +     * "Device or resource busy", but the result seems OK for now. Need
> +     *  further checks.
> +     */

I've seen this comment before and it worries me a bit. Why are we
getting the error? How do you know temp=5Fbuf is allocated properly? What
does it mean that the result "seems OK"?
You check return codes before and after this, but if you get unlucky
here you could easily segfault or read nonsense.

I think this issue should be figured out before merging the code, both
here and wherever else it appears.

Thanks,
Sam

> +
> +    buf=5Fsize =3D strlen(temp=5Fbuf) + 1;
> +    printf("IPMID connection name: %s\n", temp=5Fbuf);
> +    *buf =3D (char*)malloc(buf=5Fsize);
> +
> +    if (*buf =3D=3D NULL) {
> +        fprintf(stderr, "Malloc failed for warm reset");
> +        r =3D -1;
> +        goto finish;
> +    }
> +
> +    memcpy(*buf, temp=5Fbuf, buf=5Fsize);
> +
> +finish:
> +    sd=5Fbus=5Ferror=5Ffree(&error);
> +    sd=5Fbus=5Fmessage=5Funref(m);
> +
> +    return r;
> +}
> +
> +int dbus=5Fwarm=5Freset()
> +{
> +    sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> +    sd=5Fbus=5Fmessage *m =3D NULL;
> +    sd=5Fbus *bus =3D NULL;
> +    char* temp=5Fbuf =3D NULL;
> +    uint8=5Ft* get=5Fvalue =3D NULL;
> +    char* connection =3D NULL;
> +    int r, i;
> +
> +    r =3D obj=5Fmapper=5Fget=5Fconnection(&connection, control=5Fobject=
=5Fname);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to get connection, return value: %d.\n",
r);
> +        goto finish;
> +    }
> +
> +    printf("connection: %s\n", connection);
> +
> +    // Open the system bus where most system services are provided.
> +    bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to
call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at
the
> +     * end.
> +		  */
> +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,
> +            connection,                                /* service to
contact */
> +            control=5Fobject=5Fname,                       /* object pat=
h */
> +            control=5Fintf=5Fname,                         /* interface =
name
*/
> +            "warmReset",                               /* method name */
> +            &error,                                    /* object to
return error in */
> +            &m,                                        /* return message
on success */
> +            NULL,
> +            NULL
> +            );
> +
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to issue method call: %s\n",
error.message);
> +        goto finish;
> +    }
> +
> +finish:
> +    sd=5Fbus=5Ferror=5Ffree(&error);
> +    sd=5Fbus=5Fmessage=5Funref(m);
> +    free(connection);
> +
> +    return r;
> +}
> +
> +ipmi=5Fret=5Ft ipmi=5Fglobal=5Fwarm=5Freset(ipmi=5Fnetfn=5Ft netfn, ipmi=
=5Fcmd=5Ft cmd,
> +                              ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft
response,
> +                              ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fc=
ontext=5Ft
context)
> +{
> +    printf("Handling GLOBAL warmReset Netfn:[0x%X], Cmd:[0x%X]\n",netfn,
cmd);
> +
> +    // TODO: call the correct dbus method for warmReset.
> +    dbus=5Fwarm=5Freset();
> +
> +    // Status code.
> +    ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> +    *data=5Flen =3D 0;
> +    return rc;
> +}
> +
> +ipmi=5Fret=5Ft ipmi=5Fglobal=5Fwildcard=5Fhandler(ipmi=5Fnetfn=5Ft netfn=
, ipmi=5Fcmd=5Ft
cmd,
> +                              ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft
response,
> +                              ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fc=
ontext=5Ft
context)
> +{
> +    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> +
> +    // Status code.
> +    ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> +
> +    *data=5Flen =3D strlen("THIS IS WILDCARD");
> +
> +    // Now pack actual response
> +    memcpy(response, "THIS IS WILDCARD", *data=5Flen);
> +
> +    return rc;
> +}
> +
> +void register=5Fnetfn=5Fglobal=5Ffunctions()
> +{
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP,
IPMI=5FCMD=5FWARM=5FRESET);
> +    ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET, =
NULL,
ipmi=5Fglobal=5Fwarm=5Freset);
> +
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP,
IPMI=5FCMD=5FWILDCARD);
> +    ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWILDCARD, NULL,
ipmi=5Fglobal=5Fwildcard=5Fhandler);
> +
> +		 return;
> +}
> diff --git a/globalhandler.h b/globalhandler.h
> new file mode 100644
> index 0000000..608df3b
> --- /dev/null
> +++ b/globalhandler.h
> @@ -0,0 +1,12 @@
> +#ifndef =5F=5FHOST=5FIPMI=5FGLOBAL=5FHANDLER=5FH=5F=5F
> +#define =5F=5FHOST=5FIPMI=5FGLOBAL=5FHANDLER=5FH=5F=5F
> +
> +#include <stdint.h>
> +
> +// Various GLOBAL operations under a single command.
> +enum ipmi=5Fglobal=5Fcontrol=5Fcmds : uint8=5Ft
> +{
> +IPMI=5FCMD=5FWARM=5FRESET 		 		 		    =3D 0x02,
> +};
> +
> +#endif
> --
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


--1__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Too late.  Cyril had already approved this code.   If you wa=
nt to step up the priority on fixing the TODO, you could open an issue so w=
e can make sure it gets addressed in a timely fashion.  <br><br><br>Regards=
,<br>Norman James<br>IBM - POWER Systems Architect<br>Phone: 1-512-286-6807=
 (T/L: 363-6807)<br>Internet: njames@us.ibm.com<br><br><br><img width=3D"16=
" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF5DEDF8568408f9e8a93df938690918c09=
B@" border=3D"0" alt=3D"Inactive hide details for Sam Mendoza-Jonas ---02/0=
1/2016 09:44:21 PM---Hi William, a question below; On Mon, Feb 01, 2016 at =
1"><font color=3D"#424282">Sam Mendoza-Jonas ---02/01/2016 09:44:21 PM---Hi=
 William, a question below; On Mon, Feb 01, 2016 at 12:40:25AM -0600, OpenB=
MC Patches wrote:</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:   =
     </font><font size=3D"2">Sam Mendoza-Jonas &lt;sam@mendozajonas.com&gt;=
</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=
=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><font si=
ze=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">openbmc@lists=
.ozlabs.org, William &lt;bjlinan@cn.ibm.com&gt;</font><br><font size=3D"2" =
color=3D"#5F5F5F">Date:        </font><font size=3D"2">02/01/2016 09:44 PM<=
/font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font s=
ize=3D"2">Re: [PATCH phosphor-host-ipmid v3] Add ipmi coldReset command, wh=
ich call a dbus method, belongs to NETFUN=5FAPP. 1. A method dbus=5Fwarm=5F=
reset() to talk with the dbus method 'warmRest'; 2. Also get service name b=
y ipmid=5Fget=5Fsd=5Fbus=5Fconnection() instead of object=5Fmapper=5Fget=5F=
connection(); 3. Register the ipmi command; 4. Add related .o to the Makefi=
le; 5. Add wildcard function.</font><br><font size=3D"2" color=3D"#5F5F5F">=
Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bou=
nces+njames=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" =
size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt=
>Hi William, a question below;<br><br>On Mon, Feb 01, 2016 at 12:40:25AM -0=
600, OpenBMC Patches wrote:<br>&gt; From: William &lt;bjlinan@cn.ibm.com&gt=
;<br>&gt; <br>&gt; ---<br>&gt; &nbsp;Makefile &nbsp; &nbsp; &nbsp; &nbsp;| =
&nbsp; 1 +<br>&gt; &nbsp;globalhandler.C | 171 ++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++<br>&gt; &nbsp;globalhandler.h | &nbsp;12 ++++<=
br>&gt; &nbsp;3 files changed, 184 insertions(+)<br>&gt; &nbsp;create mode =
100644 globalhandler.C<br>&gt; &nbsp;create mode 100644 globalhandler.h<br>=
&gt; <br>&gt; diff --git a/Makefile b/Makefile<br>&gt; index 472bfaa..58e73=
10 100644<br>&gt; --- a/Makefile<br>&gt; +++ b/Makefile<br>&gt; @@ -15,6 +1=
5,7 @@ LIB=5FAPP=5FOBJ =3D apphandler.o &nbsp; &nbsp; \<br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmisensor.o &nbsp; &nbsp; \<br=
>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;storageaddsel.=
o &nbsp;\<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ansporthandler.o &nbsp;\<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;globalhandler.o &nbsp;<br>&gt; &nbsp;<br>&gt; &nbsp;LIB=5FHOST=5FSR=
V=5FOBJ =3D host-services.o<br>&gt; &nbsp;<br>&gt; diff --git a/globalhandl=
er.C b/globalhandler.C<br>&gt; new file mode 100644<br>&gt; index 0000000..=
e68ea79<br>&gt; --- /dev/null<br>&gt; +++ b/globalhandler.C<br>&gt; @@ -0,0=
 +1,171 @@<br>&gt; +#include &quot;globalhandler.h&quot;<br>&gt; +#include =
&quot;ipmid-api.h&quot;<br>&gt; +#include &lt;stdio.h&gt;<br>&gt; +#include=
 &lt;string.h&gt;<br>&gt; +#include &lt;stdint.h&gt;<br>&gt; +<br>&gt; +con=
st char &nbsp;*control=5Fobject=5Fname &nbsp;=3D &nbsp;&quot;/org/openbmc/c=
ontrol/bmc0&quot;;<br>&gt; +const char &nbsp;*control=5Fintf=5Fname &nbsp; =
&nbsp;=3D &nbsp;&quot;org.openbmc.control.Bmc&quot;;<br>&gt; +<br>&gt; +con=
st char &nbsp;*objectmapper=5Fservice=5Fname =3D &nbsp;&quot;org.openbmc.ob=
jectmapper&quot;;<br>&gt; +const char &nbsp;*objectmapper=5Fobject=5Fname &=
nbsp;=3D &nbsp;&quot;/org/openbmc/objectmapper/objectmapper&quot;;<br>&gt; =
+const char &nbsp;*objectmapper=5Fintf=5Fname &nbsp; &nbsp;=3D &nbsp;&quot;=
org.openbmc.objectmapper.ObjectMapper&quot;;<br>&gt; +<br>&gt; +void regist=
er=5Fnetfn=5Fglobal=5Ffunctions() =5F=5Fattribute=5F=5F((constructor));<br>=
&gt; +<br>&gt; +int obj=5Fmapper=5Fget=5Fconnection(char** buf, const char*=
 obj=5Fpath)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D S=
D=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *m =3D NU=
LL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus *bus =3D NULL;<br>&gt; + &nbsp; &nbsp;c=
har *temp=5Fbuf =3D NULL, *intf =3D NULL;<br>&gt; + &nbsp; &nbsp;size=5Ft b=
uf=5Fsize =3D 0;<br>&gt; + &nbsp; &nbsp;int r;<br>&gt; +<br>&gt; + &nbsp; &=
nbsp;//Get the system bus where most system services are provided.<br>&gt; =
+ &nbsp; &nbsp;bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>&gt; +<br>=
&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * Bus, service, object path,=
 interface and method are provided to call<br>&gt; + &nbsp; &nbsp; * the me=
thod.<br>&gt; + &nbsp; &nbsp; * Signatures and input arguments are provided=
 by the arguments at the<br>&gt; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &n=
bsp; */<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;objectmapper=5Fservice=5Fname, &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
/* service to contact */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;objectmapper=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;objectmapper=5Fintf=5Fname, &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interfac=
e name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;GetObjec=
t&quot;, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* method name *=
/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error, &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object to return =
error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
/* return message on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;&quot;s&quot;, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;/* input signature */<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;obj=5Fpath &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;/* first argument */<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to issue me=
thod call: %s\n&quot;, error.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;// =
Get the key, aka, the connection name<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmes=
sage=5Fread(m, &quot;a{sas}&quot;, 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&g=
t; + &nbsp; &nbsp;<br>&gt; +                 /* <br>&gt; + &nbsp; &nbsp; * =
TODO: check the return code. Currently for no reason the message<br>&gt; + =
&nbsp; &nbsp; * parsing of object mapper is always complaining about<br>&gt=
; + &nbsp; &nbsp; * &quot;Device or resource busy&quot;, but the result see=
ms OK for now. Need<br>&gt; + &nbsp; &nbsp; * &nbsp;further checks.<br>&gt;=
 + &nbsp; &nbsp; */<br><br>I've seen this comment before and it worries me =
a bit. Why are we<br>getting the error? How do you know temp=5Fbuf is alloc=
ated properly? What<br>does it mean that the result &quot;seems OK&quot;?<b=
r>You check return codes before and after this, but if you get unlucky<br>h=
ere you could easily segfault or read nonsense.<br><br>I think this issue s=
hould be figured out before merging the code, both<br>here and wherever els=
e it appears.<br><br>Thanks,<br>Sam<br><br>&gt; +<br>&gt; + &nbsp; &nbsp;bu=
f=5Fsize =3D strlen(temp=5Fbuf) + 1;<br>&gt; + &nbsp; &nbsp;printf(&quot;IP=
MID connection name: %s\n&quot;, temp=5Fbuf);<br>&gt; + &nbsp; &nbsp;*buf =
=3D (char*)malloc(buf=5Fsize);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (*buf =
=3D=3D NULL) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;M=
alloc failed for warm reset&quot;);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcpy(*buf, temp=5Fbuf, buf=5Fsiz=
e);<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffr=
ee(&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&g=
t; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +<br>&gt; +int dbu=
s=5Fwarm=5Freset()<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error=
 =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *m =
=3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus *bus =3D NULL;<br>&gt; + &nbsp; &=
nbsp;char* temp=5Fbuf =3D NULL;<br>&gt; + &nbsp; &nbsp;uint8=5Ft* get=5Fval=
ue =3D NULL;<br>&gt; + &nbsp; &nbsp;char* connection =3D NULL;<br>&gt; + &n=
bsp; &nbsp;int r, i;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D obj=5Fmapper=5F=
get=5Fconnection(&amp;connection, control=5Fobject=5Fname);<br>&gt; + &nbsp=
; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr=
, &quot;Failed to get connection, return value: %d.\n&quot;, r);<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<=
br>&gt; + &nbsp; &nbsp;printf(&quot;connection: %s\n&quot;, connection);<br=
>&gt; +<br>&gt; + &nbsp; &nbsp;// Open the system bus where most system ser=
vices are provided.<br>&gt; + &nbsp; &nbsp;bus =3D ipmid=5Fget=5Fsd=5Fbus=
=5Fconnection();<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;/*<br>&gt; =
+ &nbsp; &nbsp; * Bus, service, object path, interface and method are provi=
ded to call<br>&gt; + &nbsp; &nbsp; * the method.<br>&gt; + &nbsp; &nbsp; *=
 Signatures and input arguments are provided by the arguments at the<br>&gt=
; + &nbsp; &nbsp; * end.<br>&gt; +                 &nbsp;*/<br>&gt; + &nbsp=
; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;connection, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* serv=
ice to contact */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;contro=
l=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; /* object path */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;control=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interface name */<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;warmReset&quot;, &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; /* method name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;/* object to return error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&amp;m, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;/* return message on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;NULL,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NU=
LL<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;);<br>&gt; +<br>&gt; =
+ &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf=
(stderr, &quot;Failed to issue method call: %s\n&quot;, error.message);<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>=
&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp=
;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; + &n=
bsp; &nbsp;free(connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>=
&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fglobal=5Fwarm=5Freset(ipmi=
=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=
=5Ft context)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;printf(&quot;Handling GLOBA=
L warmReset Netfn:[0x%X], Cmd:[0x%X]\n&quot;,netfn, cmd);<br>&gt; +<br>&gt;=
 + &nbsp; &nbsp;// TODO: call the correct dbus method for warmReset.<br>&gt=
; + &nbsp; &nbsp;dbus=5Fwarm=5Freset();<br>&gt; +<br>&gt; + &nbsp; &nbsp;//=
 Status code.<br>&gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<=
br>&gt; + &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; + &nbsp; &nbsp;return rc;=
<br>&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fglobal=5Fwildcard=5Fha=
ndler(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=
=5Fcontext=5Ft context)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;printf(&quot;Hand=
ling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n&quot;,netfn, cmd);<br>&gt; +<br>&g=
t; + &nbsp; &nbsp;// Status code.<br>&gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft rc =
=3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; + &nbsp; &nbsp;*data=5Flen =3D strlen=
(&quot;THIS IS WILDCARD&quot;);<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Now pac=
k actual response<br>&gt; + &nbsp; &nbsp;memcpy(response, &quot;THIS IS WIL=
DCARD&quot;, *data=5Flen);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return rc;<br>&=
gt; +}<br>&gt; +<br>&gt; +void register=5Fnetfn=5Fglobal=5Ffunctions()<br>&=
gt; +{<br>&gt; + &nbsp; &nbsp;printf(&quot;Registering NetFn:[0x%X], Cmd:[0=
x%X]\n&quot;,NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET);<br>&gt; + &nbsp; &nb=
sp;ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET, NULL=
, ipmi=5Fglobal=5Fwarm=5Freset);<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf(&q=
uot;Registering NetFn:[0x%X], Cmd:[0x%X]\n&quot;,NETFUN=5FAPP, IPMI=5FCMD=
=5FWILDCARD);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FAP=
P, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fglobal=5Fwildcard=5Fhandler);<br>&gt=
; +<br>&gt; +                 return;<br>&gt; +}<br>&gt; diff --git a/globa=
lhandler.h b/globalhandler.h<br>&gt; new file mode 100644<br>&gt; index 000=
0000..608df3b<br>&gt; --- /dev/null<br>&gt; +++ b/globalhandler.h<br>&gt; @=
@ -0,0 +1,12 @@<br>&gt; +#ifndef =5F=5FHOST=5FIPMI=5FGLOBAL=5FHANDLER=5FH=
=5F=5F<br>&gt; +#define =5F=5FHOST=5FIPMI=5FGLOBAL=5FHANDLER=5FH=5F=5F<br>&=
gt; +<br>&gt; +#include &lt;stdint.h&gt;<br>&gt; +<br>&gt; +// Various GLOB=
AL operations under a single command.<br>&gt; +enum ipmi=5Fglobal=5Fcontrol=
=5Fcmds : uint8=5Ft<br>&gt; +{<br>&gt; +IPMI=5FCMD=5FWARM=5FRESET          =
                                          &nbsp; &nbsp;=3D 0x02,<br>&gt; +}=
;<br>&gt; +<br>&gt; +#endif<br>&gt; -- <br>&gt; 2.6.4<br>&gt; <br>&gt; <br>=
&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </tt><t=
t><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlab=
s.org/listinfo/openbmc</a></tt><tt><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lis=
ts.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/open=
bmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840--


--0__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5DEDF8568408f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5DEDF8568408f9e8a93df938690918c09BBF5DEDF856840--
