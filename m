Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H3dugFNw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J1kBqAap"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znWvV226VzF1l1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 11:15:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57B4E20FF9;
 Thu, 22 Feb 2018 19:15:15 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Feb 2018 19:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=xlC6GDznC4TWZ0AXeYelQPKiKmo1c
 A17dMqPRzuXKI0=; b=H3dugFNwD7E+VojO6u1rS0iaoyBzZbTGSJv7OgwUoLOCx
 mfGqbnefRf0YSvCUn5y2LOcSacNC07rLxfxmi+1u9iZRwpIVoxtzCEWSKJfGWUb+
 K+g5Z64vF67hLM1stFzk/RlIQVPUu3vUg7Jyot56xflsL0MtxlnYjdn6wEVHh+Es
 WyVu9iwhnxUdi6VL0TzV2rfmTrys4fQyCDS6FxRAPT6mkdXRiVFQ0xmNsxBsffSv
 XiAyzHAQ9LOqm+qZLw6gZQrqiVcwQf6lq+NrNdos9FLmrAOILrPEFzclaOoitzi6
 InuG3Du5t6tHJbod541fHv5kMnQZRygxiaAwmN66g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xlC6GD
 znC4TWZ0AXeYelQPKiKmo1cA17dMqPRzuXKI0=; b=J1kBqAapJdvXtPOwRAlbNB
 QN6jDaMCS6+NKICTDkkVIcy5hwhTgmUDJxqrPnthbaZduaGaTz1Vr4rgJHPFuLks
 ClOVyGqPZQKswUy583mbBH8A6bkuxi6V4mXkCwcDfrf2HXvPcuzZpHxLEOyEHUYx
 BA1ZYMkEoz4NfytSS7iNXscyVqf1hjrSsDOUJhmlz0dsGM8GlQljkx9ypQhdhwyu
 XDOnwb5kOqgONmCEA4AyiZ9cDCQigZMbGbBA9+Ep9WLeYHrbVx47oUc3O9NiOmWW
 B01z9Tcwun746W4Trltxo35DoGhIELVpiNr6rePdWZJcJNLbc+iAEy6ckws3GefQ
 ==
X-ME-Sender: <xms:E12PWmw9PS2XWnN7YflvpqfBVPo3QIuddcrReE2_f0XTEFS7yXqVww>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 29F3CBA43B; Thu, 22 Feb 2018 19:15:15 -0500 (EST)
Message-Id: <1519344915.1026206.1280350784.6E4A2974@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-efbb3405
Subject: Re: [PATCH linux dev-4.13 01/16] dts: fsi: Make OCC description match
 expected hierarchy
In-Reply-To: <84dc8db8-ba52-28a4-260e-0c47cf579f80@linux.vnet.ibm.com>
Date: Fri, 23 Feb 2018 10:45:15 +1030
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-2-andrew@aj.id.au>
 <84dc8db8-ba52-28a4-260e-0c47cf579f80@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 23 Feb 2018 00:15:18 -0000


On Fri, 23 Feb 2018, at 06:55, Eddie James wrote:
> 
> 
> On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> > ibm,p9-occ-hwmon describes a driver, not hardware, but this compatible is
> > what's required to get the driver to probe.
> >
> > While we discuss how to resolve that problem, lets at least make the current
> > configuration work.
> 
> I already have a possible solution in my patch "drivers: occ: Create 
> hwmon platform device directly"
> that does away with dts entries for the hwmon driver. Open to feedback, 
> but it will obviously conflict with this patch.
> 

Yep, I need to review your patches. Happy to drop this for yours pending the outcome.

Cheers,

Andrew
