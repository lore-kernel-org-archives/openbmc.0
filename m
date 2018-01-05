Return-Path: <prvs=45432c9750=cov@fb.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=45432c9750=cov@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="hU0KA6YP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="KaVBlVx3"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zD0jV6zrFzDqMj
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2018 10:09:17 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 w05LsQkE030921; Fri, 5 Jan 2018 13:57:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=8SA+ktjXyjtsoyf51NirzAVpyBliQM7XWeRxcmor6hA=;
 b=hU0KA6YPBhVf2zYNzy5ExfmdQwX/S0U1O85vKGHR10zoZ0EF3YA8I0d3GJJZqhcTeK1F
 NP7IylXu5d++5uzwvtFyZXk7ESMrSs/DTMwkjz21e7bLO8y+ga7E4hho7qOxzcnGqktu
 n9Krm/qIPRfvKe7VEuf9hUdEA/Gw8+sAv5Y= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2fagdt86k9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jan 2018 13:57:29 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.26) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Fri, 5 Jan 2018 16:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8SA+ktjXyjtsoyf51NirzAVpyBliQM7XWeRxcmor6hA=;
 b=KaVBlVx32wqjldF9PXDpVBeShl2uE3+3IApwLOXyKnCIlO6w67Cx3RWYvTnBLMxTGv/DOlAcOXAr6HUXovFY2dA+iDYqQlZ9dgyL/QCc+P9jBZBlwXe9nbaLBMYDSZsvIU8TLdu2LMxn545H6UU8BqUNdHO5Ji68SM3KKK5JlrM=
Received: from MW2PR1501MB1978.namprd15.prod.outlook.com (52.132.149.154) by
 MW2PR1501MB1978.namprd15.prod.outlook.com (52.132.149.154) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.386.5; Fri, 5 Jan
 2018 21:57:25 +0000
Received: from MW2PR1501MB1978.namprd15.prod.outlook.com
 ([fe80::89dc:4130:1631:aa15]) by MW2PR1501MB1978.namprd15.prod.outlook.com
 ([fe80::89dc:4130:1631:aa15%13]) with mapi id 15.20.0386.006; Fri, 5 Jan 2018
 21:57:25 +0000
From: Christopher Covington <cov@fb.com>
To: Michael E Brown <Michael.E.Brown@dell.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>
CC: "stewart@linux.vnet.ibm.com" <stewart@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Thread-Topic: OpenBMC community telecon - 11/27 Agenda
Thread-Index: AQHThX1jW/a68F4MaUa/Iii+r9fTPKNl00Em
Date: Fri, 5 Jan 2018 21:57:25 +0000
Message-ID: <MW2PR1501MB1978E7E54C8CFD8B57393A9ECB1C0@MW2PR1501MB1978.namprd15.prod.outlook.com>
References: <20171205010205.GH113334@mauery>
 <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
 <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
 <20171228233714.GR113334@mauery>,
 <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
In-Reply-To: <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.201.64.132]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MW2PR1501MB1978;
 7:gLr66p1+bpyEN0KisoWzqAtahY+BvuSxCd2Dfk6X6k9KCtxXpjLxpy/AMB0DOgotjJkgawWUdR/CRvJhS34e0xcQZSf20NEj4ZRq72zOLIZDSXTIWtWpzlIuBn/KNcJnq9tMnbjInYiTcjrCGezZsYAXtt2WG68bpnWx9KM0L4RT/aILRswzncV3453Fb7Ug1Y7hzlhtYOE8MIWH5OaOb45OTPctKgZlhayC4U+vQ2lTlE+8GKWz7uSH7WkmAEyZ;
 20:Srur08lNh8CdbOR5ddWxeQeZQISme82nd81BjOnW/3dHQlhECWupU8m9ycWo6uzRCWZ/LKcYdrOJTaAV9kwajgOgqYDFXYzhWp32ndkT2+U96rNzvgEpKhmp8/fbHL8wllX6F10e27RaQcY9IvFe9XyD61W9LiwK7lvnfvpnrPU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 3eee149f-2300-4433-0684-08d554874e56
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060);
 SRVR:MW2PR1501MB1978; 
