Return-Path: <austenc@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490421A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 13:43:35 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 2 Dec 2015 19:43:32 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Dec 2015 19:43:31 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 6D5A919D8026
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 19:31:36 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB32hUKr28049412
 for <openbmc@lists.ozlabs.org>; Wed, 2 Dec 2015 19:43:30 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB32hUbP013189
 for <openbmc@lists.ozlabs.org>; Wed, 2 Dec 2015 19:43:30 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB32hTuT013140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 2 Dec 2015 19:43:29 -0700
Message-Id: <201512030243.tB32hTuT013140@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 2 Dec 2015 19:43:29 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 2 Dec 2015 19:43:26 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 3 Dec 2015 02:43:25 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 3 Dec 2015 02:43:23 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015120302444150-16945 ;
 Thu, 3 Dec 2015 02:44:41 +0000 
In-Reply-To: <CACPK8XcFL8UjQJLdHYC3mj76iOnOzEgkzjLvAkuFzTn=rcAsHQ@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] Alignment and double error
From: "Chris Austen" <austenc@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 3 Dec 2015 02:43:21 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XcFL8UjQJLdHYC3mj76iOnOzEgkzjLvAkuFzTn=rcAsHQ@mail.gmail.com>,
 <1449102026-16402-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449102026-16402-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_11162015_FP1 November 18, 2015
X-LLNOutbound: False
X-Disclaimed: 16503
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 000EF49D00257F10_="
x-cbid: 15120302-0005-0000-0000-00001A4C6BB5
X-IBM-ISS-SpamDetectors: Score=0.397557; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397557; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004631; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00625638; UDB=6.00278894; UTC=2015-12-03
 02:43:24
x-cbparentid: 15120302-5938-0000-0000-000001275728
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
X-List-Received-Date: Thu, 03 Dec 2015 02:43:37 -0000


--=_alternative 000EF49D00257F10_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

I removed the sensor reading feature.=C2=A0 I'll use a separate commit for =
that in the next sprint.=20


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: Joel Stanley=20
Sent by: "openbmc"=20
Date: 12/02/2015 06:57PM
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH phosphor-host-ipmid] Alignment and double error

On Thu, Dec 3, 2015 at 10:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> Fixed a pointer pointer issue where no one had the storage for a uint16=
=5Ft
> Fixed the double error log on palmetto systems needed a reconfig loop

These unrelated changes should be two separate commits.

> ---
> =C2=A0ipmid.C =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++++++++---------
> =C2=A0sensorhandler.C | 48 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> =C2=A0sensorhandler.h | =C2=A01 +
> =C2=A0storageaddsel.C | 30 ++++++------------------------
> =C2=A04 files changed, 65 insertions(+), 33 deletions(-)
>
> diff --git a/ipmid.C b/ipmid.C
> index f1f938c..5b17036 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -186,7 +186,7 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fmessage *=
req, unsigned char seq, unsigned ch
>
> =C2=A0 =C2=A0 =C2=A0r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&m=
,dest,path,DBUS=5FINTF,"sendMessage");
> =C2=A0 =C2=A0 =C2=A0if (r < 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to add the method ob=
ject: %s\n", strerror(-r));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to add the method ob=
ject: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> =C2=A0 =C2=A0 =C2=A0}
>
> @@ -198,14 +198,14 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fmessage=
 *req, unsigned char seq, unsigned ch
