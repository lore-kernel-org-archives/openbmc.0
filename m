Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::129; helo=mail-it1-x129.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3x0emG9"; 
 dkim-atps=neutral
Received: from mail-it1-x129.google.com (mail-it1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439TsN1j46zDr7V
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 19:53:27 +1100 (AEDT)
Received: by mail-it1-x129.google.com with SMTP id z7so188168iti.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Dec 2018 00:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=K41vlMzCVCN5kK7RbYVXYANm1HYQQB+a/PM1wuKsh7k=;
 b=a3x0emG9KhjCuMhLY9Hnvz4PWvWhP/d9gRPG86+mxz4MjTDEDCKETGXkYzGeBBDw59
 YftYWWcZCDOWKmOLoZLK1zA3OxtMdSu+NsdkkAjA7oOv9QP4/R4QoI2VzsyNYAkYP0Vv
 H9Twqh/KJYk6PAUI7TX0wjUr1F/UnSxC2e2TTH3d4ClPAlK41Ais80hhkQICNE/NnXE5
 4jL4mPJCPik7jvfHsjo2qaTPKO5KRjFy3075KL5iOTwjJoqJN/JtkqchNEktYotUEaJ5
 oI3aByGGBKdanZJde9x8CRie0izbeQFkVPj9mXgDlHMJTpJGl+4ITz8wMSqmc0I/nQDG
 Xi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=K41vlMzCVCN5kK7RbYVXYANm1HYQQB+a/PM1wuKsh7k=;
 b=eHAaWAdwc6sMOKtpt302APMpYJ+GyJXh415PiBmxE9mztrTlkIETj+fNPcAo+/LWwR
 ByX7gHc1m+4STNiImhgrGGmdJSMO7ike3HT6v3yFusR4l1duaI1fpfV4Xkp8LI35mJt5
 zziNnf9QNE7OL18fT4hCstTvWK0BUQ5CXe5CTv9RX6UGyYbgUhjOGC7fbfqMIB0lzQUx
 8gOKvlGS6+60G9chfXI6ZtZAdVgZ+U/G9U7qsitsoXSwqdeZeTCVJlAxUIqnACZS1LRQ
 kYUcUZXlRq0UpTot4wvdHWTeVOh75KSlV11u6x8hmx70sBFaqjP7i1/m6fSVGWzXuY65
 ppiQ==
X-Gm-Message-State: AA+aEWbrjqes6SW64D7zW+/k7CsA49ZkxTGNa05KxOrYuSzxB5TefFPY
 2pEznUkqzkoKHoJapPRjbWU=
X-Google-Smtp-Source: AFSGD/XRIwLWxf5/N+m1g0pPe2I7D8DhTN52HO45WnHQHQq7E1lHoL3t+ZhlSSLSV2uG4zb3rTmjEg==
X-Received: by 2002:a24:b003:: with SMTP id d3mr18438777itf.55.1544086405295; 
 Thu, 06 Dec 2018 00:53:25 -0800 (PST)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s13sm8455721ioj.0.2018.12.06.00.53.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 00:53:24 -0800 (PST)
Date: Thu, 6 Dec 2018 16:53:15 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>, qianlihu
 <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>, Ryan
 Chen <ryan_chen@aspeedtech.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>, 
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>
Message-ID: <5c845f98-659d-4bb9-80e8-1bc732fe8b65@Spark>
In-Reply-To: <11fda24c-a82d-2fb5-d0dd-e3f3001b4096@linux.intel.com>
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
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
 <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
 <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
 <48f0e3b4-eca5-4ca6-a9ce-40b2a393ede9@Spark>
 <11fda24c-a82d-2fb5-d0dd-e3f3001b4096@linux.intel.com>
Subject: Re: [HELP] ipmi-kcs didn't work
X-Readdle-Message-ID: 5c845f98-659d-4bb9-80e8-1bc732fe8b65@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5c08e381_d34b6a8_225d"
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
X-List-Received-Date: Thu, 06 Dec 2018 08:53:29 -0000

--5c08e381_d34b6a8_225d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


> Why should the aspeed=5Fgates match with SoC default=3F All clocks will=
 be
> set newly according to the dts setting at kernel booting time or at
> module probing time.
>
> Jae

Sorry, I misunderstand the aspeed=5Fgates purpose. =C2=A0Ignore my questi=
on and drop the patch.

Thanks,

Samuel Jiang
On Dec 5, 2018, 11:01 PM +0800, Jae Hyun Yoo <jae.hyun.yoo=40linux.intel.=
com>, wrote:
> On 12/5/2018 12:45 AM, Samuel Jiang wrote:
> > Hi Ryan,
> >
> > I want to confirm=C2=A0the register default set of LCLK is running or=
 stop
> > for Aspped SoC=3F
> >
> > Hi Jae,
> > I want to confirm that does the aspeed=5Fgates is set for matching wi=
th
> > the SoC default clock setting=3F
> >
>
> Why should the aspeed=5Fgates match with SoC default=3F All clocks will=
 be
> set newly according to the dts setting at kernel booting time or at
> module probing time.
>
> Jae
>
> > I need to these things information for joining the discussion to assi=
st
> > patch to send upstream.
> >
> > Thanks,
> >
> > Samuel Jiang
> >
> > On Dec 4, 2018, 2:17 PM +0800, Ryan Chen , wrote:
> > > Hello Jae,
> > > ASPEED LPC IP HW block have serval clk input.
> > > Most important is LCLK is come from LPC Host.
> > > The others is not controllable by register.
> > > Ryan
> > >
> > > -----Original Message-----
> > > =46rom: Vijay Khemka =5Bmailto:vijaykhemka=40fb.com=5D
> > > Sent: Tuesday, December 4, 2018 3:38 AM
> > > To: Jae Hyun Yoo <jae.hyun.yoo=40linux.intel.com>; Samuel Jiang
> > > <chyishian.jiang=40gmail.com>; qianlihu <wangzhiqiang8906=40gmail.c=
om>;
> > > Gary Hsu <gary=5Fhsu=40aspeedtech.com>; Ryan Chen <ryan=5Fchen=40as=
peedtech.com>
> > > Cc: openbmc=40lists.ozlabs.org
> > > Subject: Re: =5BHELP=5D ipmi-kcs didn't work
> > >
> > >
> > >
> > > On 12/3/18, 7:54 AM, =22Jae Hyun Yoo=22 <jae.hyun.yoo=40linux.intel=
.com> wrote:
> > >
> > > On 12/1/2018 8:29 AM, Samuel Jiang wrote:
> > > > Apologize for sending out no content mail first.
> > > >
> > > > Jae,
> > > > The aspeed=5Fgates in clk-aspeed.c perhaps as todo suggest asking=
 Aspeed
> > > > the actual parent data for check initializing=3F
> > > >
> > >
> > > Yes, that makes sense.
> > >
> > > Hi Gary and Ryan,
> > >
> > > Can you please tell us what is the actual parent clock source of LP=
C IP=3F
> > > I mean the operational clock of LPC IP hardware block, not the inte=
rface
> > > clock.
> > >
> > > Thanks,
> > > Jae
> > >
> > > > Vijay,
> > > > I traced lpc-ctrl module, it seems direct update the same
> > > > ASPEED=5FCLK=5FGATE=5FLCLK register map bit to enable. If parent =
data is
> > > > disabled, it could enable in dts.
> > > > The device tree detail, I reference it from aspeed-g5.dtsi. Hope =
it
> > > > could help you for work.
> > > >
> > > > Thanks,
> > > >
> > > > Samuel Jiang
> > >
> > > Samual/Jay,
> > > In my case if I don't initialize LPC clock in driver, Bios on host
> > > side wait and doesn't boot.
> > > I don't understand here what is holding Bios here but by initializi=
ng
> > > this LPC clock let bios boot.
> > >
> > > Regards
> > > -Vijay
> > >

--5c08e381_d34b6a8_225d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>
<div><br /></div>
<div>
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>Why should the aspeed=5Fgates =
match with SoC default=3F All clocks will be<br />
set newly according to the dts setting at kernel booting time or at<br />=

module probing time.<br />
<br />
Jae</blockquote>
</div>
<div><br /></div>
<div>Sorry, I misunderstand the aspeed=5Fgates purpose. &=23160;Ignore my=
 question and drop the patch.<br /></div>
</div>
<div name=3D=22messageSignatureSection=22 style=3D=22font-size: 14px; fon=
t-family: -apple-system, BlinkMacSystem=46ont, sans-serif;=22><br />
Thanks,
<div><br /></div>
<div>Samuel Jiang</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On Dec 5, 2018,=
 11:01 PM +0800, Jae Hyun Yoo &lt;jae.hyun.yoo=40linux.intel.com&gt;, wro=
te:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>On 12/5/2018 12:45 AM, Samuel =
Jiang wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23e67e22;=22>Hi Ryan,<br />
<br />
I want to confirm&=23160;the register default set of LCLK is running or s=
top<br />
for Aspped SoC=3F<br />
<br />
Hi Jae,<br />
I want to confirm that does the aspeed=5Fgates is set for matching with<b=
r />
the SoC default clock setting=3F<br />
<br /></blockquote>
<br />
Why should the aspeed=5Fgates match with SoC default=3F All clocks will b=
e<br />
set newly according to the dts setting at kernel booting time or at<br />=

module probing time.<br />
<br />
Jae<br />
<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23e67e22;=22>I need to these things informa=
tion for joining the discussion to assist<br />
patch to send upstream.<br />
<br />
Thanks,<br />
<br />
Samuel Jiang<br />
<br />
On Dec 4, 2018, 2:17 PM +0800, Ryan Chen , wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =233498db;=22>Hello Jae,<br />
ASPEED LPC IP HW block have serval clk input.<br />
Most important is LCLK is come from LPC Host.<br />
The others is not controllable by register.<br />
Ryan<br />
<br />
-----Original Message-----<br />
=46rom: Vijay Khemka =5Bmailto:vijaykhemka=40fb.com=5D<br />
Sent: Tuesday, December 4, 2018 3:38 AM<br />
To: Jae Hyun Yoo &lt;jae.hyun.yoo=40linux.intel.com&gt;; Samuel Jiang<br =
/>
&lt;chyishian.jiang=40gmail.com&gt;; qianlihu &lt;wangzhiqiang8906=40gmai=
l.com&gt;;<br />
Gary Hsu &lt;gary=5Fhsu=40aspeedtech.com&gt;; Ryan Chen &lt;ryan=5Fchen=40=
aspeedtech.com&gt;<br />
Cc: openbmc=40lists.ozlabs.org<br />
Subject: Re: =5BHELP=5D ipmi-kcs didn't work<br />
<br />
<br />
<br />
=EF=BB=BFOn 12/3/18, 7:54 AM, =22Jae Hyun Yoo=22 &lt;jae.hyun.yoo=40linux=
.intel.com&gt; wrote:<br />
<br />
On 12/1/2018 8:29 AM, Samuel Jiang wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23d35400;=22>Apologize for sending out no c=
ontent mail first.<br />
<br />
Jae,<br />
The aspeed=5Fgates in clk-aspeed.c perhaps as todo suggest asking Aspeed<=
br />
the actual parent data for check initializing=3F<br />
<br /></blockquote>
<br />
Yes, that makes sense.<br />
<br />
Hi Gary and Ryan,<br />
<br />
Can you please tell us what is the actual parent clock source of LPC IP=3F=
<br />
I mean the operational clock of LPC IP hardware block, not the interface<=
br />
clock.<br />
<br />
Thanks,<br />
Jae<br />
<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23d35400;=22>Vijay,<br />
I traced lpc-ctrl module, it seems direct update the same<br />
ASPEED=5FCLK=5FGATE=5FLCLK register map bit to enable. If parent data is<=
br />
disabled, it could enable in dts.<br />
The device tree detail, I reference it from aspeed-g5.dtsi. Hope it<br />=

could help you for work.<br />
<br />
Thanks,<br />
<br />
Samuel Jiang<br /></blockquote>
<br />
Samual/Jay,<br />
In my case if I don't initialize LPC clock in driver, Bios on host<br />
side wait and doesn't boot.<br />
I don't understand here what is holding Bios here but by initializing<br =
/>
this LPC clock let bios boot.<br />
<br />
Regards<br />
-Vijay<br />
<br /></blockquote>
</blockquote>
</blockquote>
</div>
</body>
</html>

--5c08e381_d34b6a8_225d--
