Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0493E1A0014
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 12:30:05 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 23 Nov 2015 20:30:02 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 23 Nov 2015 20:30:00 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 3C8E9C9003C
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:18:09 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAO1TxPW21430344
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:29:59 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAO1TxEn014164
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:29:59 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAO1TwQq014121
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:29:58 -0500
Message-Id: <201511240129.tAO1TwQq014121@d01av01.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 23 Nov 2015 18:29:58 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 23 Nov 2015 18:29:55 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 24 Nov 2015 01:29:54 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 24 Nov 2015 01:29:52 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015112401295153-516952 ;
 Tue, 24 Nov 2015 01:29:51 +0000 
In-Reply-To: <20151123221402.GA19499@asimov.austin.ibm.com>
Subject: Re: [PATCH ipmi-fru-parser v2] eeprom read CLI
From: "Chris Austen" <austenc@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 24 Nov 2015 01:29:50 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <20151123221402.GA19499@asimov.austin.ibm.com>,
 <1448035211-29526-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448035211-29526-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_11092015_FP2 November 12, 2015
X-LLNOutbound: False
X-Disclaimed: 56943
X-TNEFEvaluated: 1
Content-Type: multipart/mixed; boundary="=_mixed 000839B100257F07_="
x-cbid: 15112401-0041-0000-0000-0000027739A5
X-IBM-ISS-SpamDetectors: Score=0.384944; BY=0.257773; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.384944; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004606; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00621727; UDB=6.00276311; UTC=2015-11-24
 01:29:53
x-cbparentid: 15112401-5920-0000-0000-00000508D6BF
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
X-List-Received-Date: Tue, 24 Nov 2015 01:30:06 -0000

--=_mixed 000839B100257F07_=
Content-Type: multipart/alternative; boundary="=_alternative 000839B100257F07_="



--=_alternative 000839B100257F07_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

=20
Vishwa, attached are the changes needed to make your code compile and not h=
it link issues when we run it on the test system.=C2=A0 Looks like you stil=
l need to fix some things from Patricks review but this will take care of t=
he makefile issues.

Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: Patrick Williams=20
Sent by: "openbmc"=20
Date: 11/23/2015 04:14PM
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v2] eeprom read CLI

On Fri, Nov 20, 2015 at 11:00:11AM -0500, OpenBMC Patches wrote:
> From: vishwa <vishwanath@in.ibm.com>
> =C2=A0define =5F=5FBUILD=5FEXE
> =C2=A0$1 : $$($1=5FOBJS) $$(LIBS)
> -		$$(LINK.cpp) -o $$@ $$^ $(call =5F=5FPKG=5FCONFIG,$($1=5FNEEDED),--lib=
s)
> +		$$(LINK.cpp) -o $$@ $$^ $(call =5F=5FPKG=5FCONFIG,$($1=5FNEEDED),--lib=
s)=20

Remove whitespace change.

> =C2=A0define =5F=5FBUILD=5FLIB
> =C2=A0$1 : $$($1=5FOBJS)
> -		$$(LINK.cpp) -shared -o $$@ $$^ $(call =5F=5FPKG=5FCONFIG,$($1=5FNEEDE=
D),--libs)
> +		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call =5F=5FEXTRA=5FLIB=5FRESOL=
V,$($1=5FEXTRA=5FLIBS)) $(call =5F=5FPKG=5FCONFIG,$($1=5FNEEDED),--libs)=20

This is causing $1=5FEXTRA=5FLIBS to be added as an argument directly.
=C2=A0=C2=A0 1) You need to add the $1=5FEXTRA=5FLIBS to the dependency abo=
ve.
=C2=A0=C2=A0 =C2=A0 =C2=A0 $1 : $$($1=5FOBJS) $$($1=5FEXTRA=5FLIBS)
=C2=A0=C2=A0 2) You should be using -l<library> instead so that it continue=
s to be
=C2=A0=C2=A0 =C2=A0 =C2=A0dynamically linked.

