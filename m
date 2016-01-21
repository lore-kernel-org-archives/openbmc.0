Return-Path: <hramasub@in.ibm.com>
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F1AA1A02E6
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 17:23:36 +1100 (AEDT)
Received: from localhost
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Mon, 25 Jan 2016 11:53:32 +0530
Received: from d28relay03.in.ibm.com (9.184.220.60)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 25 Jan 2016 11:53:30 +0530
X-IBM-Helo: d28relay03.in.ibm.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0P6NTkw56164606
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 11:53:29 +0530
Message-Id: <201601250623.u0P6NTkw56164606@d28relay03.in.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Sun, 24 Jan 2016 23:23:27 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 24 Jan 2016 23:23:26 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Mon, 25 Jan 2016 06:23:25 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 25 Jan 2016 06:23:22 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016012506232175-26362 ;
 Mon, 25 Jan 2016 06:23:21 +0000 
In-Reply-To: <20160121154802.3183fc4a@camb691>
Subject: Re: [PATCH phosphor-host-ipmid] Using systemd dbus API to set get LAN
 parameters.
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Thu, 21 Jan 2016 10:29:05 +0530
References: <1453296028-21095-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453296028-21095-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160121154802.3183fc4a@camb691>
X-KeepSent: 6F6E6399:535AF62C-00257F41:001B1138;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 65259
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8"
x-cbid: 16012506-0009-0000-0000-00000A24F27F
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.131954; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004830; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000137; SDB=6.00650210; UDB=6.00294002; UTC=2016-01-25
 06:23:23
x-cbparentid: 16012506-5920-0000-0000-000005D14CF0
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
X-List-Received-Date: Mon, 25 Jan 2016 06:23:38 -0000

--0__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8"


--1__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


The intent of this patch is to *replace* the popen () calls with dbus api
calls.

The functional equivalent to add an IP address (previously a system call to
ip addr add ...) would be:

rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,            		   // On the System Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path
> +                                ifc,            // Interface name
> +                                "AddAddress4",  // Method to be called
> +                                &err,           // object to return
error
> +                                &res,           // Response message on
success
> +                                "ssss",         // input message
(dev,ip,nm,gw)
> +                                "eth0",
> +                                new=5Fipaddr,
> +                                new=5Fnetmask,
> +                                new=5Fgateway);

hth,
rhari !

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950



From:	Cyril Bur <cyrilbur@gmail.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org
Date:	01/21/2016 10:18 AM
Subject:	Re: [PATCH phosphor-host-ipmid] Using systemd dbus API to set
            get LAN parameters.
Sent by:	"openbmc" <openbmc-bounces
            +hramasub=3Din.ibm.com@lists.ozlabs.org>



On Wed, 20 Jan 2016 07:20:28 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

Hi Hariharasubramanian,

I have a few questions about this patch.


Firstly, I notice you've removed all the calls to popen() and I can't see
any
functional equivalent. Unfortunately there is no commit message so I don't
know
if you meant to remove them and not replace them. Thought I had to check.


> From: Hariharasubramanian R <hramasub@in.ibm.com>
>
> ---
>  transporthandler.C | 233 ++++++++++++++++++++++++++++++++++++++++++
+----------
>  1 file changed, 191 insertions(+), 42 deletions(-)
>
> diff --git a/transporthandler.C b/transporthandler.C
> index 0f7a730..dac8fe8 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -1,11 +1,31 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdint.h>
> +#include <arpa/inet.h>
>
>  #include "ipmid-api.h"
>  #include "ipmid.H"
>  #include "transporthandler.h"
>
> +#define SYSTEMD=5FNETWORKD=5FDBUS 1
> +
> +#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> +#include <systemd/sd-bus.h>
> +#endif

Why even have the SYSTEMD=5FNETWORKD=5FDBUS?

> +
> +// OpenBMC System Manager dbus framework
> +const char  *app   =3D  "org.openbmc.NetworkManager";
> +const char  *obj   =3D  "/org/openbmc/NetworkManager/Interface";
> +const char  *ifc   =3D  "org.openbmc.NetworkManager";
> +
> +char cur=5Fipaddr  [16] =3D "";
> +char cur=5Fnetmask [16] =3D "";
> +char cur=5Fgateway [16] =3D "";
> +
> +char new=5Fipaddr  [16] =3D "";
> +char new=5Fnetmask [16] =3D "";
> +char new=5Fgateway [16] =3D "";
> +

Why are you declaring these globally?

