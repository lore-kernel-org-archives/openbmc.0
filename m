Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="u+OtNv/t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hWRf4+bL"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z2BP3gM2zDqTb
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 10:32:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2334A2258B;
 Mon, 11 Feb 2019 18:32:10 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Mon, 11 Feb 2019 18:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:references:subject; s=fm2; bh=+t7
 TRA3eZQTJ4YrAMfIaU/dsCYO2/XbRjCO/kxPqUJQ=; b=u+OtNv/tN6+QSxcVdMQ
 kq6WqdXsAFPhn11DdVqAGm4rhpp5Gm5hBIpcquWYQdAhYu20vEPDoO9tSDLS39f6
 4SAr0+aOZ9PG+dyrdBCGRzqqU8MJbuadQoRlQU9Ko334IZ7eJVegn96Y8jk52Nxh
 MdnwU9Cu4uheYodl6QTofIxugGBdKePU8epdXtzxytTeM1scf44kJiXjyVovMqXU
 RpSWGZzQwMcYLljOHVRymJ7BFtmaZuSinWqu2j8kd/9KkcGGG+B/XvUS+paelNqM
 vEawz9wS0eijNO+ov0s477RGW6sULLP/da9OU9VPCayNgud7pgTphFR5H7H4zxe1
 Wmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=+t7TRA3eZQTJ4YrAMfIaU/dsCYO2/XbRjCO/kxPqU
 JQ=; b=hWRf4+bL1uMEnANUGIQZP5ZeQpJWQ+42CyoaKsdvtNMfReZ5x9uXqGrAA
 Ot/9PN4PiLXixNDUSH8K+wpqb65CTZjx6WWKyidIze+FhN0V9JLOTynFQMpC8qvA
 49U5ADO0+rjTt+ky2ZegxyrvuA6mzh8L1iYoyT9kHXg9M21zVpKcpAeoFPeHiJFf
 tUott1iQHVcpJo9AMbpd3WFIx2UDFOh1XQAp1BoMNZZes6x1P/4QSLaO7JdnrAXc
 Immxtxz89rWxRcH3AcMhDHln6VVc9qZL6qpgvZlmZrNlg8wbhsxEYyz+dfFVS6jr
 CM1MEi7Se1z4bNKDzsMWBdrZv1xPg==
X-ME-Sender: <xms:-QViXGXUZ25Yr2Y9vp_RWws2JuzjwAO62ghOGK-cYrJUN3Q78O9QLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddttddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fojgfffhfusehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:-QViXOzYyJAZsADF7MXxv78pI7FpSR73x1Lh1pIvNrDN2EzLIfoOVw>
 <xmx:-QViXBjLyL6aEIZ1ZBeOdy5PMmDw0mYOsucD1C5CM8SidTqhl8ePCA>
 <xmx:-QViXI5roZrD3BXPBjY7X8NKA1rG7MYMLwLrscldziN_H4yIy1St0Q>
 <xmx:-gViXOe2bnT8OVMsy_4_vxrs0OwiIbUjrus0U3ywCHW1V5Vmep4JKw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 76A5A942D4; Mon, 11 Feb 2019 18:32:09 -0500 (EST)
Message-Id: <1549927929.1686694.1655933984.5318EBC3@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
In-Reply-To: <CAGMNF6VM9SDm1c0hFLBYwSdwPHdEjA=a5ikbhJk3GFrYFwKNRQ@mail.gmail.com>
Date: Tue, 12 Feb 2019 10:02:09 +1030
References: <20180723145840.17856-1-andrew@aj.id.au>
 <20180723145840.17856-5-andrew@aj.id.au>
 <CAGMNF6VM9SDm1c0hFLBYwSdwPHdEjA=a5ikbhJk3GFrYFwKNRQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 4/4] aspeed: Disable unnecessary features
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
X-List-Received-Date: Mon, 11 Feb 2019 23:32:14 -0000

Hi Kun,

It's probably safe to reply to this now :)

On Sat, 15 Sep 2018, at 09:52, Kun Yi wrote:
> Thanks for sending the patch Andrew. I think it's a viable solution since
> linux upstream didn't like the idea of misc controls.
> 
> My feature request would be that we add config options for selectively
> turning these features on/off. For example, we actually use LPC2AHB and
> PCIe2AHB downstream for host-BMC mailbox typed transfers.. It would be nice
> if we could take this patch and define the flags to enable what we needed.

We've included the patch via bitbake but I think wee should work to get it applied to
the u-boot repository. I think you're probably right - having some control over which
features are enabled or disabled would be nice. The way I see this working is that
the bitbake magic simply selects the desired configuration rather than applying the
patch.

Andrew
