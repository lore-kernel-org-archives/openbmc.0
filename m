Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CCA11A039D
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 06:38:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_12F9797F-C9CE-464F-893F-D76F4724690D"
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH openbmc 1/3] Don't set source dir to git
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <201510281922.t9SJM4R5032135@d01av04.pok.ibm.com>
Date: Wed, 28 Oct 2015 15:38:18 -0400
Cc: OpenBMC Patches <patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 Bradley W Bishop <bradleyb@us.ibm.com>
Message-Id: <7E4A7DBE-04B9-452A-805F-5A5B8D24763E@fuzziesquirrel.com>
References: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
 <1446040095-14799-2-git-send-email-patches@stwcx.xyz>
 <201510281922.t9SJM4R5032135@d01av04.pok.ibm.com>
To: Adriana Kobylak <anoo@us.ibm.com>
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
X-List-Received-Date: Wed, 28 Oct 2015 19:38:26 -0000


--Apple-Mail=_12F9797F-C9CE-464F-893F-D76F4724690D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I think this was already merged.

I=E2=80=99d like to see libopenbmc.so get moved.

> On Oct 28, 2015, at 3:21 PM, Adriana Kobylak <anoo@us.ibm.com> wrote:
>=20
> "openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org> wrote =
on 10/28/2015 08:48:13 AM:
>=20
> > From: OpenBMC Patches <patches@stwcx.xyz>
> > To: openbmc@lists.ozlabs.org
> > Cc: Bradley W Bishop/Rochester/IBM@IBMUS
> > Date: 10/28/2015 09:31 AM
> > Subject: [PATCH openbmc 1/3] Don't set source dir to git
> > Sent by: "openbmc" =
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
> >=20
> > From: Brad Bishop <bradleyb@us.ibm.com>
> >=20
> > So that patches can apply.
> > ---
> >  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 10 =
++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/
> > skeleton.bb =
b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> > index d0cf359..0c8687c 100644
> > --- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> > +++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> > @@ -19,16 +19,18 @@ SRC_URI +=3D "git://github.com/openbmc/skeleton"
> > =20
> >  SRCREV =3D "47750bc1c06aebda189f2e8d7862c9d9b9ffe35b"
> > =20
> > -S =3D "${WORKDIR}/git"
> > +S =3D "${WORKDIR}"
> > =20
> >  do_compile() {
> > -        oe_runmake all
> > +        oe_runmake -C git all
> >  }
> > =20
> >  do_install() {
> > +        source=3D${S}/git
> > +
> >          install -d ${D}/${sbindir} ${D}${libdir}
> > -        for i in ${S}/bin/*.py ${S}/bin/*.exe; do
> > +        for i in ${source}/bin/*.py ${source}/bin/*.exe; do
> >                  install $i ${D}/${sbindir}
>=20
> There are new executables in the skeleton bin dir, like "obmcutil". =
Should we rename these new executables to have a *.py extension, or move =
the *.so to a new skeleton lib dir and have this recipe pick up all the =
contents of skeleton bin/*?
>=20
> >          done
> > -        install ${S}/bin/libopenbmc_intf.so ${D}/${libdir}
> > +        install ${source}/bin/libopenbmc_intf.so ${D}/${libdir}
> >  }
> > --=20
> > 2.6.0
> >=20
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc =
<https://lists.ozlabs.org/listinfo/openbmc>
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--Apple-Mail=_12F9797F-C9CE-464F-893F-D76F4724690D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">I think this was already merged.</div><div =
class=3D""><br class=3D""></div><div class=3D"">I=E2=80=99d like to see =
libopenbmc.so get moved.</div><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Oct 28, 2015, at 3:21 PM, =
Adriana Kobylak &lt;<a href=3D"mailto:anoo@us.ibm.com" =
class=3D"">anoo@us.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><tt class=3D""><font =
size=3D"2" class=3D"">"openbmc" &lt;<a =
href=3D"mailto:openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org" =
class=3D"">openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org</a>&gt;
wrote on 10/28/2015 08:48:13 AM:<br class=3D""><br class=3D"">&gt; From: =
OpenBMC Patches &lt;<a href=3D"mailto:patches@stwcx.xyz" =
class=3D"">patches@stwcx.xyz</a>&gt;</font></tt><br class=3D""><tt =
class=3D""><font size=3D"2" class=3D"">&gt; To: <a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a></font></tt><br class=3D""><tt =
class=3D""><font size=3D"2" class=3D"">&gt; Cc: Bradley W =
Bishop/Rochester/IBM@IBMUS</font></tt><br class=3D""><tt class=3D""><font =
size=3D"2" class=3D"">&gt; Date: 10/28/2015 09:31 AM</font></tt><br =
class=3D""><tt class=3D""><font size=3D"2" class=3D"">&gt; Subject: =
[PATCH openbmc 1/3] Don't set source
dir to git</font></tt><br class=3D""><tt class=3D""><font size=3D"2" =
class=3D"">&gt; Sent by: "openbmc" &lt;<a =
href=3D"mailto:openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org" =
class=3D"">openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org</a>&gt;</fon=
t></tt><br class=3D""><tt class=3D""><font size=3D"2" class=3D"">&gt; =
<br class=3D"">&gt; From: Brad Bishop &lt;<a =
href=3D"mailto:bradleyb@us.ibm.com" =
class=3D"">bradleyb@us.ibm.com</a>&gt;<br class=3D"">&gt; <br =
class=3D"">&gt; So that patches can apply.<br class=3D"">&gt; ---<br =
class=3D"">&gt; =
&nbsp;meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb |
10 ++++++----<br class=3D"">&gt; &nbsp;1 file changed, 6 insertions(+), =
4 deletions(-)<br class=3D"">&gt; <br class=3D"">&gt; diff --git =
a/meta-phosphor/common/recipes-phosphor/skeleton/<br class=3D"">&gt; =
skeleton.bb =
b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb<br =
class=3D"">&gt; index d0cf359..0c8687c 100644<br class=3D"">&gt; --- =
a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb<br =
class=3D"">&gt; +++ =
b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb<br =
class=3D"">&gt; @@ -19,16 +19,18 @@ SRC_URI +=3D "<a =
href=3D"git://github.com/openbmc/skeleton" =
class=3D"">git://github.com/openbmc/skeleton</a>"<br class=3D"">&gt; =
&nbsp;<br class=3D"">&gt; &nbsp;SRCREV =3D =
"47750bc1c06aebda189f2e8d7862c9d9b9ffe35b"<br class=3D"">&gt; &nbsp;<br =
class=3D"">&gt; -S =3D "${WORKDIR}/git"<br class=3D"">&gt; +S =3D =
"${WORKDIR}"<br class=3D"">&gt; &nbsp;<br class=3D"">&gt; =
&nbsp;do_compile() {<br class=3D"">&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;oe_runmake all<br class=3D"">&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;oe_runmake -C git all<br class=3D"">&gt; &nbsp;}<br class=3D"">&gt; =
&nbsp;<br class=3D"">&gt; &nbsp;do_install() {<br class=3D"">&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;source=3D${S}/git<br class=3D"">&gt; +<br =
class=3D"">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d =
${D}/${sbindir} ${D}${libdir}<br class=3D"">&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;for i in ${S}/bin/*.py ${S}/bin/*.exe;
do<br class=3D"">&gt; + &nbsp; &nbsp; &nbsp; &nbsp;for i in =
${source}/bin/*.py ${source}/bin/*.exe;
do<br class=3D"">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;install
$i ${D}/${sbindir}</font></tt><br class=3D""><br class=3D""><tt =
class=3D""><font size=3D"2" class=3D"">There are new executables in the =
skeleton bin dir,
like "obmcutil". Should we rename these new executables to have
a *.py extension, or move the *.so to a new skeleton lib dir and have =
this
recipe pick up all the contents of skeleton bin/*?</font></tt><br =
class=3D""><tt class=3D""><font size=3D"2" class=3D""><br class=3D"">&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;done<br class=3D"">&gt; - &nbsp; =
&nbsp; &nbsp; &nbsp;install ${S}/bin/libopenbmc_intf.so =
${D}/${libdir}<br class=3D"">&gt; + &nbsp; &nbsp; &nbsp; &nbsp;install =
${source}/bin/libopenbmc_intf.so
${D}/${libdir}<br class=3D"">&gt; &nbsp;}<br class=3D"">&gt; -- <br =
class=3D"">&gt; 2.6.0<br class=3D"">&gt; <br class=3D"">&gt; <br =
class=3D"">&gt; _______________________________________________<br =
class=3D"">&gt; openbmc mailing list<br class=3D"">&gt; <a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a><br class=3D"">&gt; =
</font></tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc" =
class=3D""><tt class=3D""><font size=3D"2" =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt =
class=3D""><font size=3D"2" class=3D""><br class=3D""></font></tt><br =
class=3D"">_______________________________________________<br =
class=3D"">openbmc mailing list<br class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a><br =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc<br =
class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_12F9797F-C9CE-464F-893F-D76F4724690D--
