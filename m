Return-Path: <austenc@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 521BD1A11A1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:14:18 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 16 Dec 2015 23:14:16 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 23:14:14 -0500
X-IBM-Helo: b01cxnp22033.gho.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBH4EDLf22216774
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 04:14:13 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBH4EDxQ030608
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 23:14:13 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBH4ECCY030569
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 23:14:13 -0500
Message-Id: <201512170414.tBH4ECCY030569@d01av01.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 16 Dec 2015 21:14:12 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 16 Dec 2015 21:14:09 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 17 Dec 2015 04:14:08 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Dec 2015 04:14:05 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015121704140795-27549 ;
 Thu, 17 Dec 2015 04:14:07 +0000 
To: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
In-Reply-To: <1450315225-22284-3-git-send-email-openbmc-patches@stwcx.xyz>
Date: Thu, 17 Dec 2015 04:14:04 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v4 2/2] Add get/set ipmid command
 support with correct DBUS property handling.
Cc: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>,
 "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.9 Build 201512150717_20
X-KeepSent: 21496544:74E17992-00257F1E:001742B8;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 30835
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_10_872690692.1450325644568"
x-cbid: 15121704-0045-0000-0000-000002C9669A
X-IBM-ISS-SpamDetectors: Score=0.445263; BY=0.10626; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.445263; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004672; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000126; SDB=6.00631699; UDB=6.00282893; UTC=2015-12-17
 04:14:07
x-cbparentid: 15121704-9900-0000-0000-0000055EF727
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
X-List-Received-Date: Thu, 17 Dec 2015 04:14:19 -0000


------=_Part_10_872690692.1450325644568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

This commit has patches from a different commit=0A   =0A    Id there really=
 a need for uint=5Fto=5Fchar like functions?=0A    =0A    Sdbus seems to ha=
ve a bug (or maybe I don't know how to use it) but unref of of a bus doesn'=
t seem to work.  So you should not call sdbus=5Fopen   You should call the =
get=5Fsbus (my correct spelling but I'm on a plane) function found in the i=
pmid.c. File=0A    =0A    I've never seen a need to create free desktop fun=
ctions not sure why they are here.   Attaching an object manager is a singl=
e function call.  See the phosphor-event repository =0A    =0A    =0A  Sent=
 from my iPhone using IBM Verse=0A  =0A  On Dec 16, 2015, 8:20:47 PM, "Open=
BMC Patches" <openbmc-patches@stwcx.xyz> wrote:=0A  =0A     From: shgoupf =
=0A   1) Two methods to handle the dbus property set and get:=0A      a) db=
us=5Fset=5Fproperty()=0A      b) dbus=5Fget=5Fproperty()=0A   2) The proper=
ty is stored as a 10 character strings which represents=0A   5-byte informa=
tion.=0A   3) ipmid set method is registered and implemented since petitboo=
t will=0A   use it to clear the boot options.=0A   4) Get service name via =
object mapper=0A      a) The connection name is got via objectmapper.=0A   =
   b) The method used to get the connection name is object=5Fmapper=5Fget=
=5Fconnection().=0A      c) dbus=5Fget=5Fproperty/dbus=5Fset=5Fproperty wil=
l get the connection name via=0A   the above method instead of hard coding.=
=0A   ---=0A   chassishandler.C | 279 +++++++++++++++++++++++++++++++++++++=
+++++++++++++++++-=0A   chassishandler.h |   8 ++=0A   2 files changed, 283=
 insertions(+), 4 deletions(-)=0A   diff --git a/chassishandler.C b/chassis=
handler.C=0A   index 1389db9..35b5086 100644=0A   --- a/chassishandler.C=0A=
   +++ b/chassishandler.C=0A   @@ -9,6 +9,217 @@ const char  *chassis=5Fbus=
