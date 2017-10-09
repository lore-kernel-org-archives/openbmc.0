Return-Path: <shliyi@cn.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cn.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=shliyi@cn.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9Zvf3KBrzDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 20:39:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v999d5t8091611
 for <openbmc@lists.ozlabs.org>; Mon, 9 Oct 2017 05:39:23 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dg2tq12yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 05:39:22 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 9 Oct 2017 09:39:22 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 9 Oct 2017 09:39:19 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017100909391847-278678 ;
 Mon, 9 Oct 2017 09:39:18 +0000 
MIME-Version: 1.0
In-Reply-To: <1507531274.5452.154.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>, Javier Romero <xavinux@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Mon, 9 Oct 2017 17:39:06 +0800
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
X-KeepSent: 72E5748D:A94F82AF-482581B4:0033C44D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 12019
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0B27DFA042DD8f9e8a93df938690918cC7BB0B27DFA042DD"
Content-Disposition: inline
x-cbid: 17100909-3815-0000-0000-000002DC0FBD
X-IBM-SpamModules-Scores: BY=0.088464; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.429909; ST=0; TS=0; UL=0; ISC=; MB=0.041496
X-IBM-SpamModules-Versions: BY=3.00007866; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00928581; UDB=6.00467328; IPR=6.00708854; 
 BA=6.00005628; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017456; XFM=3.00000015;
 UTC=2017-10-09 09:39:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-09 09:22:03 - 6.00007437
x-cbparentid: 17100909-3816-0000-0000-0000A27A17E5
Message-Id: <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-09_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 09:39:27 -0000


--0__=C7BB0B27DFA042DD8f9e8a93df938690918cC7BB0B27DFA042DD
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Javier,

Andrew has mentioned the cause of the bug.

When I added the RaspberryPi configure to OpenBMC, I referred to
configuration of other boards, like:
"meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf", you
might also refer to other working machines.

The original target was to build an OpenBMC image for RaspberryPi, but I
never tested on a real hardware.
More work is required to run OpenBMC on a Raspberry Pi.

The "meta-phosphor" layer has been changed since that time, we need to
update RaspberryPi configurations accordingly.

Thanks,
-Yi

> From: Andrew Jeffery <andrew@aj.id.au>
> To: Javier Romero <xavinux@gmail.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 09/10/2017 02:41 PM
> Subject: Re: OpenBMC on Raspberry PI 3.
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> On Sun, 2017-10-08 at 23:57 -0300, Javier Romero wrote:
> > Andrew,
> >
> > Thans for your answer.
> >
> > Bug reported:=A0https://github.com/openbmc/openbmc/issues/2434
> >
> > I`d like to try to cook up a patch, but do I need to know a specific
> > language programming to do this ?
>
> Hmm, good question. This is probably a bug in how a bitbake
> configuration/recipe configures the kernel. As such I'd suggest getting a
> handle on Yocto, which is the build and configuration system we
use.Here's the
> quick start guide:
>
>
http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.html
>
> There's also a rather daunting Mega Manual, which is useful as a
reference
> (rather than reading the whole thing):
>
> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html
>
> Back to the bug itself, from the output that you gave I expect it's some
issue
> with the following directive:
>
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/
> distro/openbmc-phosphor.conf#L57
>
> i.e. the issue is that that linux-raspberrypi (the kernel recipe used for
the
> raspberry pi[1][2]) doesn't have a 'phosphor-gpio-keys' feature. The
implicit
> assumption is that the configuration will be using the linux-obmc
> tree[3][4][5], which
> is our fork of the kernel (primarily for Aspeed SoC support).
>
> More generally, knowledge of Python (Yocto/bitbake, some OpenBMC
userspace), C
> (u-boot, kernel, qemu, also requires a some comfort with assembler)
> and C++ (most
> of the phosphor reference userspace applications) is useful.
>
> Hope that helps.
>
> Andrew
>
> [1] https://github.com/openbmc/openbmc/blob/
> 4f2d85233d23eedaf1d4846d3d861ba28bc49b00/import-layers/meta-
> raspberrypi/recipes-kernel/linux/linux-raspberrypi=5F4.4.bb
> [2] https://github.com/openbmc/openbmc/blob/
> 4f2d85233d23eedaf1d4846d3d861ba28bc49b00/import-layers/meta-
> raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
> [3] https://github.com/openbmc/openbmc/blob/
> 4f2cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/
> recipes-kernel/linux/linux-obmc=5F4.10.bb
> [4] https://github.com/openbmc/openbmc/blob/
> 4f2cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/
> recipes-kernel/linux/linux-obmc.inc[attachment "signature.asc"
> deleted by Yi TZ Li/China/IBM]

--0__=C7BB0B27DFA042DD8f9e8a93df938690918cC7BB0B27DFA042DD
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">Javier,</font></tt><br><br><tt><font si=
ze=3D"2">Andrew has mentioned the cause of the bug.</font></tt><br><br><tt>=
<font size=3D"2">When I added the RaspberryPi configure to OpenBMC, I refer=
red to configuration of other boards, like:</font></tt><br><tt><font size=
=3D"2">&quot;</font></tt><tt><font size=3D"2">meta-openbmc-machines/meta-ev=
b/meta-evb-aspeed/meta-evb-ast2500/conf</font></tt><tt><font size=3D"2">&qu=
ot;, you might also refer to other working machines.</font></tt><br><br><tt=
><font size=3D"2">The original target was to build an OpenBMC image for Ras=
pberryPi, but I never tested on a real hardware.</font></tt><br><tt><font s=
ize=3D"2">More work is required to run OpenBMC on a Raspberry Pi.</font></t=
t><br><br><tt><font size=3D"2">The &quot;meta-phosphor&quot; layer has been=
 changed since that time, we need to update RaspberryPi configurations acco=
rdingly.</font></tt><br><br><tt><font size=3D"2">Thanks,</font></tt><br><tt=
><font size=3D"2">-Yi</font></tt><br><tt><font size=3D"2"><br>&gt; From: An=
drew Jeffery &lt;andrew@aj.id.au&gt;</font></tt><br><tt><font size=3D"2">&g=
t; To: Javier Romero &lt;xavinux@gmail.com&gt;</font></tt><br><tt><font siz=
e=3D"2">&gt; Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font></=
tt><br><tt><font size=3D"2">&gt; Date: 09/10/2017 02:41 PM</font></tt><br><=
tt><font size=3D"2">&gt; Subject: Re: OpenBMC on Raspberry PI 3.</font></tt=
><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bou=
nces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</font></tt><br><tt><font size=
=3D"2">&gt; <br>&gt; On Sun, 2017-10-08 at 23:57 -0300, Javier Romero wrote=
:<br>&gt; &gt; Andrew,<br>&gt; &gt;=A0<br>&gt; &gt; Thans for your answer.<=
br>&gt; &gt;=A0<br>&gt; &gt; Bug reported:=A0<a href=3D"https://github.com/=
openbmc/openbmc/issues/2434">https://github.com/openbmc/openbmc/issues/2434=
</a><br>&gt; &gt;=A0<br>&gt; &gt; I`d like to try to cook up a patch, but d=
o I need to know a specific<br>&gt; &gt; language programming to do this ?<=
br>&gt; <br>&gt; Hmm, good question. This is probably a bug in how a bitbak=
e<br>&gt; configuration/recipe configures the kernel. As such I'd suggest g=
etting a<br>&gt; handle on Yocto, which is the build and configuration syst=
em we use.Here's the<br>&gt; quick start guide:<br>&gt; <br>&gt; <a href=3D=
"http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.htm=
l">http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.h=
tml</a><br>&gt; <br>&gt; There's also a rather daunting Mega Manual, which =
is useful as a reference<br>&gt; (rather than reading the whole thing):<br>=
&gt; <br>&gt; <a href=3D"http://www.yoctoproject.org/docs/2.1/mega-manual/m=
ega-manual.html">http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manu=
al.html</a><br>&gt; <br>&gt; Back to the bug itself, from the output that y=
ou gave I expect it's some issue<br>&gt; with the following directive:<br>&=
gt; <br>&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta=
-phosphor/conf/">https://github.com/openbmc/openbmc/blob/master/meta-phosph=
or/conf/</a><br>&gt; distro/openbmc-phosphor.conf#L57<br>&gt; <br>&gt; i.e.=
 the issue is that that linux-raspberrypi (the kernel recipe used for the<b=
r>&gt; raspberry pi[1][2]) doesn't have a 'phosphor-gpio-keys' feature. The=
 implicit<br>&gt; assumption is that the configuration will be using the li=
