Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N7caD5G7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZU1B8pt+"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RM5P1D5KzF20s
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 11:36:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F0C6621982;
 Wed, 18 Apr 2018 21:36:05 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 18 Apr 2018 21:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=s/atNfQS+kjU21K2BeF8nFQBedLgw
 K6MQc74oPDhxXE=; b=N7caD5G7em9CopoHYujuuXAQjk5+9tdpCZy78kQbKMiKh
 RpD+4D1xl2WbXtNGSi1II5ZFyGGVad1p3w6NILznOG4VJqRlrSaUGwjM3xb3Xyd3
 GD5DeTdXzXYifa4vjWU/B1FqXSSrjUBZvQPulnrmOGo0ziul9XpXfZbPrMu7LZpG
 WY7uAOyMx9TNWThKPuZrjwUuTHqQ0rhViBD1AVqJpUDZyQxniVFN0jy1khNRMKOO
 bf1jKQwcFEy7h7nHg3cu3Qm3zCCa4Qv5c82Y6uteAavOMgjGzmhX89wr8Yc1Zruo
 ylzJ8yTriTwun7PT+PeLXbZIE2/d5s59Jdu4Jrr0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s/atNf
 QS+kjU21K2BeF8nFQBedLgwK6MQc74oPDhxXE=; b=ZU1B8pt+NoggWXxZ3mIVlv
 Oi7Zae2GYwuuabbljPteads6B5vM24FMufbTxSqsTK23TmVNdqzhxNMnf1BXwYdA
 XPm0nK7zn7va03Nu/d4PRpBjvM9QgigGs56NyEjX7rsGvIdSTYQbXBcwsxIhqofp
 gMXi9MIciGuuyNmvhjy9MWBEAjW+KSra3pRp7tNDyFjsOgbGTGRsJE854TtjNSYJ
 R2pZ7Oa3TTpQwpfco9IKmlUrPX1z8RAZP+rYDns7OBX54N3aAqm3fHNw30kr115M
 CYbyQj6Hll+BSPX+0ARaPzje5vhBqJHWTI0mygFEA/ZjJU8EOJ1hHk3mDCTfu57w
 ==
X-ME-Sender: <xms:hfLXWhmRyz9EZbQWGPAbzIYtvJf-TMq0uJRNKq1kTef39J2Nyc4p2w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id CDB9C425A; Wed, 18 Apr 2018 21:36:05 -0400 (EDT)
Message-Id: <1524101765.2367494.1343094608.58E4CC87@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: =?utf-8?Q?YangBrianC=2EW=20=E6=A5=8A=E5=98=89=E5=81=89=20TAO?=
 <yang.brianc.w@inventec.com>,
 =?utf-8?Q?Chen=2EKenYY=20=E9=99=B3=E6=B0=B8=E7=87=9F=20TAO?=
 <Chen.KenYY@inventec.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei YU <mine260309@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: FW: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
 Lanyang BMC
Date: Thu, 19 Apr 2018 11:06:05 +0930
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6B7921E@IEC1-EX2010-MX4.iec.inventec>
 <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
 <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
 <CACPK8XeRZ_NbaduF-jbPoSA+-HO6O4Zoy3M1-geqkhkyohq6ag@mail.gmail.com>
In-Reply-To: <CACPK8XeRZ_NbaduF-jbPoSA+-HO6O4Zoy3M1-geqkhkyohq6ag@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 01:36:10 -0000

On Thu, 19 Apr 2018, at 10:27, Joel Stanley wrote:
> On 17 April 2018 at 11:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> >> >> +&i2c11 {
> >> >> +     status = "okay";
> >> >> +};
> >> >
> >> > Do we need to enable all of the above i2c buses? By comparison, Zaius enables i2c0, i2c1, i2c4, i2c7 and i2c8.
> >>
> >> Thank you for your review.
> >>
> >> We need to enable all of the above i2c buses because we want to verify
> >> the i2c bus is fine by i2ctool.
> >>
> >> Because we use the above i2c buses on Lanyang platform.
> >
> > Okay, it's still not clear to me. Are there devices on all the buses? If so, do any have bindings that we could use to describe them here? It looks odd enabling all the buses but not "using" any of them.
> >
> > If you're just enabling them to test the bus with i2ctool then I feel that we might be better with that staying as a local change for your testing, rather than merging this as is. Joel?
> 
> If they exist on in the design, then enabling them is fine.
> 
> The distinction I've gone with is it doesn't make sense to have them
> enabled when the i2c pads on the SoC are not broken out, or if they're
> only connected to ground, so there's no way of them ever "working".
> 
> I'm happy with the dt as is it is. If you're happy then I will merge.

Yeah I don't feel strongly about it, just it looked odd.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
