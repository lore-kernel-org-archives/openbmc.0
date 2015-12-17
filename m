Return-Path: <austenc@us.ibm.com>
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F3CE1A119F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:01:26 +1100 (AEDT)
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 16 Dec 2015 23:01:24 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 23:01:22 -0500
X-IBM-Helo: b01cxnp23033.gho.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBH41MoP30081162
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 04:01:22 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBH41KHO017652
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 23:01:20 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBH41I0o017374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 23:01:18 -0500
Message-Id: <201512170401.tBH41I0o017374@d01av01.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 16 Dec 2015 21:01:17 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 16 Dec 2015 21:01:14 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 17 Dec 2015 04:01:14 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Dec 2015 04:01:10 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015121704010951-23061 ;
 Thu, 17 Dec 2015 04:01:09 +0000 
To: "Stewart Smith" <stewart@linux.vnet.ibm.com>
In-Reply-To: <87twni5aqw.fsf@birb.au.ibm.com>
Date: Thu, 17 Dec 2015 04:01:09 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v3 2/6] Add get/set ipmid command
 support with correct DBUS property handling.
Cc: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>, "OpenBMC Patches"
 <openbmc-patches@stwcx.xyz>, "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.9 Build 201512150717_20
X-KeepSent: 6CA268B3:D580B2FE-00257F1E:0016143E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 19543
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_7_175901308.1450324869700"
x-cbid: 15121704-0009-0000-0000-000006DBF04A
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004672; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000126; SDB=6.00631695; UDB=6.00282891; UTC=2015-12-17
 04:01:12
x-cbparentid: 15121704-9900-0000-0000-0000055EF28F
X-TM-AS-MML: disable
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
X-List-Received-Date: Thu, 17 Dec 2015 04:01:28 -0000


------=_Part_7_175901308.1450324869700
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

I'm very confused with this patch.  =0A   =0A    1) sdbus already supports =
a get and set property so do not create your own=0A    =0A    2) there is a=
 lot of deletes.  Feels like this needs some additional eyes.  =0A  =0A  Se=
nt from my iPhone using IBM Verse=0A  =0A  On Dec 16, 2015, 4:46:14 PM, "St=
ewart Smith" <stewart@linux.vnet.ibm.com> wrote:=0A  =0A     OpenBMC Patche=
s  writes:=0A   > From: shgoupf =0A   >=0A   > 1) Two methods to handle the=
 dbus property set and get:=0A   >     a) dbus=5Fset=5Fproperty()=0A   >   =
  b) dbus=5Fget=5Fproperty()=0A   > 2) The property is stored as a 10 chara=
cter strings which represents=0A   > 5-byte information.=0A   > 3) ipmid se=
t method is registered and implemented since petitboot will=0A   > use it t=
o clear the boot options.=0A   > ---=0A   >  apphandler.C       |  70 ++---=
-------=0A   >  apphandler.h       |  33 +-----=0A   >  chassishandler.C   =
| 306 ++++++++++++++++++++++++++++++++++++++---------------=0A   >  chassis=
handler.h   |  20 ++--=0A   >  ipmid-api.h        |  13 +--=0A   >  ipmid.C=
            |  26 ++---=0A   >  ipmisensor.C       |  35 +-----=0A   >  sen=
sorhandler.C    |  17 ++-=0A   >  storageaddsel.C    |  42 ++++++--=0A   > =
 storagehandler.C   |  20 +---=0A   >  transporthandler.C |   2 +=0A   >  1=
1 files changed, 304 insertions(+), 280 deletions(-)=0A   >=0A   > diff --g=
it a/apphandler.C b/apphandler.C=0A   > index 2c9ce6b..6467397 100644=0A   =
> --- a/apphandler.C=0A   > +++ b/apphandler.C=0A   > @@ -10,76 +10,20 @@ e=
xtern sd=5Fbus *bus;=0A   >  =0A   >  void register=5Fnetfn=5Fapp=5Ffunctio=
ns() =5F=5Fattribute=5F=5F((constructor));=0A   >  =0A   > -//-------------=
--------------------------------------------------------=0A   > -// Called =
by Host on seeing a SMS=5FATN bit set. Return a hardcoded =0A   > -// value=
 of 0x2 indicating we need Host read some data.=0A   > -//-----------------=
