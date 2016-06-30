Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgH6v39WXzDq5f
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 21:16:39 +1000 (AEST)
Received: from [10.205.122.234] (mobile-107-92-58-211.mycingular.net
 [107.92.58.211]) by mx.zohomail.com
 with SMTPS id 1467285395237435.2401235311057;
 Thu, 30 Jun 2016 04:16:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-8198F550-0D55-47B7-AF02-E6281269DBD1
Mime-Version: 1.0 (1.0)
Subject: Re: Gerrit server migration
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (13F69)
In-Reply-To: <OF078F9B9A.3E0E3D3C-ON48257FE2.0028571B-48257FE2.00293E97@notes.na.collabserv.com>
Date: Thu, 30 Jun 2016 06:16:33 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <4E458F8F-2914-43F9-9A23-792D7168FBE7@stwcx.xyz>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <20160629182150.GP20922@asimov.austin.ibm.com>
 <OF078F9B9A.3E0E3D3C-ON48257FE2.0028571B-48257FE2.00293E97@notes.na.collabserv.com>
To: Yi TZ Li <shliyi@cn.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 11:16:40 -0000


--Apple-Mail-8198F550-0D55-47B7-AF02-E6281269DBD1
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

You can submit the one in Gerrit and the other in Github.=20

Skeleton will be moved later this week or early next week. There are a few m=
ajor pieces of work going through that repository for the next 1.0.x tag.=20=


Patrick
Sent from my iPhone

> On Jun 30, 2016, at 2:30 AM, Yi TZ Li <shliyi@cn.ibm.com> wrote:
>=20
> Hi,
>=20
> I have a patch to fix issue: https://github.com/openbmc/skeleton/issues/64=

> This patch will change skeleton (in github), and openbmc/pyphosphor (in ge=
rrit).
>=20
> So I think I should wait for skeleton being migrated to Gerrit to submit t=
he patch. Do we have an expected time
> when all the migration be finished?
>=20
> Thanks,
> -Yi
>=20
> "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on 0=
6/30/2016 02:21:50 AM:
>=20
> > From: Patrick Williams <patrick@stwcx.xyz>
> > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Date: 06/30/2016 02:22 AM
> > Subject: Re: Gerrit server migration
> > Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org=
>
> >=20
> > These repos are now also migrated:
> >          * openbmc / phosphor-rest-server
> >          * openbmc / openbmc-test-automation
> >=20
> > On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> > > All,
> > >=20
> > > The Gerrit server is now ready for use.  All of the repositories excep=
t
> > > for the ones listed below are migrated to it.  We therefore no longer
> > > accept pull requests on Github, but instead need commits to go through=

> > > Gerrit.
> > >=20
> > > For a reminder, the Gerrit server is at https://gerrit.openbmc-project=
.xyz
> > > and documentation can be found in this outstanding pull request
> > > https://github.com/openbmc/docs/pull/30 .
> > >=20
> > > The Gerrit server automatically replicates all merged commits back to
> > > Github, so Github is still considered the canonical location for our s=
ource.
> > >=20
> > > Not [yet] migrated repositories:
> > >     * Waiting on a few pull requests to be closed.
> > >         * openbmc / openbmc
> > >         * openbmc / skeleton
> > >         * openbmc / phosphor-host-ipmid
> > >         * openbmc / ipmi-fru-parser
> > >         * openbmc / openpower-host-ipmi-oem
> > >     * To be migrated later this week.
> > >         * openbmc / docs
> > >         * openbmc / openbmc-build-scripts
> > >     * Never to be migrated (use mailing list for commits).
> > >         * openbmc / linux
> > >         * openbmc / ipmitool
> > >         * openbmc / u-boot
> > >         * openbmc / qemu
> > > --
> > > Patrick Williams
> >=20
> >=20
> >=20
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
> >=20
> >=20
> > --=20
> > Patrick Williams
> > [attachment "signature.asc" deleted by Yi TZ Li/China/IBM]=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--Apple-Mail-8198F550-0D55-47B7-AF02-E6281269DBD1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>You can submit the one in Gerrit and t=
he other in Github.&nbsp;</div><div id=3D"AppleMailSignature"><br></div><div=
 id=3D"AppleMailSignature">Skeleton will be moved later this week or early n=
ext week. There are a few major pieces of work going through that repository=
 for the next 1.0.x tag.&nbsp;<br><br>Patrick<div>Sent from my iPhone</div><=