>  void register=5Fnetfn=5Ftransport=5Ffunctions() =5F=5Fattribute=5F=5F((c=
onstructor));
>
>  ipmi=5Fret=5Ft ipmi=5Ftransport=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=
=5Fcmd=5Ft cmd,
> @@ -31,7 +51,6 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetf=
n=5Ft netfn,
ipmi=5Fcmd=5Ft cmd,
>  {
>      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
>      *data=5Flen =3D 0;
> -    char syscmd[128];
>
>      printf("IPMI SET=5FLAN\n");
>
> @@ -43,18 +62,88 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fne=
tfn=5Ft netfn,
ipmi=5Fcmd=5Ft cmd,
>
>      if (reqptr->parameter =3D=3D 3) // IP
>      {
> -        sprintf(syscmd, "ifconfig eth0 %d.%d.%d.%d", reqptr->data[0],
reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new=5Fipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->da=
ta
[1], reqptr->data[2], reqptr->data[3]);
>      }
>      else if (reqptr->parameter =3D=3D 6) // Subnet
>      {
> -        sprintf(syscmd, "ifconfig eth0 netmask %d.%d.%d.%d", reqptr->
data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new=5Fnetmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->
data[1], reqptr->data[2], reqptr->data[3]);
>      }
>      else if (reqptr->parameter =3D=3D 12) // Gateway
>      {
> -        sprintf(syscmd, "route add default gw %d.%d.%d.%d", reqptr->data
[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> -        system(syscmd);
> +        sprintf(new=5Fgateway, "%d.%d.%d.%d", reqptr->data[0], reqptr->
data[1], reqptr->data[2], reqptr->data[3]);
> +    }
> +    else if (reqptr->parameter =3D=3D 0) // Apply config
> +    {
> +        int rc =3D 0;
> +        sd=5Fbus=5Fmessage *req =3D NULL;
> +        sd=5Fbus=5Fmessage *res =3D NULL;
> +        sd=5Fbus *bus         =3D NULL;
> +        sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
> +
> +        if (!strcmp(new=5Fipaddr, "") || !strcmp (new=5Fnetmask, "")
|| !strcmp (new=5Fgateway, ""))
> +        {



> +            fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
> +            return -1;
> +        }
> +
> +        rc =3D sd=5Fbus=5Fopen=5Fsystem(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
> +
> +        if (strcmp(cur=5Fipaddr, ""))
> +        {
> +            sd=5Fbus=5Ferror=5Ffree(&err);
> +            sd=5Fbus=5Fmessage=5Funref(req);
> +            sd=5Fbus=5Fmessage=5Funref(res);
> +
> +            rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,            // On the Sy=
stem Bus
> +                                    app,            // Service to
contact
> +                                    obj,            // Object path
> +                                    ifc,            // Interface name
> +                                    "DelAddress4",  // Method to be
called
> +                                    &err,           // object to return
error
> +                                    &res,           // Response message
on success
> +                                    "ssss",         // input message
(dev,ip,nm,gw)
> +                                    "eth0",
> +                                    cur=5Fipaddr,
> +                                    cur=5Fnetmask,
> +                                    cur=5Fgateway);

So here it becomes quite clear that all that (possibly error prone) sprintf
earlier was simply so you can send the addresses over dbus.

Perhaps you chould just pass the reqptr->data[] values as they are?


> +        }
> +
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to remove existing IP %s: %s\n",
cur=5Fipaddr, err.message);
> +            return -1;
> +        }
> +
> +        sd=5Fbus=5Ferror=5Ffree(&err);
> +        sd=5Fbus=5Fmessage=5Funref(req);
> +        sd=5Fbus=5Fmessage=5Funref(res);
> +
> +        rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,            // On the System=
 Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path
> +                                ifc,            // Interface name
> +                                "AddAddress4",  // Method to be called
> +                                &err,           // object to return
error
> +                                &res,           // Response message on
success
> +                                "ssss",         // input message
(dev,ip,nm,gw)
> +                                "eth0",
> +                                new=5Fipaddr,
> +                                new=5Fnetmask,
> +                                new=5Fgateway);

See my previous comment.

> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to set IP %s: %s\n", new=5Fipaddr,
err.message);
> +            return -1;
> +        }
> +
> +        strcpy (cur=5Fipaddr, new=5Fipaddr);
> +        strcpy (cur=5Fnetmask, new=5Fnetmask);
> +        strcpy (cur=5Fgateway, new=5Fgateway);
>      }
>      else
>      {
> @@ -78,10 +167,16 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fn=
etfn=5Ft
netfn, ipmi=5Fcmd=5Ft cmd,
>  {
>      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
>      *data=5Flen =3D 0;
> -
> +    sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL; /* fixme */

What is going to need fixing exactly?

>      const uint8=5Ft current=5Frevision =3D 0x11; // Current rev per IPMI=
 Spec
2.0
> -    char syscmd[128];
> -    int i =3D 0;
> +
> +    int                 family;
> +    unsigned char       prefixlen;
> +    unsigned char       scope;
> +    unsigned int        flags;
> +    char                saddr [128];
> +    char                gateway [128];
> +    uint8=5Ft             buf[11];
>
>      printf("IPMI GET=5FLAN\n");
>
> @@ -121,56 +216,111 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=
=5Fnetfn=5Ft
netfn, ipmi=5Fcmd=5Ft cmd,
>      }
>      else if (reqptr->parameter =3D=3D 3) // IP

See my other comment about this

>      {
> -        //string to parse: inet xx.xx.xxx.xxx/xx
> +        const char*         device             =3D "eth0";
>
> -        uint8=5Ft buf[5];
> -        memcpy((void*)&buf[0], &current=5Frevision, 1);
> +        sd=5Fbus=5Fmessage *res =3D NULL;
> +        sd=5Fbus *bus         =3D NULL;
> +        sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
> +
> +        rc =3D sd=5Fbus=5Fopen=5Fsystem(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
>
> -        for (i=3D0; i<4; i++)
> +        rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,            // On the System=
 Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path
> +                                ifc,            // Interface name
> +                                "GetAddress4",  // Method to be called
> +                                &err,           // object to return
error
> +                                &res,           // Response message on
success
> +                                "s",         // input message
(dev,ip,nm,gw)
> +                                "eth0");
> +        if(rc < 0)
>          {
> -            char ip[5];
> -
> -            sprintf(syscmd, "ip address show dev eth0|grep inet|cut
-d'/' -f1|cut -d' ' -f 6|cut -d'.' -f%d|head -n1", i+1);
> -            FILE *fp =3D popen(syscmd, "r");
> -
> -            memset(ip,0,sizeof(ip));
> -            while (fgets(ip, sizeof(ip), fp) !=3D 0)
> -            {
> -                int tmpip =3D strtoul(ip, NULL, 10);
> -                memcpy((void*)&buf[i+1], &tmpip, 1);
> -            }
> -            pclose(fp);
> +            fprintf(stderr, "Failed to Get IP on interface : %s\n",
device);
> +            return -1;
> +        }
> +
> +        /* rc =3D sd=5Fbus=5Fmessage=5Fread(res, "a(iyyus)s", ...); */

Delete that line?

> +        rc =3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (res, 'a', "(iyyus=
)");
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to parse response message:[%s]\n",
strerror(-rc));
> +            return -1;
> +        }
> +
> +        while ((rc =3D sd=5Fbus=5Fmessage=5Fread(res, "(iyyus)", &family,
&prefixlen, &scope, &flags, &saddr)) > 0) {
> +                printf("%s:%d:%d:%d:%s\n",
family=3D=3DAF=5FINET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
>          }

Again, I bet there is someone sprintf()ing in order to pass saddr as a
string
requiring you to do a sscanf() just a bit further, this makes no sense!

>
> +        rc =3D sd=5Fbus=5Fmessage=5Fread (res, "s", &gateway);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to parse gateway from response
message:[%s]\n", strerror(-rc));
> +            return -1;
> +        }
> +
> +        memcpy((void*)&buf[0], &current=5Frevision, 1);
> +        sscanf (saddr, "%c.%c.%c.%c", &buf[1], &buf[2], &buf[3], &buf
[4]);
> +        buf[5] =3D family;
> +        buf[6] =3D prefixlen;
> +        sscanf (gateway, "%c.%c.%c.%c", &buf[7], &buf[8], &buf[9], &buf
[10]);
> +

From man 3 scanf:

       c      Matches a sequence of characters whose length is specified by
the
       maximum field width (default 1); the next pointer must be a pointer
to
       char, and there must be enough room for all the  charac- ters (no
       terminating null byte is added).  The usual skip of leading white
space
       is suppressed.  To skip white space first, use an explicit space in
the
       format.

To conclude the %c will only match 0-9. Unless someone is passing around
'addresses' in the form of A.B.C.D which is horrifying me but I suppose
could
work... but NO!

However, this isn't the biggest problem we have here - I ask the question
again, why are strings being used to represent these when dbus is perfectly
capable of a variety of different types.

>          *data=5Flen =3D sizeof(buf);
>          memcpy(response, &buf, *data=5Flen);
> +
>          return IPMI=5FCC=5FOK;
>      }
>      else if (reqptr->parameter =3D=3D 5) // MAC
>      {

I know this isn't in the scope of this patch but perhaps we could stop with
the
magic numbers...

>          //string to parse: link/ether xx:xx:xx:xx:xx:xx
>
> -        uint8=5Ft buf[7];
> -        memcpy((void*)&buf[0], &current=5Frevision, 1);
> +        const char*         device             =3D "eth0";

Why did you even declare device? Perhaps consider #defineing it?

> +        char                eaddr [12];
> +        uint8=5Ft             buf[7];
> +
> +        sd=5Fbus=5Fmessage *res =3D NULL;
> +        sd=5Fbus *bus         =3D NULL;
> +        sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
> +
> +        rc =3D sd=5Fbus=5Fopen=5Fsystem(&bus);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +            return -1;
> +        }
> +
> +        rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,            // On the System=
 Bus