> =C2=A0 =C2=A0 =C2=A0// Add the bytes needed for the methods to be called
> =C2=A0 =C2=A0 =C2=A0r =3D sd=5Fbus=5Fmessage=5Fappend(m, "yyyyy", seq, ne=
tfn, lun, cmd, cc);
> =C2=A0 =C2=A0 =C2=A0if (r < 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed add the netfn and ot=
hers : %s\n", strerror(-r));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed add the netfn and ot=
hers : %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto final;
> =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0r =3D sd=5Fbus=5Fmessage=5Fappend=5Farray(m, 'y', buf=
, len);
> =C2=A0 =C2=A0 =C2=A0if (r < 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to add the string of=
 response bytes: %s\n", strerror(-r));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to add the string of=
 response bytes: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto final;
> =C2=A0 =C2=A0 =C2=A0}
>
>
> @@ -213,18 +213,19 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fmessage=
 *req, unsigned char seq, unsigned ch
> =C2=A0 =C2=A0 =C2=A0// Call the IPMI responder on the bus so the message =
can be sent to the CEC
> =C2=A0 =C2=A0 =C2=A0r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> =C2=A0 =C2=A0 =C2=A0if (r < 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to call the method: =
%s", strerror(-r));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Failed to call the method: =
%s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0goto final;
> =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0r =3D sd=5Fbus=5Fmessage=5Fread(reply, "x", &pty);
> =C2=A0 =C2=A0 =C2=A0if (r < 0) {
> - =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Failed to get a rc from the metho=
d: %s\n", strerror(-r));
> -
> + =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Failed to get a rc from the metho=
d: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));
> =C2=A0 =C2=A0 =C2=A0}
>
> +final:
> =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Ferror=5Ffree(&error);
> =C2=A0 =C2=A0 =C2=A0sd=5Fbus=5Fmessage=5Funref(m);
> + =C2=A0 =C2=A0sd=5Fbus=5Fmessage=5Funref(reply);
>
>
> =C2=A0 =C2=A0 =C2=A0return r < 0 ? EXIT=5FFAILURE : EXIT=5FSUCCESS;
> diff --git a/sensorhandler.C b/sensorhandler.C
> index dd83152..131da71 100644
> --- a/sensorhandler.C
> +++ b/sensorhandler.C
> @@ -29,6 +29,7 @@ sensorTypemap=5Ft g=5FSensorTypeMap[] =3D {
> =C2=A0 =C2=A0 =C2=A0{0xe9, 0x09, "OccStatus"}, =C2=A0// E9 is an internal=
 mapping to handle sensor type code os 0x09
> =C2=A0 =C2=A0 =C2=A0{0xC3, 0x6F, "BootCount"},
> =C2=A0 =C2=A0 =C2=A0{0x1F, 0x6F, "OperatingSystemStatus"},
> + =C2=A0 =C2=A0{0x12, 0x6F, "SYSTEM"},
> =C2=A0 =C2=A0 =C2=A0{0xFF, 0x00, ""},
> =C2=A0};
>
> @@ -39,6 +40,14 @@ struct sensor=5Fdata=5Ft {
> =C2=A0} =C2=A0=5F=5Fattribute=5F=5F ((packed)) ;
>
>
> +struct sensor=5Freading=5Fret=5Ft {
> + =C2=A0 =C2=A0uint8=5Ft reading;
> + =C2=A0 =C2=A0uint8=5Ft options;
> + =C2=A0 =C2=A0uint8=5Ft assert[2];
> +} =C2=A0=5F=5Fattribute=5F=5F ((packed)) ;
> +
> +
> +

Whitespace

> =C2=A0uint8=5Ft dbus=5Fto=5Fsensor=5Ftype(char *p) {
>
> =C2=A0 =C2=A0 =C2=A0sensorTypemap=5Ft *s =3D g=5FSensorTypeMap;
> @@ -155,6 +164,42 @@ ipmi=5Fret=5Ft ipmi=5Fsen=5Fset=5Fsensor(ipmi=5Fnetf=
n=5Ft netfn, ipmi=5Fcmd=5Ft cmd,
> =C2=A0 =C2=A0 =C2=A0return rc;
> =C2=A0}
>
> +

Whitespace

> +ipmi=5Fret=5Ft ipmi=5Fsen=5Fget=5Fsensor=5Freading(ipmi=5Fnetfn=5Ft netf=
n, ipmi=5Fcmd=5Ft cmd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft=
 response,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontex=
t=5Ft context)
> +{
> + =C2=A0 =C2=A0sensor=5Fdata=5Ft *reqptr =3D (sensor=5Fdata=5Ft*)request;
> + =C2=A0 =C2=A0sensor=5Freading=5Fret=5Ft ret;
> + =C2=A0 =C2=A0ipmi=5Fret=5Ft rc;
> +
> + =C2=A0 =C2=A0printf("IPMI GET=5FSENSOR=5FREADING [0x%02x]\n",reqptr->se=
nnum);
> +
> +

Whitespace

> + =C2=A0 =C2=A0// TODO Call dbus method to get teh real state of the sens=
or and
> + =C2=A0 =C2=A0// translate it to IPMI. =C2=A0For now stop every boot of =
a Palmetto
> + =C2=A0 =C2=A0// from creating error logs about missing the Reboot Senso=
r.
> + =C2=A0 =C2=A0if (reqptr->sennum =3D=3D 9) {

Give the magic number a name.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret.reading =3D 2;

Again, what does 2 mean?

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret.options =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret.assert[0] =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret.assert[1] =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*data=5Flen =3D sizeof(ret);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(response, &ret, *data=5Flen);

Is there a reason why you create the local ret, and then copy the
results in to response? Could you just put the data straight into
response?

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D IPMI=5FCC=5FOK;
> +
> + =C2=A0 =C2=A0} else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*data=5Flen =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D IPMI=5FCC=5FSENSOR=5FINVALID;
> + =FF =FF}
> +
> +

Whitespace

> + =FF =FFreturn rc;
> +}
> +
> +
> +

