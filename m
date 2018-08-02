Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MIMKxspG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pJuXEymk"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gsl71zSqzF14j
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 11:18:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 66D3520DE3;
 Wed,  1 Aug 2018 21:18:56 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 01 Aug 2018 21:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=Y90KnCiZI2NyMvHcsFhdIIwjwb3v7
 8OuNJ06VpX2BGU=; b=MIMKxspGnciC7o5ls6++8nBp39E9GwaoNRZ57pKbnFJSv
 ocd679nwd62cCYo/2+W4ppcEt5xvcVSpbJSafHbbi7ehaCd+zpz/AdJlnZMzq++L
 M1fgrPev73W80CK22cE0SDiC/hYQbwB2qRtF5ATFmSPqEJKIDzUlAEjFJg3pvzL0
 NIB3bG7FkpWpmPStMx7Lu2AEjY4as7Z+xclf+BiN1w+PuDP4afwBmNKOWgHwWqHq
 MVNTLXLTvyw0F6EJ599IE7HcWn9AjAjCa4rTH51OL+pvr9/VFM7itQZ5jBLKa1yx
 mSIHxJZoC4sJ4XsbnOgwjgLi3FZXWPHtGJIISsBSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y90KnC
 iZI2NyMvHcsFhdIIwjwb3v78OuNJ06VpX2BGU=; b=pJuXEymk4HbZjf9M5UgKpQ
 36AuEAoIckE+18yJPUvqsis1XViMF8HL5awP/HM9BIKm3V5omEPRclqSJKNT/yLs
 QeyNmvyGrv+JHKH01EhjH9i5NUXzmy62L/LRziv3y/lk5cPFNdyFUJOlvH2j8llV
 oSDWsqUt0EO42wlwEJspWfgdGYk/fRH8SmkzLTt4McnbpBIlxLi/xvRg58WX0tOk
 Q2x+sNAP5cNFO3rBKYpqCCPhhD5L5R3ZawQlTAbeEOxHYcZxEQatri2l13WdvYRx
 MPp71H4ofPJ7vMtAywLvPHEhpAS030FRasDJF0GtJdscZmc0GTjJdeg9N4HCbpqQ
 ==
X-ME-Proxy: <xmx:AFxiW2bfFD9zHAez26tktamV8Yfb-xs759Pr19QPS2jIGlV1Gjr7qg>
 <xmx:AFxiW48Bv6CMZOXwLwpI2P3GBkCPZfw8XGC4Rrq0f6dgRyTcFlctBw>
 <xmx:AFxiW1S3CWEz6kkPzk3kBx6uzhuPdMUlZtvgzimN7ygdAscl-316jw>
 <xmx:AFxiW7IGKSYpyG7GQwlezQXkezY8o4rwXoHRkGL0V8dFoyHUMzSB7g>
 <xmx:AFxiW_RWT-aiCOEkvFaAZLWHGFf_hdawQtSwpn_wggZOBHD_SHiQcA>
 <xmx:AFxiWy7FgsYHejrtn6ZG1alV1uJA1upFmvixzqq9ZNMaQe-Cm1liSg>
X-ME-Sender: <xms:AFxiWzxQks7GWV0nAV8vQUVS1KFjRJf6Nt5C2aCoV8amIg68nZilnA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 0866C9E488; Wed,  1 Aug 2018 21:18:55 -0400 (EDT)
Message-Id: <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Oskar Senft <osk@google.com>, Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2be8cd1b
In-Reply-To: <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
Subject: Re: UART Route setting
Date: Thu, 02 Aug 2018 10:48:55 +0930
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2018 01:19:01 -0000

Hi Oskar, Henbin,

On Thu, 2 Aug 2018, at 10:32, Oskar Senft wrote:
> Hi Henbin
> 
> I think we should be able to configure default settings for the routing
> with the driver that I'm working on. I guess that could be done via DTS or
> by just applying settings via /sys during boot.

Have you explored writing a pinmux driver for it? It's effectively what these
registers represent.

It was something that wound up down the bottom of my todo list.

This enables configuring the routing via DTS, though doing it dynamically
from userspace might be a bit harder.

Cheers,

Andrew