> +                                app,            // Service to contact
> +                                obj,            // Object path
> +                                ifc,            // Interface name
> +                                "GetHwAddress",  // Method to be called
> +                                &err,           // object to return
error
> +                                &res,           // Response message on
success
> +                                "s",         // input message
(dev,ip,nm,gw)
> +                                device);
> +        if(rc < 0)
> +        {
> +            fprintf(stderr, "Failed to Get HW address of device : %s\n",
device);
> +            return -1;
> +        }
>
> -        for (i=3D0; i<6; i++)
> +        rc =3D sd=5Fbus=5Fmessage=5Fread (res, "s", &eaddr);
> +        if(rc < 0)
>          {
> -            char mac[4];
> -
> -            sprintf(syscmd, "ip address show dev eth0|grep link|cut -d'
' -f 6|cut -d':' -f%d", i+1);
> -            FILE *fp =3D popen(syscmd, "r");
> -
> -            memset(mac,0,sizeof(mac));
> -            while (fgets(mac, sizeof(mac), fp) !=3D 0)
> -            {
> -                int tmpmac =3D strtoul(mac, NULL, 16);
> -                memcpy((void*)&buf[i+1], &tmpmac, 1);
> -            }
> -            pclose(fp);
> +            fprintf(stderr, "Failed to parse gateway from response
message:[%s]\n", strerror(-rc));
> +            return -1;
>          }
>
> +        memcpy((void*)&buf[0], &current=5Frevision, 1);
> +        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2], &buf[3],
&buf[4], &buf[5], &buf[6]);
> +