> diff --git a/readeeprom.C b/readeeprom.C
> new file mode 100644
> index 0000000..27adfa1
> --- /dev/null
> +++ b/readeeprom.C
> @@ -0,0 +1,73 @@
> +#include <iostream>
> +#include <memory>
> +#include "argument.H"
> +#include "writefrudata.H"
> +
> +// FRU ID of VPD contaied in BMC accessible EEPROM
> +#define BARRELEYE=5FIO=5FBOARD	 	 64

There should not be any system-specific #define in this program. =C2=A0Get =
it
passed as an argument if you need it.

> +//----------------------------------------------------------------------=
----
> +// This gets called by udev monitor soon after seeing hog plugs for EEPR=
OMS.=20
> +//----------------------------------------------------------------------=
----
> +int main(int argc, char **argv)
> +{
> +	int rc =3D 0;
> +
> +	// Handle to per process system bus
> +	sd=5Fbus *bus=5Ftype =3D NULL;
> +
> +	// Read the arguments.
> +	auto cli=5Foptions =3D std::make=5Funique<ArgumentParser>(argc, argv);
> +=09
> +	// Parse out each argument.
> +	auto eeprom=5Ffile =3D (*cli=5Foptions)["eeprom"];
> + =C2=A0 =C2=A0if (eeprom=5Ffile =3D=3D ArgumentParser::empty=5Fstring)
> + =C2=A0 =C2=A0{
> +		// User has not passed in the appropriate argument value
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0exit=5Fwith=5Ferror("eeprom data not found."=
, argv);
> + =C2=A0 =C2=A0}
> +
> +	auto fruid=5Fstr =3D (*cli=5Foptions)["fruid"];
> + =C2=A0 =C2=A0if (eeprom=5Ffile =3D=3D ArgumentParser::empty=5Fstring)
> + =C2=A0 =C2=A0{
> +		// User has not passed in the appropriate argument value
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0exit=5Fwith=5Ferror("fruid data not found.",=
 argv);
> + =C2=A0 =C2=A0}

Please use consistent space indentation (and no tab characters).

> +	// Extract the fruid
> +	uint8=5Ft fruid =3D strtol(fruid=5Fstr.c=5Fstr(), NULL, 16);
> +	if(fruid =3D=3D 0)
> +	{
> +		// default to hardcoded 64
> +		fruid =3D BARRELEYE=5FIO=5FBOARD;
> +	}

It doesn't make much sense to me that you have it above as an error if
they don't pass it in but not an error here if they give you a string
instead of an integer. =C2=A0Just make it all an error and forget about a
default that only works on one particular machine.

> -int ipmi=5Fvalidate=5Fand=5Fupdate=5Finventory(const uint8=5Ft fruid, co=
nst uint8=5Ft *fru=5Fdata)
> +int ipmi=5Fvalidate=5Fand=5Fupdate=5Finventory(const uint8=5Ft fruid, co=
nst uint8=5Ft *fru=5Fdata,=20
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd=5Fbus *bu=
s=5Ftype)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0// Used for generic checksum calculation
> =C2=A0 =C2=A0 =C2=A0uint8=5Ft checksum =3D 0;
> @@ -249,7 +244,7 @@ int ipmi=5Fvalidate=5Fand=5Fupdate=5Finventory(const =
uint8=5Ft fruid, const uint8=5Ft *fru=5Fd
> =C2=A0 =C2=A0 =C2=A0uint8=5Ft fru=5Fentry;
> =C2=A0
> =C2=A0 =C2=A0 =C2=A0// A generic offset locator for any FRU record.
> - =C2=A0 =C2=A0uint8=5Ft area=5Foffset =3D 0;
> + =C2=A0 =C2=A0uint16=5Ft area=5Foffset =3D 0;

Any reason to not just use size=5Ft?

--=20
Patrick Williams
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


[attachment "signature.asc" removed by Chris Austen/Austin/IBM]


--=_alternative 000839B100257F07_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Content-ID: <>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"> <span><br>Vishwa, attached are the changes needed to make your code=
 compile and not hit link issues when we run it on the test system.&nbsp; L=
ooks like you still need to fix some things from Patricks review but this w=
ill take care of the makefile issues.<br><br>Chris Austen<br>POWER Systems =
Enablement Manager <br>(512) 286-5184 (T/L: 363-5184)</span><br><br><font c=
olor=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fblank" href=3D"mailto:o=
penbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org">openbmc-bounces+auste=
nc=3Dus.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</font><div class=3D"i=
NotesHistory" style=3D"padding-left:5px;"><div style=3D"padding-right:0px;p=
adding-left:5px;border-left:solid black 2px;">To: OpenBMC Patches &lt;<a ta=
rget=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches=
@stwcx.xyz</a>&gt;<br>From: Patrick Williams <patrick@stwcx.xyz><br>Sent by=
: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org><br>Date=
: 11/23/2015 04:14PM<br>Cc: <a target=3D"=5Fblank" href=3D"mailto:openbmc@l=
ists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>Subject: Re: [PATCH ipmi-f=
ru-parser v2] eeprom read CLI<br><br><div><font size=3D"2" face=3D"Courier =
New,Courier,monospace">On Fri, Nov 20, 2015 at 11:00:11AM -0500, OpenBMC Pa=
tches wrote:<br>&gt; From: vishwa &lt;<a target=3D"=5Fblank" href=3D"mailto=
:vishwanath@in.ibm.com">vishwanath@in.ibm.com</a>&gt;<br>&gt; &nbsp;define =
=5F=5FBUILD=5FEXE<br>&gt; &nbsp;$1 : $$($1=5FOBJS) $$(LIBS)<br>&gt; -      =
          $$(LINK.cpp) -o $$@ $$^ $(call =5F=5FPKG=5FCONFIG,$($1=5FNEEDED),=
--libs)<br>&gt; +                $$(LINK.cpp) -o $$@ $$^ $(call =5F=5FPKG=
=5FCONFIG,$($1=5FNEEDED),--libs) <br><br>Remove whitespace change.<br><br>&=
gt; &nbsp;define =5F=5FBUILD=5FLIB<br>&gt; &nbsp;$1 : $$($1=5FOBJS)<br>&gt;=
 -                $$(LINK.cpp) -shared -o $$@ $$^ $(call =5F=5FPKG=5FCONFIG=
,$($1=5FNEEDED),--libs)<br>&gt; +                $$(LINK.cpp) -fPIC -shared=
 -o $$@ $$^ $(call =5F=5FEXTRA=5FLIB=5FRESOLV,$($1=5FEXTRA=5FLIBS)) $(call =
=5F=5FPKG=5FCONFIG,$($1=5FNEEDED),--libs) <br><br>This is causing $1=5FEXTR=
A=5FLIBS to be added as an argument directly.<br>&nbsp;&nbsp; 1) You need t=
o add the $1=5FEXTRA=5FLIBS to the dependency above.<br>&nbsp;&nbsp; &nbsp;=
 &nbsp; $1 : $$($1=5FOBJS) $$($1=5FEXTRA=5FLIBS)<br>&nbsp;&nbsp; 2) You sho=
