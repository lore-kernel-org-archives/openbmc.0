Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Wzh8LNUF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QpG8VYEc"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MdwF5VypzDqyH
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 10:30:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BDFBB216CC;
 Thu, 12 Apr 2018 20:30:17 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 12 Apr 2018 20:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=J4KBPZfn110Zqc6TZUNgWy1UTCSio
 uCj6WZqJfouEoI=; b=Wzh8LNUFUyvKdOM9bhWSgRE8opF6iClPfZQuCgw8/zzWm
 jaTorSXYSR59Crbip6K5508QYKWPXfw7M/gLdyHfgXyHvwxHimJ/DZwOz2P+8yxF
 YbY59uEW1PKtZ8mJMWWt12eXx8TIKRe41K34CInD4uEzN3qA2M/uuvzyc6bsZ1vc
 AtqWP9KyFF0lP2BJYt4oeBPv1gOloM46uTdN/80zcXI7G/8YUtT3HNnMs4FHT28N
 yJ0suM7HFDyoFrQwhz7aOk7w5SxeHwotFo+ni11VCm5KvJTgSUvqG+kc+/26lNto
 SCebYq28nLtF34tLT982jdxzWts1lB7PK2fm55glg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=J4KBPZ
 fn110Zqc6TZUNgWy1UTCSiouCj6WZqJfouEoI=; b=QpG8VYEcU5IrqYw3F7qdbY
 MQ8dGresKnJzygryJdGRO/ChHxbuGKIMrXAn24L1wh8/CuqaPAkBQhGudYTOaSwp
 0bewEAD4/KbqR/z5O0jpA41ErzMqSgP3McQNK/8Ww9x1opLBqNmgysSyxzUUqOig
 8YkrU2k6JzYw+tpxupn/cD1SwKYG493FemsLZFXtVRflI1xkizKcSMp/uvD7Z/36
 AonD3101+zxjmrCa5wLrJ1hF8ksheBknqcU7PNEpZMvUtX+drg2s858bCTgO3RpL
 WvMlLQHDc5jBJCGuxlgKqREagjveiqPW+l7oeSuK2IXiUpt38z5W8xeN2MLa26Tw
 ==
X-ME-Sender: <xms:GfrPWro_hMoOyOkFPrOEGza8nB7lbIuUnA1luwa73CVS5D-qJFwmIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7F494BA43D; Thu, 12 Apr 2018 20:30:17 -0400 (EDT)
Message-Id: <1523579417.2617274.1336331832.4088E66A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, openbmc@lists.ozlabs.org,
 openbmc-request@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 benh@kernel.crashing.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a1de26f4
Date: Fri, 13 Apr 2018 10:00:17 +0930
References: <mailman.355.1523511154.2391.openbmc@lists.ozlabs.org>
 <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
Subject: Re: openbmc Digest, Vol 32, Issue 32
In-Reply-To: <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 00:30:22 -0000

Hi Haiyue,

On Thu, 12 Apr 2018, at 17:25, Wang, Haiyue wrote:
> Hi Andrew,
> 
> Facebook uses the 'devmem' utility and python script to implement the 
> soc register
> 
> read and write in a simple way. And the yocto layer is also very clear 
> like different
> 
> chip vendor and common parts.
> 
> 
> Kernel device tree upstream is also very slow, we needs two parts 
> (device tree + user app)
> 
> to finish the soc setting. But Facebook just uses user app, this 
> development is fast, and
> 
> simple is the best.
> 
> 
> Well, just for sharing what I found, I may misunderstood the BIG idea 
> after this kernel
> 
> patch design. :-)

Ben's covered the main points, but yes, what was implicit was we're looking to improve the security of the BMC. I'll try to make sure I'm more explicit in the future.

Cheers,

Andrew