x-ms-traffictypediagnostic: MW2PR1501MB1978:
x-microsoft-antispam-prvs: <MW2PR1501MB1978118561D57322339F624CCB1C0@MW2PR1501MB1978.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(60795455431006)(192374486261705)(65623756079841)(104084551191319)(64217206974132)(56004941905204)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(11241501184)(944501075)(3002001)(10201501046)(93006095)(93001095)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);
 SRVR:MW2PR1501MB1978; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:MW2PR1501MB1978; 
x-forefront-prvs: 05437568AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(39380400002)(346002)(366004)(24454002)(15404003)(189003)(199004)(3660700001)(6436002)(478600001)(66066001)(68736007)(5660300001)(6306002)(81166006)(93886005)(229853002)(25786009)(4326008)(3280700002)(54896002)(9686003)(81156014)(99286004)(8666007)(7736002)(6116002)(19627405001)(8936002)(2950100002)(3846002)(8676002)(86362001)(97736004)(6246003)(53546011)(106356001)(105586002)(6506007)(606006)(236005)(316002)(54906003)(7696005)(6606003)(14454004)(2900100001)(74316002)(966005)(102836004)(53936002)(33656002)(5250100002)(2906002)(59450400001)(55016002)(110136005)(76176011)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR1501MB1978;
 H:MW2PR1501MB1978.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: OrpXRsOGnSggNRy8Ls9pa/7AWaI7u1UL/RoiUP5xXKbE5qxeXIj2eXLtBvmufRrAdIdgDNk/EXQSH8qPHvDQXw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MW2PR1501MB1978E7E54C8CFD8B57393A9ECB1C0MW2PR1501MB1978_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eee149f-2300-4433-0684-08d554874e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2018 21:57:25.3121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB1978
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-05_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Fri, 05 Jan 2018 23:09:28 -0000

--_000_MW2PR1501MB1978E7E54C8CFD8B57393A9ECB1C0MW2PR1501MB1978_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In case there are others out there for whom PAM/NSS (and the implied LDAP?)=
 may not quite fit, I've recently been configuring SSH trusted CA and autho=
rized principals lists, and like it a lot. https://code.facebook.com/posts/=
365787980419535/scalable-and-secure-access-with-ssh/

________________________________
From: openbmc <openbmc-bounces+cov=3Dfb.com@lists.ozlabs.org> on behalf of =
Michael E Brown <Michael.E.Brown@dell.com>
Sent: Thursday, January 4, 2018 8:58:05 AM
To: Vernon Mauery
Cc: stewart@linux.vnet.ibm.com; openbmc@lists.ozlabs.org; bradleyb@fuzziesq=
uirrel.com; richard.marian.thomaiyar@linux.intel.com; Michael.E.Brown@dell.=
com
Subject: Re: OpenBMC community telecon - 11/27 Agenda

On Thu, Dec 28, 2017 at 03:37:14PM -0800, Vernon Mauery wrote:
> On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:
> > We have spent almost two years now writing a comprehensive SELinux poli=
cy for our product. Our current shipping product has SELinux enabled and in=
 "permissive" mode for field testing. Our next major release will have SELi=
nux in enforcing mode, barring major issues in testing. We just had outside=
 security auditors take a look at the implementation and I must say that I'=
m very pleased with the outcome.
> >
> > <soapbox mode=3D"on">
> > I strongly encourage every embedded project to have a comprehensive SEL=
inux policy, to enable that policy at the earliest possible opportunity dur=
ing development, and to have a robust solution and development methodology =
to run all daemons as NON-root. My personal experience is that it is extrao=
rdinarily difficult to retrofit SELinux policy onto a legacy codebase and t=
hat it is very difficult to convert an existing codebase running as root to=
 full non-root. What tends to happen is that unrelated things get stuffed i=
