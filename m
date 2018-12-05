Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12b; helo=mail-it1-x12b.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bhhcsIoL"; 
 dkim-atps=neutral
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438q4B3s6YzDqpg
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 17:45:30 +1100 (AEDT)
Received: by mail-it1-x12b.google.com with SMTP id z7so19649982iti.0
 for <openbmc@lists.ozlabs.org>; Tue, 04 Dec 2018 22:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=OYunytcW8+epbzLZE8xiKJ6MupMoWqHu7rN1hyCnJJc=;
 b=bhhcsIoLhbP75N3+0Nvn07zHAEIPDCn5nCyrr3W95fMnP2xEeo7vzX47UQA4dPlqnT
 so+lzuNxw74Mz5Ps5nyXLfjgWfk7Ypz95rrKMZ0+jbme+akaRysw5PwuugA7R4gM/Gp/
 1aIwJKd4d5kiT+3hyG676fC2ylqSdIY6llcA9hKPy25fOZujfzOTWiDdyMpjig8vy1jI
 zS0j2LBFFSCXthBWKOTCB5AK2DlEWGvCP7Ozkn92xnzOjAIr8hHSbzx77vv4oEevOGYw
 MYMMVq99Dlm0cA7yQUe4whN9h3jQib3u8V4X2PDYoCcomwmCXEQ42a/Tx2b5XxpFaUKr
 ANiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=OYunytcW8+epbzLZE8xiKJ6MupMoWqHu7rN1hyCnJJc=;
 b=Spyah+an3jCCONQ5g+vbg5foJ7MSgkKsEGcyGu9qTRmB1DZ2ZOH52WC8FpSuPdfDkz
 epH2sMJl2SZ0KzWIZZIVlMQTHjwx+mJDt+Tt0FQotl+pO/g1Cw3Ha463tgTC6Ed22Sff
 W91gHfQnte/Dj0uNN4aCCoqLoIdewqf+3MLR3rdeJPealwajg/TpBY/WbdTvz4zob3aw
 jl2aCU4W39t5A2r+Sdtbprwx7TBpgCPNABPBltZfTc5vmuYuLVvs0p1nC3w7dsWjOe1i
 qtqgz64wVPT3PAdyXlDkXExDpALX7/UPrfnUI7b9LK5w3SaVZMkeLy2SR9qlJLNZu+LQ
 GiUQ==
X-Gm-Message-State: AA+aEWbEtHCRZBNrn2BIVQdH1fNuayuZ1Yz44NArV87Dn4ZizPfpAh7h
 NdBNW3z/ZK2l83yX7POt58I=
X-Google-Smtp-Source: AFSGD/UjPtnrjsqZD3ETOdXyxP5UXwPEns1/MnRUmIzJbLxP14znYt++tfgbNsFzZ+iThLqLWRBTvg==
X-Received: by 2002:a05:660c:12c7:: with SMTP id
 k7mr13626039itd.148.1543992328207; 
 Tue, 04 Dec 2018 22:45:28 -0800 (PST)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id d7sm2538390ioc.67.2018.12.04.22.45.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 22:45:27 -0800 (PST)
Date: Wed, 5 Dec 2018 14:45:18 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, qianlihu <wangzhiqiang8906@gmail.com>, 
 Gary Hsu <gary_hsu@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>, 
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>
Message-ID: <48f0e3b4-eca5-4ca6-a9ce-40b2a393ede9@Spark>
In-Reply-To: <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
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
Subject: RE: [HELP] ipmi-kcs didn't work
X-Readdle-Message-ID: 48f0e3b4-eca5-4ca6-a9ce-40b2a393ede9@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5c077404_70a64e2a_225d"
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
X-List-Received-Date: Wed, 05 Dec 2018 06:45:31 -0000

--5c077404_70a64e2a_225d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Ryan,

I want to confirm=C2=A0the register default set of LCLK is running or sto=
p for Aspped SoC=3F

Hi Jae,
I want to confirm that does the aspeed=5Fgates is set for matching with t=
he SoC default clock setting=3F


I need to these things information for joining the discussion to assist p=
atch to send upstream.

Thanks,

Samuel Jiang

