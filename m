Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkjGF52HlzDqYw
 for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2017 14:06:13 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v82441Ap086494
 for <openbmc@lists.ozlabs.org>; Sat, 2 Sep 2017 00:06:10 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cqe9u6veb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 02 Sep 2017 00:06:10 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 2 Sep 2017 04:06:09 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 2 Sep 2017 04:06:08 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2017090204060790-25440 ;
 Sat, 2 Sep 2017 04:06:07 +0000 
MIME-Version: 1.0
In-Reply-To: <CAO=notw4J__9WRcK_VjDt=WX1fzGm+JNfVYLPysd0KOkzA_9Gw@mail.gmail.com>
Subject: Re: layers and adding a new system
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 1 Sep 2017 23:06:06 -0500
References: <OF2D430B1C.0ECB52AA-ON86258177.0076016C-8625818E.005FE1ED@notes.na.collabserv.com>
 <CAO=notw4J__9WRcK_VjDt=WX1fzGm+JNfVYLPysd0KOkzA_9Gw@mail.gmail.com>
X-KeepSent: 55EB50D3:DFCECDEB-8625818F:0012D256;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 6055
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B1CDF8154C68f9e8a93df938690918c09BB0B1CDF8154C6"
Content-Disposition: inline
x-cbid: 17090204-0327-0000-0000-000002C90A99
X-IBM-SpamModules-Scores: BY=0.021104; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=; MB=0.236015
X-IBM-SpamModules-Versions: BY=3.00007650; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910991; UDB=6.00457042; IPR=6.00691272; 
 BA=6.00005564; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016971; XFM=3.00000015;
 UTC=2017-09-02 04:06:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-02 02:11:17 - 6.00007267
x-cbparentid: 17090204-0328-0000-0000-000016600ED2
Message-Id: <OF55EB50D3.DFCECDEB-ON8625818F.0012D256-8625818F.00168858@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-01_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Sep 2017 04:06:14 -0000


--0__=09BB0B1CDF8154C68f9e8a93df938690918c09BB0B1CDF8154C6
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Chris Austen <austenc@us.ibm.com>

> Patrick Venture <venture@google.com> wrote on 09/01/2017 02:35:46 PM:

> From: Patrick Venture <venture@google.com>
> To: Chris Austen <austenc@us.ibm.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 09/01/2017 02:36 PM
> Subject: Re: layers and adding a new system
>
> Chris;
>
> I think this is valuable to point out -- and especially the value of
> MACHINE=5FOVERRIDES.  Because Google is building OpenBMC from a single
> bblayer file, all the recipes we pickup need specific overrides.  So
> it might be worth emphasizing the danger a little more that even
> things in a separate folder that is machine specific may get picked up
> depending on how things are organized.

The results in my testing really surprised me but I think I understand
why it is that way.  It's likely a lot more common for all the machines
in a bb file to need the same SRC files and append more if there is a
specific machine addition.

yeah organization is key.  It almost feels like the meta-machines could
use another layer.  A hardware layer that defines the base set of
hardware and then another layer where organizations can add their tweaks.

Since Zaius specs are in OCP it only makes sense that others would want
to create similar work and as such the OCP Zaius reference could in
theory be its own meta.  The danger of course is when there is a reference
board change... all users of the layer are effected.

I know it's difficult.  There's no math formula that declares something
is different enough to create a new reference meta.  There's just us
firmware engineers making hardware do our bidding via the principals of
computer science.