... and again ...

>          *data=5Flen =3D sizeof(buf);
>          memcpy(response, &buf, *data=5Flen);
> +
>          return IPMI=5FCC=5FOK;
>      }
>      else
> @@ -195,4 +345,3 @@ void register=5Fnetfn=5Ftransport=5Ffunctions()
>
>      return;
>  }
> -

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>The intent of this patch is to *replace* the popen () calls =
with dbus api calls.<br><br>The functional equivalent to add an IP address =
(previously a system call to ip addr add ...) would be:<br><br><tt>rc =3D <=
/tt><tt><b>sd=5Fbus=5Fcall=5Fmethod</b></tt><tt>(bus, &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;                 &nbsp; // On the System Bus<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;app, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;// Service to contact<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
obj, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Object path <br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ifc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;// Interface name<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;<=
/tt><tt><b>AddAddress4</b></tt><tt>&quot;, &nbsp;// Method to be called<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; // object to return error<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&amp;res, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Response message =
on success<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;ssss&quot;, =
&nbsp; &nbsp; &nbsp; &nbsp; // input message (dev,ip,nm,gw)<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;eth0&quot;,<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;new=5Fipaddr,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;new=5Fnetmask,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;new=5Fgat=
eway);</tt><br><br>hth,<br>rhari !<br><br>Hariharasubramanian R.<br>Power F=
irmware Development<br>IBM India Systems &amp; Technology Lab, Bangalore, I=
ndia<br>Phone:  +91 80 4025 6950   <br><br><img width=3D"16" height=3D"16" =
src=3D"cid:1=5F=5F=3D8FBBF5D2DF8897A88f9e8a93df938690918c8FB@" border=3D"0"=
 alt=3D"Inactive hide details for Cyril Bur ---01/21/2016 10:18:35 AM---On =
Wed, 20 Jan 2016 07:20:28 -0600 OpenBMC Patches &lt;openbmc-pat"><font colo=
r=3D"#424282">Cyril Bur ---01/21/2016 10:18:35 AM---On Wed, 20 Jan 2016 07:=
20:28 -0600 OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; wrote:</font>=
<br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=
=3D"2">Cyril Bur &lt;cyrilbur@gmail.com&gt;</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patches &lt;openbm=
c-patches@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:   =
     </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">01/21/2016 10=