nux-obmc <br>&gt; tree[3][4][5], which<br>&gt; is our fork of the kernel (p=
rimarily for Aspeed SoC support).<br>&gt; <br>&gt; More generally, knowledg=
e of Python (Yocto/bitbake, some OpenBMC userspace), C<br>&gt; (u-boot, ker=
nel, qemu, also requires a some comfort with assembler) <br>&gt; and C++ (m=
ost<br>&gt; of the phosphor reference userspace applications) is useful.<br=
>&gt; <br>&gt; Hope that helps.<br>&gt; <br>&gt; Andrew<br>&gt; <br>&gt; [1=
] <a href=3D"https://github.com/openbmc/openbmc/blob/">https://github.com/o=
penbmc/openbmc/blob/</a><br>&gt; 4f2d85233d23eedaf1d4846d3d861ba28bc49b00/i=
mport-layers/meta-<br>&gt; raspberrypi/recipes-kernel/linux/linux-raspberry=
pi=5F4.4.bb<br>&gt; [2] <a href=3D"https://github.com/openbmc/openbmc/blob/=
">https://github.com/openbmc/openbmc/blob/</a><br>&gt; 4f2d85233d23eedaf1d4=
846d3d861ba28bc49b00/import-layers/meta-<br>&gt; raspberrypi/recipes-kernel=
/linux/linux-raspberrypi.inc<br>&gt; [3] <a href=3D"https://github.com/open=
bmc/openbmc/blob/">https://github.com/openbmc/openbmc/blob/</a><br>&gt; 4f2=
cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/<br>&gt; recipes=
-kernel/linux/linux-obmc=5F4.10.bb<br>&gt; [4] <a href=3D"https://github.co=
m/openbmc/openbmc/blob/">https://github.com/openbmc/openbmc/blob/</a><br>&g=
t; 4f2cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/<br>&gt; r=
ecipes-kernel/linux/linux-obmc.inc[attachment &quot;signature.asc&quot; <br=
>&gt; deleted by Yi TZ Li/China/IBM] </font></tt><BR>
</body></html>

--0__=C7BB0B27DFA042DD8f9e8a93df938690918cC7BB0B27DFA042DD--