>
> On Fri, Sep 1, 2017 at 10:27 AM, Chris Austen <austenc@us.ibm.com> wrote:
> > As the popularity of OpenBMC grows the project will hopefully find
itself
> > with additional pull requests to support more systems. As I did when I
first
> > started out you could easily be allured to simply copy/past the entire
> > contents of a similar system under meta-openbmc-machines/... and call
it
> > your own. However scale that to anything greater then a few machines
and the
> > shier volume of duplicate code will become bulky and unmanageable.
Yocto
> > recognized this as an issue and has provided support to reduce. I would
like
> > to build a list of recommendations on how to add new hardware in to the
> > OpenBMC Project.
> >
> >
> > For hardware based on a similar design this is...
> >
> > Not good
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > meta-mfg/meta-redfish/
> > meta-mfg/meta-bluefish/
> > meta-mfg/meta-yellowfish/
> > meta-mfg/meta-greenfish/
> >
> >
> > Good
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > meta-mfg/meta-fish/
> >
> >
> > So how can you do that? With a single variable in your local.conf...
> > MACHINE. You change the MACHINE variable per system type but let
default and
> > use the base platform for common items.
> >
> > MACHINE =3D "bluefish"
> >
> > A bbappend that is specific to the bluefish system; you append the
=5Fbluefish
> >
> > FILESEXTRAPATHS=5Fprepend=5Fbluefish :=3D "${THISDIR}/${PN}:"
> > SRC=5FURI=5Fappend=5Fbluefish =3D " file://0001-blueworms.patch"
> >
> > A bbappend that makes a common change to all of the fish type. This
means
> > anyone adding the meta-fish layer gets this bbappend and the
rainbowworms.
> >

This is where the benefit of a reference layer helps the community.  One
person
finds a hardware issue and everyone gets the fix.

> > FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/${PN}:"
> > SRC=5FURI=5Fappend =3D " file://0001-rainbowworms.patch"
> >
> > Machine and default are all good until If you use a bluefish system but
you
> > have a company policy use the MACHINEOVERRIDES variable
> >
> > FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D "${THISDIR}/${PN}:"
> > SRC=5FURI=5Fappend=5ForgXfis =3D " file://0001-blueXworms.patch"
> >
> > Note yocto matches and runs every hit. That means if you add a default,
> > machine and machine override in the same bbappend, you get all three
files.
> > So use with caution...
> >
> > FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D "${THISDIR}/${PN}:"
> > SRC=5FURI=5Fappend=5ForgXfis =3D " file://0001-blueXworms.patch"
> > SRC=5FURI=5Fappend =3D " file://0001-rainbowworms.patch"
> > SRC=5FURI=5Fappend=5Fbluefish =3D " file://0001-blueworms.patch"
> >
> > $ ls
> > 0001-blueXworms.patch
> > 0001-rainbowworms.patch
> > 0001-blueworms.patch
> >
> >
> > TBD.. need to add example of something being added, replaced and kernel
> > device tree needs.
> >
> >
> > Thoughts?
>
> There is an effort to write up some system component bring-up with
> OpenBMC, that's already had some results -- configuring LEDs.  By
> adding something, are you referring to adding a new system's
> configuration or a new package to OpenBMC?
>

I'd like to create some examples where a system configuration deviates from
the reference.  LEDs could be it or the reference uses PWM while another
similar system uses an i2c device.  I think if we don't start discussing
best practices here we will see different approaches and confused gerrit
responses

Adding an example of another package or even replacing a package is a
good thing to have documented too.

> >
> >
> >
> > Chris Austen
> >
>

--0__=09BB0B1CDF8154C68f9e8a93df938690918c09BB0B1CDF8154C6
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">Chris Austen &lt;austenc@us.ibm.com&gt; </f=
ont><br><br><tt><font size=3D"2">&gt; Patrick Venture &lt;venture@google.co=
m&gt; wrote on 09/01/2017 02:35:46 PM:<br><br>&gt; From: Patrick Venture &l=
t;venture@google.com&gt;</font></tt><br><tt><font size=3D"2">&gt; To: Chris=
 Austen &lt;austenc@us.ibm.com&gt;</font></tt><br><tt><font size=3D"2">&gt;=
 Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font></tt><br><tt><=
font size=3D"2">&gt; Date: 09/01/2017 02:36 PM</font></tt><br><tt><font siz=
e=3D"2">&gt; Subject: Re: layers and adding a new system</font></tt><br><tt=
><font size=3D"2">&gt; <br>&gt; Chris;<br>&gt; <br>&gt; I think this is val=
uable to point out -- and especially the value of<br>&gt; MACHINE=5FOVERRID=
ES. &nbsp;Because Google is building OpenBMC from a single<br>&gt; bblayer =
file, all the recipes we pickup need specific overrides. &nbsp;So<br>&gt; i=
t might be worth emphasizing the danger a little more that even<br>&gt; thi=
ngs in a separate folder that is machine specific may get picked up<br>&gt;=
 depending on how things are organized.<br></font></tt><br><tt><font size=
