Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Y/kO4gfh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IcdAo7In"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406d8F3KFzzF1yt
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 07:10:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 307A22100F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 16:10:28 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Thu, 22 Mar 2018 16:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=YiTUQexRI+/movzLPM5RKrFSGyh/y
 41/2uZMIOPOgdw=; b=Y/kO4gfheAYx3pwMAAA7ejxiMlQ778CTlvaFhiwy3iO4k
 BSmX7qhb+kBpuGozbPAUSBfUEgQuFHQZEs6spFMStMlphwqwGeQ4tpgQXAdpL8bj
 yBVs7Vu08ivHESPSWYXeSIBTpJGadaZIatFXrIHZXKQcShER6qN3zdzQby3TDpH6
 iaC6Hsjdmktt0lfwrc744xf+i3OJsHNUZgAO6GyQ9K7JBLIAyeDuE96E13tbb1sK
 DSmhYFUfVmlvZChOHmBWO2SiKFTyX6V7h+S3XRnlBnu1dShst4kK42ST9AXHktbv
 Lk3+hXmHBp2/rDiSYEA8ls2WDIawXf23nzosTccbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YiTUQe
 xRI+/movzLPM5RKrFSGyh/y41/2uZMIOPOgdw=; b=IcdAo7Inj622ToaCD4rTyc
 2eMfwnVZ07FPwT4vvRZR3GSPNFiSRn2jz2vX2y+RN2eK3tv+/PBg8rECVZGX8rXa
 hCG2m5tpQkRfABnEsD5Obt99wtCL98L/7pt0V5dKqW+U8edjGIlFXXsbAIGhYltP
 gZOKqv1f/2Td5wkW08/oK6JqWWJ9takgPPnQbF/n54tTyTrebFxXuo1Purimsmk2
 pQerAcNmAe0pMyFgGHySpfuepcTKZhZGb+mxVZ1sahcDQUcCn4Wh6M/iT75JWLuI
 5gqQIM/ehZmKfNXUTzIqc9B5v/Vi6DMGktaMQBbw28OjwVdFq2hiffWMIJPFypHQ
 ==
X-ME-Sender: <xms:tA20WtkSjEoZr715sQPRTyUgk3NZEhhI0bEl69UcBFaxUaU7cxZxZA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EE1389E09C; Thu, 22 Mar 2018 16:10:27 -0400 (EDT)
Message-Id: <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
References: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
Date: Fri, 23 Mar 2018 06:40:27 +1030
In-Reply-To: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
Subject: Re: BMC Health
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
X-List-Received-Date: Thu, 22 Mar 2018 20:10:39 -0000

On Fri, 23 Mar 2018, at 05:24, Patrick Venture wrote:
> The Facebook presentation yesterday talked about BMC health, free
> memory, etc.  I didn't see anything in the IPMI spec about this
> information, and beyond my general drive for metrics, just system
> health would be great.
> 
> Things I care about:
> up-time
> free memory
> ... other things?

* Free flash space
* Network traffic stats
* CPU load average

Andrew