:18 AM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font>=
<font size=3D"2">Re: [PATCH phosphor-host-ipmid] Using systemd dbus API to =
set get LAN parameters.</font><br><font size=3D"2" color=3D"#5F5F5F">Sent b=
y:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+h=
ramasub=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=
=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On =
Wed, 20 Jan 2016 07:20:28 -0600<br>OpenBMC Patches &lt;openbmc-patches@stwc=
x.xyz&gt; wrote:<br><br>Hi Hariharasubramanian,<br><br>I have a few questio=
ns about this patch.<br><br><br>Firstly, I notice you've removed all the ca=
lls to popen() and I can't see any<br>functional equivalent. Unfortunately =
there is no commit message so I don't know<br>if you meant to remove them a=
nd not replace them. Thought I had to check.<br><br><br>&gt; From: Harihara=
subramanian R &lt;hramasub@in.ibm.com&gt;<br>&gt; <br>&gt; ---<br>&gt; &nbs=
p;transporthandler.C | 233 +++++++++++++++++++++++++++++++++++++++++++-----=
-----<br>&gt; &nbsp;1 file changed, 191 insertions(+), 42 deletions(-)<br>&=
gt; <br>&gt; diff --git a/transporthandler.C b/transporthandler.C<br>&gt; i=
ndex 0f7a730..dac8fe8 100644<br>&gt; --- a/transporthandler.C<br>&gt; +++ b=
/transporthandler.C<br>&gt; @@ -1,11 +1,31 @@<br>&gt; &nbsp;#include &lt;st=
dio.h&gt;<br>&gt; &nbsp;#include &lt;string.h&gt;<br>&gt; &nbsp;#include &l=
t;stdint.h&gt;<br>&gt; +#include &lt;arpa/inet.h&gt;<br>&gt; &nbsp;<br>&gt;=
 &nbsp;#include &quot;ipmid-api.h&quot;<br>&gt; &nbsp;#include &quot;ipmid.=
H&quot;<br>&gt; &nbsp;#include &quot;transporthandler.h&quot;<br>&gt; &nbsp=
;<br>&gt; +#define SYSTEMD=5FNETWORKD=5FDBUS 1<br>&gt; +<br>&gt; +#ifdef SY=
STEMD=5FNETWORKD=5FDBUS<br>&gt; +#include &lt;systemd/sd-bus.h&gt;<br>&gt; =
+#endif<br><br>Why even have the SYSTEMD=5FNETWORKD=5FDBUS?<br><br>&gt; +<b=
r>&gt; +// OpenBMC System Manager dbus framework<br>&gt; +const char &nbsp;=
*app &nbsp; =3D &nbsp;&quot;org.openbmc.NetworkManager&quot;;<br>&gt; +cons=
t char &nbsp;*obj &nbsp; =3D &nbsp;&quot;/org/openbmc/NetworkManager/Interf=
ace&quot;;<br>&gt; +const char &nbsp;*ifc &nbsp; =3D &nbsp;&quot;org.openbm=
c.NetworkManager&quot;;<br>&gt; +<br>&gt; +char cur=5Fipaddr &nbsp;[16] =3D=
 &quot;&quot;;<br>&gt; +char cur=5Fnetmask [16] =3D &quot;&quot;;<br>&gt; +=