=5Fname      =3D  "org.openbmc.control.Chassis";=0A   const char  *chassis=
=5Fobject=5Fname   =3D  "/org/openbmc/control/chassis0";=0A   const char  *=
chassis=5Fintf=5Fname     =3D  "org.openbmc.control.Chassis";=0A   =0A   +/=
/ Host settings in dbus=0A   +// Service name should be referenced by conne=
ction name got via object mapper=0A   +// const char  *settings=5Fservice=
=5Fname =3D  "org.openbmc.settings.Host";=0A   +const char  *settings=5Fobj=
ect=5Fname  =3D  "/org/openbmc/settings/host0";=0A   +const char  *settings=
=5Fintf=5Fname    =3D  "org.freedesktop.DBus.Properties";=0A   +=0A   +cons=
t char  *objmapper=5Fservice=5Fname =3D  "org.openbmc.objectmapper";=0A   +=
const char  *objmapper=5Fobject=5Fname  =3D  "/org/openbmc/objectmapper/obj=
ectmapper";=0A   +const char  *objmapper=5Fintf=5Fname    =3D  "org.openbmc=
.objectmapper.ObjectMapper";=0A   +=0A   +char* uint8=5Fto=5Fchar(uint8=5Ft=
 *a, size=5Ft size)=0A   +{=0A   +    char* buffer;=0A   +    int i;=0A   +=
=0A   +    buffer =3D (char*)malloc(size * 2 + 1);=0A   +    if (!buffer)=
=0A   +        return NULL;=0A   +=0A   +    buffer[size * 2] =3D 0;=0A   +=
    for (i =3D 0; i < size; i++) {=0A   +        uint8=5Ft msb =3D (a[i] >>=
 4) & 0xF;=0A   +        uint8=5Ft lsb =3D a[i] & 0xF;=0A   +        buffer=
[2*i] =3D msb > 9 ? msb + 'A' - 10 : msb + '0';=0A   +        buffer[2*i + =
1] =3D lsb > 9 ? lsb + 'A' - 10 : lsb + '0';=0A   +    }=0A   +=0A   +    r=
eturn buffer;=0A   +}=0A   +=0A   +uint8=5Ft* char=5Fto=5Fuint8(char *a, si=
ze=5Ft size)=0A   +{=0A   +    uint8=5Ft* buffer;=0A   +    int i;=0A   +=
=0A   +    buffer =3D (uint8=5Ft*)malloc(size);=0A   +    if (!buffer)=0A  =
 +        return NULL;=0A   +=0A   +    for (i =3D 0; i < size; i++) {=0A  =
 +        uint8=5Ft msb =3D (uint8=5Ft)(a[2*i] > '9' ? a[2*i] - 'A' + 10 : =
a[2*i] - '0');=0A   +        uint8=5Ft lsb =3D (uint8=5Ft)(a[2*i+1] > '9' ?=
 a[2*i+1] - 'A' + 10 : a[2*i+1] - '0');=0A   +        buffer[i] =3D ((msb <=
< 4) | (lsb & 0xF)) & 0xFF;=0A   +    }=0A   +=0A   +    return buffer;=0A =
  +}=0A   +=0A   +int object=5Fmapper=5Fget=5Fconnection(char** buf, const =
char* obj=5Fpath)=0A   +{=0A   +    sd=5Fbus=5Ferror error =3D SD=5FBUS=5FE=
RROR=5FNULL;=0A   +    sd=5Fbus=5Fmessage *m =3D NULL;=0A   +    sd=5Fbus *=
bus =3D NULL;=0A   +    char* temp=5Fbuf =3D NULL;=0A   +    size=5Ft buf=
=5Fsize =3D 0;=0A   +    int r;=0A   +=0A   +    // Open the system bus whe=
re most system services are provided. =0A   +    r =3D sd=5Fbus=5Fopen=5Fsy=
stem(&bus);=0A   +    if (r < 0) {=0A   +        fprintf(stderr, "Failed to=
 connect to system bus: %s\n", strerror(-r));=0A   +        goto finish;=0A=
   +    }=0A   +=0A   +    // Bus, service, object path, interface and meth=
od are provided to call=0A   +    // the method. =0A   +    // Signatures a=
nd input arguments are provided by the arguments at the=0A   +    // end.=
=0A   +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,=0A   +            objmapper=
=5Fservice=5Fname,                      /* service to contact */=0A   +    =
        objmapper=5Fobject=5Fname,                       /* object path */=
=0A   +            objmapper=5Fintf=5Fname,                         /* inte=
rface name */=0A   +            "GetObject",                               =
  /* method name */=0A   +            &error,                              =
        /* object to return error in */=0A   +            &m,              =
                            /* return message on success */=0A   +         =
   "s",                                         /* input signature */=0A   =
+            obj=5Fpath                                     /* first argume=
nt */=0A   +            );=0A   +=0A   +    if (r < 0) {=0A   +        fpri=
ntf(stderr, "Failed to issue method call: %s\n", error.message);=0A   +    =
    goto finish;=0A   +    }=0A   +=0A   +    // Get the key, aka, the conn=
ection name=0A   +    r =3D sd=5Fbus=5Fmessage=5Fread(m, "a{sas}", 1, &temp=
=5Fbuf);=0A   +    buf=5Fsize =3D strlen(temp=5Fbuf) + 1;=0A   +    printf(=
"IPMID connection name: %s\n", temp=5Fbuf);=0A   +    *buf =3D (char*)mallo=
c(buf=5Fsize);=0A   +    memcpy(*buf, temp=5Fbuf, buf=5Fsize);=0A   +=0A   =
+finish:=0A   +    sd=5Fbus=5Ferror=5Ffree(&error);=0A   +    sd=5Fbus=5Fme=
ssage=5Funref(m);=0A   +    sd=5Fbus=5Funref(bus);=0A   +=0A   +    return =
r;=0A   +}=0A   +=0A   +// TODO: object mapper should be used instead of ha=
rd-coding.=0A   +int dbus=5Fget=5Fproperty(char* buf)=0A   +{=0A   +    sd=
=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;=0A   +    sd=5Fbus=5Fmess=
age *m =3D NULL;=0A   +    sd=5Fbus *bus =3D NULL;=0A   +    char* temp=5Fb=
uf =3D NULL;=0A   +    uint8=5Ft* get=5Fvalue =3D NULL;=0A   +    char* con=
nection =3D NULL;=0A   +    int r, i;=0A   +=0A   +    // Open the system b=
us where most system services are provided. =0A   +    r =3D sd=5Fbus=5Fope=
n=5Fsystem(&bus);=0A   +    if (r < 0) {=0A   +        fprintf(stderr, "Fai=
led to connect to system bus: %s\n", strerror(-r));=0A   +        goto fini=
sh;=0A   +    }=0A   +=0A   +    object=5Fmapper=5Fget=5Fconnection(&connec=
tion, settings=5Fobject=5Fname);=0A   +    printf("connection: %s\n", conne=
ction);=0A   +    // Bus, service, object path, interface and method are pr=
ovided to call=0A   +    // the method. =0A   +    // Signatures and input =
arguments are provided by the arguments at the=0A   +    // end.=0A   +    =
r =3D sd=5Fbus=5Fcall=5Fmethod(bus,=0A   +            connection,          =
                       /* service to contact */=0A   +            settings=
=5Fobject=5Fname,                       /* object path */=0A   +           =
 settings=5Fintf=5Fname,                         /* interface name */=0A   =
+            "Get",                                      /* method name */=
=0A   +            &error,                                     /* object to=
 return error in */=0A   +            &m,                                  =
       /* return message on success */=0A   +            "ss",             =
                          /* input signature */=0A   +            settings=
=5Fintf=5Fname,                         /* first argument */=0A   +        =
    "boot=5Fflags");                              /* second argument */=0A =
  +=0A   +    if (r < 0) {=0A   +        fprintf(stderr, "Failed to issue m=
ethod call: %s\n", error.message);=0A   +        goto finish;=0A   +    }=
=0A   +=0A   +    // The output should be parsed exactly the same as the ou=
tput formatting=0A   +    // specified.=0A   +    r =3D sd=5Fbus=5Fmessage=
=5Fread(m, "v", "s", &temp=5Fbuf);=0A   +    if (r < 0) {=0A   +        fpr=
intf(stderr, "Failed to parse response message: %s\n", strerror(-r));=0A   =
+        goto finish;=0A   +    }=0A   +=0A   +    printf("IPMID boot optio=
n property get: {%s}.\n", (char*) temp=5Fbuf);=0A   +=0A   +    memcpy(buf,=
 temp=5Fbuf, 2*NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED + 1);=0A   +=0A   +fi=
nish:=0A   +    sd=5Fbus=5Ferror=5Ffree(&error);=0A   +    sd=5Fbus=5Fmessa=
ge=5Funref(m);=0A   +    sd=5Fbus=5Funref(bus);=0A   +    free(connection);=
=0A   +=0A   +    return r;=0A   +}=0A   +=0A   +// TODO: object mapper sho=
uld be used instead of hard-coding.=0A   +int dbus=5Fset=5Fproperty(const c=
har* buf)=0A   +{=0A   +    sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FN=
ULL;=0A   +    sd=5Fbus=5Fmessage *m =3D NULL;=0A   +    sd=5Fbus *bus =3D =
NULL;=0A   +    char* connection =3D NULL;=0A   +    int r;=0A   +=0A   +  =
  // Open the system bus where most system services are provided. =0A   +  =
  r =3D sd=5Fbus=5Fopen=5Fsystem(&bus);=0A   +    if (r < 0) {=0A   +      =
  fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));=
=0A   +        goto finish;=0A   +    }=0A   +=0A   +    object=5Fmapper=5F=
get=5Fconnection(&connection, settings=5Fobject=5Fname);=0A   +    printf("=
connection: %s\n", connection);=0A   +    // Bus, service, object path, int=
erface and method are provided to call=0A   +    // the method. =0A   +    =
// Signatures and input arguments are provided by the arguments at the=0A  =
 +    // end.=0A   +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus,=0A   +         =
   connection,                                 /* service to contact */=0A =
  +            settings=5Fobject=5Fname,                       /* object pa=
th */=0A   +            settings=5Fintf=5Fname,                         /* =
interface name */=0A   +            "Set",                                 =
     /* method name */=0A   +            &error,                           =
          /* object to return error in */=0A   +            &m,            =
                             /* return message on success */=0A   +        =
    "ssv",                                      /* input signature */=0A   =
+            settings=5Fintf=5Fname,                         /* first argum=
ent */=0A   +            "boot=5Fflags",                               /* s=
econd argument */=0A   +            "s",                                   =
     /* third argument */=0A   +            buf);                          =
             /* fourth argument */=0A   +=0A   +    if (r < 0) {=0A   +    =
    fprintf(stderr, "Failed to issue method call: %s\n", error.message);=0A=
   +        goto finish;=0A   +    }=0A   +=0A   +    printf("IPMID boot op=
tion property set: {%s}.\n", buf);=0A   +=0A   +finish:=0A   +    sd=5Fbus=
=5Ferror=5Ffree(&error);=0A   +    sd=5Fbus=5Fmessage=5Funref(m);=0A   +   =
 sd=5Fbus=5Funref(bus);=0A   +    free(connection);=0A   +=0A   +    return=
 r;=0A   +}=0A   +=0A   void register=5Fnetfn=5Fchassis=5Ffunctions() =5F=
=5Fattribute=5F=5F((constructor));=0A   =0A   struct get=5Fsys=5Fboot=5Fopt=
ions=5Ft {=0A   @@ -17,6 +228,15 @@ struct get=5Fsys=5Fboot=5Foptions=5Ft {=
=0A       uint8=5Ft block;=0A   }  =5F=5Fattribute=5F=5F ((packed));=0A   =
=0A   +struct set=5Fsys=5Fboot=5Foptions=5Ft {=0A   +    uint8=5Ft paramete=
r;=0A   +    uint8=5Ft data1;=0A   +    uint8=5Ft data2;=0A   +    uint8=5F=
t data3;=0A   +    uint8=5Ft data4;=0A   +    uint8=5Ft data5;=0A   +}  =5F=
=5Fattribute=5F=5F ((packed));=0A   +=0A   ipmi=5Fret=5Ft ipmi=5Fchassis=5F=
wildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd, =0A                   =
              ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response, =0A=
                                 ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fc=
ontext=5Ft context)=0A   @@ -116,16 +336,63 @@ ipmi=5Fret=5Ft ipmi=5Fchassi=
s=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=
=0A   =0A       get=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (get=5Fsys=5Fboo=
t=5Foptions=5Ft*) request;=0A   =0A   -    // TODO Return default values to=
 OPAL until dbus interface is available=0A   +    char* buf =3D (char*)mall=
oc(NUM=5FRETURN=5FBYTES=5FOF=5FGET);=0A   +=0A   +    if (reqptr->parameter=
 =3D=3D 5) // Parameter #5=0A   +    {=0A   +        dbus=5Fget=5Fproperty(=
buf);=0A   +        uint8=5Ft* return=5Fvalue =3D char=5Fto=5Fuint8(buf, NU=
M=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED);=0A   +        *data=5Flen =3D NUM=5F=
RETURN=5FBYTES=5FOF=5FGET;=0A   +        // TODO: last 3 bytes=0A   +      =
  // (NUM=5FRETURN=5FBYTES=5FOF=5FGET - NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FU=
SED) is meanlingless=0A   +        memcpy(response, return=5Fvalue, *data=
=5Flen);=0A   +        free(buf);=0A   +        free(return=5Fvalue);=0A   =
+    }=0A   +    else=0A   +    {=0A   +        *data=5Flen =3D NUM=5FRETUR=
N=5FBYTES=5FOF=5FGET;=0A   +        // 0x80: parameter not supported=0A   +=
        buf[0] =3D 0x80;=0A   +        memcpy(response, buf, *data=5Flen);=
=0A   +        free(buf);=0A   +        fprintf(stderr, "Unsupported parame=
ter 0x%x\n", reqptr->parameter);=0A   +        return IPMI=5FCC=5FPARM=5FNO=
T=5FSUPPORTED;        =0A   +    }=0A   +=0A   +    return rc;=0A   +}=0A  =
 +=0A   +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5F=
netfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd, =0A   +                              i=
pmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response, =0A   +           =
                   ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft con=
text)=0A   +{=0A   +    ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;=0A   +=0A   +=
    printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");=0A   +    printf("IPMID se=
t command required return bytes: %i\n", *data=5Flen);=0A   +=0A   +    set=
=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (set=5Fsys=5Fboot=5Foptions=5Ft*) r=
equest;=0A   +=0A   +    char* output=5Fbuf =3D (char*)malloc(NUM=5FRETURN=
=5FBYTES=5FOF=5FSET);=0A   =0A       if (reqptr->parameter =3D=3D 5) // Par=
ameter #5=0A       {=0A   -        uint8=5Ft buf[] =3D {0x1,0x5,80,0,0,0,0}=
;=0A   -        *data=5Flen =3D sizeof(buf);=0A   -        memcpy(response,=
 &buf, *data=5Flen);=0A   +        char* input=5Fbuf =3D uint8=5Fto=5Fchar(=
(uint8=5Ft*)(&(reqptr->data1)), NUM=5FINPUT=5FBYTES=5FOF=5FSET);=0A   +    =
    dbus=5Fset=5Fproperty(input=5Fbuf);=0A   +        *data=5Flen =3D NUM=
=5FRETURN=5FBYTES=5FOF=5FSET;=0A   +        // 0x0: return code OK.=0A   + =
       output=5Fbuf[0] =3D 0x0;=0A   +        memcpy(response, output=5Fbuf=
, *data=5Flen);=0A   +        free(output=5Fbuf);=0A   +        free(input=
=5Fbuf);=0A       }=0A       else=0A       {=0A   +        // 0x80: paramet=
er not supported=0A   +        output=5Fbuf[0] =3D 0x80;=0A   +        memc=
py(response, output=5Fbuf, *data=5Flen);=0A   +        free(output=5Fbuf);=
=0A           fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->param=
eter);=0A           return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;        =0A  =
     }=0A   @@ -133,6 +400,7 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=
=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=0A       retu=
rn rc;=0A   }=0A   =0A   +=0A   void register=5Fnetfn=5Fchassis=5Ffunctions=
()=0A   {=0A       printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=
=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);=0A   @@ -141,6 +409,9 @@ void register=
=5Fnetfn=5Fchassis=5Ffunctions()=0A       printf("Registering NetFn:[0x%X],=
 Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);=
=0A       ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FS=
YS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);=0A=
   =0A   +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHAS=
SIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS);=0A   +    ipmi=5Fregister=5F=
callback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, i=
pmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions);=0A   +=0A       printf("Regist=
ering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5F=
CONTROL);=0A       ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=
=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol);=0A   }=0A   diff --g=
it a/chassishandler.h b/chassishandler.h=0A   index 1a26411..0164ce1 100644=
=0A   --- a/chassishandler.h=0A   +++ b/chassishandler.h=0A   @@ -3,12 +3,2=
0 @@=0A   =0A   #include =0A   =0A   +// TODO: Petitboot requires 8 bytes o=
f response=0A   +// however only 5 of them are used.=0A   +#define NUM=5FRE=
TURN=5FBYTES=5FOF=5FGET 8=0A   +#define NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FU=
SED 5=0A   +#define NUM=5FRETURN=5FBYTES=5FOF=5FSET 1=0A   +#define NUM=5FI=
NPUT=5FBYTES=5FOF=5FSET 5=0A   +=0A   // IPMI commands for Chassis net func=
tions.=0A   enum ipmi=5Fnetfn=5Fapp=5Fcmds=0A   {=0A    // Chassis Control=
=0A    IPMI=5FCMD=5FCHASSIS=5FCONTROL   =3D 0x02,=0A       // Get capabilit=
y bits=0A   +    IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS =3D 0x08,=0A      =
 IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,=0A   };=0A   =0A   -- =
