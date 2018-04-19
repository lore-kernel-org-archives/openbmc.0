Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hfA28uoQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IHYMyZv+"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQxX41H5zF20x
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:29:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 42AF321820;
 Thu, 19 Apr 2018 00:29:34 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 00:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=clLaVnmbhlFh1afI9856zq1PCNuLj
 Lml6JAePAK1cvU=; b=hfA28uoQO57GjmjkAdC+v2niNR97sLFEKCQfDGpjy8WAs
 u4dGFhDII3Pv9GFmoqzE2iH/nJftJC3yEXJY6VDt0SCErzOIGSFU24iE3KQuuMkM
 nJjiv/F4U3gDUjQvJojgsa0H2+V/AbPPPXh0Uft19+3Iuq/e+Ne/Yc1Y/0FlXaTz
 PWYZbYvn2EQd363Ft2itXaJtTJhG+sl7hGPEYQGkW5E2UMFCELo69UwcK3Znvloo
 l/2fQkOHfw3fClvJQusOHwftTxPmdSkoCuYfbolhrMIXWmPFHVXlLaiM8hc1PJZ2
 onbsw1Ce7hXKp6hSpmy5f2SJcM++eI/8mm6sAhkCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=clLaVn
 mbhlFh1afI9856zq1PCNuLjLml6JAePAK1cvU=; b=IHYMyZv+/kay6vTl1bGZMQ
 aOAB+kl3HWe/E9AuyKRVcuhBtOXMuKA9VUiXg4Pq6ZC96jbfeOckFJNyiIEjtVWm
 oM4tMFOtEApvmBRR/saYHqWrsJnxSskzf/+7wAV0MyY8KTUT/6wsndMcav0+FnAn
 +ke/mvcasDvcDSUBoBme+2bBXDdpoKHW1lUQ1/9A7WNOYau7sHrStQSOO1VsoQjP
 CZoMVoK5thbyX56Qcr9kR9Ge4XAICl5stZIm7R33lXScej49EH6iYSPQWBekbW6s
 D31xk+F5HMsqcdL72i9YZvwjPrg0hCqz8wctCGRgm2xvY+qM1ZukOy0iZbgmtthA
 ==
X-ME-Sender: <xms:LhvYWufi72I1gos_vRS09EdNh0A0P-Dxzt8nc_J-2LE5E9cmJfN0SA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EF7EF4256; Thu, 19 Apr 2018 00:29:33 -0400 (EDT)
Message-Id: <1524112173.2435031.1343194816.552C67CE@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
In-Reply-To: <CACPK8Xcpvyp6kAs4CNLv+vCAu6hJnQ5iRpU4Je=Ehcn4NYNQ=A@mail.gmail.com>
References: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
 <CACPK8Xcpvyp6kAs4CNLv+vCAu6hJnQ5iRpU4Je=Ehcn4NYNQ=A@mail.gmail.com>
Date: Thu, 19 Apr 2018 13:59:33 +0930
Subject: Re: OpenBMC v2.2
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
X-List-Received-Date: Thu, 19 Apr 2018 04:29:37 -0000

On Thu, 19 Apr 2018, at 12:27, Joel Stanley wrote:
> On 19 April 2018 at 10:53, Brad Bishop <bradleyb@fuzziesquirrel.com> wrot=
e:
> > There has been lots of cool work in the last couple months and we=E2=80=
=99ve been
> > reasonably stable with Yocto 2.4 and Linux 4.13 for some time now so le=
ts
> > have a tag!
> >
> > Last time I mentioned v2.1 might be the last tag before switching to so=
me
> > new branch strategy, but nothing has happened on that front.  So like
> > before,
> > stay tuned to the list for updates.
>=20
> Cool. As someone who sees these numbers as a user (tech support
> person) of openbmc more than a developer, I would like to see them
> continue. In the past I suggested every six weeks, as it gives fast
> feedback of "this is old" or "this is new" (or "wow OpenBMC has moved
> on a lot since I booted it last").
>=20

I second this.  I feel like for the pace we move at, it's better to have fr=
equent, regular tags. What we probably need to work on is a guideline for t=
he expected amount of QA that goes into each tag (both from the tagger's an=
d the tag consumer's perspective).

Cheers,

Andrew
