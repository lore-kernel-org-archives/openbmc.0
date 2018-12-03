Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EDAJt1aI"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437SkP1X5qzDqXb
 for <openbmc@lists.ozlabs.org>; Mon,  3 Dec 2018 12:55:24 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id z23so5614401plo.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Dec 2018 17:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=UemBxcSERxRtvKlpy7jjRYUs/f1jMK6oC4BFMpP3eBo=;
 b=EDAJt1aIJnedWDztL4eYmDN6gTCmw33Es5UDRKG2/17DRwWCbJBq4VnAu1aPIzU3JG
 qLDQY+LR1+PQZuRRZ3lcCXKx3cMfZsVUx1udojiMzGh8w/MFQOHlcupWBXV0Kfkqu6bV
 RWxFz2q/HgaLlQjpFd10sIO26iErqAb0Vtr6uLHtiYIwA+sF7nzAZWk3OxKvhRwRR0Kh
 +Jrc1M6jRldYcyob3JxEcKlpqXZI6ZSZLLZGDSLe8liIFLpCrU/H1guBJKBfE+ntN7jw
 4BUM3zN+TE5aVaDf0QPSSN1jm/s+dEvJLgF96Nv91QrYBECMJmVYewV0c0feDflKfOBY
 pOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=UemBxcSERxRtvKlpy7jjRYUs/f1jMK6oC4BFMpP3eBo=;
 b=ZCa5dg6NrioWLr4i2ijL2pXtWuWWbHGln9RZkm17CDwvtl19pIG5qrunvS8ITof+NY
 1JKjtxuYMB1v/gAgIlknhhq61Tj+UN2kElQi1v0LZulx2OWEGzUnu2CI36DEG7qPWtCN
 NCzw17tUqGcVGjH9fTrUpVcjqfrp/gQVEqwiYreReHggnrUhpq4GVe7hTDL1J2WU+obc
 dBPVSWqspg18oMdMb8YzwZPwurYeSAsUix7uHlLm+b++/fo98d9gS8iOMJE52BrF6N0V
 yIfl/pxRIYSPVIswqcmzWVMWJyVRHyd7oinEcOEfMAXaRcIlumxdQOvn+6CM5YJVAd60
 Sdog==
X-Gm-Message-State: AA+aEWYbbFJQQa7o4UfMKB71K7nThii/G/pDXgG3RoCDmmnaUmu5AezO
 DPisf/GQPf0TMkvnw5PyIhY=
X-Google-Smtp-Source: AFSGD/VGdC2WbVTnYdKDD+yfvVYzjJG7XcqQeCAjRWdbj2AOH53g5mjvOYZ0JWZezwoDBsRHYi9SHw==
X-Received: by 2002:a17:902:bd46:: with SMTP id
 b6mr14021302plx.231.1543802122320; 
 Sun, 02 Dec 2018 17:55:22 -0800 (PST)
Received: from [192.168.43.9] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w136sm16154489pfd.169.2018.12.02.17.55.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Dec 2018 17:55:21 -0800 (PST)
Date: Mon, 3 Dec 2018 09:55:12 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>, qianlihu
 <wangzhiqiang8906@gmail.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <d30f1d08-22c4-4dab-926b-cb794a9a336f@Spark>
In-Reply-To: <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
Subject: Re: [HELP] ipmi-kcs didn't work
X-Readdle-Message-ID: d30f1d08-22c4-4dab-926b-cb794a9a336f@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5c048d06_3ca88ecf_da85"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2018 01:55:26 -0000

--5c048d06_3ca88ecf_da85
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Dec 1, 2018, 10:29 PM +0800, Samuel Jiang <chyishian.jiang=40gmail.com=
>, wrote:
> Apologize for sending out no content mail first.
>
> Jae,
> The aspeed=5Fgates in clk-aspeed.c perhaps as todo suggest asking Aspee=
d the actual parent data for check initializing=3F
>
> Vijay,
> I traced lpc-ctrl module, it seems direct update the same ASPEED=5FCLK=5F=
GATE=5FLCLK register map bit to enable. If parent data is disabled, it co=
uld enable in dts.
> The device tree detail, I reference it from aspeed-g5.dtsi. Hope it cou=
ld help you for work.
>

Hi Vijay,

=E2=80=83Correct above content, how to enable LPC-ctrl module, we follow =
aspeed-bmc-opp-romulus.dts to adjust that.

Samuel