nto the "wrong" places and things break in both spectacular and subtle ways=
, sometimes at the same time, when you try to do the conversion from root -=
> noroot and DAC -> MAC. The earlier you make this transition, the easier t=
hings are, long term.
> > </soapbox>
> >
> > My biggest problem right now with openbmc is that everything runs as ro=
ot and there is no selinux. Huge step backwards for me. :)  This is one maj=
or thing that I would like to help drive in OpenBMC.
> >
> > If you run all the daemons as different users, that tends to sort out d=
esign issues.
> >
> > Now, on to the good stuff I can say: The openbmc design lends itself *r=
eally* well to both non-root and SELinux. Having DBUS as the common interfa=
ce should let us do something like:
> >      - phosphor-hwmon runs as "hwmon" user and group. (systemd service =
file settings User=3D, Group=3D)
> >      - phosphor-hwmon installs systemd-tmpfiles to change file ownershi=
p of the sysfs files needed to run hwmon daemons as hwmon user
> >      - phosphor-hwmon installs DBUS policy files to allow itself to own=
 the dbus endpoints
> >      - phosphor-hwmon dbus policy files specify a group that can be use=
d to call the dbus endpoints (eg. "hwmon_read")
> >      - On the other side of this, the thermal daemons run with suppleme=
ntary groups "hwmon_read" (systemd SupplementaryGroups=3D)
> >      - SELinux policy written for phosphor-hwmon that allows it to *onl=
y* read hwmon sysfs files, and talk to DBUS.
>
> I fully support your direction with the "run each daemon as its own user"
> policy. Almost nothing should be running as root anymore.

Looks like I need to do some builds and look at this, as I'm operating off =
old
information then.

> I don't have any SELinux experience, so it is great to have someone in th=
e
> community that does and is willing to drive that.

Thanks

> Have you considered using user namespaces to avoid username collisions wi=
th
> system users and user-chosen names (like if an IPMI user wanted to pick
> 'root' as the name)? I have seen people demonstrate how you can use
> containers to do this, but I have not yet figured out how it all works.

I've given this a little bit of thought. Yes, you could use some user
namespaces for this, though to be honest I don't really think it buys all t=
hat
much. You can limit ptrace with yama and basically protect the users from e=
ach
other pretty well that way, all using a single account. But we could add us=
er
namespaces here as well. The hard part would be in figuring out how to do d=
bus
level security. I think we'll need to have a unified policy around security=
 of
dbus to tie everything together.

> The reason I don't like the NSS mechanism with a single unix user that yo=
u
> proposed is that it allows users to attack each other, which can lead to
> privilege escalations as well. If the non-system users are namespaced, th=
ey
> can be called whatever they want and have whatever ID they want, but as f=
ar
> as the kernel goes, they are separate users and all non-root.

I think the overriding question here is what kind of shell access do we wan=
t to
give to users of openbmc, and what permissions do we want to give them in t=
he
shell? If we want as a project to have the default openbmc "ssh" access be =
to a
bash shell, then we need to do a lot more around security to get this all t=
o
work well. This is also going to be very difficult to make sure we get
everything correct, however, it is do-able.

On Dell's product, we have a custom shell, and users don't have any generic
system access. Users have no write access to any filesystems, so there is n=
o
way for any logged in user to attack another user via a file.  This pretty
effective in our product.

If we want to have openbmc give shell access to users, lets figure out what
that looks like from a security perspective.

NSS/PAM and one "linux" account, lets call it 'bmcuser'. We'll call the
accounts that users use "bmc accounts". (for example, user could create 'us=
er1'
and 'user2' and those would not show up as linux accounts) It would be
relatively straightforward, I believe, to ensure that one bmc account canno=
t
attack another bmc account even if both are running in the same linux accou=
nt,
either with or without namespaces.

With or without namespaces:
        - Need a way to unambiguously set security policy so that things li=
ke
dbus calls can have appropriate security applied. Likely the best way to do
this is via normal linux groups. Then we need a comprehensive policy for db=
us
to apply the group security policy. This way, we can apply policy for shell
users when they do things like busctl, or use cli utilities that make dbus
calls.
        - Need to ensure that all writable filesystems are mounted noexec t=
o
prevent silly shell attacks.

Without namespaces:
        - use the yama security patches to disable ptrace for non-children.
        - possibly use seccomp to disable ptrace()
        - possibly use seccomp to disable kill()

With namespaces:
        - set bmcuser login shell to a special wrapper which spawns new