--------------------------------------------------=0A   > -ipmi=5Fret=5Ft i=
pmi=5Fapp=5Fget=5Fmsg=5Fflags(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=
=0A   > -                             ipmi=5Frequest=5Ft request, ipmi=5Fre=
sponse=5Ft response,=0A   > -                             ipmi=5Fdata=5Flen=
=5Ft data=5Flen, ipmi=5Fcontext=5Ft=0A   > context)=0A   It is unclear why =
this is being removed. Is it replaced by something else?=0A   > -//--------=
-----------------------------------------------------------=0A   > -// Call=
ed by Host post response from Get=5FMessage=5FFlags=0A   > -//-------------=
------------------------------------------------------=0A   >  ipmi=5Fret=
=5Ft ipmi=5Fapp=5Fread=5Fevent(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=
=0A   >                               ipmi=5Frequest=5Ft request, ipmi=5Fre=
sponse=5Ft response,=0A   >                               ipmi=5Fdata=5Flen=
=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=0A   >  {=0A   >      ipmi=5Fr=
et=5Ft rc =3D IPMI=5FCC=5FOK;=0A   > -    printf("IPMI APP READ EVENT comma=
nd received\n");=0A   > -=0A   > - // TODO : For now, this is catering only=
 to the Soft Power Off via OEM SEL=0A   > - //        mechanism. If we need=
 to make this generically used for some=0A   > - //        other conditions=
, then we can take advantage of context pointer.=0A   > -=0A   > - struct o=
em=5Fsel=5Ftimestamped soft=5Foff =3D {0};=0A   > -    *data=5Flen =3D size=
of(struct oem=5Fsel=5Ftimestamped);=0A   > -=0A   > - // either id[0] -or- =
id[1] can be filled in. We will use id[0]=0A   > - soft=5Foff.id[0]  =3D SE=
L=5FOEM=5FID=5F0;=0A   > - soft=5Foff.id[1]  =3D SEL=5FOEM=5FID=5F0;=0A   >=
 - soft=5Foff.type  =3D SEL=5FRECORD=5FTYPE=5FOEM;=0A   > -=0A   > - // Fol=
lowing 3 bytes are from IANA Manufactre=5FId field. See below=0A   > - soft=
=5Foff.manuf=5Fid[0]=3D 0x41;=0A   > - soft=5Foff.manuf=5Fid[1]=3D 0xA7;=0A=
   > - soft=5Foff.manuf=5Fid[2]=3D 0x00;=0A   > -=0A   > - // per IPMI spec=
 NetFuntion for OEM=0A   > - soft=5Foff.netfun  =3D 0x3A;=0A   > -=0A   > -=
 // Mechanism to kick start soft shutdown.=0A   > - soft=5Foff.cmd  =3D CMD=
=5FPOWER;=0A   > - soft=5Foff.data[0] =3D SOFT=5FOFF;=0A   > -=0A   > - // =
All '0xFF' since unused.=0A   > - memset(&soft=5Foff.data[1], 0xFF, 3);=0A =
  > +    *data=5Flen =3D 0;=0A   >  =0A   > -    // Pack the actual respons=
e=0A   > -    memcpy(response, &soft=5Foff, *data=5Flen);=0A   > +    print=
f("IPMI APP READ EVENT Ignoring for now\n");=0A   >      return rc;=0A   > =
+=0A   >  }=0A   Feels like should be a separate patch, I'm unsure as to ho=
w this is=0A   related to adding get/set methods.=0A   > diff --git a/appha=
ndler.h b/apphandler.h=0A   > index aa2a55d..35a2b20 100644=0A   > --- a/ap=
phandler.h=0A   > +++ b/apphandler.h=0A   > @@ -1,19 +1,6 @@=0A   >  #ifnde=
f =5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F=0A   >  #define =5F=5FHOST=5F=
IPMI=5FAPP=5FHANDLER=5FH=5F=5F=0A   >  =0A   > -#include =0A   > -=0A   > -=
// These are per skiboot ipmi-sel code=0A   > -=0A   > -// OEM=5FSEL type w=
ith Timestamp=0A   > -#define SEL=5FOEM=5FID=5F0 0x55=0A   > -// SEL type i=
s OEM and -not- general SEL=0A   > -#define SEL=5FRECORD=5FTYPE=5FOEM 0xC0=
=0A   > -// Minor command for soft shurdown=0A   > -#define SOFT=5FOFF 0x00=
=0A   > -// Major command for Any kind of power ops=0A   > -#define CMD=5FP=
OWER 0x04=0A   > -=0A   not sure how the removal of these is related to thi=
s patch. Should be a=0A   separate one?=0A   >  // IPMI commands for App ne=
t functions.=0A   >  enum ipmi=5Fnetfn=5Fapp=5Fcmds=0A   >  {=0A   > @@ -24=
,27 +11,9 @@ enum ipmi=5Fnetfn=5Fapp=5Fcmds=0A   >      IPMI=5FCMD=5FRESET=
=5FWD               =3D 0x22,=0A   >      IPMI=5FCMD=5FSET=5FWD            =
     =3D 0x24,=0A   >      IPMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES =3D 0x=
2E,=0A   > -    IPMI=5FCMD=5FGET=5FMSG=5FFLAGS          =3D 0x31,=0A   >   =
   IPMI=5FCMD=5FREAD=5FEVENT             =3D 0x35,=0A   >      IPMI=5FCMD=
=5FGET=5FCAP=5FBIT            =3D 0x36,=0A   > -};=0A   same here.=0A   >  =
=0A   > -// A Mechanism to tell host to shtudown hosts by sending this PEM =
SEL. Really=0A   > -// the only used fields by skiboot are:=0A   > -// id[0=
] / id[1] for ID=5F0 , ID=5F1=0A   > -// type : SEL=5FRECORD=5FTYPE=5FOEM a=
s standard SELs are ignored by skiboot=0A   > -// cmd : CMD=5FPOWER for pow=
er functions=0A   > -// data[0], specific commands.  example Soft power off=
. power cycle, etc.=0A   > -struct oem=5Fsel=5Ftimestamped=0A   > -{=0A   >=
 - /* SEL header */=0A   > - uint8=5Ft id[2];=0A   > - uint8=5Ft type;=0A  =
 > - uint8=5Ft manuf=5Fid[3];=0A   > - uint8=5Ft timestamp[4];=0A   > - /* =
OEM SEL data (6 bytes) follows */=0A   > - uint8=5Ft netfun;=0A   > - uint8=
=5Ft cmd;=0A   > - uint8=5Ft data[4];=0A   >  };=0A   > +=0A   >  #endif=0A=
   and here.=0A   > diff --git a/chassishandler.C b/chassishandler.C=0A   >=
 index 1389db9..7694bd5 100644=0A   > --- a/chassishandler.C=0A   > +++ b/c=
hassishandler.C=0A   > @@ -4,10 +4,147 @@=0A   >  #include =0A   >  #includ=
e =0A   >  =0A   > -// OpenBMC Chassis Manager dbus framework=0A   > -const=
 char  *chassis=5Fbus=5Fname      =3D  "org.openbmc.control.Chassis";=0A   =
> -const char  *chassis=5Fobject=5Fname   =3D  "/org/openbmc/control/chassi=
s0";=0A   > -const char  *chassis=5Fintf=5Fname     =3D  "org.openbmc.contr=
ol.Chassis";=0A   > +char* uint8=5Fto=5Fchar(uint8=5Ft *a, size=5Ft size)=
=0A   > +{=0A   > +    char* buffer;=0A   > +    int i;=0A   > +=0A   > +  =
  buffer =3D (char*)malloc(size * 2 + 1);=0A   > +    if (!buffer)=0A   > +=
        return NULL;=0A   > +=0A   > +    buffer[size * 2] =3D 0;=0A   > + =
   for (i =3D 0; i < size; i++) {=0A   > +        uint8=5Ft msb =3D (a[i] >=
> 4) & 0xF;=0A   > +        uint8=5Ft lsb =3D a[i] & 0xF;=0A   > +        b=
uffer[2*i] =3D msb > 9 ? msb + 'A' - 10 : msb + '0';=0A   > +        buffer=
[2*i + 1] =3D lsb > 9 ? lsb + 'A' - 10 : lsb + '0';=0A   > +    }=0A   > +=
=0A   > +    return buffer;=0A   > +}=0A   > +=0A   > +uint8=5Ft* char=5Fto=
=5Fuint8(char *a, size=5Ft size)=0A   > +{=0A   > +    uint8=5Ft* buffer;=
=0A   > +    int i;=0A   > +=0A   > +    buffer =3D (uint8=5Ft*)malloc(size=
);=0A   > +    if (!buffer)=0A   > +        return NULL;=0A   > +=0A   > + =
   for (i =3D 0; i < size; i++) {=0A   > +        uint8=5Ft msb =3D (uint8=
=5Ft)(a[2*i] > '9' ? a[2*i] - 'A' + 10 : a[2*i] - '0');=0A   > +        uin=
t8=5Ft lsb =3D (uint8=5Ft)(a[2*i+1] > '9' ? a[2*i+1] - 'A' + 10 : a[2*i+1] =
- '0');=0A   > +        buffer[i] =3D ((msb << 4) | (lsb & 0xF)) & 0xFF;=0A=
   > +    }=0A   > +=0A   > +    return buffer;=0A   > +}=0A   What do thes=
e functions *do*? The names of uint8=5Fto=5Fchar and=0A   char=5Fto=5Fuint8=
 make absolutely zero sense to me as a char is, in fact, 8=0A   bits, i.e. =
a uint8=5Ft, just with a different semantic meaning.=0A   Is there some wei=
rd IPMI specific format of strings?=0A   > -//-----------------------------=
-----------------------------------------=0A   > -// Chassis Control comman=
ds=0A   > -//--------------------------------------------------------------=
--------=0A   > -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft n=
etfn, ipmi=5Fcmd=5Ft cmd, =0A   > -                        ipmi=5Frequest=
=5Ft request, ipmi=5Fresponse=5Ft response, =0A   > -                      =
  ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=0A   > -{=
=0A   > - // Error from power off.=0A   > - int rc =3D 0;=0A   > +    char*=
 buf =3D (char*)malloc(NUM=5FRETURN=5FBYTES=5FOF=5FGET);=0A   >  =0A   > - =
// No response for this command.=0A   > -    *data=5Flen =3D 0;=0A   > +   =
 if (reqptr->parameter =3D=3D 5) // Parameter #5=0A   > +    {=0A   > +    =
    dbus=5Fget=5Fproperty(buf);=0A   > +        uint8=5Ft* return=5Fvalue =
=3D char=5Fto=5Fuint8(buf, NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED);=0A   > =
+        *data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;=0A   > +        /=
/ TODO: last 3 bytes=0A   > +        // (NUM=5FRETURN=5FBYTES=5FOF=5FGET - =
NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED) is meanlingless=0A   > +        mem=
cpy(response, return=5Fvalue, *data=5Flen);=0A   > +        free(buf);=0A  =
 > +        free(return=5Fvalue);=0A   This isn't safe if dbus=5Fget=5Fprop=
erty fails (which it can). Indeed, if it=0A   does, you'll be running a who=
le bunch of code on unitialised data. If=0A   you're lucky you'll segv, if =
unlucky, exploitable security hole.=0A   > -ipmi=5Fret=5Ft ipmi=5Fchassis=
=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd, =
=0A   > +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5F=
netfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd, =0A   >                               =
 ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response, =0A   >         =
                       ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft=
 context)=0A   >  {=0A   >      ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;=0A   =
> -    *data=5Flen =3D 0;=0A   >  =0A   > -    printf("IPMI GET=5FSYS=5FBOO=
T=5FOPTIONS\n");=0A   > +    printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");=
=0A   > +    printf("IPMID set command required return bytes: %i\n", *data=
=5Flen);=0A   >  =0A   > -    get=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (g=
et=5Fsys=5Fboot=5Foptions=5Ft*) request;=0A   > +    set=5Fsys=5Fboot=5Fopt=
ions=5Ft *reqptr =3D (set=5Fsys=5Fboot=5Foptions=5Ft*) request;=0A   >  =0A=
   > -    // TODO Return default values to OPAL until dbus interface is ava=
ilable=0A   > +    char* output=5Fbuf =3D (char*)malloc(NUM=5FRETURN=5FBYTE=
S=5FOF=5FSET);=0A   This pattern repeats itself a lot - not checking for re=
turn value of=0A   malloc.=0A   Since OpenBMC is going to be running in a r=
elatively constrained=0A   resource environment, likely without swap and th=
ere's probably a good=0A   argument for turning memory overcommit off, you =
probably want to fail=0A   somewhat gracefully - or at the very least asser=
t() and fail in a known=0A   way rather than continue ond dereference null =
pointers.=0A   > @@ -141,6 +257,28 @@ void register=5Fnetfn=5Fchassis=5Ffun=
ctions()=0A   >      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=
=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);=0A   >      ipmi=5Fre=
gister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS=
, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);=0A   >  =0A   > -    =
printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCM=
D=5FCHASSIS=5FCONTROL);=0A   > -    ipmi=5Fregister=5Fcallback(NETFUN=5FCHA=
SSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol);=0A  =
 > +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, I=
PMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS);=0A   > +    ipmi=5Fregister=5Fcall=
back(NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=
=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions);=0A   > +=0A   > +    // TODO: Tes=
ting for dbus property set/get and related methods.=0A   > +    printf("---=
-> Start of chassis handler testing.\n");=0A   > +    set=5Fsys=5Fboot=5Fop=
tions=5Ft req =3D {0x80, 0x10, 0xA2, 0x3B, 0x45, 0x57}; =0A   > +    char* =
set=5Fvalue =3D uint8=5Fto=5Fchar((uint8=5Ft*)(&(req.data1)), 5);=0A   > + =
   dbus=5Fset=5Fproperty(set=5Fvalue);=0A   > +    char* buf =3D (char*)mal=
loc(NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED * 2 + 1);=0A   again, not checki=
ng results of dbus=5Fset=5Fproperty or malloc.=0A   > +    dbus=5Fget=5Fpro=
perty(buf);=0A   > +    uint8=5Ft* get=5Fvalue =3D char=5Fto=5Fuint8(buf, N=
UM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED);=0A   > +    int i;=0A   > +    prin=
tf("buf: %s\n", (char*)buf);=0A   > +    printf("0x");=0A   > +    for (i =
=3D 0; i < 5; i++) {=0A   > +        printf("%2x", get=5Fvalue[i]);=0A   > =
+    }=0A   > +    printf("\n");=0A   > +    printf("----> End of chassis h=
andler testing.\n");=0A   > +    free(buf);=0A   > +    free(set=5Fvalue);=
=0A   > +    free(get=5Fvalue);=0A   >  }=0A   > +=0A   > +=0A   > diff --g=
it a/chassishandler.h b/chassishandler.h=0A   > index 1a26411..80e40a8 1006=
44=0A   > --- a/chassishandler.h=0A   > +++ b/chassishandler.h=0A   > @@ -1=
,14 +1,18 @@=0A   >  #ifndef =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=
=5F=0A   >  #define =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F=0A   > =
 =0A   > -#include =0A   > +// TODO: Petitboot requires 8 bytes of response=
=0A   > +// however only 5 of them are used.=0A   Is this due to petitboto =
behaviour quirk or something that's=0A   standardized somewhere?=0A   what =
should the unused bytes be set to? 0x00? 0xFF?=0A   =5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A   openbmc mailing list=0A =
  openbmc@lists.ozlabs.org=0A   https://lists.ozlabs.org/listinfo/openbmc

------=_Part_7_175901308.1450324869700
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">I'm very confused with this patch. &nbsp;<div><br></div><d=
iv>1) sdbus already supports a get and set property so do not create your o=
wn</div><div><br></div><div>2) there is a lot of deletes. &nbsp;Feels like =
this needs some additional eyes. &nbsp;<br><br>Sent from my iPhone using IB=
M Verse<br><br><hr>On Dec 16, 2015, 4:46:14 PM, "Stewart Smith" &lt;stewart=
@linux.vnet.ibm.com&gt; wrote:<br><div style=3D"margin-left: 15px;" id=3D"M=
aaS360PIMSDKOriginalMessageId">OpenBMC&nbsp;Patches&nbsp;<openbmc-patches@s=
twcx.xyz>&nbsp;writes:<br>&gt;&nbsp;From:&nbsp;shgoupf&nbsp;<shgoupf@cn.ibm=
.com><br>&gt;<br>&gt;&nbsp;1)&nbsp;Two&nbsp;methods&nbsp;to&nbsp;handle&nbs=
p;the&nbsp;dbus&nbsp;property&nbsp;set&nbsp;and&nbsp;get:<br>&gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;a)&nbsp;dbus=5Fset=5Fproperty()<br>&gt;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;b)&nbsp;dbus=5Fget=5Fproperty()<br>&gt;&nbsp;2)&nbsp;The&nbsp=
;property&nbsp;is&nbsp;stored&nbsp;as&nbsp;a&nbsp;10&nbsp;character&nbsp;st=
rings&nbsp;which&nbsp;represents<br>&gt;&nbsp;5-byte&nbsp;information.<br>&=
gt;&nbsp;3)&nbsp;ipmid&nbsp;set&nbsp;method&nbsp;is&nbsp;registered&nbsp;an=
d&nbsp;implemented&nbsp;since&nbsp;petitboot&nbsp;will<br>&gt;&nbsp;use&nbs=
p;it&nbsp;to&nbsp;clear&nbsp;the&nbsp;boot&nbsp;options.<br>&gt;&nbsp;---<b=
r>&gt;&nbsp;&nbsp;apphandler.C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&n=
bsp;&nbsp;70&nbsp;++----------<br>&gt;&nbsp;&nbsp;apphandler.h&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;33&nbsp;+-----<br>&gt;&nbsp;&nbsp=
;chassishandler.C&nbsp;&nbsp;&nbsp;|&nbsp;306&nbsp;++++++++++++++++++++++++=
++++++++++++++---------------<br>&gt;&nbsp;&nbsp;chassishandler.h&nbsp;&nbs=
p;&nbsp;|&nbsp;&nbsp;20&nbsp;++--<br>&gt;&nbsp;&nbsp;ipmid-api.h&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;13&nbsp;+--<br>&gt;&nbsp;=
&nbsp;ipmid.C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;|&nbsp;&nbsp;26&nbsp;++---<br>&gt;&nbsp;&nbsp;ipmisensor.C&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;35&nbsp;+-----<br>&gt;&nbsp=
;&nbsp;sensorhandler.C&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;17&nbsp;++-<br>&=
gt;&nbsp;&nbsp;storageaddsel.C&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;42&nbsp;=
++++++--<br>&gt;&nbsp;&nbsp;storagehandler.C&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;=
20&nbsp;+---<br>&gt;&nbsp;&nbsp;transporthandler.C&nbsp;|&nbsp;&nbsp;&nbsp;=
2&nbsp;+<br>&gt;&nbsp;&nbsp;11&nbsp;files&nbsp;changed,&nbsp;304&nbsp;inser=
tions(+),&nbsp;280&nbsp;deletions(-)<br>&gt;<br>&gt;&nbsp;diff&nbsp;--git&n=
bsp;a/apphandler.C&nbsp;b/apphandler.C<br>&gt;&nbsp;index&nbsp;2c9ce6b..<a =
dir=3D"ltr" href=3D"tel:6467397" x-apple-data-detectors=3D"true" x-apple-da=
ta-detectors-type=3D"telephone" x-apple-data-detectors-result=3D"1">6467397=
</a>&nbsp;100644<br>&gt;&nbsp;---&nbsp;a/apphandler.C<br>&gt;&nbsp;+++&nbsp=
;b/apphandler.C<br>&gt;&nbsp;@@&nbsp;-10,76&nbsp;+10,20&nbsp;@@&nbsp;extern=
&nbsp;sd=5Fbus&nbsp;*bus;<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&nbsp;void&nbsp;=
register=5Fnetfn=5Fapp=5Ffunctions()&nbsp;=5F=5Fattribute=5F=5F((constructo=
r));<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-//----------------------------------=
-----------------------------------<br>&gt;&nbsp;-//&nbsp;Called&nbsp;by&nb=
sp;Host&nbsp;on&nbsp;seeing&nbsp;a&nbsp;SMS=5FATN&nbsp;bit&nbsp;set.&nbsp;R=
eturn&nbsp;a&nbsp;hardcoded&nbsp;<br>&gt;&nbsp;-//&nbsp;value&nbsp;of&nbsp;=
0x2&nbsp;indicating&nbsp;we&nbsp;need&nbsp;Host&nbsp;read&nbsp;some&nbsp;da=
ta.<br>&gt;&nbsp;-//-------------------------------------------------------=
------------<br>&gt;&nbsp;-ipmi=5Fret=5Ft&nbsp;ipmi=5Fapp=5Fget=5Fmsg=5Ffla=
gs(ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,<br>&gt;&nbsp;=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Frequest=5Ft&nbsp;request,&nbsp;ipmi=5Frespo=
nse=5Ft&nbsp;response,<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fdata=5F=
len=5Ft&nbsp;data=5Flen,&nbsp;ipmi=5Fcontext=5Ft<br>&gt;&nbsp;context)<br>I=
t&nbsp;is&nbsp;unclear&nbsp;why&nbsp;this&nbsp;is&nbsp;being&nbsp;removed.&=
nbsp;Is&nbsp;it&nbsp;replaced&nbsp;by&nbsp;something&nbsp;else?<br>&gt;&nbs=
p;-//-------------------------------------------------------------------<br=
>&gt;&nbsp;-//&nbsp;Called&nbsp;by&nbsp;Host&nbsp;post&nbsp;response&nbsp;f=
rom&nbsp;Get=5FMessage=5FFlags<br>&gt;&nbsp;-//----------------------------=
---------------------------------------<br>&gt;&nbsp;&nbsp;ipmi=5Fret=5Ft&n=
bsp;ipmi=5Fapp=5Fread=5Fevent(ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=
=5Ft&nbsp;cmd,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Frequest=5F=
t&nbsp;request,&nbsp;ipmi=5Fresponse=5Ft&nbsp;response,<br>&gt;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fdata=5Flen=5Ft&nbsp;data=5Flen,&nbsp;ipmi=5F=
context=5Ft&nbsp;context)<br>&gt;&nbsp;&nbsp;{<br>&gt;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;ipmi=5Fret=5Ft&nbsp;rc&nbsp;=3D&nbsp;IPMI=5FCC=5FOK;<br>&gt;=
&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMI&nbsp;APP&nbsp;READ&nbsp;EVENT&n=
bsp;command&nbsp;received\n");<br>&gt;&nbsp;-<br>&gt;&nbsp;-        //&nbsp=
;TODO&nbsp;:&nbsp;For&nbsp;now,&nbsp;this&nbsp;is&nbsp;catering&nbsp;only&n=
bsp;to&nbsp;the&nbsp;Soft&nbsp;Power&nbsp;Off&nbsp;via&nbsp;OEM&nbsp;SEL<br=
>&gt;&nbsp;-        //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mecha=
nism.&nbsp;If&nbsp;we&nbsp;need&nbsp;to&nbsp;make&nbsp;this&nbsp;genericall=
y&nbsp;used&nbsp;for&nbsp;some<br>&gt;&nbsp;-        //&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;other&nbsp;conditions,&nbsp;then&nbsp;we&nbsp;c=
an&nbsp;take&nbsp;advantage&nbsp;of&nbsp;context&nbsp;pointer.<br>&gt;&nbsp=
;-<br>&gt;&nbsp;-        struct&nbsp;oem=5Fsel=5Ftimestamped&nbsp;soft=5Fof=
f&nbsp;=3D&nbsp;{0};<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp=
;=3D&nbsp;sizeof(struct&nbsp;oem=5Fsel=5Ftimestamped);<br>&gt;&nbsp;-<br>&g=
t;&nbsp;-        //&nbsp;either&nbsp;id[0]&nbsp;-or-&nbsp;id[1]&nbsp;can&nb=
sp;be&nbsp;filled&nbsp;in.&nbsp;We&nbsp;will&nbsp;use&nbsp;id[0]<br>&gt;&nb=
sp;-        soft=5Foff.id[0]        &nbsp;=3D&nbsp;SEL=5FOEM=5FID=5F0;<br>&=
gt;&nbsp;-        soft=5Foff.id[1]        &nbsp;=3D&nbsp;SEL=5FOEM=5FID=5F0=
;<br>&gt;&nbsp;-        soft=5Foff.type        &nbsp;=3D&nbsp;SEL=5FRECORD=
=5FTYPE=5FOEM;<br>&gt;&nbsp;-<br>&gt;&nbsp;-        //&nbsp;Following&nbsp;=
3&nbsp;bytes&nbsp;are&nbsp;from&nbsp;IANA&nbsp;Manufactre=5FId&nbsp;field.&=
nbsp;See&nbsp;below<br>&gt;&nbsp;-        soft=5Foff.manuf=5Fid[0]=3D&nbsp;=
0x41;<br>&gt;&nbsp;-        soft=5Foff.manuf=5Fid[1]=3D&nbsp;0xA7;<br>&gt;&=
nbsp;-        soft=5Foff.manuf=5Fid[2]=3D&nbsp;0x00;<br>&gt;&nbsp;-<br>&gt;=
&nbsp;-        //&nbsp;per&nbsp;IPMI&nbsp;spec&nbsp;NetFuntion&nbsp;for&nbs=
p;OEM<br>&gt;&nbsp;-        soft=5Foff.netfun        &nbsp;=3D&nbsp;0x3A;<b=
r>&gt;&nbsp;-<br>&gt;&nbsp;-        //&nbsp;Mechanism&nbsp;to&nbsp;kick&nbs=
p;start&nbsp;soft&nbsp;shutdown.<br>&gt;&nbsp;-        soft=5Foff.cmd      =
  &nbsp;=3D&nbsp;CMD=5FPOWER;<br>&gt;&nbsp;-        soft=5Foff.data[0]&nbsp=
;=3D&nbsp;SOFT=5FOFF;<br>&gt;&nbsp;-<br>&gt;&nbsp;-        //&nbsp;All&nbsp=
;'0xFF'&nbsp;since&nbsp;unused.<br>&gt;&nbsp;-        memset(&amp;soft=5Fof=
f.data[1],&nbsp;0xFF,&nbsp;3);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;*data=
=5Flen&nbsp;=3D&nbsp;0;<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp=
;&nbsp;//&nbsp;Pack&nbsp;the&nbsp;actual&nbsp;response<br>&gt;&nbsp;-&nbsp;=
&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;&amp;soft=5Foff,&nbsp;*data=5Flen);=
<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMI&nbsp;APP&nbsp;READ&nbsp=
;EVENT&nbsp;Ignoring&nbsp;for&nbsp;now\n");<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;return&nbsp;rc;<br>&gt;&nbsp;+<br>&gt;&nbsp;&nbsp;}<br>Feels&nb=
sp;like&nbsp;should&nbsp;be&nbsp;a&nbsp;separate&nbsp;patch,&nbsp;I'm&nbsp;=
unsure&nbsp;as&nbsp;to&nbsp;how&nbsp;this&nbsp;is<br>related&nbsp;to&nbsp;a=
dding&nbsp;get/set&nbsp;methods.<br>&gt;&nbsp;diff&nbsp;--git&nbsp;a/apphan=
dler.h&nbsp;b/apphandler.h<br>&gt;&nbsp;index&nbsp;aa2a55d..35a2b20&nbsp;10=
0644<br>&gt;&nbsp;---&nbsp;a/apphandler.h<br>&gt;&nbsp;+++&nbsp;b/apphandle=
r.h<br>&gt;&nbsp;@@&nbsp;-1,19&nbsp;+1,6&nbsp;@@<br>&gt;&nbsp;&nbsp;#ifndef=
&nbsp;=5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F<br>&gt;&nbsp;&nbsp;#defin=
e&nbsp;=5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F<br>&gt;&nbsp;&nbsp;<br>&=
gt;&nbsp;-#include&nbsp;<stdint.h><br>&gt;&nbsp;-<br>&gt;&nbsp;-//&nbsp;The=
se&nbsp;are&nbsp;per&nbsp;skiboot&nbsp;ipmi-sel&nbsp;code<br>&gt;&nbsp;-<br=
>&gt;&nbsp;-//&nbsp;OEM=5FSEL&nbsp;type&nbsp;with&nbsp;Timestamp<br>&gt;&nb=
sp;-#define&nbsp;SEL=5FOEM=5FID=5F0                0x55<br>&gt;&nbsp;-//&nb=
sp;SEL&nbsp;type&nbsp;is&nbsp;OEM&nbsp;and&nbsp;-not-&nbsp;general&nbsp;SEL=
<br>&gt;&nbsp;-#define&nbsp;SEL=5FRECORD=5FTYPE=5FOEM        0xC0<br>&gt;&n=
bsp;-//&nbsp;Minor&nbsp;command&nbsp;for&nbsp;soft&nbsp;shurdown<br>&gt;&nb=
sp;-#define&nbsp;SOFT=5FOFF                        0x00<br>&gt;&nbsp;-//&nb=
sp;Major&nbsp;command&nbsp;for&nbsp;Any&nbsp;kind&nbsp;of&nbsp;power&nbsp;o=
ps<br>&gt;&nbsp;-#define&nbsp;CMD=5FPOWER                        0x04<br>&g=
t;&nbsp;-<br>not&nbsp;sure&nbsp;how&nbsp;the&nbsp;removal&nbsp;of&nbsp;thes=
e&nbsp;is&nbsp;related&nbsp;to&nbsp;this&nbsp;patch.&nbsp;Should&nbsp;be&nb=
sp;a<br>separate&nbsp;one?<br>&gt;&nbsp;&nbsp;//&nbsp;IPMI&nbsp;commands&nb=
sp;for&nbsp;App&nbsp;net&nbsp;functions.<br>&gt;&nbsp;&nbsp;enum&nbsp;ipmi=
=5Fnetfn=5Fapp=5Fcmds<br>&gt;&nbsp;&nbsp;{<br>&gt;&nbsp;@@&nbsp;-24,27&nbsp=
;+11,9&nbsp;@@&nbsp;enum&nbsp;ipmi=5Fnetfn=5Fapp=5Fcmds<br>&gt;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FRESET=5FWD&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;0x22=
,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FSET=5FWD&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;=3D&nbsp;0x24,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;IPMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES&nbsp;=3D&nbsp;0x2E,<br>&gt;&nbsp=
;-&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FGET=5FMSG=5FFLAGS&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;0x31,<br>&gt;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FREAD=5FEVENT&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;0x35,<br>&gt;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FGET=5FCAP=5FBIT&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;0x36,<=
br>&gt;&nbsp;-};<br>same&nbsp;here.<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-//&nb=
sp;A&nbsp;Mechanism&nbsp;to&nbsp;tell&nbsp;host&nbsp;to&nbsp;shtudown&nbsp;=
hosts&nbsp;by&nbsp;sending&nbsp;this&nbsp;PEM&nbsp;SEL.&nbsp;Really<br>&gt;=
&nbsp;-//&nbsp;the&nbsp;only&nbsp;used&nbsp;fields&nbsp;by&nbsp;skiboot&nbs=
p;are:<br>&gt;&nbsp;-//&nbsp;id[0]&nbsp;/&nbsp;id[1]&nbsp;for&nbsp;ID=5F0&n=
bsp;,&nbsp;ID=5F1<br>&gt;&nbsp;-//&nbsp;type&nbsp;:&nbsp;SEL=5FRECORD=5FTYP=
E=5FOEM&nbsp;as&nbsp;standard&nbsp;SELs&nbsp;are&nbsp;ignored&nbsp;by&nbsp;=
skiboot<br>&gt;&nbsp;-//&nbsp;cmd&nbsp;:&nbsp;CMD=5FPOWER&nbsp;for&nbsp;pow=
er&nbsp;functions<br>&gt;&nbsp;-//&nbsp;data[0],&nbsp;specific&nbsp;command=
s.&nbsp;&nbsp;example&nbsp;Soft&nbsp;power&nbsp;off.&nbsp;power&nbsp;cycle,=
&nbsp;etc.<br>&gt;&nbsp;-struct&nbsp;oem=5Fsel=5Ftimestamped<br>&gt;&nbsp;-=
{<br>&gt;&nbsp;-        /*&nbsp;SEL&nbsp;header&nbsp;*/<br>&gt;&nbsp;-     =
   uint8=5Ft&nbsp;id[2];<br>&gt;&nbsp;-        uint8=5Ft&nbsp;type;<br>&gt;=
&nbsp;-        uint8=5Ft&nbsp;manuf=5Fid[3];<br>&gt;&nbsp;-        uint8=5F=
t&nbsp;timestamp[4];<br>&gt;&nbsp;-        /*&nbsp;OEM&nbsp;SEL&nbsp;data&n=
bsp;(6&nbsp;bytes)&nbsp;follows&nbsp;*/<br>&gt;&nbsp;-        uint8=5Ft&nbs=
p;netfun;<br>&gt;&nbsp;-        uint8=5Ft&nbsp;cmd;<br>&gt;&nbsp;-        u=
int8=5Ft&nbsp;data[4];<br>&gt;&nbsp;&nbsp;};<br>&gt;&nbsp;+<br>&gt;&nbsp;&n=
bsp;#endif<br>and&nbsp;here.<br>&gt;&nbsp;diff&nbsp;--git&nbsp;a/chassishan=
dler.C&nbsp;b/chassishandler.C<br>&gt;&nbsp;index&nbsp;1389db9..7694bd5&nbs=
p;100644<br>&gt;&nbsp;---&nbsp;a/chassishandler.C<br>&gt;&nbsp;+++&nbsp;b/c=
hassishandler.C<br>&gt;&nbsp;@@&nbsp;-4,10&nbsp;+4,147&nbsp;@@<br>&gt;&nbsp=
;&nbsp;#include&nbsp;<string.h><br>&gt;&nbsp;&nbsp;#include&nbsp;<stdint.h>=
<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-//&nbsp;OpenBMC&nbsp;Chassis&nbsp;Manage=
r&nbsp;dbus&nbsp;framework<br>&gt;&nbsp;-const&nbsp;char&nbsp;&nbsp;*chassi=
s=5Fbus=5Fname&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;&nbsp;"org.openb=
mc.control.Chassis";<br>&gt;&nbsp;-const&nbsp;char&nbsp;&nbsp;*chassis=5Fob=
ject=5Fname&nbsp;&nbsp;&nbsp;=3D&nbsp;&nbsp;"/org/openbmc/control/chassis0"=
;<br>&gt;&nbsp;-const&nbsp;char&nbsp;&nbsp;*chassis=5Fintf=5Fname&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=3D&nbsp;&nbsp;"org.openbmc.control.Chassis";<br>&gt;&n=
bsp;+char*&nbsp;uint8=5Fto=5Fchar(uint8=5Ft&nbsp;*a,&nbsp;size=5Ft&nbsp;siz=
e)<br>&gt;&nbsp;+{<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;buffer;=
<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;i;<br>&gt;&nbsp;+<br>&gt;&n=
bsp;+&nbsp;&nbsp;&nbsp;&nbsp;buffer&nbsp;=3D&nbsp;(char*)malloc(size&nbsp;*=
&nbsp;2&nbsp;+&nbsp;1);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!buf=
fer)<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&n=
bsp;NULL;<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;buffer[size&=
nbsp;*&nbsp;2]&nbsp;=3D&nbsp;0;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;for&n=
bsp;(i&nbsp;=3D&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;size;&nbsp;i++)&nbsp;{<br>&gt=
;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;msb&=
nbsp;=3D&nbsp;(a[i]&nbsp;&gt;&gt;&nbsp;4)&nbsp;&amp;&nbsp;0xF;<br>&gt;&nbsp=
;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;lsb&nbsp;=
=3D&nbsp;a[i]&nbsp;&amp;&nbsp;0xF;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;buffer[2*i]&nbsp;=3D&nbsp;msb&nbsp;&gt;&nbsp;9&nbsp;?=
&nbsp;msb&nbsp;+&nbsp;'A'&nbsp;-&nbsp;10&nbsp;:&nbsp;msb&nbsp;+&nbsp;'0';<b=
r>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buffer[2*i&nbs=
p;+&nbsp;1]&nbsp;=3D&nbsp;lsb&nbsp;&gt;&nbsp;9&nbsp;?&nbsp;lsb&nbsp;+&nbsp;=
'A'&nbsp;-&nbsp;10&nbsp;:&nbsp;lsb&nbsp;+&nbsp;'0';<br>&gt;&nbsp;+&nbsp;&nb=
sp;&nbsp;&nbsp;}<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;retur=
n&nbsp;buffer;<br>&gt;&nbsp;+}<br>&gt;&nbsp;+<br>&gt;&nbsp;+uint8=5Ft*&nbsp=
;char=5Fto=5Fuint8(char&nbsp;*a,&nbsp;size=5Ft&nbsp;size)<br>&gt;&nbsp;+{<b=
r>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft*&nbsp;buffer;<br>&gt;&nbsp;+=
&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;i;<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbs=
p;&nbsp;&nbsp;buffer&nbsp;=3D&nbsp;(uint8=5Ft*)malloc(size);<br>&gt;&nbsp;+=
&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!buffer)<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;NULL;<br>&gt;&nbsp;+<br>&gt;&nbsp;=
+&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(i&nbsp;=3D&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp=
;size;&nbsp;i++)&nbsp;{<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;uint8=5Ft&nbsp;msb&nbsp;=3D&nbsp;(uint8=5Ft)(a[2*i]&nbsp;&gt;&nb=
sp;'9'&nbsp;?&nbsp;a[2*i]&nbsp;-&nbsp;'A'&nbsp;+&nbsp;10&nbsp;:&nbsp;a[2*i]=
&nbsp;-&nbsp;'0');<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;uint8=5Ft&nbsp;lsb&nbsp;=3D&nbsp;(uint8=5Ft)(a[2*i+1]&nbsp;&gt;&nbsp;=
'9'&nbsp;?&nbsp;a[2*i+1]&nbsp;-&nbsp;'A'&nbsp;+&nbsp;10&nbsp;:&nbsp;a[2*i+1=
]&nbsp;-&nbsp;'0');<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;buffer[i]&nbsp;=3D&nbsp;((msb&nbsp;&lt;&lt;&nbsp;4)&nbsp;|&nbsp;(lsb=
&nbsp;&amp;&nbsp;0xF))&nbsp;&amp;&nbsp;0xFF;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbs=
p;&nbsp;}<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;=
buffer;<br>&gt;&nbsp;+}<br>What&nbsp;do&nbsp;these&nbsp;functions&nbsp;*do*=
?&nbsp;The&nbsp;names&nbsp;of&nbsp;uint8=5Fto=5Fchar&nbsp;and<br>char=5Fto=
=5Fuint8&nbsp;make&nbsp;absolutely&nbsp;zero&nbsp;sense&nbsp;to&nbsp;me&nbs=
p;as&nbsp;a&nbsp;char&nbsp;is,&nbsp;in&nbsp;fact,&nbsp;8<br>bits,&nbsp;i.e.=
&nbsp;a&nbsp;uint8=5Ft,&nbsp;just&nbsp;with&nbsp;a&nbsp;different&nbsp;sema=
ntic&nbsp;meaning.<br>Is&nbsp;there&nbsp;some&nbsp;weird&nbsp;IPMI&nbsp;spe=
cific&nbsp;format&nbsp;of&nbsp;strings?<br>&gt;&nbsp;-//-------------------=
---------------------------------------------------<br>&gt;&nbsp;-//&nbsp;C=
hassis&nbsp;Control&nbsp;commands<br>&gt;&nbsp;-//-------------------------=
---------------------------------------------<br>&gt;&nbsp;-ipmi=5Fret=5Ft&=
nbsp;ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=
=5Ft&nbsp;cmd,&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Frequest=5Ft&nbsp;request,&nbsp;ipmi=5Fr=
esponse=5Ft&nbsp;response,&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fdata=5Flen=5Ft&nbsp;data=5F=
len,&nbsp;ipmi=5Fcontext=5Ft&nbsp;context)<br>&gt;&nbsp;-{<br>&gt;&nbsp;-  =
      //&nbsp;Error&nbsp;from&nbsp;power&nbsp;off.<br>&gt;&nbsp;-        in=
t&nbsp;rc&nbsp;=3D&nbsp;0;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp=
;buf&nbsp;=3D&nbsp;(char*)malloc(NUM=5FRETURN=5FBYTES=5FOF=5FGET);<br>&gt;&=
nbsp;&nbsp;<br>&gt;&nbsp;-        //&nbsp;No&nbsp;response&nbsp;for&nbsp;th=
is&nbsp;command.<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp;=3D=
&nbsp;0;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(reqptr-&gt;paramete=
r&nbsp;=3D=3D&nbsp;5)&nbsp;//&nbsp;Parameter&nbsp;#5<br>&gt;&nbsp;+&nbsp;&n=
bsp;&nbsp;&nbsp;{<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;dbus=5Fget=5Fproperty(buf);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;uint8=5Ft*&nbsp;return=5Fvalue&nbsp;=3D&nbsp;char=5Fto=
=5Fuint8(buf,&nbsp;NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED);<br>&gt;&nbsp;+&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp;=3D&nbsp;NU=
M=5FRETURN=5FBYTES=5FOF=5FGET;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;//&nbsp;TODO:&nbsp;last&nbsp;3&nbsp;bytes<br>&gt;&nbsp;+&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;(NUM=5FRETURN=5FBYTE=
S=5FOF=5FGET&nbsp;-&nbsp;NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED)&nbsp;is&nb=
sp;meanlingless<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;memcpy(response,&nbsp;return=5Fvalue,&nbsp;*data=5Flen);<br>&gt;&nbsp;+&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(buf);<br>&gt;&nbsp;+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(return=5Fvalue);<br>This&=
nbsp;isn't&nbsp;safe&nbsp;if&nbsp;dbus=5Fget=5Fproperty&nbsp;fails&nbsp;(wh=
ich&nbsp;it&nbsp;can).&nbsp;Indeed,&nbsp;if&nbsp;it<br>does,&nbsp;you'll&nb=
sp;be&nbsp;running&nbsp;a&nbsp;whole&nbsp;bunch&nbsp;of&nbsp;code&nbsp;on&n=
bsp;unitialised&nbsp;data.&nbsp;If<br>you're&nbsp;lucky&nbsp;you'll&nbsp;se=
gv,&nbsp;if&nbsp;unlucky,&nbsp;exploitable&nbsp;security&nbsp;hole.<br>&gt;=
&nbsp;-ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=
=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,&nbsp;<br>&gt;&nbsp;+=
ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetf=
n=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,&nbsp;<br>&gt;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Frequest=5Ft&nbsp;request,&nbsp;ipmi=5Fre=
sponse=5Ft&nbsp;response,&nbsp;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;ipmi=5Fdata=5Flen=5Ft&nbsp;data=5Flen,&nbsp;ipmi=5Fcontext=5Ft&nbsp;c=
ontext)<br>&gt;&nbsp;&nbsp;{<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipm=
i=5Fret=5Ft&nbsp;rc&nbsp;=3D&nbsp;IPMI=5FCC=5FOK;<br>&gt;&nbsp;-&nbsp;&nbsp=
;&nbsp;&nbsp;*data=5Flen&nbsp;=3D&nbsp;0;<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;=
-&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMI&nbsp;GET=5FSYS=5FBOOT=5FOPTIONS\n");<=
br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMI&nbsp;SET=5FSYS=5FBOOT=5F=
OPTIONS\n");<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMID&nbsp;set&n=
bsp;command&nbsp;required&nbsp;return&nbsp;bytes:&nbsp;%i\n",&nbsp;*data=5F=
len);<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;get=5Fsys=
=5Fboot=5Foptions=5Ft&nbsp;*reqptr&nbsp;=3D&nbsp;(get=5Fsys=5Fboot=5Foption=
s=5Ft*)&nbsp;request;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;set=5Fsys=5Fboo=
t=5Foptions=5Ft&nbsp;*reqptr&nbsp;=3D&nbsp;(set=5Fsys=5Fboot=5Foptions=5Ft*=
)&nbsp;request;<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;/=
/&nbsp;TODO&nbsp;Return&nbsp;default&nbsp;values&nbsp;to&nbsp;OPAL&nbsp;unt=
il&nbsp;dbus&nbsp;interface&nbsp;is&nbsp;available<br>&gt;&nbsp;+&nbsp;&nbs=
p;&nbsp;&nbsp;char*&nbsp;output=5Fbuf&nbsp;=3D&nbsp;(char*)malloc(NUM=5FRET=
URN=5FBYTES=5FOF=5FSET);<br>This&nbsp;pattern&nbsp;repeats&nbsp;itself&nbsp=
;a&nbsp;lot&nbsp;-&nbsp;not&nbsp;checking&nbsp;for&nbsp;return&nbsp;value&n=
bsp;of<br>malloc.<br>Since&nbsp;OpenBMC&nbsp;is&nbsp;going&nbsp;to&nbsp;be&=
nbsp;running&nbsp;in&nbsp;a&nbsp;relatively&nbsp;constrained<br>resource&nb=
sp;environment,&nbsp;likely&nbsp;without&nbsp;swap&nbsp;and&nbsp;there's&nb=
sp;probably&nbsp;a&nbsp;good<br>argument&nbsp;for&nbsp;turning&nbsp;memory&=
nbsp;overcommit&nbsp;off,&nbsp;you&nbsp;probably&nbsp;want&nbsp;to&nbsp;fai=
l<br>somewhat&nbsp;gracefully&nbsp;-&nbsp;or&nbsp;at&nbsp;the&nbsp;very&nbs=
p;least&nbsp;assert()&nbsp;and&nbsp;fail&nbsp;in&nbsp;a&nbsp;known<br>way&n=
bsp;rather&nbsp;than&nbsp;continue&nbsp;ond&nbsp;dereference&nbsp;null&nbsp=
;pointers.<br>&gt;&nbsp;@@&nbsp;-141,6&nbsp;+257,28&nbsp;@@&nbsp;void&nbsp;=
register=5Fnetfn=5Fchassis=5Ffunctions()<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;printf("Registering&nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=
=5FCHASSIS,&nbsp;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS,&nbs=
p;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS,&nbsp;NULL,&nbsp;ipmi=5Fchassis=
=5Fget=5Fsys=5Fboot=5Foptions);<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nb=
sp;&nbsp;&nbsp;printf("Registering&nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NE=
TFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>&gt;&nbsp;-&nbsp;&=
nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS,&nbsp;IPMI=5FC=
MD=5FCHASSIS=5FCONTROL,&nbsp;NULL,&nbsp;ipmi=5Fchassis=5Fcontrol);<br>&gt;&=
nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&nbsp;NetFn:[0x%X],&nbsp;C=
md:[0x%X]\n",NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS=
);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFUN=
=5FCHASSIS,&nbsp;IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS,&nbsp;NULL,&nbsp;i=
pmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions);<br>&gt;&nbsp;+<br>&gt;&nbsp;+&=
nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;TODO:&nbsp;Testing&nbsp;for&nbsp;dbus&nbsp;p=
roperty&nbsp;set/get&nbsp;and&nbsp;related&nbsp;methods.<br>&gt;&nbsp;+&nbs=
p;&nbsp;&nbsp;&nbsp;printf("----&gt;&nbsp;Start&nbsp;of&nbsp;chassis&nbsp;h=
andler&nbsp;testing.\n");<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;set=5Fsys=
=5Fboot=5Foptions=5Ft&nbsp;req&nbsp;=3D&nbsp;{0x80,&nbsp;0x10,&nbsp;0xA2,&n=
bsp;0x3B,&nbsp;0x45,&nbsp;0x57};&nbsp;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbs=
p;char*&nbsp;set=5Fvalue&nbsp;=3D&nbsp;uint8=5Fto=5Fchar((uint8=5Ft*)(&amp;=
(req.data1)),&nbsp;5);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;dbus=5Fset=5Fp=
roperty(set=5Fvalue);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;buf&=
nbsp;=3D&nbsp;(char*)malloc(NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED&nbsp;*&n=
bsp;2&nbsp;+&nbsp;1);<br>again,&nbsp;not&nbsp;checking&nbsp;results&nbsp;of=
&nbsp;dbus=5Fset=5Fproperty&nbsp;or&nbsp;malloc.<br>&gt;&nbsp;+&nbsp;&nbsp;=
&nbsp;&nbsp;dbus=5Fget=5Fproperty(buf);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nb=
sp;uint8=5Ft*&nbsp;get=5Fvalue&nbsp;=3D&nbsp;char=5Fto=5Fuint8(buf,&nbsp;NU=
M=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbs=
p;int&nbsp;i;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("buf:&nbsp;%s\n"=
,&nbsp;(char*)buf);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("0x");<br>=
&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(i&nbsp;=3D&nbsp;0;&nbsp;i&nbsp=
;&lt;&nbsp;5;&nbsp;i++)&nbsp;{<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;printf("%2x",&nbsp;get=5Fvalue[i]);<br>&gt;&nbsp;+&nbsp;&=
nbsp;&nbsp;&nbsp;}<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("\n");<br>&=
gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;printf("----&gt;&nbsp;End&nbsp;of&nbsp;ch=
assis&nbsp;handler&nbsp;testing.\n");<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp=
;free(buf);<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;free(set=5Fvalue);<br>&gt=
;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;free(get=5Fvalue);<br>&gt;&nbsp;&nbsp;}<br>=
&gt;&nbsp;+<br>&gt;&nbsp;+<br>&gt;&nbsp;diff&nbsp;--git&nbsp;a/chassishandl=
er.h&nbsp;b/chassishandler.h<br>&gt;&nbsp;index&nbsp;1a26411..80e40a8&nbsp;=
100644<br>&gt;&nbsp;---&nbsp;a/chassishandler.h<br>&gt;&nbsp;+++&nbsp;b/cha=
ssishandler.h<br>&gt;&nbsp;@@&nbsp;-1,14&nbsp;+1,18&nbsp;@@<br>&gt;&nbsp;&n=
bsp;#ifndef&nbsp;=5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F<br>&gt;&nb=
sp;&nbsp;#define&nbsp;=5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F<br>&g=
t;&nbsp;&nbsp;<br>&gt;&nbsp;-#include&nbsp;<stdint.h><br>&gt;&nbsp;+//&nbsp=
;TODO:&nbsp;Petitboot&nbsp;requires&nbsp;8&nbsp;bytes&nbsp;of&nbsp;response=
<br>&gt;&nbsp;+//&nbsp;however&nbsp;only&nbsp;5&nbsp;of&nbsp;them&nbsp;are&=
nbsp;used.<br>Is&nbsp;this&nbsp;due&nbsp;to&nbsp;petitboto&nbsp;behaviour&n=
bsp;quirk&nbsp;or&nbsp;something&nbsp;that's<br>standardized&nbsp;somewhere=
?<br>what&nbsp;should&nbsp;the&nbsp;unused&nbsp;bytes&nbsp;be&nbsp;set&nbsp=
;to?&nbsp;0x00?&nbsp;0xFF?<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc@lists.oz=
labs.org<br>https://lists.ozlabs.org/listinfo/openbmc<br></stdint.h></stdin=
t.h></string.h></stdint.h></shgoupf@cn.ibm.com></openbmc-patches@stwcx.xyz>=
</div></div></div><BR>
</body></html>

------=_Part_7_175901308.1450324869700--