On Dec 4, 2018, 2:17 PM +0800, Ryan Chen , wrote:
> Hello Jae,
> ASPEED LPC IP HW block have serval clk input.
> Most important is LCLK is come from LPC Host.
> The others is not controllable by register.
> Ryan
>
> -----Original Message-----
> =46rom: Vijay Khemka =5Bmailto:vijaykhemka=40fb.com=5D
> Sent: Tuesday, December 4, 2018 3:38 AM
> To: Jae Hyun Yoo <jae.hyun.yoo=40linux.intel.com>; Samuel Jiang <chyish=
ian.jiang=40gmail.com>; qianlihu <wangzhiqiang8906=40gmail.com>; Gary Hsu=
 <gary=5Fhsu=40aspeedtech.com>; Ryan Chen <ryan=5Fchen=40aspeedtech.com>
> Cc: openbmc=40lists.ozlabs.org
> Subject: Re: =5BHELP=5D ipmi-kcs didn't work
>
>
>
> On 12/3/18, 7:54 AM, =22Jae Hyun Yoo=22 <jae.hyun.yoo=40linux.intel.com=
> wrote:
>
> On 12/1/2018 8:29 AM, Samuel Jiang wrote:
> > Apologize for sending out no content mail first.
> >
> > Jae,
> > The aspeed=5Fgates in clk-aspeed.c perhaps as todo suggest asking Asp=
eed
> > the actual parent data for check initializing=3F
> >
>
> Yes, that makes sense.
>
> Hi Gary and Ryan,
>
> Can you please tell us what is the actual parent clock source of LPC IP=
=3F
> I mean the operational clock of LPC IP hardware block, not the interfac=
e
> clock.
>
> Thanks,
> Jae
>
> > Vijay,
> > I traced lpc-ctrl module, it seems direct update the same
> > ASPEED=5FCLK=5FGATE=5FLCLK register map bit to enable. If parent data=
 is
> > disabled, it could enable in dts.
> > The device tree detail, I reference it from aspeed-g5.dtsi. Hope it
> > could help you for work.
> >
> > Thanks,
> >
> > Samuel Jiang
>
> Samual/Jay,
> In my case if I don't initialize LPC clock in driver, Bios on host side=
 wait and doesn't boot.
> I don't understand here what is holding Bios here but by initializing t=
his LPC clock let bios boot.
>
> Regards
> -Vijay
>

--5c077404_70a64e2a_225d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>Hi Ryan,<br />
<br />
I want to confirm&=23160;the register default set of LCLK is running or s=
top for Aspped SoC=3F<br />
<br />
Hi Jae,<br />
I want to confirm that does the aspeed=5Fgates is set for matching with t=
he SoC default clock setting=3F
<div>
<div>&=23160;</div>
<div><br /></div>
<div>I need to these things information for joining the discussion to ass=
ist patch to send upstream.</div>
</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Thanks,
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22><br style=3D=22font-size: 14px; font-family: -ap=
ple-system, BlinkMacSystem=46ont, sans-serif;=22 /></div>
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22>Samuel Jiang</div>
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22><br style=3D=22font-size: 14px; font-family: -ap=
ple-system, BlinkMacSystem=46ont, sans-serif;=22 /></div>
</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On Dec 4, 2018,=
 2:17 PM +0800, Ryan Chen , wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>Hello Jae,<br />
ASPEED LPC IP HW block have serval clk input.<br />
Most important is LCLK is come from LPC Host.<br />
The others is not controllable by register.<br />
Ryan<br />
<br />
-----Original Message-----<br />
=46rom: Vijay Khemka =5Bmailto:vijaykhemka=40fb.com=5D<br />
Sent: Tuesday, December 4, 2018 3:38 AM<br />
To: Jae Hyun Yoo &lt;jae.hyun.yoo=40linux.intel.com&gt;; Samuel Jiang &lt=
;chyishian.jiang=40gmail.com&gt;; qianlihu &lt;wangzhiqiang8906=40gmail.c=
om&gt;; Gary Hsu &lt;gary=5Fhsu=40aspeedtech.com&gt;; Ryan Chen &lt;ryan=5F=
chen=40aspeedtech.com&gt;<br />
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
0px; border-left: thin solid =23e67e22;=22>Apologize for sending out no c=
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
0px; border-left: thin solid =23e67e22;=22>Vijay,<br />
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
In my case if I don't initialize LPC clock in driver, Bios on host side w=
ait and doesn't boot.<br />
I don't understand here what is holding Bios here but by initializing thi=
s LPC clock let bios boot.<br />
<br />
Regards<br />
-Vijay<br />
<br /></blockquote>
<div></div>
</div>
</body>
</html>

--5c077404_70a64e2a_225d--