/div><div><br>On Jun 30, 2016, at 2:30 AM, Yi TZ Li &lt;<a href=3D"mailto:sh=
liyi@cn.ibm.com">shliyi@cn.ibm.com</a>&gt; wrote:<br><br></div><blockquote t=
ype=3D"cite"><div><p>Hi,<br><br>I have a patch to fix issue: <a href=3D"http=
s://github.com/openbmc/skeleton/issues/64">https://github.com/openbmc/skelet=
on/issues/64</a><br>This patch will change skeleton (in github), and openbmc=
/pyphosphor (in gerrit).<br><br>So I think I should wait for skeleton being m=
igrated to Gerrit to submit the patch. Do we have an expected time<br>when a=
ll the migration be finished?<br><br>Thanks,<br>-Yi<br><br><tt>"openbmc" &lt=
;<a href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">ope=
nbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote on 06/30/201=
6 02:21:50 AM:<br><br>&gt; From: Patrick Williams &lt;<a href=3D"mailto:patr=
ick@stwcx.xyz">patrick@stwcx.xyz</a>&gt;</tt><br><tt>&gt; To: OpenBMC Mailli=
st &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org<=
/a>&gt;</tt><br><tt>&gt; Date: 06/30/2016 02:22 AM</tt><br><tt>&gt; Subject:=
 Re: Gerrit server migration</tt><br><tt>&gt; Sent by: "openbmc" &lt;<a href=
=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">openbmc-bou=
nces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt;</tt><br><tt>&gt; <br>&gt; T=
hese repos are now also migrated:<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
* openbmc / phosphor-rest-server<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*=
 openbmc / openbmc-test-automation<br>&gt; <br>&gt; On Mon, Jun 27, 2016 at 0=
5:15:01PM -0500, Patrick Williams wrote:<br>&gt; &gt; All,<br>&gt; &gt; <br>=
&gt; &gt; The Gerrit server is now ready for use. &nbsp;All of the repositor=
ies except<br>&gt; &gt; for the ones listed below are migrated to it. &nbsp;=
We therefore no longer<br>&gt; &gt; accept pull requests on Github, but inst=
ead need commits to go through<br>&gt; &gt; Gerrit.<br>&gt; &gt; <br>&gt; &g=
t; For a reminder, the Gerrit server is at <a href=3D"https://gerrit.openbmc=
-project.xyz">https://gerrit.openbmc-project.xyz</a><br>&gt; &gt; and docume=
ntation can be found in this outstanding pull request<br>&gt; &gt; <a href=3D=
"https://github.com/openbmc/docs/pull/30">https://github.com/openbmc/docs/pu=
ll/30</a> .<br>&gt; &gt; <br>&gt; &gt; The Gerrit server automatically repli=
cates all merged commits back to<br>&gt; &gt; Github, so Github is still con=
sidered the canonical location for our source.<br>&gt; &gt; <br>&gt; &gt; No=
t [yet] migrated repositories:<br>&gt; &gt; &nbsp; &nbsp; * Waiting on a few=
 pull requests to be closed.<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * open=
bmc / openbmc<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / skeleton<=
br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / phosphor-host-ipmid<br>=
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / ipmi-fru-parser<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / openpower-host-ipmi-oem<br>&gt; &=
gt; &nbsp; &nbsp; * To be migrated later this week.<br>&gt; &gt; &nbsp; &nbs=
p; &nbsp; &nbsp; * openbmc / docs<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; *=
 openbmc / openbmc-build-scripts<br>&gt; &gt; &nbsp; &nbsp; * Never to be mi=
grated (use mailing list for commits).<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nb=
sp; * openbmc / linux<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / i=
pmitool<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / u-boot<br>&gt; &=
gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / qemu<br>&gt; &gt; --<br>&gt; &gt=
; Patrick Williams<br>&gt; <br>&gt; <br>&gt; <br>&gt; &gt; _________________=
______________________________<br>&gt; &gt; openbmc mailing list<br>&gt; &gt=
; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><b=
r>&gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://li=
sts.ozlabs.org/listinfo/openbmc</a><br>&gt; <br>&gt; <br>&gt; -- <br>&gt; Pa=
trick Williams<br>&gt; [attachment "signature.asc" deleted by Yi TZ Li/China=
/IBM] <br>&gt; _______________________________________________<br>&gt; openb=
mc mailing list<br>&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@=
lists.ozlabs.org</a><br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/op=
enbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></tt><br>

</p></div></blockquote><blockquote type=3D"cite"><div><span>________________=
_______________________________</span><br><span>openbmc mailing list</span><=
br><span><a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.or=
g</a></span><br><span><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">=
https://lists.ozlabs.org/listinfo/openbmc</a></span><br></div></blockquote><=
/body></html>=

--Apple-Mail-8198F550-0D55-47B7-AF02-E6281269DBD1--
