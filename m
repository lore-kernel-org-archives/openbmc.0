Return-Path: <anoo@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5EEAD1A0167
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 12:28:16 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 2 Feb 2016 18:28:13 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 18:28:12 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 4A5D21FF0041
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 18:16:22 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u131SC1L32243784
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 18:28:12 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u131SC0x009590
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 18:28:12 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u131SB8Q009587
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 18:28:12 -0700
Message-Id: <201602030128.u131SB8Q009587@d03av01.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 2 Feb 2016 18:28:11 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 2 Feb 2016 18:28:10 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 3 Feb 2016 01:28:09 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 3 Feb 2016 01:28:07 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016020301294039-489465 ;
 Wed, 3 Feb 2016 01:29:40 +0000 
In-Reply-To: <20160203120841.6aabf916@camb691>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc 1/2] Update recipes
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Tue, 2 Feb 2016 19:28:06 -0600
References: <1454386220-10574-1-git-send-email-openbmc-patches@stwcx.xyz><1454386220-10574-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160203120841.6aabf916@camb691>
MIME-Version: 1.0
X-KeepSent: F54CBBFE:089DC386-86257F4E:0008035A;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 39071
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0008105A86257F4E_="
x-cbid: 16020301-0005-0000-0000-00001C04AEFE
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004872; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654382; UDB=6.00296504; UTC=2016-02-03
 01:28:07
x-cbparentid: 16020301-7792-0000-0000-000001D0C6EE
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
X-List-Received-Date: Wed, 03 Feb 2016 01:28:17 -0000


--=_alternative 0008105A86257F4E_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Cyril Bur <cyrilbur@gmail.com> wrote on 02/02/2016 07:08:41 PM:

> From: Cyril Bur <cyrilbur@gmail.com>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, Adriana Kobylak/
> Austin/IBM@IBMUS
> Cc: openbmc@lists.ozlabs.org
> Date: 02/02/2016 07:08 PM
> Subject: Re: [PATCH openbmc 1/2] Update recipes
>=20
> On Mon,  1 Feb 2016 22:10:19 -0600
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>=20
> > From: Adriana Kobylak <anoo@us.ibm.com>
> >=20
> > ---
> >  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb |=20
2 +-
> >  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     |=20
2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/
> host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-
> ipmid/host-ipmid-fru.bb
> > index 5eed1f4..06ee00e 100644
> > ---=20
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> > +++=20
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
> > @@ -18,7 +18,7 @@ TARGET=5FCFLAGS +=3D " -fpic -std=3Dgnu++14"
> >=20
> >  SRC=5FURI +=3D "git://github.com/openbmc/ipmi-fru-parser"
> >=20
> > -SRCREV =3D "63696f4b23c9fd0a84ce539a6414ada406aaf229"
> > +SRCREV =3D "a14239a201443222906864273449a39cfa84118e"
> >=20
> >  FILES=5F${PN} +=3D "${libdir}/host-ipmid/*.so"
> >  FILES=5F${PN}-dbg +=3D "${libdir}/host-ipmid/.debug"
> > diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/
> host-ipmid.bb=20
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > index e74a6de..068d395 100644
> > --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > @@ -18,7 +18,7 @@ RDEPENDS=5F${PN} +=3D "settings"
> >  RDEPENDS=5F${PN} +=3D "network"
> >  SRC=5FURI +=3D "git://github.com/openbmc/phosphor-host-ipmid"
> >=20
> > -SRCREV =3D "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
> > +SRCREV =3D ""
> >=20
>=20
> Does this not break the build?

I inadvertently created 2 commits instead of amending the same one, making =

the first commit an "intermediate" one with incomplete work, and the 2nd=20
commit the completed work.
>=20
> >  S =3D "${WORKDIR}/git"
> >  INSTALL=5FNAME =3D "ipmid"
>=20



--=_alternative 0008105A86257F4E_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><tt><font size=3D2>Cyril Bur &lt;cyrilbur@gmail.com&gt; wrote on 02/02/=
2016
07:08:41 PM:<br><br>&gt; From: Cyril Bur &lt;cyrilbur@gmail.com&gt;</font><=
/tt><br><tt><font size=3D2>&gt; To: OpenBMC Patches &lt;openbmc-patches@stw=
cx.xyz&gt;,
Adriana Kobylak/<br>&gt; Austin/IBM@IBMUS</font></tt><br><tt><font size=3D2=
>&gt; Cc: openbmc@lists.ozlabs.org</font></tt><br><tt><font size=3D2>&gt; D=
ate: 02/02/2016 07:08 PM</font></tt><br><tt><font size=3D2>&gt; Subject: Re=
: [PATCH openbmc 1/2] Update recipes</font></tt><br><tt><font size=3D2>&gt;=
 <br>&gt; On Mon, &nbsp;1 Feb 2016 22:10:19 -0600<br>&gt; OpenBMC Patches &=
lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt; <br>&gt; &gt; From: Adriana=
 Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; &gt; <br>&gt; &gt; ---<br>&gt; &gt=
; &nbsp;meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
| 2 +-<br>&gt; &gt; &nbsp;meta-phosphor/common/recipes-phosphor/host-ipmid/=
host-ipmid.bb
&nbsp; &nbsp; | 2 +-<br>&gt; &gt; &nbsp;2 files changed, 2 insertions(+), 2=
 deletions(-)<br>&gt; &gt; <br>&gt; &gt; diff --git a/meta-phosphor/common/=
recipes-phosphor/host-ipmid/<br>&gt; host-ipmid-fru.bb b/meta-phosphor/comm=
on/recipes-phosphor/host-<br>&gt; ipmid/host-ipmid-fru.bb<br>&gt; &gt; inde=
x 5eed1f4..06ee00e 100644<br>&gt; &gt; --- a/meta-phosphor/common/recipes-p=
hosphor/host-ipmid/host-ipmid-fru.bb<br>&gt; &gt; +++ b/meta-phosphor/commo=
n/recipes-phosphor/host-ipmid/host-ipmid-fru.bb<br>&gt; &gt; @@ -18,7 +18,7=
 @@ TARGET=5FCFLAGS +=3D &quot; -fpic -std=3Dgnu++14&quot;<br>&gt; &gt; &nb=
sp;<br>&gt; &gt; &nbsp;SRC=5FURI +=3D &quot;git://github.com/openbmc/ipmi-f=
ru-parser&quot;<br>&gt; &gt; &nbsp;<br>&gt; &gt; -SRCREV =3D &quot;63696f4b=
23c9fd0a84ce539a6414ada406aaf229&quot;<br>&gt; &gt; +SRCREV =3D &quot;a1423=
9a201443222906864273449a39cfa84118e&quot;<br>&gt; &gt; &nbsp;<br>&gt; &gt; =
&nbsp;FILES=5F${PN} +=3D &quot;${libdir}/host-ipmid/*.so&quot;<br>&gt; &gt;=
 &nbsp;FILES=5F${PN}-dbg +=3D &quot;${libdir}/host-ipmid/.debug&quot;<br>&g=
t; &gt; diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/<br>&=
gt; host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-i=
pmid.bb<br>&gt; &gt; index e74a6de..068d395 100644<br>&gt; &gt; --- a/meta-=
phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb<br>&gt; &gt; +++ =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb<br>&gt; &g=
t; @@ -18,7 +18,7 @@ RDEPENDS=5F${PN} +=3D &quot;settings&quot;<br>&gt; &gt=
; &nbsp;RDEPENDS=5F${PN} +=3D &quot;network&quot;<br>&gt; &gt; &nbsp;SRC=5F=
URI +=3D &quot;git://github.com/openbmc/phosphor-host-ipmid&quot;<br>&gt; &=
gt; &nbsp;<br>&gt; &gt; -SRCREV =3D &quot;e90d8bf6a342649dba2fd1589a3cddb3c=
d051bb1&quot;<br>&gt; &gt; +SRCREV =3D &quot;&quot;<br>&gt; &gt; &nbsp;<br>=
&gt; <br>&gt; Does this not break the build?</font></tt><br><br><font size=
=3D2 face=3D"sans-serif">I inadvertently created 2 commits instead
of amending the same one, making the first commit an &quot;intermediate&quo=
t;
one with incomplete work, and the 2nd commit the completed work.</font><tt>=
<font size=3D2><br>&gt; <br>&gt; &gt; &nbsp;S =3D &quot;${WORKDIR}/git&quot=
;<br>&gt; &gt; &nbsp;INSTALL=5FNAME =3D &quot;ipmid&quot;<br>&gt; <br></fon=
t></tt><BR>
--=_alternative 0008105A86257F4E_=--