=0A   2.6.3=0A   =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=0A   openbmc mailing list=0A   openbmc@lists.ozlabs.org=0A   http=
s://lists.ozlabs.org/listinfo/openbmc

------=_Part_10_872690692.1450325644568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">This commit has patches from a different commit<div><br></=
div><div>Id there really a need for uint=5Fto=5Fchar like functions?</div><=
div><br></div><div>Sdbus seems to have a bug (or maybe I don't know how to =
use it) but unref of of a bus doesn't seem to work. &nbsp;So you should not=
 call sdbus=5Fopen &nbsp; You should call the get=5Fsbus (my correct spelli=
ng but I'm on a plane) function found in the ipmid.c. File</div><div><br></=
div><div>I've never seen a need to create free desktop functions not sure w=
hy they are here. &nbsp; Attaching an object manager is a single function c=
all. &nbsp;See the phosphor-event repository&nbsp;</div><div><br></div><div=
><br><br>Sent from my iPhone using IBM Verse<br><br><hr>On Dec 16, 2015, 8:=
20:47 PM, "OpenBMC Patches" &lt;openbmc-patches@stwcx.xyz&gt; wrote:<br><di=
v style=3D"margin-left: 15px;" id=3D"MaaS360PIMSDKOriginalMessageId">From:&=
nbsp;shgoupf&nbsp;<shgoupf@cn.ibm.com><br>1)&nbsp;Two&nbsp;methods&nbsp;to&=
nbsp;handle&nbsp;the&nbsp;dbus&nbsp;property&nbsp;set&nbsp;and&nbsp;get:<br=
>&nbsp;&nbsp;&nbsp;a)&nbsp;dbus=5Fset=5Fproperty()<br>&nbsp;&nbsp;&nbsp;b)&=
nbsp;dbus=5Fget=5Fproperty()<br>2)&nbsp;The&nbsp;property&nbsp;is&nbsp;stor=
ed&nbsp;as&nbsp;a&nbsp;10&nbsp;character&nbsp;strings&nbsp;which&nbsp;repre=
sents<br>5-byte&nbsp;information.<br>3)&nbsp;ipmid&nbsp;set&nbsp;method&nbs=
p;is&nbsp;registered&nbsp;and&nbsp;implemented&nbsp;since&nbsp;petitboot&nb=
sp;will<br>use&nbsp;it&nbsp;to&nbsp;clear&nbsp;the&nbsp;boot&nbsp;options.<=
br>4)&nbsp;Get&nbsp;service&nbsp;name&nbsp;via&nbsp;object&nbsp;mapper<br>&=
nbsp;&nbsp;&nbsp;a)&nbsp;The&nbsp;connection&nbsp;name&nbsp;is&nbsp;got&nbs=
p;via&nbsp;objectmapper.<br>&nbsp;&nbsp;&nbsp;b)&nbsp;The&nbsp;method&nbsp;=
used&nbsp;to&nbsp;get&nbsp;the&nbsp;connection&nbsp;name&nbsp;is&nbsp;objec=
t=5Fmapper=5Fget=5Fconnection().<br>&nbsp;&nbsp;&nbsp;c)&nbsp;dbus=5Fget=5F=
property/dbus=5Fset=5Fproperty&nbsp;will&nbsp;get&nbsp;the&nbsp;connection&=
nbsp;name&nbsp;via<br>the&nbsp;above&nbsp;method&nbsp;instead&nbsp;of&nbsp;=
hard&nbsp;coding.<br>---<br>chassishandler.C&nbsp;|&nbsp;279&nbsp;+++++++++=
+++++++++++++++++++++++++++++++++++++++++++++-<br>chassishandler.h&nbsp;|&n=
bsp;&nbsp;&nbsp;8&nbsp;++<br>2&nbsp;files&nbsp;changed,&nbsp;283&nbsp;inser=
tions(+),&nbsp;4&nbsp;deletions(-)<br>diff&nbsp;--git&nbsp;a/chassishandler=
.C&nbsp;b/chassishandler.C<br>index&nbsp;1389db9..35b5086&nbsp;100644<br>--=
-&nbsp;a/chassishandler.C<br>+++&nbsp;b/chassishandler.C<br>@@&nbsp;-9,6&nb=
sp;+9,217&nbsp;@@&nbsp;const&nbsp;char&nbsp;&nbsp;*chassis=5Fbus=5Fname&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;&nbsp;"org.openbmc.control.Chassis=
";<br>const&nbsp;char&nbsp;&nbsp;*chassis=5Fobject=5Fname&nbsp;&nbsp;&nbsp;=
=3D&nbsp;&nbsp;"/org/openbmc/control/chassis0";<br>const&nbsp;char&nbsp;&nb=
sp;*chassis=5Fintf=5Fname&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D&nbsp;&nbsp;"org.=
openbmc.control.Chassis";<br><br>+//&nbsp;Host&nbsp;settings&nbsp;in&nbsp;d=
bus<br>+//&nbsp;Service&nbsp;name&nbsp;should&nbsp;be&nbsp;referenced&nbsp;=
by&nbsp;connection&nbsp;name&nbsp;got&nbsp;via&nbsp;object&nbsp;mapper<br>+=
//&nbsp;const&nbsp;char&nbsp;&nbsp;*settings=5Fservice=5Fname&nbsp;=3D&nbsp=
;&nbsp;"org.openbmc.settings.Host";<br>+const&nbsp;char&nbsp;&nbsp;*setting=
s=5Fobject=5Fname&nbsp;&nbsp;=3D&nbsp;&nbsp;"/org/openbmc/settings/host0";<=
br>+const&nbsp;char&nbsp;&nbsp;*settings=5Fintf=5Fname&nbsp;&nbsp;&nbsp;&nb=
sp;=3D&nbsp;&nbsp;"org.freedesktop.DBus.Properties";<br>+<br>+const&nbsp;ch=
ar&nbsp;&nbsp;*objmapper=5Fservice=5Fname&nbsp;=3D&nbsp;&nbsp;"org.openbmc.=
objectmapper";<br>+const&nbsp;char&nbsp;&nbsp;*objmapper=5Fobject=5Fname&nb=
sp;&nbsp;=3D&nbsp;&nbsp;"/org/openbmc/objectmapper/objectmapper";<br>+const=
&nbsp;char&nbsp;&nbsp;*objmapper=5Fintf=5Fname&nbsp;&nbsp;&nbsp;&nbsp;=3D&n=
bsp;&nbsp;"org.openbmc.objectmapper.ObjectMapper";<br>+<br>+char*&nbsp;uint=
8=5Fto=5Fchar(uint8=5Ft&nbsp;*a,&nbsp;size=5Ft&nbsp;size)<br>+{<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;char*&nbsp;buffer;<br>+&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;i;=
<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;buffer&nbsp;=3D&nbsp;(char*)malloc(size&n=
bsp;*&nbsp;2&nbsp;+&nbsp;1);<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!buffer)<=
br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;NULL;<br>+<=
br>+&nbsp;&nbsp;&nbsp;&nbsp;buffer[size&nbsp;*&nbsp;2]&nbsp;=3D&nbsp;0;<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(i&nbsp;=3D&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp=
;size;&nbsp;i++)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;uint8=5Ft&nbsp;msb&nbsp;=3D&nbsp;(a[i]&nbsp;&gt;&gt;&nbsp;4)&nbsp;&amp;&nb=
sp;0xF;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;=
lsb&nbsp;=3D&nbsp;a[i]&nbsp;&amp;&nbsp;0xF;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;buffer[2*i]&nbsp;=3D&nbsp;msb&nbsp;&gt;&nbsp;9&nbsp;?&=
nbsp;msb&nbsp;+&nbsp;'A'&nbsp;-&nbsp;10&nbsp;:&nbsp;msb&nbsp;+&nbsp;'0';<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buffer[2*i&nbsp;+&nbsp;1]=
&nbsp;=3D&nbsp;lsb&nbsp;&gt;&nbsp;9&nbsp;?&nbsp;lsb&nbsp;+&nbsp;'A'&nbsp;-&=
nbsp;10&nbsp;:&nbsp;lsb&nbsp;+&nbsp;'0';<br>+&nbsp;&nbsp;&nbsp;&nbsp;}<br>+=
<br>+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;buffer;<br>+}<br>+<br>+uint8=5Ft*&=
nbsp;char=5Fto=5Fuint8(char&nbsp;*a,&nbsp;size=5Ft&nbsp;size)<br>+{<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;uint8=5Ft*&nbsp;buffer;<br>+&nbsp;&nbsp;&nbsp;&nbsp;in=
t&nbsp;i;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;buffer&nbsp;=3D&nbsp;(uint8=5Ft*=
)malloc(size);<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!buffer)<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;NULL;<br>+<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;for&nbsp;(i&nbsp;=3D&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;size;&nbsp=
;i++)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&=
nbsp;msb&nbsp;=3D&nbsp;(uint8=5Ft)(a[2*i]&nbsp;&gt;&nbsp;'9'&nbsp;?&nbsp;a[=
2*i]&nbsp;-&nbsp;'A'&nbsp;+&nbsp;10&nbsp;:&nbsp;a[2*i]&nbsp;-&nbsp;'0');<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;lsb&nbsp;=
=3D&nbsp;(uint8=5Ft)(a[2*i+1]&nbsp;&gt;&nbsp;'9'&nbsp;?&nbsp;a[2*i+1]&nbsp;=
-&nbsp;'A'&nbsp;+&nbsp;10&nbsp;:&nbsp;a[2*i+1]&nbsp;-&nbsp;'0');<br>+&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buffer[i]&nbsp;=3D&nbsp;((msb&nbs=
p;&lt;&lt;&nbsp;4)&nbsp;|&nbsp;(lsb&nbsp;&amp;&nbsp;0xF))&nbsp;&amp;&nbsp;0=
xFF;<br>+&nbsp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;return&=
nbsp;buffer;<br>+}<br>+<br>+int&nbsp;object=5Fmapper=5Fget=5Fconnection(cha=
r**&nbsp;buf,&nbsp;const&nbsp;char*&nbsp;obj=5Fpath)<br>+{<br>+&nbsp;&nbsp;=
&nbsp;&nbsp;sd=5Fbus=5Ferror&nbsp;error&nbsp;=3D&nbsp;SD=5FBUS=5FERROR=5FNU=
LL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fmessage&nbsp;*m&nbsp;=3D&nbsp;NU=
LL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus&nbsp;*bus&nbsp;=3D&nbsp;NULL;<br>+=
&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;temp=5Fbuf&nbsp;=3D&nbsp;NULL;<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;size=5Ft&nbsp;buf=5Fsize&nbsp;=3D&nbsp;0;<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;int&nbsp;r;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;Open&nbs=
p;the&nbsp;system&nbsp;bus&nbsp;where&nbsp;most&nbsp;system&nbsp;services&n=
bsp;are&nbsp;provided.&nbsp;<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=
=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(r&nb=
sp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
fprintf(stderr,&nbsp;"Failed&nbsp;to&nbsp;connect&nbsp;to&nbsp;system&nbsp;=
bus:&nbsp;%s\n",&nbsp;strerror(-r));<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nbsp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbs=
p;&nbsp;&nbsp;&nbsp;//&nbsp;Bus,&nbsp;service,&nbsp;object&nbsp;path,&nbsp;=
interface&nbsp;and&nbsp;method&nbsp;are&nbsp;provided&nbsp;to&nbsp;call<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;the&nbsp;method.&nbsp;<br>+&nbsp;&nbsp;&nb=
sp;&nbsp;//&nbsp;Signatures&nbsp;and&nbsp;input&nbsp;arguments&nbsp;are&nbs=
p;provided&nbsp;by&nbsp;the&nbsp;arguments&nbsp;at&nbsp;the<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;//&nbsp;end.<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=5F=
bus=5Fcall=5Fmethod(bus,<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;objmapper=5Fservice=5Fname,&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;service&nbsp;to&nbsp;contact&nbs=
p;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;objmapper=5Fobject=5Fname,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;/*&nbsp;object&nbsp;path&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;objmapper=5Fintf=5Fna=
me,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;/*&nbsp;interface&nbsp;name&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"GetObject",&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;method&nbsp;name&nbsp;*/<br>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;error,&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*=
&nbsp;object&nbsp;to&nbsp;return&nbsp;error&nbsp;in&nbsp;*/<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;m,&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;/*&nbsp;return&nbsp;message&nbsp;on&nbsp;success&nbsp;*=
/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;"s",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;input&nbsp;signature&nbsp;*/<br>+&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;obj=5Fpat=
h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*=
&nbsp;first&nbsp;argument&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;);<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&n=
bsp;(r&nbsp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;fprintf(stderr,&nbsp;"Failed&nbsp;to&nbsp;issue&nbsp;method&nbsp;c=
all:&nbsp;%s\n",&nbsp;error.message);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nbsp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;//&nbsp;Get&nbsp;the&nbsp;key,&nbsp;aka,&nbsp;the&nbsp=
;connection&nbsp;name<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=5Fbus=
=5Fmessage=5Fread(m,&nbsp;"a{sas}",&nbsp;1,&nbsp;&amp;temp=5Fbuf);<br>+&nbs=
p;&nbsp;&nbsp;&nbsp;buf=5Fsize&nbsp;=3D&nbsp;strlen(temp=5Fbuf)&nbsp;+&nbsp=
;1;<br>+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMID&nbsp;connection&nbsp;name:&nb=
sp;%s\n",&nbsp;temp=5Fbuf);<br>+&nbsp;&nbsp;&nbsp;&nbsp;*buf&nbsp;=3D&nbsp;=
(char*)malloc(buf=5Fsize);<br>+&nbsp;&nbsp;&nbsp;&nbsp;memcpy(*buf,&nbsp;te=
mp=5Fbuf,&nbsp;buf=5Fsize);<br>+<br>+finish:<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=
=5Fbus=5Ferror=5Ffree(&amp;error);<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fm=
essage=5Funref(m);<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Funref(bus);<br>+<=
br>+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;r;<br>+}<br>+<br>+//&nbsp;TODO:&nbs=
p;object&nbsp;mapper&nbsp;should&nbsp;be&nbsp;used&nbsp;instead&nbsp;of&nbs=
p;hard-coding.<br>+int&nbsp;dbus=5Fget=5Fproperty(char*&nbsp;buf)<br>+{<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Ferror&nbsp;error&nbsp;=3D&nbsp;SD=5FBUS=
=5FERROR=5FNULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fmessage&nbsp;*m&nbs=
p;=3D&nbsp;NULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus&nbsp;*bus&nbsp;=3D&nb=
sp;NULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;temp=5Fbuf&nbsp;=3D&nbsp;NU=
LL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft*&nbsp;get=5Fvalue&nbsp;=3D&nbsp;N=
ULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;connection&nbsp;=3D&nbsp;NULL;<=
br>+&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;r,&nbsp;i;<br>+<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;//&nbsp;Open&nbsp;the&nbsp;system&nbsp;bus&nbsp;where&nbsp;most&nbsp;=
system&nbsp;services&nbsp;are&nbsp;provided.&nbsp;<br>+&nbsp;&nbsp;&nbsp;&n=
bsp;r&nbsp;=3D&nbsp;sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>+&nbsp;&nbsp;&nb=
sp;&nbsp;if&nbsp;(r&nbsp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,&nbsp;"Failed&nbsp;to&nbsp;connect&nbs=
p;to&nbsp;system&nbsp;bus:&nbsp;%s\n",&nbsp;strerror(-r));<br>+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nbsp;&nbsp;&nbsp=
;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;object=5Fmapper=5Fget=5Fconnectio=
n(&amp;connection,&nbsp;settings=5Fobject=5Fname);<br>+&nbsp;&nbsp;&nbsp;&n=
bsp;printf("connection:&nbsp;%s\n",&nbsp;connection);<br>+&nbsp;&nbsp;&nbsp=
;&nbsp;//&nbsp;Bus,&nbsp;service,&nbsp;object&nbsp;path,&nbsp;interface&nbs=
p;and&nbsp;method&nbsp;are&nbsp;provided&nbsp;to&nbsp;call<br>+&nbsp;&nbsp;=
&nbsp;&nbsp;//&nbsp;the&nbsp;method.&nbsp;<br>+&nbsp;&nbsp;&nbsp;&nbsp;//&n=
bsp;Signatures&nbsp;and&nbsp;input&nbsp;arguments&nbsp;are&nbsp;provided&nb=
sp;by&nbsp;the&nbsp;arguments&nbsp;at&nbsp;the<br>+&nbsp;&nbsp;&nbsp;&nbsp;=
//&nbsp;end.<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=5Fbus=5Fcall=5F=
method(bus,<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;connection,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&=
nbsp;service&nbsp;to&nbsp;contact&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;settings=5Fobject=5Fname,&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;object&nbsp=
;path&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;settings=5Fintf=5Fname,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;interface&nbsp;name&nbsp;*/<b=
r>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
"Get",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;/*&nbsp;method&nbsp;name&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;error,&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;object&nbsp;to&n=
bsp;return&nbsp;error&nbsp;in&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;m,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;=
return&nbsp;message&nbsp;on&nbsp;success&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"ss",&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;inp=
ut&nbsp;signature&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;settings=5Fintf=5Fname,&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;first&nbsp;argume=
nt&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;"boot=5Fflags");&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;second&nb=
sp;argument&nbsp;*/<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(r&nbsp;&lt;&n=
bsp;0)&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(s=
tderr,&nbsp;"Failed&nbsp;to&nbsp;issue&nbsp;method&nbsp;call:&nbsp;%s\n",&n=
bsp;error.message);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;got=
o&nbsp;finish;<br>+&nbsp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nb=
sp;//&nbsp;The&nbsp;output&nbsp;should&nbsp;be&nbsp;parsed&nbsp;exactly&nbs=
p;the&nbsp;same&nbsp;as&nbsp;the&nbsp;output&nbsp;formatting<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;//&nbsp;specified.<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbs=
p;sd=5Fbus=5Fmessage=5Fread(m,&nbsp;"v",&nbsp;"s",&nbsp;&amp;temp=5Fbuf);<b=
r>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(r&nbsp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,&nbsp;"Failed&nbsp;t=
o&nbsp;parse&nbsp;response&nbsp;message:&nbsp;%s\n",&nbsp;strerror(-r));<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMID&nbsp;=
boot&nbsp;option&nbsp;property&nbsp;get:&nbsp;{%s}.\n",&nbsp;(char*)&nbsp;t=
emp=5Fbuf);<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;memcpy(buf,&nbsp;temp=5Fbuf,&n=
bsp;2*NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED&nbsp;+&nbsp;1);<br>+<br>+finis=
h:<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>+&nbsp;&nbsp;&nbsp;&=
nbsp;sd=5Fbus=5Funref(bus);<br>+&nbsp;&nbsp;&nbsp;&nbsp;free(connection);<b=
r>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;r;<br>+}<br>+<br>+//&nbsp;TODO:=
&nbsp;object&nbsp;mapper&nbsp;should&nbsp;be&nbsp;used&nbsp;instead&nbsp;of=
&nbsp;hard-coding.<br>+int&nbsp;dbus=5Fset=5Fproperty(const&nbsp;char*&nbsp=
;buf)<br>+{<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Ferror&nbsp;error&nbsp;=
=3D&nbsp;SD=5FBUS=5FERROR=5FNULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fme=
ssage&nbsp;*m&nbsp;=3D&nbsp;NULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus&nbsp=
;*bus&nbsp;=3D&nbsp;NULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;char*&nbsp;connection=
&nbsp;=3D&nbsp;NULL;<br>+&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;r;<br>+<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;//&nbsp;Open&nbsp;the&nbsp;system&nbsp;bus&nbsp;where&nb=
sp;most&nbsp;system&nbsp;services&nbsp;are&nbsp;provided.&nbsp;<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>+&n=
bsp;&nbsp;&nbsp;&nbsp;if&nbsp;(r&nbsp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,&nbsp;"Failed&nbsp;to&nbs=
p;connect&nbsp;to&nbsp;system&nbsp;bus:&nbsp;%s\n",&nbsp;strerror(-r));<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nbs=
p;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;object=5Fmapper=5Fge=
t=5Fconnection(&amp;connection,&nbsp;settings=5Fobject=5Fname);<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;printf("connection:&nbsp;%s\n",&nbsp;connection);<br>+&nbs=
p;&nbsp;&nbsp;&nbsp;//&nbsp;Bus,&nbsp;service,&nbsp;object&nbsp;path,&nbsp;=
interface&nbsp;and&nbsp;method&nbsp;are&nbsp;provided&nbsp;to&nbsp;call<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;the&nbsp;method.&nbsp;<br>+&nbsp;&nbsp;&nb=
sp;&nbsp;//&nbsp;Signatures&nbsp;and&nbsp;input&nbsp;arguments&nbsp;are&nbs=
p;provided&nbsp;by&nbsp;the&nbsp;arguments&nbsp;at&nbsp;the<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;//&nbsp;end.<br>+&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=3D&nbsp;sd=5F=
bus=5Fcall=5Fmethod(bus,<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;connection,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;/*&nbsp;service&nbsp;to&nbsp;contact&nbsp;*/<br>+&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;settings=5Fobject=
=5Fname,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&n=
bsp;object&nbsp;path&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;settings=5Fintf=5Fname,&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;interface&nbsp=
;name&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;"Set",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;method&nbsp;name&nbsp;*/<br>+&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;error,&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;o=
bject&nbsp;to&nbsp;return&nbsp;error&nbsp;in&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;m,&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;/*&nbsp;return&nbsp;message&nbsp;on&nbsp;success&nbsp;*/<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"ssv",&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/=
*&nbsp;input&nbsp;signature&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;settings=5Fintf=5Fname,&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;first&n=
bsp;argument&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;"boot=5Fflags",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*=
&nbsp;second&nbsp;argument&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"s",&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;third&nbsp;a=
rgument&nbsp;*/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;buf);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;fourth&nbsp;argument&nbsp;*/<br>+<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(r&nbsp;&lt;&nbsp;0)&nbsp;{<br>+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,&nbsp;"Failed&nbsp;to=
&nbsp;issue&nbsp;method&nbsp;call:&nbsp;%s\n",&nbsp;error.message);<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto&nbsp;finish;<br>+&nbsp;&n=
bsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMID&nbsp;boot&=
nbsp;option&nbsp;property&nbsp;set:&nbsp;{%s}.\n",&nbsp;buf);<br>+<br>+fini=
sh:<br>+&nbsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>+&n=
bsp;&nbsp;&nbsp;&nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;sd=5Fbus=5Funref(bus);<br>+&nbsp;&nbsp;&nbsp;&nbsp;free(connection);<=
br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;r;<br>+}<br>+<br>void&nbsp;reg=
ister=5Fnetfn=5Fchassis=5Ffunctions()&nbsp;=5F=5Fattribute=5F=5F((construct=
or));<br><br>struct&nbsp;get=5Fsys=5Fboot=5Foptions=5Ft&nbsp;{<br>@@&nbsp;-=
17,6&nbsp;+228,15&nbsp;@@&nbsp;struct&nbsp;get=5Fsys=5Fboot=5Foptions=5Ft&n=
bsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;block;<br>}&nbsp;&nbsp;=5F=
=5Fattribute=5F=5F&nbsp;((packed));<br><br>+struct&nbsp;set=5Fsys=5Fboot=5F=
options=5Ft&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;parameter;<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;data1;<br>+&nbsp;&nbsp;&nbsp;&nbsp=
;uint8=5Ft&nbsp;data2;<br>+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;data3;<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft&nbsp;data4;<br>+&nbsp;&nbsp;&nbsp;&nbsp=
;uint8=5Ft&nbsp;data5;<br>+}&nbsp;&nbsp;=5F=5Fattribute=5F=5F&nbsp;((packed=
));<br>+<br>ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft&=
nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;ipmi=5Frequest=5Ft&nbsp;request,&nbsp;ipmi=5Fresponse=5Ft&nbsp;respon=
se,&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fdata=5Flen=5Ft&nbsp;data=
=5Flen,&nbsp;ipmi=5Fcontext=5Ft&nbsp;context)<br>@@&nbsp;-116,16&nbsp;+336,=
63&nbsp;@@&nbsp;ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Fopt=
ions(ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,<br><br>&nbs=
p;&nbsp;&nbsp;&nbsp;get=5Fsys=5Fboot=5Foptions=5Ft&nbsp;*reqptr&nbsp;=3D&nb=
sp;(get=5Fsys=5Fboot=5Foptions=5Ft*)&nbsp;request;<br><br>-&nbsp;&nbsp;&nbs=
p;&nbsp;//&nbsp;TODO&nbsp;Return&nbsp;default&nbsp;values&nbsp;to&nbsp;OPAL=
&nbsp;until&nbsp;dbus&nbsp;interface&nbsp;is&nbsp;available<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;char*&nbsp;buf&nbsp;=3D&nbsp;(char*)malloc(NUM=5FRETURN=5FBYTE=
S=5FOF=5FGET);<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(reqptr-&gt;paramet=
er&nbsp;=3D=3D&nbsp;5)&nbsp;//&nbsp;Parameter&nbsp;#5<br>+&nbsp;&nbsp;&nbsp=
;&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbus=5Fget=5Fp=
roperty(buf);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=5Ft=
*&nbsp;return=5Fvalue&nbsp;=3D&nbsp;char=5Fto=5Fuint8(buf,&nbsp;NUM=5FRETUR=
N=5FBYTES=5FOF=5FGET=5FUSED);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;*data=5Flen&nbsp;=3D&nbsp;NUM=5FRETURN=5FBYTES=5FOF=5FGET;<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;TODO:&nbsp;last&nbsp;3&n=
bsp;bytes<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;(NUM=
=5FRETURN=5FBYTES=5FOF=5FGET&nbsp;-&nbsp;NUM=5FRETURN=5FBYTES=5FOF=5FGET=5F=
USED)&nbsp;is&nbsp;meanlingless<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;memcpy(response,&nbsp;return=5Fvalue,&nbsp;*data=5Flen);<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(buf);<br>+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(return=5Fvalue);<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;}<br>+&nbsp;&nbsp;&nbsp;&nbsp;else<br>+&nbsp;&nbsp;&nbsp;&nbsp;{<br>+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp;=3D&nbsp;N=
UM=5FRETURN=5FBYTES=5FOF=5FGET;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;//&nbsp;0x80:&nbsp;parameter&nbsp;not&nbsp;supported<br>+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buf[0]&nbsp;=3D&nbsp;0x80;<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;buf,&nbsp;=
*data=5Flen);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(buf)=
;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,&nbsp;=
"Unsupported&nbsp;parameter&nbsp;0x%x\n",&nbsp;reqptr-&gt;parameter);<br>+&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;IPMI=5FCC=5FPARM=
=5FNOT=5FSUPPORTED;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;}<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;rc;<br>=
+}<br>+<br>+ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions=
(ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,&nbsp;<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Frequest=5Ft&nbsp;request,&nbsp;ipmi=5Frespo=
nse=5Ft&nbsp;response,&nbsp;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fdata=
=5Flen=5Ft&nbsp;data=5Flen,&nbsp;ipmi=5Fcontext=5Ft&nbsp;context)<br>+{<br>=
+&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fret=5Ft&nbsp;rc&nbsp;=3D&nbsp;IPMI=5FCC=5FO=
K;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMI&nbsp;SET=5FSYS=5FBOOT=5FOP=
TIONS\n");<br>+&nbsp;&nbsp;&nbsp;&nbsp;printf("IPMID&nbsp;set&nbsp;command&=
nbsp;required&nbsp;return&nbsp;bytes:&nbsp;%i\n",&nbsp;*data=5Flen);<br>+<b=
r>+&nbsp;&nbsp;&nbsp;&nbsp;set=5Fsys=5Fboot=5Foptions=5Ft&nbsp;*reqptr&nbsp=
;=3D&nbsp;(set=5Fsys=5Fboot=5Foptions=5Ft*)&nbsp;request;<br>+<br>+&nbsp;&n=
bsp;&nbsp;&nbsp;char*&nbsp;output=5Fbuf&nbsp;=3D&nbsp;(char*)malloc(NUM=5FR=
ETURN=5FBYTES=5FOF=5FSET);<br><br>&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(reqptr-&=
gt;parameter&nbsp;=3D=3D&nbsp;5)&nbsp;//&nbsp;Parameter&nbsp;#5<br>&nbsp;&n=
bsp;&nbsp;&nbsp;{<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8=
=5Ft&nbsp;buf[]&nbsp;=3D&nbsp;{0x1,0x5,80,0,0,0,0};<br>-&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp;=3D&nbsp;sizeof(buf);<br>-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;&amp;buf=
,&nbsp;*data=5Flen);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ch=
ar*&nbsp;input=5Fbuf&nbsp;=3D&nbsp;uint8=5Fto=5Fchar((uint8=5Ft*)(&amp;(req=
ptr-&gt;data1)),&nbsp;NUM=5FINPUT=5FBYTES=5FOF=5FSET);<br>+&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbus=5Fset=5Fproperty(input=5Fbuf);<br>+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*data=5Flen&nbsp;=3D&nbsp;NUM=
=5FRETURN=5FBYTES=5FOF=5FSET;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;//&nbsp;0x0:&nbsp;return&nbsp;code&nbsp;OK.<br>+&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;output=5Fbuf[0]&nbsp;=3D&nbsp;0x0;<br>+&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;output=5Fbuf,=
&nbsp;*data=5Flen);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fre=
e(output=5Fbuf);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(i=
nput=5Fbuf);<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>&nbsp;&nbsp;&nbsp;&nbsp;else<b=
r>&nbsp;&nbsp;&nbsp;&nbsp;{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;//&nbsp;0x80:&nbsp;parameter&nbsp;not&nbsp;supported<br>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;output=5Fbuf[0]&nbsp;=3D&nbsp;0x80;<br>+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;outpu=
t=5Fbuf,&nbsp;*data=5Flen);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;free(output=5Fbuf);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;fprintf(stderr,&nbsp;"Unsupported&nbsp;parameter&nbsp;0x%x\n",&nbsp;reqptr=
-&gt;parameter);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&=
nbsp;IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>@@&nbsp;-133,6&nbsp;+400,7&nb=
sp;@@&nbsp;ipmi=5Fret=5Ft&nbsp;ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(=
ipmi=5Fnetfn=5Ft&nbsp;netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,<br>&nbsp;&nbsp;&=
nbsp;&nbsp;return&nbsp;rc;<br>}<br><br>+<br>void&nbsp;register=5Fnetfn=5Fch=
assis=5Ffunctions()<br>{<br>&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&nbs=
p;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FWILD=
CARD);<br>@@&nbsp;-141,6&nbsp;+409,9&nbsp;@@&nbsp;void&nbsp;register=5Fnetf=
n=5Fchassis=5Ffunctions()<br>&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&nb=
sp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FGET=
=5FSYS=5FBOOT=5FOPTIONS);<br>&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcall=
back(NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS,&nbsp;N=
ULL,&nbsp;ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);<br><br>+&nbsp;&nbsp=
;&nbsp;&nbsp;printf("Registering&nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETF=
UN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS);<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=
=5FSET=5FSYS=5FBOOT=5FOPTIONS,&nbsp;NULL,&nbsp;ipmi=5Fchassis=5Fset=5Fsys=
=5Fboot=5Foptions);<br>+<br>&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&nbs=
p;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FCHASSIS,&nbsp;IPMI=5FCMD=5FCHAS=
SIS=5FCONTROL);<br>&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFU=
N=5FCHASSIS,&nbsp;IPMI=5FCMD=5FCHASSIS=5FCONTROL,&nbsp;NULL,&nbsp;ipmi=5Fch=
assis=5Fcontrol);<br>}<br>diff&nbsp;--git&nbsp;a/chassishandler.h&nbsp;b/ch=
assishandler.h<br>index&nbsp;1a26411..0164ce1&nbsp;100644<br>---&nbsp;a/cha=
ssishandler.h<br>+++&nbsp;b/chassishandler.h<br>@@&nbsp;-3,12&nbsp;+3,20&nb=
sp;@@<br><br>#include&nbsp;<stdint.h><br><br>+//&nbsp;TODO:&nbsp;Petitboot&=
nbsp;requires&nbsp;8&nbsp;bytes&nbsp;of&nbsp;response<br>+//&nbsp;however&n=
bsp;only&nbsp;5&nbsp;of&nbsp;them&nbsp;are&nbsp;used.<br>+#define&nbsp;NUM=
=5FRETURN=5FBYTES=5FOF=5FGET&nbsp;8<br>+#define&nbsp;NUM=5FRETURN=5FBYTES=
=5FOF=5FGET=5FUSED&nbsp;5<br>+#define&nbsp;NUM=5FRETURN=5FBYTES=5FOF=5FSET&=
nbsp;1<br>+#define&nbsp;NUM=5FINPUT=5FBYTES=5FOF=5FSET&nbsp;5<br>+<br>//&nb=
sp;IPMI&nbsp;commands&nbsp;for&nbsp;Chassis&nbsp;net&nbsp;functions.<br>enu=
m&nbsp;ipmi=5Fnetfn=5Fapp=5Fcmds<br>{<br>        //&nbsp;Chassis&nbsp;Contr=
ol<br>        IPMI=5FCMD=5FCHASSIS=5FCONTROL        &nbsp;&nbsp;=3D&nbsp;0x=
02,<br>&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;Get&nbsp;capability&nbsp;bits<br>+&n=
bsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS&nbsp;=3D&nbsp=
;0x08,<br>&nbsp;&nbsp;&nbsp;&nbsp;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS&n=
bsp;=3D&nbsp;0x09,<br>};<br><br>--&nbsp;<br>2.6.3<br>=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc&nbsp;mailing&nbsp;=
list<br>openbmc@lists.ozlabs.org<br>https://lists.ozlabs.org/listinfo/openb=
mc<br></stdint.h></shgoupf@cn.ibm.com></div></div></div><BR>
</body></html>

------=_Part_10_872690692.1450325644568--