> =C2=A0Thanks,
>
> Samuel Jiang
> On Dec 1, 2018, 7:04 AM +0800, Jae Hyun Yoo , wrote:
> > On 11/30/2018 4:39 PM, Vijay Khemka wrote:
> > >
> > >
> > > On 11/30/18, 11:29 AM, =22Jae Hyun Yoo=22 <jae.hyun.yoo=40linux.int=
el.com> wrote:
> > >
> > > On 11/30/2018 12:57 PM, Vijay Khemka wrote:
> > > >
> > > > On 11/30/18, 7:31 AM, =22Jae Hyun Yoo=22 <jae.hyun.yoo=40linux.in=
tel.com> wrote:
> > > >
> > > > On 11/29/2018 9:00 PM, Samuel Jiang wrote:
> > > > > Hi Jae,
> > > > >
> > > > > We also encountered the same situation a month ago.
> > > > > We try to enable the LPC clock on devicetree to resolve this pr=
oblem not
> > > > > direct modify clock driver.
> > > > >
> > > > > lpc=5Fctrl: lpc-ctrl=400 =7B
> > > > > =E2=80=83 compatible =3D =22aspeed,ast2500-lpc-ctrl=E2=80=9D;
> > > > > =E2=80=83 reg =3D <0x0 0x80>;
> > > > > =E2=80=83 clocks =3D <&syscon ASPEED=5FCLK=5FGATE=5FLCLK>;
> > > > > status =3D =E2=80=9Cokay=E2=80=9D;
> > > > > =7D;
> > > > >
> > > > > However, I=E2=80=99m not sure which is better for LPC=5FCLCK se=
tting.
> > > > > Whether we should modify driver if original data is enabled or =
should
> > > > > enable on the device tree, correct=3F
> > > > >
> > > > >
> > > >
> > > > Hi Samuel,
> > > >
> > > > Yes, you are right. I realized that kcs=5Fbmc=5Faspeed.c doesn't =
have any
> > > > clock control code so adding a clocks setting into kcs dtsi code =
doesn't
> > > > make any help. Also, it was the reason why the change is needed o=
n
> > > > clk-aspeed.c. Enabling lpc=5Fctrl node you suggested seems a righ=
t way.
> > > >
> > > > Hi Vijay,
> > > > Can you please try the way Samuel suggested after removing change=
s I
> > > > gave you. Samuel's solution looks good to me.
> > > >
> > > > Thanks,
> > > > Jae
> > > >
> > > > Jae,
> > > > I can try. We can certainly enable lpc=5Fctrl node but in my unde=
rstanding that
> > > > we still need this below patch to redefine ASPEED=5FCLK=5FGATE=5F=
LCLK value to
> > > > add CRITICAL. I might be missing something here.
> > > > - =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,=
 NULL, 0 =7D, /* LPC */
> > > > + =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,=
 NULL, CLK=5FIS=5FCRITICAL =7D, /* LPC */
> > > >
> > >
> > > Vijay,
> > >
> > > I checked that lpc=5Fctrl module has clocks dt property handling co=
de in
> > > the module so I think the LCLK would be enabled without the clk-asp=
eed.c
> > > fix. I can't test it now because I'm in a business trip so please t=
est
> > > it. I'll also check it when I back to office a week after.
> > >
> > > Thanks,
> > > Jae
> > >
> > > Jae,
> > > I removed above aspeed clock driver patch, and enabled lpc-ctrl nod=
e in dts also removed clock definition from kcs. And I don't see host is =
getting powered on. It works only with clock driver change.
> > >
> > > And I still didn't understand how enabling lpc-ctrl node will initi=
alize ASPEED=5FCLK=5FGATE=5FLCLK to CRITICAL.
> > >
> > > -Vijay
> > >
> >
> > Vijay,
> >
> > Thanks Vijay for sharing the test result. I'll also check it on my
> > hardware when I get back to office. Will share my test result too.
> >
> > Thanks again,
> > Jae

--5c048d06_3ca88ecf_da85
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On Dec 1, 2018,=
 10:29 PM +0800, Samuel Jiang &lt;chyishian.jiang=40gmail.com&gt;, wrote:=
<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>
<div>Apologize for sending out no content mail first.<br /></div>
<div><br /></div>
<div>Jae,</div>
<div>The aspeed=5Fgates in clk-aspeed.c perhaps as todo suggest asking As=
peed the actual parent data for check initializing=3F<br /></div>
<div><br /></div>
<div>Vijay,</div>
<div>I traced lpc-ctrl module, it seems direct update the same ASPEED=5FC=
LK=5FGATE=5FLCLK register map bit to enable. If parent data is disabled, =
it could enable in dts.</div>
<div>The device tree detail, I reference it from aspeed-g5.dtsi. Hope it =
could help you for work.<br /></div>
</div>
<div name=3D=22messageSignatureSection=22 style=3D=22font-size: 14px; fon=
t-family: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>&=23160;<br=
 /></div>