=3D"2">The results in my testing really surprised me but I think I understa=
nd</font></tt><br><tt><font size=3D"2">why it is that way. &nbsp;It's likel=
y a lot more common for all the machines</font></tt><br><tt><font size=3D"2=
">in a bb file to need the same SRC files and append more if there is a </f=
ont></tt><br><tt><font size=3D"2">specific machine addition.</font></tt><br=
><br><tt><font size=3D"2">yeah organization is key. &nbsp;It almost feels l=
ike the meta-machines could </font></tt><br><tt><font size=3D"2">use anothe=
r layer. &nbsp;A hardware layer that defines the base set of </font></tt><b=
r><tt><font size=3D"2">hardware and then another layer where organizations =
can add their tweaks.</font></tt><br><br><tt><font size=3D"2">Since Zaius s=
pecs are in OCP it only makes sense that others would want</font></tt><br><=
tt><font size=3D"2">to create similar work and as such the OCP Zaius refere=
nce could in </font></tt><br><tt><font size=3D"2">theory be its own meta. &=
nbsp;The danger of course is when there is a reference</font></tt><br><tt><=
font size=3D"2">board change... all users of the layer are effected.</font>=
</tt><br><br><tt><font size=3D"2">I know it's difficult. &nbsp;There's no m=
ath formula that declares something </font></tt><br><tt><font size=3D"2">is=
 different enough to create a new reference meta. &nbsp;There's just us </f=
ont></tt><br><tt><font size=3D"2">firmware engineers making hardware do our=
 bidding via the principals of </font></tt><br><tt><font size=3D"2">compute=
r science.</font></tt><br><br><br><tt><font size=3D"2">&gt; <br>&gt; On Fri=
, Sep 1, 2017 at 10:27 AM, Chris Austen &lt;austenc@us.ibm.com&gt; wrote:<b=
r>&gt; &gt; As the popularity of OpenBMC grows the project will hopefully f=
ind itself<br>&gt; &gt; with additional pull requests to support more syste=
ms. As I did when I first<br>&gt; &gt; started out you could easily be allu=
red to simply copy/past the entire<br>&gt; &gt; contents of a similar syste=
m under meta-openbmc-machines/... and call it<br>&gt; &gt; your own. Howeve=
r scale that to anything greater then a few machines and the<br>&gt; &gt; s=
hier volume of duplicate code will become bulky and unmanageable. Yocto<br>=
&gt; &gt; recognized this as an issue and has provided support to reduce. I=
 would like<br>&gt; &gt; to build a list of recommendations on how to add n=
ew hardware in to the<br>&gt; &gt; OpenBMC Project.<br>&gt; &gt;<br>&gt; &g=
t;<br>&gt; &gt; For hardware based on a similar design this is...<br>&gt; &=
gt;<br>&gt; &gt; Not good<br>&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; &gt=
; meta-mfg/meta-redfish/<br>&gt; &gt; meta-mfg/meta-bluefish/<br>&gt; &gt; =
meta-mfg/meta-yellowfish/<br>&gt; &gt; meta-mfg/meta-greenfish/<br>&gt; &gt=
;<br>&gt; &gt;<br>&gt; &gt; Good<br>&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>&=
gt; &gt; meta-mfg/meta-fish/<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; So how =
can you do that? With a single variable in your local.conf...<br>&gt; &gt; =
MACHINE. You change the MACHINE variable per system type but let default an=
d<br>&gt; &gt; use the base platform for common items.<br>&gt; &gt;<br>&gt;=
 &gt; MACHINE =3D &quot;bluefish&quot;<br>&gt; &gt;<br>&gt; &gt; A bbappend=
 that is specific to the bluefish system; you append the =5Fbluefish<br>&gt=
; &gt;<br>&gt; &gt; FILESEXTRAPATHS=5Fprepend=5Fbluefish :=3D &quot;${THISD=
IR}/${PN}:&quot;<br>&gt; &gt; SRC=5FURI=5Fappend=5Fbluefish =3D &quot; <a h=
ref=3D"file://0001-blueworms.patch">file://0001-blueworms.patch</a>&quot;<b=
r>&gt; &gt;<br>&gt; &gt; A bbappend that makes a common change to all of th=
e fish type. This means<br>&gt; &gt; anyone adding the meta-fish layer gets=
 this bbappend and the rainbowworms.<br>&gt; &gt;<br></font></tt><br><tt><f=