Whitespace.

> =FFipmi=5Fret=5Ft ipmi=5Fsen=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcm=
d=5Ft cmd,
> =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF ipmi=5Freques=
t=5Ft request, ipmi=5Fresponse=5Ft response,
> =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF =FF ipmi=5Fdata=
=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)
> @@ -179,5 +224,8 @@ void register=5Fnetfn=5Fsen=5Ffunctions()
> =FF =FF =FFprintf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FSENSO=
R, IPMI=5FCMD=5FSET=5FSENSOR);
> =FF =FF =FFipmi=5Fregister=5Fcallback(NETFUN=5FSENSOR, IPMI=5FCMD=5FSET=
=5FSENSOR, NULL, ipmi=5Fsen=5Fset=5Fsensor);
>
> + =FF =FFprintf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FSENSOR,=
 IPMI=5FCMD=5FGET=5FSENSOR=5FREADING);
> + =FF =FFipmi=5Fregister=5Fcallback(NETFUN=5FSENSOR, IPMI=5FCMD=5FGET=5FS=
ENSOR=5FREADING, NULL, ipmi=5Fsen=5Fget=5Fsensor=5Freading);
> +
> =FF =FF =FFreturn;

This is redundant.

> =FF}
> diff --git a/sensorhandler.h b/sensorhandler.h
> index 7b89a18..dd940dc 100644
> --- a/sensorhandler.h
> +++ b/sensorhandler.h
> @@ -6,6 +6,7 @@
> =FF// IPMI commands for net functions.
> =FFenum ipmi=5Fnetfn=5Fsen=5Fcmds
> =FF{
> + =FF =FFIPMI=5FCMD=5FGET=5FSENSOR=5FREADING =3D 0x2D,
> =FF =FF =FFIPMI=5FCMD=5FGET=5FSENSOR=5FTYPE =3D 0x2F,
> =FF =FF =FFIPMI=5FCMD=5FSET=5FSENSOR =FF =FF =FF=3D 0x30,
> =FF};
> diff --git a/storageaddsel.C b/storageaddsel.C
> index 345dfd5..991c78d 100644
> --- a/storageaddsel.C
> +++ b/storageaddsel.C
> @@ -155,7 +155,7 @@ int send=5Fesel=5Fto=5Fdbus(const char *desc, const c=
har *sev, const char *details, ui
> =FF =FF =FF =FF sd=5Fbus *mbus =3D NULL;
> =FF =FF =FFsd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> =FF =FF =FFsd=5Fbus=5Fmessage *reply =3D NULL, *m=3DNULL;
> - =FF =FFuint16=5Ft *pty;
> + =FF =FFuint16=5Ft x;

Use a more descriptive name than "x".

> =FF =FF =FFint r;
>
> =FF =FF =FFmbus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> @@ -181,26 +181,22 @@ int send=5Fesel=5Fto=5Fdbus(const char *desc, const=
 char *sev, const char *details, ui
> =FF =FF =FF =FF =FFfprintf(stderr, "Failed to add the raw array of bytes:=
 %s\n", strerror(-r));
> =FF =FF =FF =FF =FFreturn -1;
> =FF =FF =FF}
> -
> =FF =FF =FF// Call the IPMI responder on the bus so the message can be se=
nt to the CEC
> =FF =FF =FFr =3D sd=5Fbus=5Fcall(mbus, m, 0, &error, &reply);
> =FF =FF =FFif (r < 0) {
> - =FF =FF =FF =FFfprintf(stderr, "Failed to call the method: %s", strerro=
r(-r));
> + =FF =FF =FF =FFfprintf(stderr, "Failed to call the method: %s %s\n", =
=5F=5FFUNCTION=5F=5F, strerror(-r));

Systemd gives us a string in error->message. You could print that
instead of strerror.

> =FF =FF =FF =FF =FFreturn -1;
> =FF =FF =FF}
> -
> - =FF =FFr =3D sd=5Fbus=5Fmessage=5Fread(reply, "q", &pty);
> + =FF =FFr =3D sd=5Fbus=5Fmessage=5Fread(reply, "q", &x);
> =FF =FF =FFif (r < 0) {
> =FF =FF =FF =FF =FFfprintf(stderr, "Failed to get a rc from the method: %=
s\n", strerror(-r));
> - =FF =FF} else {
> - =FF =FF =FF =FFr =3D *pty;
> =FF =FF =FF}
>
> +finish:

storageaddsel.C:195:1: warning: label =01+finish=01, defined but not used
[-Wunused-label]
=FFfinish:
=FF^

> =FF =FF =FFsd=5Fbus=5Ferror=5Ffree(&error);
> =FF =FF =FFsd=5Fbus=5Fmessage=5Funref(m);
> =FF =FF =FFsd=5Fbus=5Fmessage=5Funref(reply);
> -
> - =FF =FFreturn r;
> + =FF =FFreturn 0;

This function will print an error message when sd=5Fbus=5Fmessage=5Fread
fails, but will always return zero now. Is that the intention?

> =FF}
>
>
> @@ -213,41 +209,27 @@ void send=5Fesel(uint16=5Ft recordid) {
> =FF =FF =FF =FF int r;
>
> =FF =FF =FF =FF uint8=5Ft hack[] =3D {0x30, 0x32, 0x34};
> -
> =FF =FF =FF =FF asprintf(&path,"%s%04x", "/tmp/esel", recordid);
> -
> =FF =FF =FF =FF sz =3D getfilestream(path, &buffer);
> -
> =FF =FF =FF =FF if (sz =3D=3D 0) {
> =FF =FF =FF =FF =FF =FF =FF =FF printf("Error file does not exist %d\n",=
=5F=5FLINE=5F=5F);
> =FF =FF =FF =FF =FF =FF =FF =FF free(path);
> =FF =FF =FF =FF =FF =FF =FF =FF return;
> =FF =FF =FF =FF }
>
> -
> =FF =FF =FF =FF sev =3D create=5Fesel=5Fseverity(buffer);
> -
> =FF =FF =FF =FF create=5Fesel=5Fassociation(buffer, &assoc);
> -
> =FF =FF =FF =FF create=5Fesel=5Fdescription(buffer, sev, &desc);
>
> -
> =FF =FF =FF =FF // TODO until ISSUE https://github.com/openbmc/rest-dbus/=
issues/2
> =FF =FF =FF =FF // I cant send extended ascii chars. =FFSo 0,2,4 for now.=
..
> - =FF =FF =FF r =3D send=5Fesel=5Fto=5Fdbus(desc, sev, assoc, hack, 3);
> -
> - =FF =FF =FF asprintf(&pathsent,"%s=5F%d", path, r);
> -
> -
> - =FF =FF =FF rename(path, pathsent);

storageaddsel.C: In function =01+void send=5Fesel(uint16=5Ft)=01,:
storageaddsel.C:209:6: warning: unused variable =01+r=01, [-Wunused-variabl=
e]
=FF=FFint r;
=FF=FF =FF =FF^
storageaddsel.C:229:16: warning: =01+pathsent=01, may be used uninitialized
in this function [-Wmaybe-uninitialized]
=FF=FFfree(pathsent);
=FF=FF =FF =FF =FF =FF =FF =FF =FF^
storageaddsel.C:207:15: note: =01+pathsent=01, was declared here
=FF=FFchar *path, *pathsent;
=FF=FF =FF =FF =FF =FF =FF =FF ^

> + =FF =FF =FF send=5Fesel=5Fto=5Fdbus(desc, sev, assoc, hack, 3);
>
> =FF =FF =FF =FF free(path);
> =FF =FF =FF =FF free(pathsent);
> =FF =FF =FF =FF free(assoc);
> =FF =FF =FF =FF free(desc);
> -
> =FF =FF =FF =FF delete[] buffer;
>
> -
> =FF =FF =FF =FF return;
> =FF}
> --
> 2.6.3
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



--=_alternative 000EF49D00257F10_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Content-ID: <>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">I removed the sensor reading feature.&nbsp; I'll use a separate comm=
it for that<span> in the next sprint. <br><br><br>Chris Austen<br>POWER Sys=
tems Enablement Manager <br>(512) 286-5184 (T/L: 363-5184)</span><br><br><f=
ont color=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fblank" href=3D"mai=
lto:openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org">openbmc-bounces+=
austenc=3Dus.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</font><div class=
=3D"iNotesHistory" style=3D"padding-left:5px;"><div style=3D"padding-right:=
0px;padding-left:5px;border-left:solid black 2px;">To: OpenBMC Patches &lt;=
<a target=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-pa=
tches@stwcx.xyz</a>&gt;<br>From: Joel Stanley <joel@jms.id.au><br>Sent by: =
"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org><br>Date: =
12/02/2015 06:57PM<br>Cc: OpenBMC Maillist &lt;<a target=3D"=5Fblank" href=
=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;<br>Su=
bject: Re: [PATCH phosphor-host-ipmid] Alignment and double error<br><br><d=
iv><font size=3D"2" face=3D"Courier New,Courier,monospace">On Thu, Dec 3, 2=
015 at 10:50 AM, OpenBMC Patches<br>&lt;<a target=3D"=5Fblank" href=3D"mail=
to:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt; wrote:<br>&=
gt; From: Chris Austen &lt;<a target=3D"=5Fblank" href=3D"mailto:austenc@us=
.ibm.com">austenc@us.ibm.com</a>&gt;<br>&gt;<br>&gt; Fixed a pointer pointe=
r issue where no one had the storage for a uint16=5Ft<br>&gt; Fixed the dou=
ble error log on palmetto systems needed a reconfig loop<br><br>These unrel=
ated changes should be two separate commits.<br><br>&gt; ---<br>&gt; &nbsp;=
ipmid.C &nbsp; &nbsp; &nbsp; &nbsp; | 19 ++++++++++---------<br>&gt; &nbsp;=
sensorhandler.C | 48 ++++++++++++++++++++++++++++++++++++++++++++++++<br>&g=
t; &nbsp;sensorhandler.h | &nbsp;1 +<br>&gt; &nbsp;storageaddsel.C | 30 +++=
+++------------------------<br>&gt; &nbsp;4 files changed, 65 insertions(+)=
, 33 deletions(-)<br>&gt;<br>&gt; diff --git a/ipmid.C b/ipmid.C<br>&gt; in=
dex f1f938c..5b17036 100644<br>&gt; --- a/ipmid.C<br>&gt; +++ b/ipmid.C<br>=
&gt; @@ -186,7 +186,7 @@ static int send=5Fipmi=5Fmessage(sd=5Fbus=5Fmessag=
e *req, unsigned char seq, unsigned ch<br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp;=
r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,dest,path,DBUS=5F=
INTF,"sendMessage");<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; - =
&nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to add the method object=
: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr=
, "Failed to add the method object: %s %s\n", =5F=5FFUNCTION=5F=5F, strerro=
r(-r));<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &nbsp;=
 &nbsp; &nbsp;}<br>&gt;<br>&gt; @@ -198,14 +198,14 @@ static int send=5Fipm=