namespace, sets groups appropriately, and exec's shell.

--
Michael


--_000_MW2PR1501MB1978E7E54C8CFD8B57393A9ECB1C0MW2PR1501MB1978_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">In case there are others out ther=
e for whom PAM/NSS (and the implied LDAP?) may not quite fit, I've recently=
 been configuring SSH trusted CA and authorized principals lists, and like =
it a lot.
<a href=3D"https://code.facebook.com/posts/365787980419535/scalable-and-sec=
ure-access-with-ssh/" class=3D"OWAAutoLink" id=3D"LPlnk754525" previewremov=
ed=3D"true">
https://code.facebook.com/posts/365787980419535/scalable-and-secure-access-=
with-ssh/</a><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc-b=
ounces&#43;cov=3Dfb.com@lists.ozlabs.org&gt; on behalf of Michael E Brown &=
lt;Michael.E.Brown@dell.com&gt;<br>
<b>Sent:</b> Thursday, January 4, 2018 8:58:05 AM<br>
<b>To:</b> Vernon Mauery<br>
<b>Cc:</b> stewart@linux.vnet.ibm.com; openbmc@lists.ozlabs.org; bradleyb@f=
uzziesquirrel.com; richard.marian.thomaiyar@linux.intel.com; Michael.E.Brow=
n@dell.com<br>
<b>Subject:</b> Re: OpenBMC community telecon - 11/27 Agenda</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Dec 28, 2017 at 03:37:14PM -0800, Vernon M=
auery wrote:<br>
&gt; On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:<br>
&gt; &gt; We have spent almost two years now writing a comprehensive SELinu=
x policy for our product. Our current shipping product has SELinux enabled =
and in &quot;permissive&quot; mode for field testing. Our next major releas=
e will have SELinux in enforcing mode, barring major
 issues in testing. We just had outside security auditors take a look at th=
e implementation and I must say that I'm very pleased with the outcome.<br>
&gt; &gt; <br>
&gt; &gt; &lt;soapbox mode=3D&quot;on&quot;&gt;<br>
&gt; &gt; I strongly encourage every embedded project to have a comprehensi=
ve SELinux policy, to enable that policy at the earliest possible opportuni=
ty during development, and to have a robust solution and development method=
ology to run all daemons as NON-root.
 My personal experience is that it is extraordinarily difficult to retrofit=
 SELinux policy onto a legacy codebase and that it is very difficult to con=
vert an existing codebase running as root to full non-root. What tends to h=
appen is that unrelated things get
 stuffed into the &quot;wrong&quot; places and things break in both spectac=
ular and subtle ways, sometimes at the same time, when you try to do the co=
nversion from root -&gt; noroot and DAC -&gt; MAC. The earlier you make thi=
s transition, the easier things are, long term.<br>
&gt; &gt; &lt;/soapbox&gt;<br>
&gt; &gt; <br>
&gt; &gt; My biggest problem right now with openbmc is that everything runs=
 as root and there is no selinux. Huge step backwards for me. :)&nbsp; This=
 is one major thing that I would like to help drive in OpenBMC.<br>
&gt; &gt; <br>
&gt; &gt; If you run all the daemons as different users, that tends to sort=
 out design issues.<br>
&gt; &gt; <br>
&gt; &gt; Now, on to the good stuff I can say: The openbmc design lends its=
elf *really* well to both non-root and SELinux. Having DBUS as the common i=
nterface should let us do something like:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - phosphor-hwmon runs as &quot;hwmo=
n&quot; user and group. (systemd service file settings User=3D, Group=3D)<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - phosphor-hwmon installs systemd-t=
mpfiles to change file ownership of the sysfs files needed to run hwmon dae=
mons as hwmon user<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - phosphor-hwmon installs DBUS poli=
cy files to allow itself to own the dbus endpoints<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - phosphor-hwmon dbus policy files =
specify a group that can be used to call the dbus endpoints (eg. &quot;hwmo=
n_read&quot;)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - On the other side of this, the th=
ermal daemons run with supplementary groups &quot;hwmon_read&quot; (systemd=
 SupplementaryGroups=3D)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - SELinux policy written for phosph=
