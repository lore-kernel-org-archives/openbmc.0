Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CTBZoo4S"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LcSl0GYN"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXcG13xJvzDqZv
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 10:46:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F36B20B77;
 Thu,  1 Feb 2018 18:46:31 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Thu, 01 Feb 2018 18:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Bbjczf85/A9Rhhgh+u00qWGZfgUJ1
 JzEsszVwkDX/pM=; b=CTBZoo4S9gEerKlRxr6hXRjjnX8fNvjAUChRM1vOkv9GD
 5PDS7Ycg9KHccnT9i/sOCVy593AVobZBuotfbGg+Cx/rbmY09Y2WPwRX3olhvcCa
 6xn+D71Ajrsb5BIHIYL/AUDhvnQl70i75ORTw8isTDjYDwbrhuoQHDpPnWuSShIg
 jQemiZ1VHRHyCRixCSLeXtIsnq2tzjuDI31MiVJfKfi07A8YzJYSCH7/Fs2EUiZC
 2INMhrBu1wQhyesX3QHgsUlzgVh4+CqoN9JVNLV2fhhJltzjp+hJ99iqkd9Wbbo6
 dG/QM1sGe8Bu/e5CdzHpE6dr6zHvxbMX0yCfWJrFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Bbjczf
 85/A9Rhhgh+u00qWGZfgUJ1JzEsszVwkDX/pM=; b=LcSl0GYN+oxK5K2YbUPOs4
 Y12933BcdNGUtTc9rfGbOaiQ3zTSLzqK9L3my8Ju/DK7aFDrNI812CzIXTdfBfud
 Svu9jZSGDKgnKNCaFpBpMwPyWvCWn+bJ1jHBiQjf9rmV7Yk6iYs5tSR65+uDzj6k
 2wK4Dob8TW28YWZHxPArJbQma+2YLcaBjqSkPnBURckTG0BIVE8cgyA69awiNRpu
 CFyf//ZunFO8rPBAL8EGZd2rlKeQih7puBVJ4Ji4dSsKgKVEB962PHj7v87/L2Ej
 TCL227sM47MAaxXVrtYtewwT2DxH2DrvagrZ23m//pfXCn6U280H/17OZow8XwQw
 ==
X-ME-Sender: <xms:16ZzWi3fVVDUylIv-79pqfwCs5DA97X424jvRvu6Mup_gB-AWFotLg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 5E30E9E47D; Thu,  1 Feb 2018 18:46:31 -0500 (EST)
Message-Id: <1517528791.2207823.1256604608.59B3C439@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?Chen=2EKenYY=20=E9=99=B3=E6=B0=B8=E7=87=9F=20TAO?=
 <Chen.KenYY@inventec.com>, Joel Stanley <joel@jms.id.au>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>,
 "Tsung-Han Yang (Harold)" <haroldy@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fde26eb3
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system BMC device
 tree
Date: Fri, 02 Feb 2018 10:16:31 +1030
In-Reply-To: <39E6480C5A587146BAA4D885C7BCF7EEC6AD4D07@IET-EX2010-MX2.iec.inventec>
References: <20180108030013.20873-1-chen.kenyy@inventec.com>
 <CACPK8XeHFZrCJuFb33i3+xvCvfTLNEXbKcW11eFLjRtm8V5LXQ@mail.gmail.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6AD4D07@IET-EX2010-MX2.iec.inventec>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 23:46:34 -0000

On Mon, 22 Jan 2018, at 16:32, Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO w=
rote:
> Hi Joel,
>=20
> Thanks you.=20
> Before I update new patch, I have some question.
> Should I remove the definition which the driver didn't update now?
> The related driver added or modified will be update in future.
>=20
> The watchdog is check for BMC and avoid BMC boot error, if we didn't=20
> stop this, BMC chip will boot second BMC SPI ROM.
> Does the driver support this? Could you give me an example or advice?
>=20
> The multi-function is enable SPI. It might modify driver.

There's no need to modify the driver. See my previous reply about how to do=
 this via the devicetree and existing pinmux support. Hopefully that clears=
 it up for you.

>=20
> What is the mean of "Can you use a GPIO hog instead?" ?

GPIO hogs are a concept in the GPIO subsystem where you can allocate and co=
nfigure lines during boot and then have them left alone, exactly like you'r=
e doing here. You can specify hogs in the devicetree. See [1] for an explan=
ation and example.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/gpio/gpio.txt?h=3Dv4.15#n187

Cheers,

Andrew