i=5Fmessage(sd=5Fbus=5Fmessage *req, unsigned char seq, unsigned ch<br>&gt;=
 &nbsp; &nbsp; &nbsp;// Add the bytes needed for the methods to be called<b=
r>&gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(m, "yyyyy", se=
q, netfn, lun, cmd, cc);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt=
; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed add the netfn and ot=
hers : %s\n", strerror(-r));<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed add the netf=
n and others : %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<b=
r>&gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend=5Farray(m, 'y'=
, buf, len);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; - &nbsp; &=
nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to add the string of response by=
tes: %s\n", strerror(-r));<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to add the str=
ing of response bytes: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;goto final;<br>&gt; &nbsp; &nbsp; &nbsp;}<b=
r>&gt;<br>&gt;<br>&gt; @@ -213,18 +213,19 @@ static int send=5Fipmi=5Fmessa=
ge(sd=5Fbus=5Fmessage *req, unsigned char seq, unsigned ch<br>&gt; &nbsp; &=
nbsp; &nbsp;// Call the IPMI responder on the bus so the message can be sen=
t to the CEC<br>&gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(bus, m, 0, &=
amp;error, &amp;reply);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt;=
 - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to call the method: %=
s", strerror(-r));<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to call the method: %s=
 %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;goto final;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; &nbsp; &nb=
sp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread(reply, "x", &amp;pty);<br>&gt; &n=
bsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; - &nbsp; &nbsp; &nbsp; fprintf(st=
derr, "Failed to get a rc from the method: %s\n", strerror(-r));<br>&gt; -<=
br>&gt; + &nbsp; &nbsp; &nbsp; fprintf(stderr, "Failed to get a rc from the=
 method: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));<br>&gt; &nbsp; &nbs=