uld be using -l&lt;library&gt; instead so that it continues to be<br>&nbsp;=
&nbsp; &nbsp; &nbsp;dynamically linked.<br><br>&gt; diff --git a/readeeprom=
.C b/readeeprom.C<br>&gt; new file mode 100644<br>&gt; index 0000000..27adf=
a1<br>&gt; --- /dev/null<br>&gt; +++ b/readeeprom.C<br>&gt; @@ -0,0 +1,73 @=
@<br>&gt; +#include &lt;iostream&gt;<br>&gt; +#include &lt;memory&gt;<br>&g=
t; +#include "argument.H"<br>&gt; +#include "writefrudata.H"<br>&gt; +<br>&=
gt; +// FRU ID of VPD contaied in BMC accessible EEPROM<br>&gt; +#define BA=
RRELEYE=5FIO=5FBOARD                  64<br><br>There should not be any sys=
tem-specific #define in this program. &nbsp;Get it<br>passed as an argument=
 if you need it.<br><br>&gt; +//-------------------------------------------=
-------------------------------<br>&gt; +// This gets called by udev monito=
r soon after seeing hog plugs for EEPROMS. <br>&gt; +//--------------------=
------------------------------------------------------<br>&gt; +int main(in=
t argc, char **argv)<br>&gt; +{<br>&gt; +        int rc =3D 0;<br>&gt; +<br=
>&gt; +        // Handle to per process system bus<br>&gt; +        sd=5Fbu=
s *bus=5Ftype =3D NULL;<br>&gt; +<br>&gt; +        // Read the arguments.<b=
r>&gt; +        auto cli=5Foptions =3D std::make=5Funique&lt;ArgumentParser=
&gt;(argc, argv);<br>&gt; +        <br>&gt; +        // Parse out each argu=
ment.<br>&gt; +        auto eeprom=5Ffile =3D (*cli=5Foptions)["eeprom"];<b=
r>&gt; + &nbsp; &nbsp;if (eeprom=5Ffile =3D=3D ArgumentParser::empty=5Fstri=
ng)<br>&gt; + &nbsp; &nbsp;{<br>&gt; +                // User has not passe=
d in the appropriate argument value<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ex=
it=5Fwith=5Ferror("eeprom data not found.", argv);<br>&gt; + &nbsp; &nbsp;}=
<br>&gt; +<br>&gt; +        auto fruid=5Fstr =3D (*cli=5Foptions)["fruid"];=
<br>&gt; + &nbsp; &nbsp;if (eeprom=5Ffile =3D=3D ArgumentParser::empty=5Fst=
ring)<br>&gt; + &nbsp; &nbsp;{<br>&gt; +                // User has not pas=
sed in the appropriate argument value<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
exit=5Fwith=5Ferror("fruid data not found.", argv);<br>&gt; + &nbsp; &nbsp;=
}<br><br>Please use consistent space indentation (and no tab characters).<b=
r><br>&gt; +        // Extract the fruid<br>&gt; +        uint8=5Ft fruid =
=3D strtol(fruid=5Fstr.c=5Fstr(), NULL, 16);<br>&gt; +        if(fruid =3D=
=3D 0)<br>&gt; +        {<br>&gt; +                // default to hardcoded =
64<br>&gt; +                fruid =3D BARRELEYE=5FIO=5FBOARD;<br>&gt; +    =
    }<br><br>It doesn't make much sense to me that you have it above as an =
error if<br>they don't pass it in but not an error here if they give you a =
string<br>instead of an integer. &nbsp;Just make it all an error and forget=
 about a<br>default that only works on one particular machine.<br><br>&gt; =
-int ipmi=5Fvalidate=5Fand=5Fupdate=5Finventory(const uint8=5Ft fruid, cons=
t uint8=5Ft *fru=5Fdata)<br>&gt; +int ipmi=5Fvalidate=5Fand=5Fupdate=5Finve=
ntory(const uint8=5Ft fruid, const uint8=5Ft *fru=5Fdata, <br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sd=5Fbus *bus=5Ftype)<b=
r>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;// Used for generic checksum cal=
culation<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft checksum =3D 0;<br>&gt; @@ -=
249,7 +244,7 @@ int ipmi=5Fvalidate=5Fand=5Fupdate=5Finventory(const uint8=
=5Ft fruid, const uint8=5Ft *fru=5Fd<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft =
fru=5Fentry;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;// A generic offset=
 locator for any FRU record.<br>&gt; - &nbsp; &nbsp;uint8=5Ft area=5Foffset=
 =3D 0;<br>&gt; + &nbsp; &nbsp;uint16=5Ft area=5Foffset =3D 0;<br><br>Any r=
eason to not just use size=5Ft?<br><br>-- <br>Patrick Williams<br></font></=
div><div><font size=3D"2" face=3D"Courier New,Courier,monospace">=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailin=
g list<br><a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">o=
penbmc@lists.ozlabs.org</a><br><a href=3D"https://lists.ozlabs.org/listinfo=
/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></font></div></o=
penbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org></patrick@stwcx.xyz></=
div><br><br>[attachment "signature.asc" removed by Chris Austen/Austin/IBM]=
</div></font><BR>
--=_alternative 000839B100257F07_=--

--=_mixed 000839B100257F07_=
Content-Type: application/octet-stream; name="eeprom_updates.patch"
Content-Disposition: attachment; filename="eeprom_updates.patch"
Content-Transfer-Encoding: base64

Y29tbWl0IDE3ODNkZjQ3NmZjMzgxZTE3ZjNmNTE5MDFhZDdhMjMxZGFjOTkwNzUKQXV0aG9yOiBD
aHJpcyBBdXN0ZW4gPGF1c3RlbmNAdXMuaWJtLmNvbT4KRGF0ZTogICBNb24gTm92IDIzIDE5OjI1
OjE0IDIwMTUgLTA2MDAKCiAgICBtYWtlZmlsZSBjaGFuZ2VzCgpkaWZmIC0tZ2l0IGEvTWFrZWZp
bGUgYi9NYWtlZmlsZQppbmRleCBkMzlhM2NkLi4wZjgxZDA5IDEwMDY0NAotLS0gYS9NYWtlZmls
ZQorKysgYi9NYWtlZmlsZQpAQCAtNSw4ICs1LDggQEAgbGlic3RyZ2ZuaGFuZGxlci5zb19PQkpT
ICs9IHN0cmdmbmhhbmRsZXIubwogRVhFUyArPSBwaG9zcGhvci1yZWFkLWVlcHJvbQogCiBwaG9z
cGhvci1yZWFkLWVlcHJvbV9PQkpTICArPSByZWFkZWVwcm9tLm8gYXJndW1lbnQubwotcGhvc3Bo
b3ItcmVhZC1lZXByb21fTElCUyAgKz0gd3JpdGVmcnVkYXRhCi0jbGlic3RyZ2ZuaGFuZGxlci5z
b19FWFRSQV9MSUJTICArPSB3cml0ZWZydWRhdGEKK3Bob3NwaG9yLXJlYWQtZWVwcm9tX0VYVFJB
X0xJQlMgICs9IHdyaXRlZnJ1ZGF0YQorbGlic3RyZ2ZuaGFuZGxlci5zb19FWFRSQV9MSUJTICAr
PSB3cml0ZWZydWRhdGEKIGxpYndyaXRlZnJ1ZGF0YS5zb19ORUVERUQgICs9IGxpYnN5c3RlbWQK
IHBob3NwaG9yLXJlYWQtZWVwcm9tX05FRURFRCAgKz0gbGlic3lzdGVtZAogCkBAIC0yNSw4ICsy
NSw4IEBAIF9fUEtHX0NPTkZJRyA9ICQoaWYgJDEsJChzaGVsbCBwa2ctY29uZmlnICQyICQxKSkK
IF9fRVhUUkFfTElCX1JFU09MViA9ICQoaWYgJDEsJDEpCiAKIGRlZmluZSBfX0JVSUxEX0VYRQot
JDEgOiAkJCgkMV9PQkpTKSAkJChMSUJTKQotCQkkJChMSU5LLmNwcCkgLW8gJCRAICQkXiAkKGNh
bGwgX19QS0dfQ09ORklHLCQoJDFfTkVFREVEKSwtLWxpYnMpIAorJDEgOiAkJCgkMV9PQkpTKSB8
ICQkKExJQlMpCisJCSQkKExJTksuY3BwKSAtbyAkJEAgJCReICQoY2FsbCBfX0VYVFJBX0xJQl9S
RVNPTFYsJChhZGRwcmVmaXggLWwsJCgkMV9FWFRSQV9MSUJTKSkpIC1MLiAkKGNhbGwgX19QS0df
Q09ORklHLCQoJDFfTkVFREVEKSwtLWxpYnMpIAogCiAkKGV2YWwgQ1hYRkxBR1MgKz0gJChjYWxs
IF9fUEtHX0NPTkZJRywkKCQxX05FRURFRCksLS1jZmxhZ3MpKQogCkBAIC0zNiw4ICszNiw4IEBA
IGVuZGVmCiAkKGZvcmVhY2ggZXhlLCQoRVhFUyksJChldmFsICQoY2FsbCBfX0JVSUxEX0VYRSwk
KGV4ZSkpKSkKIAogZGVmaW5lIF9fQlVJTERfTElCCi0kMSA6ICQkKCQxX09CSlMpCi0JCSQkKExJ
TksuY3BwKSAtZlBJQyAtc2hhcmVkIC1vICQkQCAkJF4gJChjYWxsIF9fRVhUUkFfTElCX1JFU09M
ViwkKCQxX0VYVFJBX0xJQlMpKSAkKGNhbGwgX19QS0dfQ09ORklHLCQoJDFfTkVFREVEKSwtLWxp
YnMpIAorJDEgOiAkJCgkMV9PQkpTKSB8ICQkKGFkZHN1ZmZpeCAuc28sJCQoYWRkcHJlZml4IGxp
YiwkJCgkMV9FWFRSQV9MSUJTKSkpCisJCSQkKExJTksuY3BwKSAtZlBJQyAtc2hhcmVkIC1vICQk
QCAkJF4gJChjYWxsIF9fRVhUUkFfTElCX1JFU09MViwkKGFkZHByZWZpeCAtbCwkKCQxX0VYVFJB
X0xJQlMpKSkgLUwuICQoY2FsbCBfX1BLR19DT05GSUcsJCgkMV9ORUVERUQpLC0tbGlicykgCiAK
ICQoZXZhbCBDWFhGTEFHUyArPSAkKGNhbGwgX19QS0dfQ09ORklHLCQoJDFfTkVFREVEKSwtLWNm
bGFncykpCiAKZGlmZiAtLWdpdCBhL3N0cmdmbmhhbmRsZXIuQyBiL3N0cmdmbmhhbmRsZXIuQwpp
bmRleCBhOWMwODZjLi4yODQwNmRlIDEwMDY0NAotLS0gYS9zdHJnZm5oYW5kbGVyLkMKKysrIGIv
c3RyZ2ZuaGFuZGxlci5DCkBAIC02LDYgKzYsOCBAQAogCiB2b2lkIHJlZ2lzdGVyX25ldGZuX3N0
b3JhZ2Vfd3JpdGVfZnJ1KCkgX19hdHRyaWJ1dGVfXygoY29uc3RydWN0b3IpKTsKIAorc2RfYnVz
KiBpcG1pZF9nZXRfc2RfYnVzX2Nvbm5lY3Rpb24odm9pZCk7CisKIC8vLy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIC8vIENhbGxlZCBieSBJ
UE1JIG5ldGZuIHJvdXRlciBmb3Igd3JpdGUgZnJ1IGRhdGEgY29tbWFuZAogLy8tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0
IGEvd3JpdGVmcnVkYXRhLkggYi93cml0ZWZydWRhdGEuSAppbmRleCA0OTFiOWI3Li44OWMyMGFj
IDEwMDY0NAotLS0gYS93cml0ZWZydWRhdGEuSAorKysgYi93cml0ZWZydWRhdGEuSApAQCAtNTEs
NSArNTEsNiBAQCB0eXBlZGVmIHN0cnVjdAogI2RlZmluZSBJUE1JX0ZSVV9IRFJfQ1JDX09GRlNF
VCAgb2Zmc2V0b2Yoc3RydWN0IGNvbW1vbl9oZWFkZXIsIGNyYykKICNkZWZpbmUgSVBNSV9FSUdI
VF9CWVRFUyAgICAgICAgIDgKIAotaW50IGlwbWlfdmFsaWRhdGVfZnJ1X2FyZWEoY29uc3QgdWlu
dDhfdCwgY29uc3QgY2hhciAqLCBzZF9idXMgKik7CitleHRlcm4gIkMiIGludCBpcG1pX3ZhbGlk
YXRlX2ZydV9hcmVhKGNvbnN0IHVpbnQ4X3QsIGNvbnN0IGNoYXIgKiwgc2RfYnVzICopOworCiAj
ZW5kaWYK


--=_mixed 000839B100257F07_=--