char cur=5Fgateway [16] =3D &quot;&quot;;<br>&gt; +<br>&gt; +char new=5Fipa=
ddr &nbsp;[16] =3D &quot;&quot;;<br>&gt; +char new=5Fnetmask [16] =3D &quot=
;&quot;;<br>&gt; +char new=5Fgateway [16] =3D &quot;&quot;;<br>&gt; +<br><b=
r>Why are you declaring these globally?<br><br>&gt; &nbsp;void register=5Fn=
etfn=5Ftransport=5Ffunctions() =5F=5Fattribute=5F=5F((constructor));<br>&gt=
; &nbsp;<br>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5Ftransport=5Fwildcard(ipmi=5Fne=
tfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; @@ -31,7 +51,6 @@ ipmi=5Fret=5Ft=
 ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=
=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; - &nbsp; &nbs=
p;char syscmd[128];<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;printf(&quot=
;IPMI SET=5FLAN\n&quot;);<br>&gt; &nbsp;<br>&gt; @@ -43,18 +62,88 @@ ipmi=
=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=
=5Ft cmd,<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;if (reqptr-&gt;paramet=
er =3D=3D 3) // IP<br>&gt; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &n=
bsp; &nbsp;sprintf(syscmd, &quot;ifconfig eth0 %d.%d.%d.%d&quot;, reqptr-&g=
t;data[0], reqptr-&gt;data[1], reqptr-&gt;data[2], reqptr-&gt;data[3]);<br>=
&gt; - &nbsp; &nbsp; &nbsp; &nbsp;system(syscmd);<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;sprintf(new=5Fipaddr, &quot;%d.%d.%d.%d&quot;, reqptr-&gt;data[=
0], reqptr-&gt;data[1], reqptr-&gt;data[2], reqptr-&gt;data[3]);<br>&gt; &n=
bsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else if (reqptr-&gt;paramet=
er =3D=3D 6) // Subnet<br>&gt; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp=
; &nbsp; &nbsp;sprintf(syscmd, &quot;ifconfig eth0 netmask %d.%d.%d.%d&quot=
;, reqptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&gt;data[2], reqptr-&gt;d=
ata[3]);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;system(syscmd);<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;sprintf(new=5Fnetmask, &quot;%d.%d.%d.%d&quot;, req=
ptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&gt;data[2], reqptr-&gt;data[3]=
);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else if (reqpt=
r-&gt;parameter =3D=3D 12) // Gateway<br>&gt; &nbsp; &nbsp; &nbsp;{<br>&gt;=
 - &nbsp; &nbsp; &nbsp; &nbsp;sprintf(syscmd, &quot;route add default gw %d=
.%d.%d.%d&quot;, reqptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&gt;data[2]=
, reqptr-&gt;data[3]);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;system(syscmd);=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sprintf(new=5Fgateway, &quot;%d.%d.%d=
.%d&quot;, reqptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&gt;data[2], reqp=
tr-&gt;data[3]);<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;else if (r=
eqptr-&gt;parameter =3D=3D 0) // Apply config<br>&gt; + &nbsp; &nbsp;{<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;int rc =3D 0;<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;sd=5Fbus=5Fmessage *req =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;sd=5Fbus=5Fmessage *res =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;sd=5Fbus *bus &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FNUL=
L;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;if (!strcmp(new=5Fipaddr, &quot;&quot;) || !strcmp (new=5Fnetmask, &quot=
;&quot;) || !strcmp (new=5Fgateway, &quot;&quot;))<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;{<br><br><br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;fprintf(stderr,&quot;ERROR: Incomplete LAN Parameters\n&quot;);<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(s=
tderr,&quot;ERROR: Getting a SYSTEM bus hook\n&quot;);<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (strcmp(cur=5Fipadd=
r, &quot;&quot;))<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;err);<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(req)=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Fu=
nref(res);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =
=3D sd=5Fbus=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
// On the System Bus<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;app, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj, &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;// Object path <br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;ifc, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;// Interface name<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;&quot;DelAddress4&quot;, &nbsp;// Method to be called<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; // object to return error<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;&amp;res, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Re=
sponse message on success<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&quot;ssss&quot;, &nbsp; &nbsp; &nbsp; &nbsp; // input message (=
dev,ip,nm,gw)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&=
quot;eth0&quot;,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;cur=5Fipaddr,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;cur=5Fnetmask,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;cur=5Fgateway);<br><br>So here it becomes quite clear that all that (possi=
bly error prone) sprintf<br>earlier was simply so you can send the addresse=
s over dbus.<br><br>Perhaps you chould just pass the reqptr-&gt;data[] valu=
es as they are?<br><br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(std=
err, &quot;Failed to remove existing IP %s: %s\n&quot;, cur=5Fipaddr, err.m=
essage);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;err);<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;sd=5Fbus=5Fmessage=5Funref(req);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;s=
d=5Fbus=5Fmessage=5Funref(res);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;rc =3D sd=5Fbus=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;// On the System Bus<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a=
pp, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;// Object path <br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ifc,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Interface name<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;AddAddress4&quot;, &nbsp;// Method to =
be called<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; // object to return error<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;&amp;res, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Resp=
onse message on success<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot=
;ssss&quot;, &nbsp; &nbsp; &nbsp; &nbsp; // input message (dev,ip,nm,gw)<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;eth0&quot;,<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;new=5Fipaddr,<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;new=5Fnetmask,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;new=5Fgateway);<br><br>See my previous comment.<br><br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed=
 to set IP %s: %s\n&quot;, new=5Fipaddr, err.message);<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fipaddr, =
new=5Fipaddr);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fnetmask, =
new=5Fnetmask);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;strcpy (cur=5Fgateway,=
 new=5Fgateway);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;=