p; &nbsp;}<br>&gt;<br>&gt; +final:<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fe=
rror=5Ffree(&amp;error);<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Fu=
nref(m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt;<=
br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp;return r &lt; 0 ? EXIT=5FFAILURE : EXIT=
=5FSUCCESS;<br>&gt; diff --git a/sensorhandler.C b/sensorhandler.C<br>&gt; =
index dd83152..131da71 100644<br>&gt; --- a/sensorhandler.C<br>&gt; +++ b/s=
ensorhandler.C<br>&gt; @@ -29,6 +29,7 @@ sensorTypemap=5Ft g=5FSensorTypeMa=
p[] =3D {<br>&gt; &nbsp; &nbsp; &nbsp;{0xe9, 0x09, "OccStatus"}, &nbsp;// E=
9 is an internal mapping to handle sensor type code os 0x09<br>&gt; &nbsp; =
&nbsp; &nbsp;{0xC3, 0x6F, "BootCount"},<br>&gt; &nbsp; &nbsp; &nbsp;{0x1F, =
0x6F, "OperatingSystemStatus"},<br>&gt; + &nbsp; &nbsp;{0x12, 0x6F, "SYSTEM=
"},<br>&gt; &nbsp; &nbsp; &nbsp;{0xFF, 0x00, ""},<br>&gt; &nbsp;};<br>&gt;<=
br>&gt; @@ -39,6 +40,14 @@ struct sensor=5Fdata=5Ft {<br>&gt; &nbsp;} &nbsp=
;=5F=5Fattribute=5F=5F ((packed)) ;<br>&gt;<br>&gt;<br>&gt; +struct sensor=
=5Freading=5Fret=5Ft {<br>&gt; + &nbsp; &nbsp;uint8=5Ft reading;<br>&gt; + =
&nbsp; &nbsp;uint8=5Ft options;<br>&gt; + &nbsp; &nbsp;uint8=5Ft assert[2];=
<br>&gt; +} &nbsp;=5F=5Fattribute=5F=5F ((packed)) ;<br>&gt; +<br>&gt; +<br=
>&gt; +<br><br>Whitespace<br><br>&gt; &nbsp;uint8=5Ft dbus=5Fto=5Fsensor=5F=
type(char *p) {<br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp;sensorTypemap=5Ft *s =
=3D g=5FSensorTypeMap;<br>&gt; @@ -155,6 +164,42 @@ ipmi=5Fret=5Ft ipmi=5Fs=
en=5Fset=5Fsensor(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp=
; &nbsp; &nbsp;return rc;<br>&gt; &nbsp;}<br>&gt;<br>&gt; +<br><br>Whitespa=
ce<br><br>&gt; +ipmi=5Fret=5Ft ipmi=5Fsen=5Fget=5Fsensor=5Freading(ipmi=5Fn=
etfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=
=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<b=
r>&gt; +{<br>&gt; + &nbsp; &nbsp;sensor=5Fdata=5Ft *reqptr =3D (sensor=5Fda=
ta=5Ft*)request;<br>&gt; + &nbsp; &nbsp;sensor=5Freading=5Fret=5Ft ret;<br>=
&gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft rc;<br>&gt; +<br>&gt; + &nbsp; &nbsp;pri=
ntf("IPMI GET=5FSENSOR=5FREADING [0x%02x]\n",reqptr-&gt;sennum);<br>&gt; +<=
br>&gt; +<br><br>Whitespace<br><br>&gt; + &nbsp; &nbsp;// TODO Call dbus me=
thod to get teh real state of the sensor and<br>&gt; + &nbsp; &nbsp;// tran=
slate it to IPMI. &nbsp;For now stop every boot of a Palmetto<br>&gt; + &nb=
sp; &nbsp;// from creating error logs about missing the Reboot Sensor.<br>&=
gt; + &nbsp; &nbsp;if (reqptr-&gt;sennum =3D=3D 9) {<br><br>Give the magic =
number a name.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret.reading =3D 2;<=
br><br>Again, what does 2 mean?<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;re=
t.options =3D 0;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret.assert[0] =3D 0;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret.assert[1] =3D 0;<br>&gt; +<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(ret);<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;memcpy(response, &amp;ret, *data=5Flen);<br><br>Is the=
re a reason why you create the local ret, and then copy the<br>results in t=
o response? Could you just put the data straight into<br>response?<br><br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D=
 0;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FSENSOR=5FINVALI=
D;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; +<br><br>Whitespace<br><br>&g=
t; + &nbsp; &nbsp;return rc;<br>&gt; +}<br>&gt; +<br>&gt; +<br>&gt; +<br><b=
r>Whitespace.<br><br>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5Fsen=5Fwildcard(ipmi=
=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5F=
t context)<br>&gt; @@ -179,5 +224,8 @@ void register=5Fnetfn=5Fsen=5Ffuncti=
ons()<br>&gt; &nbsp; &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x=
%X]\n",NETFUN=5FSENSOR, IPMI=5FCMD=5FSET=5FSENSOR);<br>&gt; &nbsp; &nbsp; &=
nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FSENSOR, IPMI=5FCMD=5FSET=5FSENSOR,=
 NULL, ipmi=5Fsen=5Fset=5Fsensor);<br>&gt;<br>&gt; + &nbsp; &nbsp;printf("R=
egistering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FSENSOR, IPMI=5FCMD=5FGET=5F=
SENSOR=5FREADING);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=
=5FSENSOR, IPMI=5FCMD=5FGET=5FSENSOR=5FREADING, NULL, ipmi=5Fsen=5Fget=5Fse=
nsor=5Freading);<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;return;<br><br>This =
is redundant.<br><br>&gt; &nbsp;}<br>&gt; diff --git a/sensorhandler.h b/se=
nsorhandler.h<br>&gt; index 7b89a18..dd940dc 100644<br>&gt; --- a/sensorhan=
dler.h<br>&gt; +++ b/sensorhandler.h<br>&gt; @@ -6,6 +6,7 @@<br>&gt; &nbsp;=
// IPMI commands for net functions.<br>&gt; &nbsp;enum ipmi=5Fnetfn=5Fsen=
=5Fcmds<br>&gt; &nbsp;{<br>&gt; + &nbsp; &nbsp;IPMI=5FCMD=5FGET=5FSENSOR=5F=
READING =3D 0x2D,<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5FGET=5FSENSOR=5FT=
YPE =3D 0x2F,<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5FSET=5FSENSOR &nbsp; =
&nbsp; &nbsp;=3D 0x30,<br>&gt; &nbsp;};<br>&gt; diff --git a/storageaddsel.=
C b/storageaddsel.C<br>&gt; index 345dfd5..991c78d 100644<br>&gt; --- a/sto=
rageaddsel.C<br>&gt; +++ b/storageaddsel.C<br>&gt; @@ -155,7 +155,7 @@ int =
send=5Fesel=5Fto=5Fdbus(const char *desc, const char *sev, const char *deta=
ils, ui<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; sd=5Fbus *mbus =3D NULL;<br>&gt=
; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<b=
r>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL, *m=3DNULL;<b=
r>&gt; - &nbsp; &nbsp;uint16=5Ft *pty;<br>&gt; + &nbsp; &nbsp;uint16=5Ft x;=
<br><br>Use a more descriptive name than "x".<br><br>&gt; &nbsp; &nbsp; &nb=
sp;int r;<br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp;mbus =3D ipmid=5Fget=5Fsd=5Fb=
us=5Fconnection();<br>&gt; @@ -181,26 +181,22 @@ int send=5Fesel=5Fto=5Fdbu=
s(const char *desc, const char *sev, const char *details, ui<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to add the raw array of=
 bytes: %s\n", strerror(-r));<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret=
urn -1;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp=
;// Call the IPMI responder on the bus so the message can be sent to the CE=
C<br>&gt; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall(mbus, m, 0, &amp;error,=
 &amp;reply);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; - &nbsp; =
&nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to call the method: %s", strerr=
or(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to ca=
ll the method: %s %s\n", =5F=5FFUNCTION=5F=5F, strerror(-r));<br><br>System=
d gives us a string in error-&gt;message. You could print that<br>instead o=
f strerror.<br><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt=
; &nbsp; &nbsp; &nbsp;}<br>&gt; -<br>&gt; - &nbsp; &nbsp;r =3D sd=5Fbus=5Fm=
essage=5Fread(reply, "q", &amp;pty);<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fmessage=5Fread(reply, "q", &amp;x);<br>&gt; &nbsp; &nbsp; &nbsp;if (r &l=
t; 0) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed t=
o get a rc from the method: %s\n", strerror(-r));<br>&gt; - &nbsp; &nbsp;} =
else {<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;r =3D *pty;<br>&gt; &nbsp; &nbs=
p; &nbsp;}<br>&gt;<br>&gt; +finish:<br><br>storageaddsel.C:195:1: warning: =
label =E2=80=98finish=E2=80=99 defined but not used<br>[-Wunused-label]<br>=
&nbsp;finish:<br>&nbsp;^<br><br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=
=5Ffree(&amp;error);<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref=
(m);<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt;=
 -<br>&gt; - &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;return 0;<br><br=
>This function will print an error message when sd=5Fbus=5Fmessage=5Fread<b=
r>fails, but will always return zero now. Is that the intention?<br><br>&gt=
; &nbsp;}<br>&gt;<br>&gt;<br>&gt; @@ -213,41 +209,27 @@ void send=5Fesel(ui=
nt16=5Ft recordid) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; int r;<br>&gt;<br>=
&gt; &nbsp; &nbsp; &nbsp; &nbsp; uint8=5Ft hack[] =3D {0x30, 0x32, 0x34};<b=
r>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; asprintf(&amp;path,"%s%04x", "=
/tmp/esel", recordid);<br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; sz =3D=
 getfilestream(path, &amp;buffer);<br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; if (sz =3D=3D 0) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; printf("Error file does not exist %d\n",=5F=5FLINE=5F=5F);<br=
>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; free(path);<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt;<br>&gt; -<br>&gt; &nbsp; &nbsp; &=
nbsp; &nbsp; sev =3D create=5Fesel=5Fseverity(buffer);<br>&gt; -<br>&gt; &n=
bsp; &nbsp; &nbsp; &nbsp; create=5Fesel=5Fassociation(buffer, &amp;assoc);<=
br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; create=5Fesel=5Fdescription(b=
uffer, sev, &amp;desc);<br>&gt;<br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp; &nbs=
p; // TODO until ISSUE <a href=3D"https://github.com/openbmc/rest-dbus/issu=
es/2">https://github.com/openbmc/rest-dbus/issues/2</a><br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; // I cant send extended ascii chars. &nbsp;So 0,2,4 for no=
w...<br>&gt; - &nbsp; &nbsp; &nbsp; r =3D send=5Fesel=5Fto=5Fdbus(desc, sev=
, assoc, hack, 3);<br>&gt; -<br>&gt; - &nbsp; &nbsp; &nbsp; asprintf(&amp;p=
athsent,"%s=5F%d", path, r);<br>&gt; -<br>&gt; -<br>&gt; - &nbsp; &nbsp; &n=
bsp; rename(path, pathsent);<br><br>storageaddsel.C: In function =E2=80=98v=
oid send=5Fesel(uint16=5Ft)=E2=80=99:<br>storageaddsel.C:209:6: warning: un=
used variable =E2=80=98r=E2=80=99 [-Wunused-variable]<br>&nbsp;&nbsp;int r;=
<br>&nbsp;&nbsp; &nbsp; &nbsp;^<br>storageaddsel.C:229:16: warning: =E2=80=
=98pathsent=E2=80=99 may be used uninitialized<br>in this function [-Wmaybe=
-uninitialized]<br>&nbsp;&nbsp;free(pathsent);<br>&nbsp;&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^<br>storageaddsel.C:207:15: note: =E2=
=80=98pathsent=E2=80=99 was declared here<br>&nbsp;&nbsp;char *path, *paths=
ent;<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^<br><br>&gt=
; + &nbsp; &nbsp; &nbsp; send=5Fesel=5Fto=5Fdbus(desc, sev, assoc, hack, 3)=
;<br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; free(path);<br>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp; free(pathsent);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; free=
(assoc);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; free(desc);<br>&gt; -<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; delete[] buffer;<br>&gt;<br>&gt; -<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; return;<br>&gt; &nbsp;}<br>&gt; --<br>&gt; 2.6.3<br=
>&gt;<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; <a target=3D"=5Fblank"=
 href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&=
gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozl=
abs.org/listinfo/openbmc</a><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br><a target=3D"=5Fblank" =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br><a=
 href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.or=
g/listinfo/openbmc</a><br></font></div></openbmc-bounces+austenc=3Dus.ibm.c=
om@lists.ozlabs.org></joel@jms.id.au></div></div></font><BR>
--=_alternative 000EF49D00257F10_=--