or-hwmon that allows it to *only* read hwmon sysfs files, and talk to DBUS.=
<br>
&gt; <br>
&gt; I fully support your direction with the &quot;run each daemon as its o=
wn user&quot;<br>
&gt; policy. Almost nothing should be running as root anymore. <br>
<br>
Looks like I need to do some builds and look at this, as I'm operating off =
old<br>
information then.<br>
<br>
&gt; I don't have any SELinux experience, so it is great to have someone in=
 the<br>
&gt; community that does and is willing to drive that.<br>
<br>
Thanks<br>
<br>
&gt; Have you considered using user namespaces to avoid username collisions=
 with<br>
&gt; system users and user-chosen names (like if an IPMI user wanted to pic=
k<br>
&gt; 'root' as the name)? I have seen people demonstrate how you can use<br=
>
&gt; containers to do this, but I have not yet figured out how it all works=
.<br>
<br>
I've given this a little bit of thought. Yes, you could use some user<br>
namespaces for this, though to be honest I don't really think it buys all t=
hat<br>
much. You can limit ptrace with yama and basically protect the users from e=
ach<br>
other pretty well that way, all using a single account. But we could add us=
er<br>
namespaces here as well. The hard part would be in figuring out how to do d=
bus<br>
level security. I think we'll need to have a unified policy around security=
 of<br>
dbus to tie everything together.<br>
<br>
&gt; The reason I don't like the NSS mechanism with a single unix user that=
 you<br>
&gt; proposed is that it allows users to attack each other, which can lead =
to<br>
&gt; privilege escalations as well. If the non-system users are namespaced,=
 they<br>
&gt; can be called whatever they want and have whatever ID they want, but a=
s far<br>
&gt; as the kernel goes, they are separate users and all non-root.<br>
<br>
I think the overriding question here is what kind of shell access do we wan=
t to<br>
give to users of openbmc, and what permissions do we want to give them in t=
he<br>
shell? If we want as a project to have the default openbmc &quot;ssh&quot; =
access be to a<br>
bash shell, then we need to do a lot more around security to get this all t=
o<br>
work well. This is also going to be very difficult to make sure we get<br>
everything correct, however, it is do-able.<br>
<br>
On Dell's product, we have a custom shell, and users don't have any generic=
<br>
system access. Users have no write access to any filesystems, so there is n=
o<br>
way for any logged in user to attack another user via a file.&nbsp; This pr=
etty<br>
effective in our product.<br>
<br>
If we want to have openbmc give shell access to users, lets figure out what=
<br>
that looks like from a security perspective.<br>
<br>
NSS/PAM and one &quot;linux&quot; account, lets call it 'bmcuser'. We'll ca=
ll the<br>
accounts that users use &quot;bmc accounts&quot;. (for example, user could =
create 'user1'<br>
and 'user2' and those would not show up as linux accounts) It would be<br>
relatively straightforward, I believe, to ensure that one bmc account canno=
t<br>
attack another bmc account even if both are running in the same linux accou=
nt,<br>
either with or without namespaces.<br>
<br>
With or without namespaces:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Need a way to unambiguously se=
t security policy so that things like<br>
dbus calls can have appropriate security applied. Likely the best way to do=
<br>
this is via normal linux groups. Then we need a comprehensive policy for db=
us<br>
to apply the group security policy. This way, we can apply policy for shell=
<br>
users when they do things like busctl, or use cli utilities that make dbus<=
br>
calls.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Need to ensure that all writab=
le filesystems are mounted noexec to<br>
prevent silly shell attacks.<br>
<br>
Without namespaces: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - use the yama security patches =
to disable ptrace for non-children. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - possibly use seccomp to disabl=
e ptrace() <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - possibly use seccomp to disabl=
e kill()<br>
<br>
With namespaces:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - set bmcuser login shell to a s=
pecial wrapper which spawns new<br>
namespace, sets groups appropriately, and exec's shell.<br>
<br>
--<br>
Michael<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW2PR1501MB1978E7E54C8CFD8B57393A9ECB1C0MW2PR1501MB1978_--
