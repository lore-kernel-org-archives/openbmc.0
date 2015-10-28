Return-Path: <anoo@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CA7D1A0AF0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 06:22:10 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 28 Oct 2015 15:22:07 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 28 Oct 2015 15:22:06 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 3A3D0C90042
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 15:10:16 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9SJM5gv63635670
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 19:22:05 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9SJM4qg032238
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 15:22:04 -0400
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9SJM4R5032135
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 15:22:04 -0400
Message-Id: <201510281922.t9SJM4R5032135@d01av04.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 28 Oct 2015 15:22:04 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 28 Oct 2015 15:22:01 -0400
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 28 Oct 2015 19:22:00 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 28 Oct 2015 19:21:58 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015102819220562-539342 ;
 Wed, 28 Oct 2015 19:22:05 +0000 
In-Reply-To: <1446040095-14799-2-git-send-email-patches@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, "Bradley W Bishop" <bradleyb@us.ibm.com>
Subject: Re: [PATCH openbmc 1/3] Don't set source dir to git
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 28 Oct 2015 13:21:56 -0600
References: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
 <1446040095-14799-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
X-KeepSent: E3707710:2F81524F-86257EEC:006A0646;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 12419
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006A61A286257EEC_="
x-cbid: 15102819-0041-0000-0000-00000216B832
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004544; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00609339; UDB=6.00268836; UTC=2015-10-28
 19:21:59
x-cbparentid: 15102819-5090-0000-0000-0000058EF08A
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
X-List-Received-Date: Wed, 28 Oct 2015 19:22:12 -0000


--=_alternative 006A61A286257EEC_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

"openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org> wrote on=20
10/28/2015 08:48:13 AM:

> From: OpenBMC Patches <patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Cc: Bradley W Bishop/Rochester/IBM@IBMUS
> Date: 10/28/2015 09:31 AM
> Subject: [PATCH openbmc 1/3] Don't set source dir to git
> Sent by: "openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
>=20
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> So that patches can apply.
> ---
>  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 10=20
++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/
> skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> index d0cf359..0c8687c 100644
> --- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> +++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> @@ -19,16 +19,18 @@ SRC=5FURI +=3D "git://github.com/openbmc/skeleton"
>=20
>  SRCREV =3D "47750bc1c06aebda189f2e8d7862c9d9b9ffe35b"
>=20
> -S =3D "${WORKDIR}/git"
> +S =3D "${WORKDIR}"
>=20
>  do=5Fcompile() {
> -        oe=5Frunmake all
> +        oe=5Frunmake -C git all
>  }
>=20
>  do=5Finstall() {
> +        source=3D${S}/git
> +
>          install -d ${D}/${sbindir} ${D}${libdir}
> -        for i in ${S}/bin/*.py ${S}/bin/*.exe; do
> +        for i in ${source}/bin/*.py ${source}/bin/*.exe; do
>                  install $i ${D}/${sbindir}

There are new executables in the skeleton bin dir, like "obmcutil". Should =

we rename these new executables to have a *.py extension, or move the *.so =

to a new skeleton lib dir and have this recipe pick up all the contents of =

skeleton bin/*?

>          done
> -        install ${S}/bin/libopenbmc=5Fintf.so ${D}/${libdir}
> +        install ${source}/bin/libopenbmc=5Fintf.so ${D}/${libdir}
>  }
> --=20
> 2.6.0
>=20
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc



--=_alternative 006A61A286257EEC_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<tt><font size=3D2>&quot;openbmc&quot; &lt;openbmc-bounces+anoo=3Dus.ibm.co=
m@lists.ozlabs.org&gt;
wrote on 10/28/2015 08:48:13 AM:<br><br>&gt; From: OpenBMC Patches &lt;patc=
hes@stwcx.xyz&gt;</font></tt><br><tt><font size=3D2>&gt; To: openbmc@lists.=
ozlabs.org</font></tt><br><tt><font size=3D2>&gt; Cc: Bradley W Bishop/Roch=
ester/IBM@IBMUS</font></tt><br><tt><font size=3D2>&gt; Date: 10/28/2015 09:=
31 AM</font></tt><br><tt><font size=3D2>&gt; Subject: [PATCH openbmc 1/3] D=
on't set source
dir to git</font></tt><br><tt><font size=3D2>&gt; Sent by: &quot;openbmc&qu=
ot; &lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font></tt><=
br><tt><font size=3D2>&gt; <br>&gt; From: Brad Bishop &lt;bradleyb@us.ibm.c=
om&gt;<br>&gt; <br>&gt; So that patches can apply.<br>&gt; ---<br>&gt; &nbs=
p;meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb |
10 ++++++----<br>&gt; &nbsp;1 file changed, 6 insertions(+), 4 deletions(-)=
<br>&gt; <br>&gt; diff --git a/meta-phosphor/common/recipes-phosphor/skelet=
on/<br>&gt; skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/sk=
eleton.bb<br>&gt; index d0cf359..0c8687c 100644<br>&gt; --- a/meta-phosphor=
/common/recipes-phosphor/skeleton/skeleton.bb<br>&gt; +++ b/meta-phosphor/c=
ommon/recipes-phosphor/skeleton/skeleton.bb<br>&gt; @@ -19,16 +19,18 @@ SRC=
=5FURI +=3D &quot;git://github.com/openbmc/skeleton&quot;<br>&gt; &nbsp;<br=
>&gt; &nbsp;SRCREV =3D &quot;47750bc1c06aebda189f2e8d7862c9d9b9ffe35b&quot;=
<br>&gt; &nbsp;<br>&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>&gt; +S =3D &q=
uot;${WORKDIR}&quot;<br>&gt; &nbsp;<br>&gt; &nbsp;do=5Fcompile() {<br>&gt; =
- &nbsp; &nbsp; &nbsp; &nbsp;oe=5Frunmake all<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;oe=5Frunmake -C git all<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbs=
p;do=5Finstall() {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;source=3D${S}/git<b=
r>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}/${sbindi=
r} ${D}${libdir}<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;for i in ${S}/bin/*.p=
y ${S}/bin/*.exe;
do<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;for i in ${source}/bin/*.py ${sourc=
e}/bin/*.exe;
do<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;in=
stall
$i ${D}/${sbindir}</font></tt><br><br><tt><font size=3D2>There are new exec=
utables in the skeleton bin dir,
like &quot;obmcutil&quot;. Should we rename these new executables to have
a *.py extension, or move the *.so to a new skeleton lib dir and have this
recipe pick up all the contents of skeleton bin/*?</font></tt><br><tt><font=
 size=3D2><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;done<br>&gt; - &nbsp; =
&nbsp; &nbsp; &nbsp;install ${S}/bin/libopenbmc=5Fintf.so ${D}/${libdir}<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;install ${source}/bin/libopenbmc=5Fintf.=
so
${D}/${libdir}<br>&gt; &nbsp;}<br>&gt; -- <br>&gt; 2.6.0<br>&gt; <br>&gt; <=
br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </fo=
nt></tt><a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=
=3D2>https://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font siz=
e=3D2><br></font></tt><BR>
--=_alternative 006A61A286257EEC_=--
