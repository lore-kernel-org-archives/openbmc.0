Return-Path: <njames@us.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0AC451A009B
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2015 09:56:10 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 21 Nov 2015 15:56:08 -0700
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 21 Nov 2015 15:56:06 -0700
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 7E1B06E803F
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 17:44:15 -0500 (EST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tALMu5kG26935392
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 22:56:05 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tALMu59v005807
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 17:56:05 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tALMu42N005790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 17:56:04 -0500
Message-Id: <201511212256.tALMu42N005790@d01av02.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 21 Nov 2015 15:56:04 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 21 Nov 2015 15:56:01 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Sat, 21 Nov 2015 22:56:00 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 21 Nov 2015 22:55:57 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015112122565123-131675 ;
 Sat, 21 Nov 2015 22:56:51 +0000 
To: "Chris Austen" <austenc@us.ibm.com>
In-Reply-To: <201511211842.tALIgr61003011@d01av04.pok.ibm.com>
Date: Sat, 21 Nov 2015 22:55:56 +0000
From: "Norman James" <njames@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI soft power off
Cc: "openbmc-patches@stwcx.xyz" <openbmc-patches@stwcx.xyz>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.9 Build 201511091004_20
X-KeepSent: 8DB8A0D9:558AC8A8-00257F04:007DF879;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 60943
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary=Apple-Mail-88C4A7DC-862C-4CA2-B1DC-BA4E0468CBC0
x-cbid: 15112122-0033-0000-0000-000006F04F3D
X-IBM-ISS-SpamDetectors: Score=0.397557; BY=0.050319; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397557; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004604; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00620750; UDB=6.00275716; UTC=2015-11-21
 22:55:58
x-cbparentid: 15112122-5090-0000-0000-000005ED7AC8
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
X-List-Received-Date: Sat, 21 Nov 2015 22:56:11 -0000


--Apple-Mail-88C4A7DC-862C-4CA2-B1DC-BA4E0468CBC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Softpoweroff is a method on chassis0.  What dbus obj are u talking about?

Sent from my iPhone

> On Nov 21, 2015, at 12:43 PM, Chris Austen <austenc@us.ibm.com> wrote:
>=20
> what makes SoftPowerOff different enough to have its own dbus object?  Sh=
ouldn't the soft power off simple be another method in the /or/openbmc/chas=
sis/chassis0 interface?=20
> =20
> =20
>=20
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
> =20
> =20
> ----- Original message -----
> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
> To: openbmc@lists.ozlabs.org
> Cc:
> Subject: [PATCH phosphor-host-ipmid v2] IPMI soft power off
> Date: Sat, Nov 21, 2015 12:10 PM
> =20
> From: vishwa <vishwanath@in.ibm.com>
>=20
> ---
>  Makefile         |   5 +--
>  apphandler.C     |  67 +++++++++++++++++++++++++++++--
>  apphandler.h     |  33 ++++++++++++++-
>  chassishandler.C |  85 ++++++++++++++++++++++++++++++++++++++-
>  chassishandler.h |  15 +++++++
>  host-services.c  | 119 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  host-services.h  |   3 ++
>  ipmid-api.h      |   4 +-
>  ipmid.C          |   6 ++-
>  ipmid.H          |   1 +
>  10 files changed, 325 insertions(+), 13 deletions(-)
>  create mode 100644 host-services.c
>  create mode 100644 host-services.h
>=20
> diff --git a/Makefile b/Makefile
> index 1a37c0f..1851c9f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -5,8 +5,7 @@ TESTER =3D testit
>  TESTADDSEL =3D testaddsel
> =20
>  DAEMON =3D ipmid
> -DAEMON=5FOBJ  =3D $(DAEMON).o
> -
> +DAEMON=5FOBJ  =3D ipmid.o host-services.o
> =20
>  LIB=5FAPP=5FOBJ =3D apphandler.o     \
>                sensorhandler.o  \
> @@ -28,7 +27,7 @@ LIB=5FAPP     =3D libapphandler.so
>  INSTALLED=5FLIBS +=3D $(LIB=5FAPP)
>  INSTALLED=5FHEADERS =3D ipmid-api.h
> =20
> -INC=5FFLAG +=3D $(shell pkg-config --cflags --libs libsystemd) -I. -O2
> +INC=5FFLAG +=3D $(shell pkg-config --cflags --libs libsystemd) -I. -O2
>  LIB=5FFLAG +=3D $(shell pkg-config  --libs libsystemd) -rdynamic
>  IPMID=5FPATH ?=3D -DHOST=5FIPMI=5FLIB=5FPATH=3D\"/usr/lib/host-ipmid/\"
> =20
> diff --git a/apphandler.C b/apphandler.C
> index 6467397..d3df330 100644
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -10,19 +10,75 @@ extern sd=5Fbus *bus;
> =20
>  void register=5Fnetfn=5Fapp=5Ffunctions() =5F=5Fattribute=5F=5F((constru=
ctor));
> =20
> +//---------------------------------------------------------------------
> +// Called by Host on seeing a SMS=5FATN bit set. Return a hardcoded
> +// value of 0x2 indicating we need Host read some data.
> +//-------------------------------------------------------------------
> +ipmi=5Fret=5Ft ipmi=5Fapp=5Fget=5Fmsg=5Fflags(ipmi=5Fnetfn=5Ft netfn, ip=
mi=5Fcmd=5Ft cmd,
> +                             ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,
> +                             ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fco=
ntext=5Ft context)
> +{
> + // Generic return from IPMI commands.
> +    ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> +
> +    printf("IPMI APP GET MSG FLAGS returning with [bit:2] set\n");
> +
> + // From IPMI spec V2.0 for Get Message Flags Command :
> + // bit:[1] from LSB : 1b =3D Event Message Buffer Full.
> + // Return as 0 if Event Message Buffer is not supported,
> + // or when the Event Message buffer is disabled.
> + // TODO. For now. assume its not disabled and send "0x2" anyway:
> +
> + uint8=5Ft set=5Fevent=5Fmsg=5Fbuffer=5Ffull =3D 0x2;
> +    *data=5Flen =3D sizeof(set=5Fevent=5Fmsg=5Fbuffer=5Ffull);
> +
> +    // Pack the actual response
> +    memcpy(response, &set=5Fevent=5Fmsg=5Fbuffer=5Ffull, *data=5Flen);
> +
> +    return rc;
> +}
> =20
> +//-------------------------------------------------------------------
> +// Called by Host post response from Get=5FMessage=5FFlags
> +//-------------------------------------------------------------------
>  ipmi=5Fret=5Ft ipmi=5Fapp=5Fread=5Fevent(ipmi=5Fnetfn=5Ft netfn, ipmi=5F=
cmd=5Ft cmd,
>                               ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,
>                               ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fco=
ntext=5Ft context)
>  {
>      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;
> -    *data=5Flen =3D 0;
> +    printf("IPMI APP READ EVENT command received\n");
> =20
> -    printf("IPMI APP READ EVENT Ignoring for now\n");
> -    return rc;
> + // TODO : For now, this is catering only to the Soft Power Off via OEM =
SEL
> + //        mechanism. If we need to make this generically used for some
> + //        other conditions, then we can take advantage of context point=
er.
> =20
> -}
> + struct oem=5Fsel=5Ftimestamped soft=5Foff =3D {0};
> +    *data=5Flen =3D sizeof(struct oem=5Fsel=5Ftimestamped);
> +
> + // either id[0] -or- id[1] can be filled in. We will use id[0]
> + soft=5Foff.id[0] =3D SEL=5FOEM=5FID=5F0;
> + soft=5Foff.id[1] =3D SEL=5FOEM=5FID=5F0;
> + soft=5Foff.type =3D SEL=5FRECORD=5FTYPE=5FOEM;
> +
> + // Following 3 bytes are from IANA Manufactre=5FId field. See below
> + soft=5Foff.manuf=5Fid[0]=3D 0x41;
> + soft=5Foff.manuf=5Fid[1]=3D 0xA7;
> + soft=5Foff.manuf=5Fid[2]=3D 0x00;
> +
> + // per IPMI spec NetFuntion for OEM
> + soft=5Foff.netfun =3D 0x3A;
> =20
> + // Mechanism to kick start soft shutdown.
> + soft=5Foff.cmd =3D CMD=5FPOWER;
> + soft=5Foff.data[0] =3D SOFT=5FOFF;
> +
> + // All '0xFF' since unused.
> + memset(&soft=5Foff.data[1], 0xFF, 3);
> +
> +    // Pack the actual response
> +    memcpy(response, &soft=5Foff, *data=5Flen);
> +    return rc;
> +}
> =20
>  ipmi=5Fret=5Ft ipmi=5Fapp=5Fset=5Facpi=5Fpower=5Fstate(ipmi=5Fnetfn=5Ft =
netfn, ipmi=5Fcmd=5Ft cmd,
>                               ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,
> @@ -359,6 +415,9 @@ void register=5Fnetfn=5Fapp=5Ffunctions()
>      ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FSET=5FBMC=5FGL=
OBAL=5FENABLES, NULL,
>                                              ipmi=5Fapp=5Fset=5Fbmc=5Fglo=
bal=5Fenables);
> =20
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP, IPMI=
=5FCMD=5FGET=5FMSG=5FFLAGS);
> +    ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FGET=5FMSG=5FFL=
AGS, NULL, ipmi=5Fapp=5Fget=5Fmsg=5Fflags);
> +
>      return;
>  }
> =20
> diff --git a/apphandler.h b/apphandler.h
> index 35a2b20..aa2a55d 100644
> --- a/apphandler.h
> +++ b/apphandler.h
> @@ -1,6 +1,19 @@
>  #ifndef =5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F
>  #define =5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F
> =20
> +#include <stdint.h>
> +
> +// These are per skiboot ipmi-sel code
> +
> +// OEM=5FSEL type with Timestamp
> +#define SEL=5FOEM=5FID=5F0 0x55
> +// SEL type is OEM and -not- general SEL
> +#define SEL=5FRECORD=5FTYPE=5FOEM 0xC0
> +// Minor command for soft shurdown
> +#define SOFT=5FOFF 0x00
> +// Major command for Any kind of power ops
> +#define CMD=5FPOWER 0x04
> +
>  // IPMI commands for App net functions.
>  enum ipmi=5Fnetfn=5Fapp=5Fcmds
>  {
> @@ -11,9 +24,27 @@ enum ipmi=5Fnetfn=5Fapp=5Fcmds
>      IPMI=5FCMD=5FRESET=5FWD               =3D 0x22,
>      IPMI=5FCMD=5FSET=5FWD                 =3D 0x24,
>      IPMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES =3D 0x2E,
> +    IPMI=5FCMD=5FGET=5FMSG=5FFLAGS          =3D 0x31,
>      IPMI=5FCMD=5FREAD=5FEVENT             =3D 0x35,
>      IPMI=5FCMD=5FGET=5FCAP=5FBIT            =3D 0x36,
> -
>  };
> =20
> +// A Mechanism to tell host to shtudown hosts by sending this PEM SEL. R=
eally
> +// the only used fields by skiboot are:
> +// id[0] / id[1] for ID=5F0 , ID=5F1
> +// type : SEL=5FRECORD=5FTYPE=5FOEM as standard SELs are ignored by skib=
oot
> +// cmd : CMD=5FPOWER for power functions
> +// data[0], specific commands.  example Soft power off. power cycle, etc.
> +struct oem=5Fsel=5Ftimestamped
> +{
> + /* SEL header */
> + uint8=5Ft id[2];
> + uint8=5Ft type;
> + uint8=5Ft manuf=5Fid[3];
> + uint8=5Ft timestamp[4];
> + /* OEM SEL data (6 bytes) follows */
> + uint8=5Ft netfun;
> + uint8=5Ft cmd;
> + uint8=5Ft data[4];
> +};
>  #endif
> diff --git a/chassishandler.C b/chassishandler.C
> index d00a124..56b8375 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -4,6 +4,11 @@
>  #include <string.h>
>  #include <stdint.h>
> =20
> +// OpenBMC Chassis Manager dbus framework
> +const char  *chassis=5Fbus=5Fname      =3D  "org.openbmc.control.Chassis=
";
> +const char  *chassis=5Fobject=5Fname   =3D  "/org/openbmc/control/chassi=
s0";
> +const char  *chassis=5Fintf=5Fname     =3D  "org.openbmc.control.Chassis=
";
> +
>  void register=5Fnetfn=5Fchassis=5Ffunctions() =5F=5Fattribute=5F=5F((con=
structor));
> =20
>  struct get=5Fsys=5Fboot=5Foptions=5Ft {
> @@ -23,6 +28,82 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=
=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
>      return rc;
>  }
> =20
> +//------------------------------------------------------------
> +// Calls into Chassis Control Dbus object to do the power off
> +//------------------------------------------------------------
> +int ipmi=5Fchassis=5Fpower=5Foff()
> +{
> + // sd=5Fbus error
> + int rc =3D 0;
> +
> +    // SD Bus error report mechanism.
> +    sd=5Fbus=5Ferror bus=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;
> +
> + // Response from the call. Although there is no response for this call,
> + // obligated to mention this to make compiler happy.
> + sd=5Fbus=5Fmessage *response =3D NULL;
> +
> + // Gets a hook onto either a SYSTEM or SESSION bus
> + sd=5Fbus *bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> +
> + rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype,         // On the System Bus
> + chassis=5Fbus=5Fname,        // Service to contact
> + chassis=5Fobject=5Fname,     // Object path
> + chassis=5Fintf=5Fname,       // Interface name
> + "powerOff",       // Method to be called
> + &bus=5Ferror,       // object to return error
> + &response, // Response buffer if any
> + NULL); // No input arguments
> + if(rc < 0)
> + {
> + fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.message);
> + }
> + else
> + {
> + printf("Chassis Power Off initiated successfully\n");
> + }
> +
> +    sd=5Fbus=5Ferror=5Ffree(&bus=5Ferror);
> +    sd=5Fbus=5Fmessage=5Funref(response);
> +
> + return rc;
> +}
> +
> +//----------------------------------------------------------------------
> +// Chassis Control commands
> +//----------------------------------------------------------------------
> +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fc=
md=5Ft cmd,
> +                        ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft =
response,
> +                        ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=
=5Ft context)
> +{
> + // Error from power off.
> + int rc =3D 0;
> +
> + // No response for this command.
> +    *data=5Flen =3D 0;
> +
> + // Catch the actual operaton by peeking into request buffer
> + uint8=5Ft chassis=5Fctrl=5Fcmd =3D *(uint8=5Ft *)request;
> + printf("Chassis Control Command: Operation:[0x%X]\n",chassis=5Fctrl=5Fc=
md);
> +
> + switch(chassis=5Fctrl=5Fcmd)
> + {
> + case CMD=5FPOWER=5FOFF:
> + case CMD=5FHARD=5FRESET:
> + {
> + rc =3D ipmi=5Fchassis=5Fpower=5Foff();
> + break;
> + }
> + default:
> + {
> + fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",cha=
ssis=5Fctrl=5Fcmd);
> + rc =3D -1;
> + }
> + }
> +
> + return ( (rc < 0) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);
> +}
> +
>  ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=
=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
>                                ipmi=5Frequest=5Ft request, ipmi=5Frespons=
e=5Ft response,
>                                ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fc=
ontext=5Ft context)
> @@ -58,5 +139,7 @@ void register=5Fnetfn=5Fchassis=5Ffunctions()
> =20
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IP=
MI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);
>      ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=
=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);
> -}
> =20
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IP=
MI=5FCMD=5FCHASSIS=5FCONTROL);
> +    ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5F=
CONTROL, NULL, ipmi=5Fchassis=5Fcontrol);
> +}
> diff --git a/chassishandler.h b/chassishandler.h
> index 99ed366..1a26411 100644
> --- a/chassishandler.h
> +++ b/chassishandler.h
> @@ -1,9 +1,13 @@
>  #ifndef =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F
>  #define =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F
> =20
> +#include <stdint.h>
> +
>  // IPMI commands for Chassis net functions.
>  enum ipmi=5Fnetfn=5Fapp=5Fcmds
>  {
> + // Chassis Control
> + IPMI=5FCMD=5FCHASSIS=5FCONTROL  =3D 0x02,
>      // Get capability bits
>      IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,
>  };
> @@ -14,4 +18,15 @@ enum ipmi=5Fchassis=5Freturn=5Fcodes
>      IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,
>  };
> =20
> +// Various Chassis operations under a single command.
> +enum ipmi=5Fchassis=5Fcontrol=5Fcmds : uint8=5Ft
> +{
> + CMD=5FPOWER=5FOFF   =3D 0x00,
> + CMD=5FPOWER=5FON   =3D 0x01,
> + CMD=5FPOWER=5FCYCLE   =3D 0x02,
> + CMD=5FHARD=5FRESET   =3D 0x03,
> + CMD=5FPULSE=5FDIAGNOSTIC=5FINTR  =3D 0x04,
> + CMD=5FSOFT=5FOFF=5FVIA=5FOVER=5FTEMP =3D 0x05,
> +};
> +
>  #endif
> diff --git a/host-services.c b/host-services.c
> new file mode 100644
> index 0000000..89f0b6c
> --- /dev/null
> +++ b/host-services.c
> @@ -0,0 +1,119 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <systemd/sd-bus.h>
> +
> +// OpenBMC Host IPMI dbus framework
> +const char  *bus=5Fname      =3D  "org.openbmc.HostIpmi";
> +const char  *object=5Fname   =3D  "/org/openbmc/HostIpmi/1";
> +const char  *intf=5Fname     =3D  "org.openbmc.HostIpmi";
> +
> +//-------------------------------------------------------------------
> +// Gets called by PowerOff handler when a Soft Power off is requested
> +//-------------------------------------------------------------------
> +static int soft=5Fpower=5Foff(sd=5Fbus=5Fmessage *m, void *userdata, sd=
=5Fbus=5Ferror *ret=5Ferror)
> +{
> + int64=5Ft bt=5Fresp =3D -1;
> + int rc =3D 0;
> +
> + // Steps to be taken when we get this.
> + // 1: Send a SMS=5FATN to the Host
> + // 2: Host receives it and sends a GetMsgFlags IPMI command
> + // 3: IPMID app handler will respond to that with a MSgFlag with bit:0x2
> + //   set indicating we have a message for Host
> + // 4: Host sends a GetMsgBuffer command and app handler will respond to
> + //   that with a OEM-SEL with certain fields packed indicating to the
> + //   host that it do a shutdown of the partitions. =20
> + // 5: Host does the partition shutdown and calls Chassis Power off comm=
and
> + // 6: App handler handles the command by making a call to ChassisManager
> + //   Dbus
> +
> + // Now the job is to send the SMS=5FATTN.
> +
> +    // Req message contains the specifics about which method etc that we=
 want to
> +    // access on which bus, object
> +    sd=5Fbus=5Fmessage *response =3D NULL;
> +
> + // Error return mechanism
> +    sd=5Fbus=5Ferror bus=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;
> +
> + // Gets a hook onto either a SYSTEM or SESSION bus
> + sd=5Fbus *bus =3D (sd=5Fbus *)ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> +
> + rc =3D sd=5Fbus=5Fcall=5Fmethod(bus,        // On the System Bus
> + bus=5Fname,        // Service to contact
> + object=5Fname,     // Object path
> + intf=5Fname,       // Interface name
> + "setAttention",  // Method to be called
> + &bus=5Ferror,      // object to return error
> + &response, // Response buffer if any
> + NULL); // No input arguments
> + if(rc < 0)
> + {
> + fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.message);
> + goto finish;
> + }
> +
> + // See if we were able to successfully raise SMS=5FATN
> +    rc =3D sd=5Fbus=5Fmessage=5Fread(response, "x", &bt=5Fresp);
> +    if (rc < 0)
> + {
> + fprintf(stderr, "Failed to get a rc from BT for SMS=5FATN: %s\n", strer=
ror(-rc));
> + goto finish;
> +    }
> +
> +finish:
> +    sd=5Fbus=5Ferror=5Ffree(&bus=5Ferror);
> +    sd=5Fbus=5Fmessage=5Funref(response);
> +
> + if(rc < 0)
> + {
> + return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "x", rc);
> + }
> + else
> + {
> + return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "x", bt=5Fresp);
> + }
> +}
> +
> +//-------------------------------------------
> +// Function pointer of APIs exposed via Dbus
> +//-------------------------------------------
> +static const sd=5Fbus=5Fvtable host=5Fservices=5Fvtable[] =3D
> +{
> + SD=5FBUS=5FVTABLE=5FSTART(0),
> + // Takes No("") arguments -but- returns a value of type 64 bit integer(=
"x")
> + SD=5FBUS=5FMETHOD("SoftPowerOff", "", "x", &soft=5Fpower=5Foff, SD=5FBU=
S=5FVTABLE=5FUNPRIVILEGED),
> + SD=5FBUS=5FVTABLE=5FEND,
> +};
> +
> +//------------------------------------------------------
> +// Called by IPMID as part of the start up
> +// -----------------------------------------------------
> +int start=5Fhost=5Fservice(sd=5Fbus *bus, sd=5Fbus=5Fslot *slot)
> +{
> + int rc =3D 0;
> +
> + /* Install the object */
> + rc =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,
> + &slot,
> + "/org/openbmc/HostServices",  /* object path */
> + "org.openbmc.HostServices",   /* interface name */
> + host=5Fservices=5Fvtable,
> + NULL);
> + if (rc < 0)
> + {
> + fprintf(stderr, "Failed to issue method call: %s\n", strerror(-rc));
> + }
> + else
> + {
> + /* Take one in OpenBmc */
> + rc =3D sd=5Fbus=5Frequest=5Fname(bus, "org.openbmc.HostServices", 0);
> + if (rc < 0)
> + {
> + fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
> + }
> + }
> +
> + return rc < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> +}
> diff --git a/host-services.h b/host-services.h
> new file mode 100644
> index 0000000..0d93480
> --- /dev/null
> +++ b/host-services.h
> @@ -0,0 +1,3 @@
> +#include <systemd/sd-bus.h>
> +
> +extern "C" int start=5Fhost=5Fservice(sd=5Fbus *, sd=5Fbus=5Fslot *);
> diff --git a/ipmid-api.h b/ipmid-api.h
> index 34d3bbe..952dd3f 100644
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -53,7 +53,7 @@ typedef ipmi=5Fret=5Ft (*ipmid=5Fcallback=5Ft)(ipmi=5Fn=
etfn=5Ft, ipmi=5Fcmd=5Ft, ipmi=5Frequest=5Ft,
>  // information of netfn, cmd, callback handler pointer and context data.
>  // Making this a extern "C" so that plugin libraries written in C can al=
so use
>  // it.
> -extern "C" void ipmi=5Fregister=5Fcallback(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=
=5Ft,
> +extern "C" void ipmi=5Fregister=5Fcallback(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=
=5Ft,
>                                         ipmi=5Fcontext=5Ft, ipmid=5Fcallb=
ack=5Ft);
> =20
>  // These are the command network functions, the response
> @@ -94,5 +94,5 @@ enum ipmi=5Freturn=5Fcodes
>      IPMI=5FCC=5FUNSPECIFIED=5FERROR =3D 0xFF,
>  };
> =20
> -sd=5Fbus *ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void);
> +extern "C" sd=5Fbus* ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void);
>  #endif
> diff --git a/ipmid.C b/ipmid.C
> index 6b1eacc..440705c 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -40,7 +40,6 @@ typedef std::pair<ipmid=5Fcallback=5Ft, ipmi=5Fcontext=
=5Ft> ipmi=5Ffn=5Fcontext=5Ft;
>  std::map<ipmi=5Ffn=5Fcmd=5Ft, ipmi=5Ffn=5Fcontext=5Ft> g=5Fipmid=5Froute=
r=5Fmap;
> =20
> =20
> -
>  #ifndef HEXDUMP=5FCOLS
>  #define HEXDUMP=5FCOLS 16
>  #endif
> @@ -418,6 +417,10 @@ int main(int argc, char *argv[])
>      // Register all the handlers that provider implementation to IPMI co=
mmands.
>      ipmi=5Fregister=5Fcallback=5Fhandlers(HOST=5FIPMI=5FLIB=5FPATH);
> =20
> + // Start the Host Services Dbus Objects
> + start=5Fhost=5Fservice(bus, slot);
> +
> + // Watch for BT messages
>      r =3D sd=5Fbus=5Fadd=5Fmatch(bus, &slot, FILTER, handle=5Fipmi=5Fcom=
mand, NULL);
>      if (r < 0) {
>          fprintf(stderr, "Failed: sd=5Fbus=5Fadd=5Fmatch: %s : %s\n", str=
error(-r), FILTER);
> @@ -427,7 +430,6 @@ int main(int argc, char *argv[])
> =20
>      for (;;) {
>          /* Process requests */
> -
>          r =3D sd=5Fbus=5Fprocess(bus, NULL);
>          if (r < 0) {
>              fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> diff --git a/ipmid.H b/ipmid.H
> index 73b60e6..3de2c8c 100644
> --- a/ipmid.H
> +++ b/ipmid.H
> @@ -2,6 +2,7 @@
>  #define =5F=5FHOST=5FIPMID=5FIPMI=5FH=5F=5F
>  #include "ipmid-api.h"
>  #include <stdio.h>
> +#include "host-services.h"
> =20
>  // When the requester sends in a netfn and a command along with data, th=
is
>  // function will look for registered handlers that will handle that [net=
fn,cmd]
> --
> 2.6.3
>=20
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20


--Apple-Mail-88C4A7DC-862C-4CA2-B1DC-BA4E0468CBC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto"><div>Softpoweroff is a method on chassi=
s0. &nbsp;What dbus obj are u talking about?<br><br>Sent from my iPhone</di=
v><div><br>On Nov 21, 2015, at 12:43 PM, Chris Austen &lt;<a href=3D"mailto=
:austenc@us.ibm.com">austenc@us.ibm.com</a>&gt; wrote:<br><br></div><blockq=
uote type=3D"cite"><div><div class=3D"socmaildefaultfont" dir=3D"ltr" style=
=3D"font-family:Arial;font-size:10.5pt"><div dir=3D"ltr">what makes SoftPow=
erOff different enough to have its own dbus object?&nbsp; Shouldn't the sof=
t power off simple be another method in the /or/openbmc/chassis/chassis0 in=
terface?
<div>&nbsp;</div><div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div><div>&nbsp;</div><blockquote data-history-content-modified=
=3D"1" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; padding-lef=
t:5px; direction:ltr; margin-right:0px">----- Original message -----<br>Fro=
m: OpenBMC Patches &lt;<a href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc=
-patches@stwcx.xyz</a>&gt;<br>Sent by: "openbmc" &lt;<a href=3D"mailto:open=
bmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org">openbmc-bounces+austenc=
=3Dus.ibm.com@lists.ozlabs.org</a>&gt;<br>To: <a href=3D"mailto:openbmc@lis=
ts.ozlabs.org">openbmc@lists.ozlabs.org</a><br>Cc:<br>Subject: [PATCH phosp=
hor-host-ipmid v2] IPMI soft power off<br>Date: Sat, Nov 21, 2015 12:10 PM<=
br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce">From: vishwa &lt;<a href=3D"mailto:vishwanath@in.ibm.com">vishwanath@in=
.ibm.com</a>&gt;<br><br>---<br>&nbsp;Makefile &nbsp; &nbsp; &nbsp; &nbsp; |=
 &nbsp; 5 +--<br>&nbsp;apphandler.C &nbsp; &nbsp; | &nbsp;67 ++++++++++++++=
+++++++++++++++--<br>&nbsp;apphandler.h &nbsp; &nbsp; | &nbsp;33 ++++++++++=
++++-<br>&nbsp;chassishandler.C | &nbsp;85 ++++++++++++++++++++++++++++++++=
++++++-<br>&nbsp;chassishandler.h | &nbsp;15 +++++++<br>&nbsp;host-services=
.c &nbsp;| 119 +++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>&=
nbsp;host-services.h &nbsp;| &nbsp; 3 ++<br>&nbsp;ipmid-api.h &nbsp; &nbsp;=
 &nbsp;| &nbsp; 4 +-<br>&nbsp;ipmid.C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 6 ++-<br>&nbsp;ipmid.H &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 1 +=
<br>&nbsp;10 files changed, 325 insertions(+), 13 deletions(-)<br>&nbsp;cre=
ate mode 100644 host-services.c<br>&nbsp;create mode 100644 host-services.h=
<br><br>diff --git a/Makefile b/Makefile<br>index 1a37c0f..1851c9f 100644<b=
r>--- a/Makefile<br>+++ b/Makefile<br>@@ -5,8 +5,7 @@ TESTER =3D testit<br>=
&nbsp;TESTADDSEL =3D testaddsel<br>&nbsp;<br>&nbsp;DAEMON =3D ipmid<br>-DAE=
MON=5FOBJ &nbsp;=3D $(DAEMON).o<br>-<br>+DAEMON=5FOBJ &nbsp;=3D ipmid.o hos=
t-services.o<br>&nbsp;<br>&nbsp;LIB=5FAPP=5FOBJ =3D apphandler.o &nbsp; &nb=
sp; \<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sensorhandl=
er.o &nbsp;\<br>@@ -28,7 +27,7 @@ LIB=5FAPP &nbsp; &nbsp; =3D libapphandler=
.so<br>&nbsp;INSTALLED=5FLIBS +=3D $(LIB=5FAPP)<br>&nbsp;INSTALLED=5FHEADER=
S =3D ipmid-api.h<br>&nbsp;<br>-INC=5FFLAG +=3D $(shell pkg-config --cflags=
 --libs libsystemd) -I. -O2<br>+INC=5FFLAG +=3D $(shell pkg-config --cflags=
 --libs libsystemd) -I. -O2<br>&nbsp;LIB=5FFLAG +=3D $(shell pkg-config &nb=
sp;--libs libsystemd) -rdynamic<br>&nbsp;IPMID=5FPATH ?=3D -DHOST=5FIPMI=5F=
LIB=5FPATH=3D\"/usr/lib/host-ipmid/\"<br>&nbsp;<br>diff --git a/apphandler.=
C b/apphandler.C<br>index 6467397..d3df330 100644<br>--- a/apphandler.C<br>=
+++ b/apphandler.C<br>@@ -10,19 +10,75 @@ extern sd=5Fbus *bus;<br>&nbsp;<b=
r>&nbsp;void register=5Fnetfn=5Fapp=5Ffunctions() =5F=5Fattribute=5F=5F((co=
nstructor));<br>&nbsp;<br>+//----------------------------------------------=
-----------------------<br>+// Called by Host on seeing a SMS=5FATN bit set=
. Return a hardcoded<br>+// value of 0x2 indicating we need Host read some =
data.<br>+//---------------------------------------------------------------=
----<br>+ipmi=5Fret=5Ft ipmi=5Fapp=5Fget=5Fmsg=5Fflags(ipmi=5Fnetfn=5Ft net=
fn, ipmi=5Fcmd=5Ft cmd,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Frequest=5Ft requ=
est, ipmi=5Fresponse=5Ft response,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=
=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>+{<br>+ // Generic re=
turn from IPMI commands.<br>+ &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=
=5FOK;<br>+<br>+ &nbsp; &nbsp;printf("IPMI APP GET MSG FLAGS returning with=
 [bit:2] set\n");<br>+<br>+ // From IPMI spec V2.0 for Get Message Flags Co=
mmand :<br>+ // bit:[1] from LSB : 1b =3D Event Message Buffer Full.<br>+ /=
/ Return as 0 if Event Message Buffer is not supported,<br>+ // or when the=
 Event Message buffer is disabled.<br>+ // TODO. For now. assume its not di=
sabled and send "0x2" anyway:<br>+<br>+ uint8=5Ft set=5Fevent=5Fmsg=5Fbuffe=
r=5Ffull =3D 0x2;<br>+ &nbsp; &nbsp;*data=5Flen =3D sizeof(set=5Fevent=5Fms=
g=5Fbuffer=5Ffull);<br>+<br>+ &nbsp; &nbsp;// Pack the actual response<br>+=
 &nbsp; &nbsp;memcpy(response, &amp;set=5Fevent=5Fmsg=5Fbuffer=5Ffull, *dat=
a=5Flen);<br>+<br>+ &nbsp; &nbsp;return rc;<br>+}<br>&nbsp;<br>+//---------=
----------------------------------------------------------<br>+// Called by=
 Host post response from Get=5FMessage=5FFlags<br>+//----------------------=
---------------------------------------------<br>&nbsp;ipmi=5Fret=5Ft ipmi=
=5Fapp=5Fread=5Fevent(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&nbsp;=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5F=
t response,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft dat=
a=5Flen, ipmi=5Fcontext=5Ft context)<br>&nbsp;{<br>&nbsp;&nbsp; &nbsp; ipmi=
=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>- &nbsp; &nbsp;*data=5Flen =3D 0;<br>+=
 &nbsp; &nbsp;printf("IPMI APP READ EVENT command received\n");<br>&nbsp;<b=
r>- &nbsp; &nbsp;printf("IPMI APP READ EVENT Ignoring for now\n");<br>- &nb=
sp; &nbsp;return rc;<br>+ // TODO : For now, this is catering only to the S=
oft Power Off via OEM SEL<br>+ // &nbsp; &nbsp; &nbsp; &nbsp;mechanism. If =
we need to make this generically used for some<br>+ // &nbsp; &nbsp; &nbsp;=
 &nbsp;other conditions, then we can take advantage of context pointer.<br>=
&nbsp;<br>-}<br>+ struct oem=5Fsel=5Ftimestamped soft=5Foff =3D {0};<br>+ &=
nbsp; &nbsp;*data=5Flen =3D sizeof(struct oem=5Fsel=5Ftimestamped);<br>+<br=
>+ // either id[0] -or- id[1] can be filled in. We will use id[0]<br>+ soft=
=5Foff.id[0] =3D SEL=5FOEM=5FID=5F0;<br>+ soft=5Foff.id[1] =3D SEL=5FOEM=5F=
ID=5F0;<br>+ soft=5Foff.type =3D SEL=5FRECORD=5FTYPE=5FOEM;<br>+<br>+ // Fo=
llowing 3 bytes are from IANA Manufactre=5FId field. See below<br>+ soft=5F=
off.manuf=5Fid[0]=3D 0x41;<br>+ soft=5Foff.manuf=5Fid[1]=3D 0xA7;<br>+ soft=
=5Foff.manuf=5Fid[2]=3D 0x00;<br>+<br>+ // per IPMI spec NetFuntion for OEM=
<br>+ soft=5Foff.netfun =3D 0x3A;<br>&nbsp;<br>+ // Mechanism to kick start=
 soft shutdown.<br>+ soft=5Foff.cmd =3D CMD=5FPOWER;<br>+ soft=5Foff.data[0=
] =3D SOFT=5FOFF;<br>+<br>+ // All '0xFF' since unused.<br>+ memset(&amp;so=
ft=5Foff.data[1], 0xFF, 3);<br>+<br>+ &nbsp; &nbsp;// Pack the actual respo=
nse<br>+ &nbsp; &nbsp;memcpy(response, &amp;soft=5Foff, *data=5Flen);<br>+ =
&nbsp; &nbsp;return rc;<br>+}<br>&nbsp;<br>&nbsp;ipmi=5Fret=5Ft ipmi=5Fapp=
=5Fset=5Facpi=5Fpower=5Fstate(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fres=
ponse=5Ft response,<br>@@ -359,6 +415,9 @@ void register=5Fnetfn=5Fapp=5Ffu=
nctions()<br>&nbsp;&nbsp; &nbsp; ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, I=
PMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES, NULL,<br>&nbsp;&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fapp=5Fs=
et=5Fbmc=5Fglobal=5Fenables);<br>&nbsp;<br>+ &nbsp; &nbsp;printf("Registeri=
ng NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP, IPMI=5FCMD=5FGET=5FMSG=5FFLAGS=
);<br>+ &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5F=
GET=5FMSG=5FFLAGS, NULL, ipmi=5Fapp=5Fget=5Fmsg=5Fflags);<br>+<br>&nbsp;&nb=
sp; &nbsp; return;<br>&nbsp;}<br>&nbsp;<br>diff --git a/apphandler.h b/apph=
andler.h<br>index 35a2b20..aa2a55d 100644<br>--- a/apphandler.h<br>+++ b/ap=
phandler.h<br>@@ -1,6 +1,19 @@<br>&nbsp;#ifndef =5F=5FHOST=5FIPMI=5FAPP=5FH=
ANDLER=5FH=5F=5F<br>&nbsp;#define =5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=
=5F<br>&nbsp;<br>+#include &lt;stdint.h&gt;<br>+<br>+// These are per skibo=
ot ipmi-sel code<br>+<br>+// OEM=5FSEL type with Timestamp<br>+#define SEL=
=5FOEM=5FID=5F0 0x55<br>+// SEL type is OEM and -not- general SEL<br>+#defi=
ne SEL=5FRECORD=5FTYPE=5FOEM 0xC0<br>+// Minor command for soft shurdown<br=
>+#define SOFT=5FOFF 0x00<br>+// Major command for Any kind of power ops<br=
>+#define CMD=5FPOWER 0x04<br>+<br>&nbsp;// IPMI commands for App net funct=
ions.<br>&nbsp;enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>&nbsp;{<br>@@ -11,9 +24,27=
 @@ enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>&nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FRESE=
T=5FWD &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x22,<br>&nbsp;=
&nbsp; &nbsp; IPMI=5FCMD=5FSET=5FWD &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; =3D 0x24,<br>&nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FSET=5FBMC=5F=
GLOBAL=5FENABLES =3D 0x2E,<br>+ &nbsp; &nbsp;IPMI=5FCMD=5FGET=5FMSG=5FFLAGS=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x31,<br>&nbsp;&nbsp; &nbsp; IPMI=5F=
CMD=5FREAD=5FEVENT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x35,<br>&=
nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FGET=5FCAP=5FBIT &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D 0x36,<br>-<br>&nbsp;};<br>&nbsp;<br>+// A Mechanism to te=
ll host to shtudown hosts by sending this PEM SEL. Really<br>+// the only u=
sed fields by skiboot are:<br>+// id[0] / id[1] for ID=5F0 , ID=5F1<br>+// =
type : SEL=5FRECORD=5FTYPE=5FOEM as standard SELs are ignored by skiboot<br=
>+// cmd : CMD=5FPOWER for power functions<br>+// data[0], specific command=
s. &nbsp;example Soft power off. power cycle, etc.<br>+struct oem=5Fsel=5Ft=
imestamped<br>+{<br>+ /* SEL header */<br>+ uint8=5Ft id[2];<br>+ uint8=5Ft=
 type;<br>+ uint8=5Ft manuf=5Fid[3];<br>+ uint8=5Ft timestamp[4];<br>+ /* O=
EM SEL data (6 bytes) follows */<br>+ uint8=5Ft netfun;<br>+ uint8=5Ft cmd;=
<br>+ uint8=5Ft data[4];<br>+};<br>&nbsp;#endif<br>diff --git a/chassishand=
ler.C b/chassishandler.C<br>index d00a124..56b8375 100644<br>--- a/chassish=
andler.C<br>+++ b/chassishandler.C<br>@@ -4,6 +4,11 @@<br>&nbsp;#include &l=
t;string.h&gt;<br>&nbsp;#include &lt;stdint.h&gt;<br>&nbsp;<br>+// OpenBMC =
Chassis Manager dbus framework<br>+const char &nbsp;*chassis=5Fbus=5Fname &=
nbsp; &nbsp; &nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<br>+const char =
&nbsp;*chassis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/openbmc/control/chass=
is0";<br>+const char &nbsp;*chassis=5Fintf=5Fname &nbsp; &nbsp; =3D &nbsp;"=
org.openbmc.control.Chassis";<br>+<br>&nbsp;void register=5Fnetfn=5Fchassis=
=5Ffunctions() =5F=5Fattribute=5F=5F((constructor));<br>&nbsp;<br>&nbsp;str=
uct get=5Fsys=5Fboot=5Foptions=5Ft {<br>@@ -23,6 +28,82 @@ ipmi=5Fret=5Ft i=
pmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&nb=
sp;&nbsp; &nbsp; return rc;<br>&nbsp;}<br>&nbsp;<br>+//--------------------=
----------------------------------------<br>+// Calls into Chassis Control =
Dbus object to do the power off<br>+//-------------------------------------=
-----------------------<br>+int ipmi=5Fchassis=5Fpower=5Foff()<br>+{<br>+ /=
/ sd=5Fbus error<br>+ int rc =3D 0;<br>+<br>+ &nbsp; &nbsp;// SD Bus error =
report mechanism.<br>+ &nbsp; &nbsp;sd=5Fbus=5Ferror bus=5Ferror =3D SD=5FB=
US=5FERROR=5FNULL;<br>+<br>+ // Response from the call. Although there is n=
o response for this call,<br>+ // obligated to mention this to make compile=
r happy.<br>+ sd=5Fbus=5Fmessage *response =3D NULL;<br>+<br>+ // Gets a ho=
ok onto either a SYSTEM or SESSION bus<br>+ sd=5Fbus *bus=5Ftype =3D ipmid=
=5Fget=5Fsd=5Fbus=5Fconnection();<br>+<br>+ rc =3D sd=5Fbus=5Fcall=5Fmethod=
(bus=5Ftype, &nbsp; &nbsp; &nbsp; &nbsp; // On the System Bus<br>+ chassis=
=5Fbus=5Fname, &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>+ chassi=
s=5Fobject=5Fname, &nbsp; &nbsp; // Object path<br>+ chassis=5Fintf=5Fname,=
 &nbsp; &nbsp; &nbsp; // Interface name<br>+ "powerOff", &nbsp; &nbsp; &nbs=
p; // Method to be called<br>+ &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; // ob=
ject to return error<br>+ &amp;response, // Response buffer if any<br>+ NUL=
L); // No input arguments<br>+ if(rc &lt; 0)<br>+ {<br>+ fprintf(stderr,"ER=
ROR initiating Power Off:[%s]\n",bus=5Ferror.message);<br>+ }<br>+ else<br>=
+ {<br>+ printf("Chassis Power Off initiated successfully\n");<br>+ }<br>+<=
br>+ &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>+ &nbsp; &n=
bsp;sd=5Fbus=5Fmessage=5Funref(response);<br>+<br>+ return rc;<br>+}<br>+<b=
r>+//----------------------------------------------------------------------=
<br>+// Chassis Control commands<br>+//------------------------------------=
----------------------------------<br>+ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcont=
rol(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=
=5Ft request, ipmi=5Fresponse=5Ft response,<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=
=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>+{<br>+ // Error from power=
 off.<br>+ int rc =3D 0;<br>+<br>+ // No response for this command.<br>+ &n=
bsp; &nbsp;*data=5Flen =3D 0;<br>+<br>+ // Catch the actual operaton by pee=
king into request buffer<br>+ uint8=5Ft chassis=5Fctrl=5Fcmd =3D *(uint8=5F=
t *)request;<br>+ printf("Chassis Control Command: Operation:[0x%X]\n",chas=
sis=5Fctrl=5Fcmd);<br>+<br>+ switch(chassis=5Fctrl=5Fcmd)<br>+ {<br>+ case =
CMD=5FPOWER=5FOFF:<br>+ case CMD=5FHARD=5FRESET:<br>+ {<br>+ rc =3D ipmi=5F=
chassis=5Fpower=5Foff();<br>+ break;<br>+ }<br>+ default:<br>+ {<br>+ fprin=
tf(stderr, "Invalid Chassis Control command:[0x%X] received\n",chassis=5Fct=
rl=5Fcmd);<br>+ rc =3D -1;<br>+ }<br>+ }<br>+<br>+ return ( (rc &lt; 0) ? I=
PMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<br>+}<br>+<br>&nbsp;ipmi=5Fret=5Ft ip=
mi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcm=
d=5Ft cmd,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Frequest=5Ft reques=
t, ipmi=5Fresponse=5Ft response,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipm=
i=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>@@ -58,5 +139=
,7 @@ void register=5Fnetfn=5Fchassis=5Ffunctions()<br>&nbsp;<br>&nbsp;&nbs=
p; &nbsp; printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS,=
 IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&nbsp;&nbsp; &nbsp; ipmi=5Fre=
gister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS=
, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);<br>-}<br>&nbsp;<br>+ =
&nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASS=
IS, IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>+ &nbsp; &nbsp;ipmi=5Fregister=5Fca=
llback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchass=
is=5Fcontrol);<br>+}<br>diff --git a/chassishandler.h b/chassishandler.h<br=
>index 99ed366..1a26411 100644<br>--- a/chassishandler.h<br>+++ b/chassisha=
ndler.h<br>@@ -1,9 +1,13 @@<br>&nbsp;#ifndef =5F=5FHOST=5FIPMI=5FCHASSIS=5F=
HANDLER=5FH=5F=5F<br>&nbsp;#define =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5F=
H=5F=5F<br>&nbsp;<br>+#include &lt;stdint.h&gt;<br>+<br>&nbsp;// IPMI comma=
nds for Chassis net functions.<br>&nbsp;enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>&=
nbsp;{<br>+ // Chassis Control<br>+ IPMI=5FCMD=5FCHASSIS=5FCONTROL &nbsp;=
=3D 0x02,<br>&nbsp;&nbsp; &nbsp; // Get capability bits<br>&nbsp;&nbsp; &nb=
sp; IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,<br>&nbsp;};<br>@@ -14=
,4 +18,15 @@ enum ipmi=5Fchassis=5Freturn=5Fcodes<br>&nbsp;&nbsp; &nbsp; IP=
MI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,<br>&nbsp;};<br>&nbsp;<br>+// Var=
ious Chassis operations under a single command.<br>+enum ipmi=5Fchassis=5Fc=
ontrol=5Fcmds : uint8=5Ft<br>+{<br>+ CMD=5FPOWER=5FOFF &nbsp; =3D 0x00,<br>=
+ CMD=5FPOWER=5FON &nbsp; =3D 0x01,<br>+ CMD=5FPOWER=5FCYCLE &nbsp; =3D 0x0=
2,<br>+ CMD=5FHARD=5FRESET &nbsp; =3D 0x03,<br>+ CMD=5FPULSE=5FDIAGNOSTIC=
=5FINTR &nbsp;=3D 0x04,<br>+ CMD=5FSOFT=5FOFF=5FVIA=5FOVER=5FTEMP =3D 0x05,=
<br>+};<br>+<br>&nbsp;#endif<br>diff --git a/host-services.c b/host-service=
s.c<br>new file mode 100644<br>index 0000000..89f0b6c<br>--- /dev/null<br>+=
++ b/host-services.c<br>@@ -0,0 +1,119 @@<br>+#include &lt;stdio.h&gt;<br>+=
#include &lt;stdlib.h&gt;<br>+#include &lt;errno.h&gt;<br>+#include &lt;sys=
temd/sd-bus.h&gt;<br>+<br>+// OpenBMC Host IPMI dbus framework<br>+const ch=
ar &nbsp;*bus=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.openbmc.HostIpmi";<=
br>+const char &nbsp;*object=5Fname &nbsp; =3D &nbsp;"/org/openbmc/HostIpmi=
/1";<br>+const char &nbsp;*intf=5Fname &nbsp; &nbsp; =3D &nbsp;"org.openbmc=
.HostIpmi";<br>+<br>+//----------------------------------------------------=
---------------<br>+// Gets called by PowerOff handler when a Soft Power of=
f is requested<br>+//------------------------------------------------------=
-------------<br>+static int soft=5Fpower=5Foff(sd=5Fbus=5Fmessage *m, void=
 *userdata, sd=5Fbus=5Ferror *ret=5Ferror)<br>+{<br>+ int64=5Ft bt=5Fresp =
=3D -1;<br>+ int rc =3D 0;<br>+<br>+ // Steps to be taken when we get this.=
<br>+ // 1: Send a SMS=5FATN to the Host<br>+ // 2: Host receives it and se=
nds a GetMsgFlags IPMI command<br>+ // 3: IPMID app handler will respond to=
 that with a MSgFlag with bit:0x2<br>+ // &nbsp; set indicating we have a m=
essage for Host<br>+ // 4: Host sends a GetMsgBuffer command and app handle=
r will respond to<br>+ // &nbsp; that with a OEM-SEL with certain fields pa=
cked indicating to the<br>+ // &nbsp; host that it do a shutdown of the par=
titions. &nbsp;<br>+ // 5: Host does the partition shutdown and calls Chass=
is Power off command<br>+ // 6: App handler handles the command by making a=
 call to ChassisManager<br>+ // &nbsp; Dbus<br>+<br>+ // Now the job is to =
send the SMS=5FATTN.<br>+<br>+ &nbsp; &nbsp;// Req message contains the spe=
cifics about which method etc that we want to<br>+ &nbsp; &nbsp;// access o=
n which bus, object<br>+ &nbsp; &nbsp;sd=5Fbus=5Fmessage *response =3D NULL=
;<br>+<br>+ // Error return mechanism<br>+ &nbsp; &nbsp;sd=5Fbus=5Ferror bu=
s=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;<br>+<br>+ // Gets a hook onto either=
 a SYSTEM or SESSION bus<br>+ sd=5Fbus *bus =3D (sd=5Fbus *)ipmid=5Fget=5Fs=
d=5Fbus=5Fconnection();<br>+<br>+ rc =3D sd=5Fbus=5Fcall=5Fmethod(bus, &nbs=
p; &nbsp; &nbsp; &nbsp;// On the System Bus<br>+ bus=5Fname, &nbsp; &nbsp; =
&nbsp; &nbsp;// Service to contact<br>+ object=5Fname, &nbsp; &nbsp; // Obj=
ect path<br>+ intf=5Fname, &nbsp; &nbsp; &nbsp; // Interface name<br>+ "set=
Attention", &nbsp;// Method to be called<br>+ &amp;bus=5Ferror, &nbsp; &nbs=
p; &nbsp;// object to return error<br>+ &amp;response, // Response buffer i=
f any<br>+ NULL); // No input arguments<br>+ if(rc &lt; 0)<br>+ {<br>+ fpri=
ntf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.message);<br>+ g=
oto finish;<br>+ }<br>+<br>+ // See if we were able to successfully raise S=
MS=5FATN<br>+ &nbsp; &nbsp;rc =3D sd=5Fbus=5Fmessage=5Fread(response, "x", =
&amp;bt=5Fresp);<br>+ &nbsp; &nbsp;if (rc &lt; 0)<br>+ {<br>+ fprintf(stder=
r, "Failed to get a rc from BT for SMS=5FATN: %s\n", strerror(-rc));<br>+ g=
oto finish;<br>+ &nbsp; &nbsp;}<br>+<br>+finish:<br>+ &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Ffree(&amp;bus=5Ferror);<br>+ &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Fu=
nref(response);<br>+<br>+ if(rc &lt; 0)<br>+ {<br>+ return sd=5Fbus=5Freply=
=5Fmethod=5Freturn(m, "x", rc);<br>+ }<br>+ else<br>+ {<br>+ return sd=5Fbu=
s=5Freply=5Fmethod=5Freturn(m, "x", bt=5Fresp);<br>+ }<br>+}<br>+<br>+//---=
----------------------------------------<br>+// Function pointer of APIs ex=
posed via Dbus<br>+//-------------------------------------------<br>+static=
 const sd=5Fbus=5Fvtable host=5Fservices=5Fvtable[] =3D<br>+{<br>+ SD=5FBUS=
=5FVTABLE=5FSTART(0),<br>+ // Takes No("") arguments -but- returns a value =
of type 64 bit integer("x")<br>+ SD=5FBUS=5FMETHOD("SoftPowerOff", "", "x",=
 &amp;soft=5Fpower=5Foff, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),<br>+ SD=5FBUS=
=5FVTABLE=5FEND,<br>+};<br>+<br>+//----------------------------------------=
--------------<br>+// Called by IPMID as part of the start up<br>+// ------=
-----------------------------------------------<br>+int start=5Fhost=5Fserv=
ice(sd=5Fbus *bus, sd=5Fbus=5Fslot *slot)<br>+{<br>+ int rc =3D 0;<br>+<br>=
+ /* Install the object */<br>+ rc =3D sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus=
,<br>+ &amp;slot,<br>+ "/org/openbmc/HostServices", &nbsp;/* object path */=
<br>+ "org.openbmc.HostServices", &nbsp; /* interface name */<br>+ host=5Fs=
ervices=5Fvtable,<br>+ NULL);<br>+ if (rc &lt; 0)<br>+ {<br>+ fprintf(stder=
r, "Failed to issue method call: %s\n", strerror(-rc));<br>+ }<br>+ else<br=
>+ {<br>+ /* Take one in OpenBmc */<br>+ rc =3D sd=5Fbus=5Frequest=5Fname(b=
us, "org.openbmc.HostServices", 0);<br>+ if (rc &lt; 0)<br>+ {<br>+ fprintf=
(stderr, "Failed to acquire service name: %s\n", strerror(-rc));<br>+ }<br>=
+ }<br>+<br>+ return rc &lt; 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;<br>+}<br>=
diff --git a/host-services.h b/host-services.h<br>new file mode 100644<br>i=
ndex 0000000..0d93480<br>--- /dev/null<br>+++ b/host-services.h<br>@@ -0,0 =
+1,3 @@<br>+#include &lt;systemd/sd-bus.h&gt;<br>+<br>+extern "C" int start=
=5Fhost=5Fservice(sd=5Fbus *, sd=5Fbus=5Fslot *);<br>diff --git a/ipmid-api=
.h b/ipmid-api.h<br>index 34d3bbe..952dd3f 100644<br>--- a/ipmid-api.h<br>+=
++ b/ipmid-api.h<br>@@ -53,7 +53,7 @@ typedef ipmi=5Fret=5Ft (*ipmid=5Fcall=
back=5Ft)(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=5Ft, ipmi=5Frequest=5Ft,<br>&nbsp;//=
 information of netfn, cmd, callback handler pointer and context data.<br>&=
nbsp;// Making this a extern "C" so that plugin libraries written in C can =
also use<br>&nbsp;// it.<br>-extern "C" void ipmi=5Fregister=5Fcallback(ipm=
i=5Fnetfn=5Ft, ipmi=5Fcmd=5Ft,<br>+extern "C" void ipmi=5Fregister=5Fcallba=
ck(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=5Ft,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fcontext=5Ft, ipmid=5Fcallback=5Ft=
);<br>&nbsp;<br>&nbsp;// These are the command network functions, the respo=
nse<br>@@ -94,5 +94,5 @@ enum ipmi=5Freturn=5Fcodes<br>&nbsp;&nbsp; &nbsp; =
IPMI=5FCC=5FUNSPECIFIED=5FERROR =3D 0xFF,<br>&nbsp;};<br>&nbsp;<br>-sd=5Fbu=
s *ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void);<br>+extern "C" sd=5Fbus* ipmi=
d=5Fget=5Fsd=5Fbus=5Fconnection(void);<br>&nbsp;#endif<br>diff --git a/ipmi=
d.C b/ipmid.C<br>index 6b1eacc..440705c 100644<br>--- a/ipmid.C<br>+++ b/ip=
mid.C<br>@@ -40,7 +40,6 @@ typedef std::pair&lt;ipmid=5Fcallback=5Ft, ipmi=
=5Fcontext=5Ft&gt; ipmi=5Ffn=5Fcontext=5Ft;<br>&nbsp;std::map&lt;ipmi=5Ffn=
=5Fcmd=5Ft, ipmi=5Ffn=5Fcontext=5Ft&gt; g=5Fipmid=5Frouter=5Fmap;<br>&nbsp;=
<br>&nbsp;<br>-<br>&nbsp;#ifndef HEXDUMP=5FCOLS<br>&nbsp;#define HEXDUMP=5F=
COLS 16<br>&nbsp;#endif<br>@@ -418,6 +417,10 @@ int main(int argc, char *ar=
gv[])<br>&nbsp;&nbsp; &nbsp; // Register all the handlers that provider imp=
lementation to IPMI commands.<br>&nbsp;&nbsp; &nbsp; ipmi=5Fregister=5Fcall=
back=5Fhandlers(HOST=5FIPMI=5FLIB=5FPATH);<br>&nbsp;<br>+ // Start the Host=
 Services Dbus Objects<br>+ start=5Fhost=5Fservice(bus, slot);<br>+<br>+ //=
 Watch for BT messages<br>&nbsp;&nbsp; &nbsp; r =3D sd=5Fbus=5Fadd=5Fmatch(=
bus, &amp;slot, FILTER, handle=5Fipmi=5Fcommand, NULL);<br>&nbsp;&nbsp; &nb=
sp; if (r &lt; 0) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr, "F=
ailed: sd=5Fbus=5Fadd=5Fmatch: %s : %s\n", strerror(-r), FILTER);<br>@@ -42=
7,7 +430,6 @@ int main(int argc, char *argv[])<br>&nbsp;<br>&nbsp;&nbsp; &n=
bsp; for (;;) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; /* Process requests */=
<br>-<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; r =3D sd=5Fbus=5Fprocess(bus, NU=
LL);<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; if (r &lt; 0) {<br>&nbsp;&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr, "Failed to process bus: %=
s\n", strerror(-r));<br>diff --git a/ipmid.H b/ipmid.H<br>index 73b60e6..3d=
e2c8c 100644<br>--- a/ipmid.H<br>+++ b/ipmid.H<br>@@ -2,6 +2,7 @@<br>&nbsp;=
#define =5F=5FHOST=5FIPMID=5FIPMI=5FH=5F=5F<br>&nbsp;#include "ipmid-api.h"=
<br>&nbsp;#include &lt;stdio.h&gt;<br>+#include "host-services.h"<br>&nbsp;=
<br>&nbsp;// When the requester sends in a netfn and a command along with d=
ata, this<br>&nbsp;// function will look for registered handlers that will =
handle that [netfn,cmd]<br>--<br>2.6.3<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br><a hr=
ef=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br><a h=
ref=3D"https://lists.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank">https=
://lists.ozlabs.org/listinfo/openbmc</a></font></div></blockquote></div></d=
iv></div></div><br>
<pre>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><a =
href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org=
/listinfo/openbmc</a></pre><br></div></blockquote><BR>
</body></html>

--Apple-Mail-88C4A7DC-862C-4CA2-B1DC-BA4E0468CBC0--