else<br>&gt; &nbsp; &nbsp; &nbsp;{<br>&gt; @@ -78,10 +167,16 @@ ipmi=5Fret=
=5Ft ipmi=5Ftransport=5Fget=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cm=
d,<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=
=5FCC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; -<br>&gt=
; + &nbsp; &nbsp;sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FN=
ULL; /* fixme */<br><br>What is going to need fixing exactly?<br><br>&gt; &=
nbsp; &nbsp; &nbsp;const uint8=5Ft current=5Frevision =3D 0x11; // Current =
rev per IPMI Spec 2.0<br>&gt; - &nbsp; &nbsp;char syscmd[128];<br>&gt; - &n=
bsp; &nbsp;int i =3D 0;<br>&gt; +<br>&gt; + &nbsp; &nbsp;int &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; family;<br>&gt; + &nbsp; &nbsp;un=
signed char &nbsp; &nbsp; &nbsp; prefixlen;<br>&gt; + &nbsp; &nbsp;unsigned=
 char &nbsp; &nbsp; &nbsp; scope;<br>&gt; + &nbsp; &nbsp;unsigned int &nbsp=
; &nbsp; &nbsp; &nbsp;flags;<br>&gt; + &nbsp; &nbsp;char &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;saddr [128];<br>&gt; + &nbsp; &nbsp;ch=
ar &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gateway [128];<br=
>&gt; + &nbsp; &nbsp;uint8=5Ft &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bu=
f[11];<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;printf(&quot;IPMI GET=5FL=
AN\n&quot;);<br>&gt; &nbsp;<br>&gt; @@ -121,56 +216,111 @@ ipmi=5Fret=5Ft i=
pmi=5Ftransport=5Fget=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>=
&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else if (reqptr-&gt;=
parameter =3D=3D 3) // IP<br><br>See my other comment about this<br><br>&gt=
; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;//string to pa=
rse: inet xx.xx.xxx.xxx/xx<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;const char*=
 &nbsp; &nbsp; &nbsp; &nbsp; device &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; =3D &quot;eth0&quot;;<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbs=
p;uint8=5Ft buf[5];<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp=
;buf[0], &amp;current=5Frevision, 1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
sd=5Fbus=5Fmessage *res =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sd=
=5Fbus *bus &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FNULL;<=
br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fopen=5Fsys=
tem(&amp;bus);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fprintf(stderr,&quot;ERROR: Getting a SYSTEM bus hook\n&quot;);<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;fo=
r (i=3D0; i&lt;4; i++)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=
=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// On the Sy=
stem Bus<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;app, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;obj, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Object =
path <br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ifc, &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;// Interface name<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;&quot;GetAddress4&quot;, &nbsp;// Method to be called<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; // object to return error<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;&amp;res, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Response message on suc=
cess<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;s&quot;, &nbsp; &n=
bsp; &nbsp; &nbsp; // input message (dev,ip,nm,gw)<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;eth0&quot;);<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;if(rc &lt; 0)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char ip[5];<br>&gt; -<br>&gt; - &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sprintf(syscmd, &quot;ip address show de=
v eth0|grep inet|cut -d'/' -f1|cut -d' ' -f 6|cut -d'.' -f%d|head -n1&quot;=
, i+1);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;FILE *fp =3D pop=
en(syscmd, &quot;r&quot;);<br>&gt; -<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;memset(ip,0,sizeof(ip));<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;while (fgets(ip, sizeof(ip), fp) !=3D 0)<br>&gt; - &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;int tmpip =3D strtoul(ip, NULL, 10);<br>&gt; - &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp;buf[i+=
1], &amp;tmpip, 1);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br=
>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pclose(fp);<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to Get IP=
 on interface : %s\n&quot;, device);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/* rc =3D sd=5Fbus=5Fmessage=5Fread(res,=
 &quot;a(iyyus)s&quot;, ...); */<br><br>Delete that line?<br><br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fmessage=5Fenter=5Fcontainer (res,=
 'a', &quot;(iyyus)&quot;);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt;=
 0)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to parse response message:[=
%s]\n&quot;, strerror(-rc));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;while ((rc =3D sd=5Fbus=5Fmessage=5Fread(res, &q=
uot;(iyyus)&quot;, &amp;family, &amp;prefixlen, &amp;scope, &amp;flags, &am=
p;saddr)) &gt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;printf(&quot;%s:%d:%d:%d:%s\n&quot;, family=3D=3DAF=5FINET?&quot;=
IPv4&quot;:&quot;IPv6&quot;, prefixlen, scope, flags, saddr);<br>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;}<br><br>Again, I bet there is someone sprintf=
()ing in order to pass saddr as a string<br>requiring you to do a sscanf() =
just a bit further, this makes no sense!<br><br>&gt; &nbsp;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fmessage=5Fread (res, &quot;s&quot;,=
 &amp;gateway);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;fprintf(stderr, &quot;Failed to parse gateway from response message:=
[%s]\n&quot;, strerror(-rc));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp;buf[0], &amp;current=5Frevis=
ion, 1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf (saddr, &quot;%c.%c.%c=
.%c&quot;, &amp;buf[1], &amp;buf[2], &amp;buf[3], &amp;buf[4]);<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;buf[5] =3D family;<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;buf[6] =3D prefixlen;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf (g=
ateway, &quot;%c.%c.%c.%c&quot;, &amp;buf[7], &amp;buf[8], &amp;buf[9], &am=
p;buf[10]);<br>&gt; +<br><br>From man 3 scanf:<br><br> &nbsp; &nbsp; &nbsp;=
 c &nbsp; &nbsp; &nbsp;Matches a sequence of characters whose length is spe=
