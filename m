Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HpHvdjOR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="imOKaNUv"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hrtL49NtzF2Cc
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 10:43:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF8332253A;
 Thu, 10 May 2018 20:43:14 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 10 May 2018 20:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=kDFQVGwg49+3YjRUc9fGR3pDmprmV
 L7YxCghtMVDIso=; b=HpHvdjORGOtBpH7Neh3DvZF1nPA+Nzx60BH4el/7f3cuW
 C3t+AQgI8o3X6NDKzxIB4xY2qW3HsuO8Z0dC0bm5O7c8JdFlDhnquSy5/UKcSBjb
 fnZ7ctg8iS7ahCw6T+paGqKw9mV/ZsO4wnpqCXzVcb7oyGbhirQAno37Alc1kESo
 tPRi8vOQoszrCIdLFYYON5wnArEewmpJIt4b510C7qvZWSA4g9nlv47Cfr3w64u4
 hdkkWmD8GNOhklJ5+I42sJm54sACqBfDWJaJH4rsN0s5LPG2UDX+7128kZBs1cm0
 Mf+IGWPjuuh4kpOCjEE/Oa2npe9ZBw9S7QFMzHaFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kDFQVG
 wg49+3YjRUc9fGR3pDmprmVL7YxCghtMVDIso=; b=imOKaNUviNr8r6+vunvjFi
 XK0xg8vypPMEp33027uL80PrGR8M5cIjGdPY62HN7WRiBFgCkaVeSazQ+NRxqUdX
 gurdGi5PKgb+FUbbG0LfCedVuJ4KPmALn7ShuMiar06scUOeN4I8waIJP4J183Iu
 IQHplFCqW0dg5PHqKT0RZ8Lp0cvKl27sBPdlO1SE/09f8mPBSxmf3dux7vKh1INk
 5GZlTFhHbc8NMKu3xYJLdwqpp4gt2qXtuEao8E+WOw0uPmT0yp9EPDzPnHz4ursL
 KSpbrDmlGUNYlEYPAz/4jYY1sgBSg+PkRHX3vFM1rjCkEKG1Elz/fzmC6xA+mO/w
 ==
X-ME-Sender: <xms:Iuf0WscEvX8FZ8HXsCh6-4qi-7zYsAwEVyvRFcS3k5Z_RXhaG0LruA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B088740D1; Thu, 10 May 2018 20:43:14 -0400 (EDT)
Message-Id: <1525999394.3941141.1368138920.1E761A8F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eugene.Cho@dell.com, joel@jms.id.au, benh@kernel.crashing.org
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
In-Reply-To: <4036e67550b341668ac78fd6e493f878@AUSX13MPC105.AMER.DELL.COM>
Subject: Re: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Date: Fri, 11 May 2018 10:13:14 +0930
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
 <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
 <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
 <d0d76c65aa504f63a4105207941ec24c@AUSX13MPC105.AMER.DELL.COM>
 <1525917124.2417085.1366924696.1ADBC6F3@webmail.messagingengine.com>
 <4036e67550b341668ac78fd6e493f878@AUSX13MPC105.AMER.DELL.COM>
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
X-List-Received-Date: Fri, 11 May 2018 00:43:24 -0000

On Fri, 11 May 2018, at 04:09, Eugene.Cho@dell.com wrote:
> Hey Andrew - 
> 
> > Have you played with the implementation at all? Would be good to get some consensus on it being a decent approach here before we go upstream with it. I also need to add devicetree bindings and ABI documentation...
> 
> Yea we have a "Dell" driver which almost matches exactly aspeed-bmc-
> misc.c (sysfs node per register field...  label,reg-offset, and bit-mask 
> configured via dt). 
> I think what you got is good, only thing I would say is maybe remove the 
> references to aspeed?
> 

Yeah, I'll rework the patches to file-off the ASPEED parts and find a more appropriate home for the driver.

Cheers for the feedback.

Andrew