</blockquote>
<div><br /></div>
<div>Hi Vijay,</div>
<div>=E2=80=83</div>
<div>=E2=80=83Correct above content, how to enable LPC-ctrl module, we fo=
llow aspeed-bmc-opp-romulus.dts to adjust that.</div>
<div><br /></div>
<div>Samuel&=23160;</div>
<div><br /></div>
<div><br /></div>
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>
<div name=3D=22messageSignatureSection=22 style=3D=22font-size: 14px; fon=
t-family: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>&=23160;Tha=
nks,
<div><br /></div>
<div>Samuel Jiang</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On Dec 1, 2018,=
 7:04 AM +0800, Jae Hyun Yoo , wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23e67e22;=22>On 11/30/2018 4:39 PM, Vijay K=
hemka wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =233498db;=22><br />
<br />
=EF=BB=BFOn 11/30/18, 11:29 AM, =22Jae Hyun Yoo=22 &lt;jae.hyun.yoo=40lin=
ux.intel.com&gt; wrote:<br />
<br />
On 11/30/2018 12:57 PM, Vijay Khemka wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23d35400;=22><br />
On 11/30/18, 7:31 AM, =22Jae Hyun Yoo=22 &lt;jae.hyun.yoo=40linux.intel.c=
om&gt; wrote:<br />
<br />
On 11/29/2018 9:00 PM, Samuel Jiang wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =2334495e;=22>Hi Jae,<br />
<br />
We also encountered the same situation a month ago.<br />
We try to enable the LPC clock on devicetree to resolve this problem not<=
br />
direct modify clock driver.<br />
<br />
lpc=5Fctrl: lpc-ctrl=400 =7B<br />
=E2=80=83 compatible =3D =22aspeed,ast2500-lpc-ctrl=E2=80=9D;<br />
=E2=80=83 reg =3D &lt;0x0 0x80&gt;;<br />
=E2=80=83 clocks =3D &lt;&amp;syscon ASPEED=5FCLK=5FGATE=5FLCLK&gt;;<br /=
>
status =3D =E2=80=9Cokay=E2=80=9D;<br />
=7D;<br />
<br />
However, I=E2=80=99m not sure which is better for LPC=5FCLCK setting.<br =
/>
Whether we should modify driver if original data is enabled or should<br =
/>
enable on the device tree, correct=3F<br />
<br />
<br /></blockquote>
<br />
Hi Samuel,<br />
<br />
Yes, you are right. I realized that kcs=5Fbmc=5Faspeed.c doesn't have any=
<br />
clock control code so adding a clocks setting into kcs dtsi code doesn't<=
br />
make any help. Also, it was the reason why the change is needed on<br />
clk-aspeed.c. Enabling lpc=5Fctrl node you suggested seems a right way.<b=
r />
<br />
Hi Vijay,<br />
Can you please try the way Samuel suggested after removing changes I<br /=
>
gave you. Samuel's solution looks good to me.<br />
<br />
Thanks,<br />
Jae<br />
<br />
Jae,<br />
I can try. We can certainly enable lpc=5Fctrl node but in my understandin=
g that<br />
we still need this below patch to redefine ASPEED=5FCLK=5FGATE=5FLCLK val=
ue to<br />
add CRITICAL. I might be missing something here.<br />
- =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22, NULL, 0=
 =7D, /* LPC */<br />
+ =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22, NULL, C=
LK=5FIS=5FCRITICAL =7D, /* LPC */<br />
<br /></blockquote>
<br />
Vijay,<br />
<br />
I checked that lpc=5Fctrl module has clocks dt property handling code in<=
br />
the module so I think the LCLK would be enabled without the clk-aspeed.c<=
br />
fix. I can't test it now because I'm in a business trip so please test<br=
 />
it. I'll also check it when I back to office a week after.<br />
<br />
Thanks,<br />
Jae<br />
<br />
Jae,<br />
I removed above aspeed clock driver patch, and enabled lpc-ctrl node in d=
ts also removed clock definition from kcs. And I don't see host is gettin=
g powered on. It works only with clock driver change.<br />
<br />
And I still didn't understand how enabling lpc-ctrl node will initialize =
ASPEED=5FCLK=5FGATE=5FLCLK to CRITICAL.<br />
<br />
-Vijay<br />
<br /></blockquote>
<br />
Vijay,<br />
<br />
Thanks Vijay for sharing the test result. I'll also check it on my<br />
hardware when I get back to office. Will share my test result too.<br />
<br />
Thanks again,<br />
Jae<br /></blockquote>
<div></div>
</div>
</blockquote>
</div>
</body>
</html>

--5c048d06_3ca88ecf_da85--
