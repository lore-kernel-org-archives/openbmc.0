Return-Path: <anoo@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwKsL2FcMzDqBB
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 12:04:54 +1000 (AEST)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 27 Apr 2016 22:04:51 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 27 Apr 2016 22:04:48 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 3347238C803B
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 22:04:48 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3S24mHC41353404
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 02:04:48 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3S1w6Al025026
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 21:58:06 -0400
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3S1w59a025009
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 21:58:06 -0400
Message-Id: <201604280158.u3S1w59a025009@d01av05.pok.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 27 Apr 2016 20:04:46 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Apr 2016 20:04:44 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Thu, 28 Apr 2016 02:04:43 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 28 Apr 2016 02:04:42 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016042802044167-20911 ;
 Thu, 28 Apr 2016 02:04:41 +0000 
In-Reply-To: <E9106819-7335-4D66-8DC8-4E7BE7472807@fuzziesquirrel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] Replace BUILD_ID with VERSION_ID in then
 inventory
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 27 Apr 2016 21:04:41 -0500
References: <1461615651-31359-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>
 <E9106819-7335-4D66-8DC8-4E7BE7472807@fuzziesquirrel.com>
MIME-Version: 1.0
X-KeepSent: 72E925A7:AF534942-86257FA3:000AC9D3;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 24835
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 000B6A5086257FA3_="
x-cbid: 16042802-0057-0000-0000-0000042A3415
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005210; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000162; SDB=6.00694295; UDB=6.00320479; UTC=2016-04-28
 02:04:43
x-cbparentid: 16042802-3202-0000-0000-000000086917
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Thu, 28 Apr 2016 02:04:55 -0000


--=_alternative 000B6A5086257FA3_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Yes, we said we would, but I realized the inventory object only had the=20
properties "present", "fault", and "version" created as default. An option =

to add the build id back would be to create a unique property for this bmc =

inventory like "build" or one like the other VPD fields like "Custom Field =

1". Thoughts?





From:   Brad Bishop <bradleyb@fuzziesquirrel.com>
To:     openbmc@lists.ozlabs.org
Date:   04/27/2016 08:11 PM
Subject:        Re: [PATCH skeleton] Replace BUILD=5FID with VERSION=5FID i=
n=20
then inventory
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



I thought we were going to expose both of these?=20


> On Apr 25, 2016, at 4:20 PM, OpenBMC Patches <openbmc-patches@stwcx.xyz> =

wrote:
>=20
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add VERSION=5FID to the inventory instead of BUILD=5FID because
> the version (git tag) is the value that gets updated during
> a firmware update, the build id remains constant.
> ---
> bin/inventory=5Fitems.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/bin/inventory=5Fitems.py b/bin/inventory=5Fitems.py
> index 6320f90..0a90569 100755
> --- a/bin/inventory=5Fitems.py
> +++ b/bin/inventory=5Fitems.py
> @@ -71,7 +71,7 @@ def getVersion():
>                                for line in f:
>                                                p =3D line.rstrip('\n')
>                                                parts =3D=20
line.rstrip('\n').split('=3D')
> -                                              if (parts[0] =3D=3D=20
"BUILD=5FID"):
> +                                              if (parts[0] =3D=3D=20
"VERSION=5FID"):
>                                                                version =
=3D=20
parts[1]
>                return version
>=20
> --=20
> 2.8.1
>=20
>=20
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





--=_alternative 000B6A5086257FA3_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Yes, we said we would, but I realized the
inventory object only had the properties &quot;present&quot;, &quot;fault&q=
uot;,
and &quot;version&quot; created as default. An option to add the build
id back would be to create a unique property for this bmc inventory like
&quot;build&quot; or one like the other VPD fields like &quot;Custom Field
1&quot;. Thoughts?</font><br><br><br><br><br><br><font size=3D1 color=3D#5f=
5f5f face=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Brad Bishop &lt;bradleyb@fu=
zziesquirrel.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-=
serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">openbmc@lists.ozlabs.org</f=
ont><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Date: &nbsp; &nb=
sp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">04/27/2016 08:11 PM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: [PATCH skeleton]
Replace BUILD=5FID with VERSION=5FID in then inventory</font><br><font size=
=3D1 color=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><tt><font size=3D2>I thought we were going to expose both=
 of these? &nbsp;<br><br><br>&gt; On Apr 25, 2016, at 4:20 PM, OpenBMC Patc=
hes &lt;openbmc-patches@stwcx.xyz&gt;
wrote:<br>&gt; <br>&gt; From: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&g=
t; <br>&gt; Add VERSION=5FID to the inventory instead of BUILD=5FID because=
<br>&gt; the version (git tag) is the value that gets updated during<br>&gt=
; a firmware update, the build id remains constant.<br>&gt; ---<br>&gt; bin=
/inventory=5Fitems.py | 2 +-<br>&gt; 1 file changed, 1 insertion(+), 1 dele=
tion(-)<br>&gt; <br>&gt; diff --git a/bin/inventory=5Fitems.py b/bin/invent=
ory=5Fitems.py<br>&gt; index 6320f90..0a90569 100755<br>&gt; --- a/bin/inve=
ntory=5Fitems.py<br>&gt; +++ b/bin/inventory=5Fitems.py<br>&gt; @@ -71,7 +7=
1,7 @@ def getVersion():<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
for line in f:<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p
=3D line.rstrip('\n')<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;parts
=3D line.rstrip('\n').split('=3D')<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (parts[0] =3D=3D &quot;BUILD=5FID&quot;):<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (parts[0] =3D=3D &quot;VERSION=5FID&quot;):<br>&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
version =3D parts[1]<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;return
version<br>&gt; <br>&gt; -- <br>&gt; 2.8.1<br>&gt; <br>&gt; <br>&gt; =5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbm=
c mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </font></tt><a href=
=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https://lis=
ts.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><br>=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mai=
ling list<br>openbmc@lists.ozlabs.org<br></font></tt><a href=3Dhttps://list=
s.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/l=
istinfo/openbmc</font></tt></a><tt><font size=3D2><br></font></tt><br><br><=
BR>
--=_alternative 000B6A5086257FA3_=--
