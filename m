Return-Path: <anoo@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpgc52NL0zDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 07:03:49 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 18 Apr 2016 17:03:47 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 18 Apr 2016 17:03:45 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 6CEB16E8048
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 16:50:33 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3IL3inf36700352
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 21:03:44 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3IL3hLZ004530
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 17:03:43 -0400
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3IL3hBG004520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 17:03:43 -0400
Message-Id: <201604182103.u3IL3hBG004520@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 18 Apr 2016 17:03:43 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 18 Apr 2016 17:03:40 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 18 Apr 2016 21:03:39 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 18 Apr 2016 21:03:37 -0000
Received: from us1a3-mail53.a3.dal06.isc4sb.com ([10.106.154.193])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016041821033654-444690 ;
 Mon, 18 Apr 2016 21:03:36 +0000 
In-Reply-To: <1459548054-10473-2-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-settingsd 1/2] parser: pprint settings_file.py
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Mon, 18 Apr 2016 16:03:36 -0500
References: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459548054-10473-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
X-KeepSent: F669E960:3560370C-86257F99:0073A4B0;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 13923
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0073AF3686257F99_="
x-cbid: 16041821-0041-0000-0000-000003E94D74
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005173; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000159; SDB=6.00689993; UDB=6.00317882; UTC=2016-04-18
 21:03:37
x-cbparentid: 16041821-4536-0000-0000-0000074104E3
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
X-List-Received-Date: Mon, 18 Apr 2016 21:03:50 -0000


--=_alternative 0073AF3686257F99_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Looks good.


"openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org> wrote on=20
04/01/2016 05:00:53 PM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Date: 04/01/2016 05:01 PM
> Subject: [PATCH phosphor-settingsd 1/2] parser: pprint settings=5Ffile.py
> Sent by: "openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
>=20
> From: Patrick Williams <patrick@stwcx.xyz>
>=20
> Use pprint for settings map instead of just casting to string.  This
> makes the output of the tool better for git-diff because it is sorted
> and multiple lines.
>=20
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  settings=5Fparser.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/settings=5Fparser.py b/settings=5Fparser.py
> index 46bb474..9e74f91 100755
> --- a/settings=5Fparser.py
> +++ b/settings=5Fparser.py
> @@ -5,6 +5,7 @@
>  # adding dependencies to additional modules like yaml
>=20
>  import yaml
> +import pprint
>=20
>  SETTINGS=5FFILE =3D 'settings.yaml'
>  OUTPUT=5FFILE =3D 'settings=5Ffile.py'
> @@ -16,5 +17,5 @@ with open(SETTINGS=5FFILE) as s:
>  with open(OUTPUT=5FFILE, 'w') as f:
>      f.write(FILE=5FHEADER)
>      f.write('\n')
> -    f.write('SETTINGS=3D')
> -    f.write(str(data))
> +    f.write('SETTINGS=3D\\\n')
> +    pprint.pprint(data, stream=3Df)
> --=20
> 2.7.1
>=20
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc



--=_alternative 0073AF3686257F99_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Looks good.</font><br><br><br><tt><font =
size=3D2>&quot;openbmc&quot; &lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.oz=
labs.org&gt;
wrote on 04/01/2016 05:00:53 PM:<br><br>&gt; From: OpenBMC Patches &lt;open=
bmc-patches@stwcx.xyz&gt;</font></tt><br><tt><font size=3D2>&gt; To: openbm=
c@lists.ozlabs.org</font></tt><br><tt><font size=3D2>&gt; Date: 04/01/2016 =
05:01 PM</font></tt><br><tt><font size=3D2>&gt; Subject: [PATCH phosphor-se=
ttingsd 1/2] parser:
pprint settings=5Ffile.py</font></tt><br><tt><font size=3D2>&gt; Sent by: &=
quot;openbmc&quot; &lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&g=
t;</font></tt><br><tt><font size=3D2>&gt; <br>&gt; From: Patrick Williams &=
lt;patrick@stwcx.xyz&gt;<br>&gt; <br>&gt; Use pprint for settings map inste=
ad of just casting to string. &nbsp;This<br>&gt; makes the output of the to=
ol better for git-diff because it is sorted<br>&gt; and multiple lines.<br>=
&gt; <br>&gt; Signed-off-by: Patrick Williams &lt;patrick@stwcx.xyz&gt;<br>=
&gt; ---<br>&gt; &nbsp;settings=5Fparser.py | 5 +++--<br>&gt; &nbsp;1 file =
changed, 3 insertions(+), 2 deletions(-)<br>&gt; <br>&gt; diff --git a/sett=
ings=5Fparser.py b/settings=5Fparser.py<br>&gt; index 46bb474..9e74f91 1007=
55<br>&gt; --- a/settings=5Fparser.py<br>&gt; +++ b/settings=5Fparser.py<br=
>&gt; @@ -5,6 +5,7 @@<br>&gt; &nbsp;# adding dependencies to additional mod=
ules like yaml<br>&gt; &nbsp;<br>&gt; &nbsp;import yaml<br>&gt; +import ppr=
int<br>&gt; &nbsp;<br>&gt; &nbsp;SETTINGS=5FFILE =3D 'settings.yaml'<br>&gt=
; &nbsp;OUTPUT=5FFILE =3D 'settings=5Ffile.py'<br>&gt; @@ -16,5 +17,5 @@ wi=
th open(SETTINGS=5FFILE) as s:<br>&gt; &nbsp;with open(OUTPUT=5FFILE, 'w') =
as f:<br>&gt; &nbsp; &nbsp; &nbsp;f.write(FILE=5FHEADER)<br>&gt; &nbsp; &nb=
sp; &nbsp;f.write('\n')<br>&gt; - &nbsp; &nbsp;f.write('SETTINGS=3D')<br>&g=
t; - &nbsp; &nbsp;f.write(str(data))<br>&gt; + &nbsp; &nbsp;f.write('SETTIN=
GS=3D\\\n')<br>&gt; + &nbsp; &nbsp;pprint.pprint(data, stream=3Df)<br>&gt; =
-- <br>&gt; 2.7.1<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; o=
penbmc@lists.ozlabs.org<br>&gt; </font></tt><a href=3Dhttps://lists.ozlabs.=
org/listinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/listinfo/o=
penbmc</font></tt></a><tt><font size=3D2><br></font></tt><BR>
--=_alternative 0073AF3686257F99_=--