cified by the<br> &nbsp; &nbsp; &nbsp; maximum field width (default 1); the=
 next pointer must be a pointer to<br> &nbsp; &nbsp; &nbsp; char, and there=
 must be enough room for all the &nbsp;charac- ters (no<br> &nbsp; &nbsp; &=
nbsp; terminating null byte is added). &nbsp;The usual skip of leading whit=
e space<br> &nbsp; &nbsp; &nbsp; is suppressed. &nbsp;To skip white space f=
irst, use an explicit space in the<br> &nbsp; &nbsp; &nbsp; format.<br><br>=
To conclude the %c will only match 0-9. Unless someone is passing around<br=
>'addresses' in the form of A.B.C.D which is horrifying me but I suppose co=
uld<br>work... but NO!<br><br>However, this isn't the biggest problem we ha=
ve here - I ask the question<br>again, why are strings being used to repres=
ent these when dbus is perfectly<br>capable of a variety of different types=
.<br><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf)=
;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *dat=
a=5Flen);<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=
=5FCC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else =
if (reqptr-&gt;parameter =3D=3D 5) // MAC<br>&gt; &nbsp; &nbsp; &nbsp;{<br>=
<br>I know this isn't in the scope of this patch but perhaps we could stop =
with the<br>magic numbers...<br><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
//string to parse: link/ether xx:xx:xx:xx:xx:xx<br>&gt; &nbsp;<br>&gt; - &n=
bsp; &nbsp; &nbsp; &nbsp;uint8=5Ft buf[7];<br>&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;memcpy((void*)&amp;buf[0], &amp;current=5Frevision, 1);<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; device &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;eth0&quot;;<br><br>Why did y=
ou even declare device? Perhaps consider #defineing it?<br><br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;eaddr [12];<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; buf[7];<br>&gt; +<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;sd=5Fbus=5Fmessage *res =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;sd=5Fbus *bus &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERR=
OR=5FNULL;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=
=5Fopen=5Fsystem(&amp;bus);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &lt;=
 0)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;fprintf(stderr,&quot;ERROR: Getting a SYSTEM bus hook\n&=
quot;);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;rc =3D sd=5Fbus=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;// On the System Bus<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;app, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj, &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;// Object path <br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if=
c, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Interface name<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;GetHwAddress&quot;, &nbsp;// Method =
to be called<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err, &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; // object to return error<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;res, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // R=
esponse message on success<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&q=
uot;s&quot;, &nbsp; &nbsp; &nbsp; &nbsp; // input message (dev,ip,nm,gw)<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;device);<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;if(rc &lt; 0)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to=
 Get HW address of device : %s\n&quot;, device);<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<=
br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;for (i=3D0; i&lt;6; i++=
)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D sd=5Fbus=5Fmessage=5Fread (re=
s, &quot;s&quot;, &amp;eaddr);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if(rc &=
lt; 0)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;char mac[4];<br>&gt; -<br>&gt; - &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;sprintf(syscmd, &quot;ip address show dev eth0|gr=
ep link|cut -d' ' -f 6|cut -d':' -f%d&quot;, i+1);<br>&gt; - &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;FILE *fp =3D popen(syscmd, &quot;r&quot;);<br>&g=
t; -<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(mac,0,sizeof=
(mac));<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (fgets(mac=
, sizeof(mac), fp) !=3D 0)<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int t=
mpmac =3D strtoul(mac, NULL, 16);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp;buf[i+1], &amp;tmpmac, 1);<br>&g=
t; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; - &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;pclose(fp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;fprintf(stderr, &quot;Failed to parse gateway from response mes=
sage:[%s]\n&quot;, strerror(-rc));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;return -1;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &=
nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp;buf[0], &amp;=
current=5Frevision, 1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf (eaddr,=
 &quot;%x:%x:%x:%x:%x:%x&quot;, &amp;buf[1], &amp;buf[2], &amp;buf[3], &amp=
;buf[4], &amp;buf[5], &amp;buf[6]);<br>&gt; +<br><br>... and again ...<br><=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Fle=
n);<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5F=
OK;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else<br>&gt; =
@@ -195,4 +345,3 @@ void register=5Fnetfn=5Ftransport=5Ffunctions()<br>&gt;=
 &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;return;<br>&gt; &nbsp;}<br>&gt; -<br><b=
r>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>op=
enbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https=
://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/ope=
nbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8--


--0__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBBF5D2DF8897A88f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBBF5D2DF8897A88f9e8a93df938690918c8FBBF5D2DF8897A8--