ont size=3D"2">This is where the benefit of a reference layer helps the com=
munity. &nbsp;One person</font></tt><br><tt><font size=3D"2">finds a hardwa=
re issue and everyone gets the fix. &nbsp;</font></tt><br><br><tt><font siz=
e=3D"2">&gt; &gt; FILESEXTRAPATHS=5Fprepend :=3D &quot;${THISDIR}/${PN}:&qu=
ot;<br>&gt; &gt; SRC=5FURI=5Fappend =3D &quot; <a href=3D"file://0001-rainb=
owworms.patch">file://0001-rainbowworms.patch</a>&quot;<br>&gt; &gt;<br>&gt=
; &gt; Machine and default are all good until If you use a bluefish system =
but you<br>&gt; &gt; have a company policy use the MACHINEOVERRIDES variabl=
e<br>&gt; &gt;<br>&gt; &gt; FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D &quot;=
${THISDIR}/${PN}:&quot;<br>&gt; &gt; SRC=5FURI=5Fappend=5ForgXfis =3D &quot=
; <a href=3D"file://0001-blueXworms.patch">file://0001-blueXworms.patch</a>=
&quot;<br>&gt; &gt;<br>&gt; &gt; Note yocto matches and runs every hit. Tha=
t means if you add a default,<br>&gt; &gt; machine and machine override in =
the same bbappend, you get all three files.<br>&gt; &gt; So use with cautio=
n...<br>&gt; &gt;<br>&gt; &gt; FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D &qu=
ot;${THISDIR}/${PN}:&quot;<br>&gt; &gt; SRC=5FURI=5Fappend=5ForgXfis =3D &q=
uot; <a href=3D"file://0001-blueXworms.patch">file://0001-blueXworms.patch<=
/a>&quot;<br>&gt; &gt; SRC=5FURI=5Fappend =3D &quot; <a href=3D"file://0001=
-rainbowworms.patch">file://0001-rainbowworms.patch</a>&quot;<br>&gt; &gt; =
SRC=5FURI=5Fappend=5Fbluefish =3D &quot; <a href=3D"file://0001-blueworms.p=
atch">file://0001-blueworms.patch</a>&quot;<br>&gt; &gt;<br>&gt; &gt; $ ls<=
br>&gt; &gt; 0001-blueXworms.patch<br>&gt; &gt; 0001-rainbowworms.patch<br>=
&gt; &gt; 0001-blueworms.patch<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; TBD..=
 need to add example of something being added, replaced and kernel<br>&gt; =
&gt; device tree needs.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Thoughts?<br=
>&gt; <br>&gt; There is an effort to write up some system component bring-u=
p with<br>&gt; OpenBMC, that's already had some results -- configuring LEDs=
. &nbsp;By<br>&gt; adding something, are you referring to adding a new syst=
em's<br>&gt; configuration or a new package to OpenBMC?<br>&gt; <br></font>=
</tt><br><tt><font size=3D"2">I'd like to create some examples where a syst=
em configuration deviates from</font></tt><br><tt><font size=3D"2">the refe=
rence. &nbsp;LEDs could be it or the reference uses PWM while another </fon=
t></tt><br><tt><font size=3D"2">similar system uses an i2c device. &nbsp;I =
think if we don't start discussing </font></tt><br><tt><font size=3D"2">bes=
t practices here we will see different approaches and confused gerrit </fon=
t></tt><br><tt><font size=3D"2">responses </font></tt><br><br><tt><font siz=
e=3D"2">Adding an example of another package or even replacing a package is=
 a </font></tt><br><tt><font size=3D"2">good thing to have documented too.<=
/font></tt><br><br><tt><font size=3D"2">&gt; &gt;<br>&gt; &gt;<br>&gt; &gt;=
<br>&gt; &gt; Chris Austen<br>&gt; &gt;<br>&gt; <br></font></tt><BR>
</body></html>

--0__=09BB0B1CDF8154C68f9e8a93df938690918c09BB0B1CDF8154C6--
