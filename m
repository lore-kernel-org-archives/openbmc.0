Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Udm48Pn9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MSyOdBwL"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CHP00j19zDqGW
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 09:08:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C87D2200E;
 Sun,  3 Mar 2019 17:08:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 03 Mar 2019 17:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=tfMM5zAej4Nz2gMWzh7C+29oDNvylfsdrX/E/p9
 OEeA=; b=Udm48Pn9v/WLErJRzgjpXbchElspdE5c+jQhTjKPqrZ6jInReda25XA
 Ak9WR9PFLBHFKgonzKUTmk4dpqJiS3qfVZPGDqGoKe69Ga+gKDE+IAHT0HTavkWh
 Iwq8uobvCR0cJkDcy3iAK8MC8DKmH/wfROy/gZOMThlOVgZYQVHnO+6UKlRyCPTA
 stAXk8KYQ1FYLS3mHxrUCuvXHJEozgsgbpiiVh/IngSvoqesnktO8KNQ76Dg3sFB
 uXfDIYS6FADZ4VVPrAhOkp0peBsh5cwEEMwGnxUpPJcVYnRKnPTrS+jDxCU38LXv
 6AprMK0pewVk4hiU3VKJHrNgzbJ06RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tfMM5zAej4Nz2gMWz
 h7C+29oDNvylfsdrX/E/p9OEeA=; b=MSyOdBwLhFjsF7iI11h/dV7Klvg8ih2ox
 0k2aLD4IFJzZkhOlUN0sHZSaw9CcrAzafZYOlYl9BLkB2NGHnN2ZCRMeicAtwY0Z
 wg05qGxJVYzIRsyeNFtOpN+Z/+BRHMZDpfy3vNUL45LFCycjU1RpaXyFl2WyNiZo
 qpKA8YhbnjkcPTFMNmqZb6mXT0uuRbWtDLfhWt1JJu/2Bg+ue2GQoo/ZtFelGnH5
 GZoaQFonzOjXck0LkE2tZgpmVsuH1p7qI634gxz8hdd8dKaI5c9utuyrxK0EdXHX
 2gTfIn4sxnU3qQ5Rr/ZTo4H6yhSoKfOMmmmUr3GwB3fFhup7vIoBg==
X-ME-Sender: <xms:blB8XKiPAviFhioEmHnMLUPftz6_mLpMhft-Q4EAb2eIqUtNzchfEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvdelgdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:blB8XHUHs8ZVynzWEo9l_pHsz0TBASWx6V6BghG_sSV0Y3pwrLxT0w>
 <xmx:blB8XE1UyNfEKmaH09sLiwybcgMT46TzXjnICjjVwyYBvzPlbF-UnA>
 <xmx:blB8XFGymDGMDGQ7MQUsK_mF2BxtthhXytqYpKF7P76c4Zz-F1ZPVg>
 <xmx:b1B8XFUdOiQ1s3MQ2ZhyK-Bc9B5bemtZzgdz2dAe97RCxVEYKxRhjQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AD8E97C4CE; Sun,  3 Mar 2019 17:08:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <05c4a58b-341c-4e39-97a9-221fa89c00d1@www.fastmail.com>
In-Reply-To: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
Date: Sun, 03 Mar 2019 17:08:04 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: [Design] Kernel-based BMC firewall
Content-Type: text/plain
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
X-List-Received-Date: Sun, 03 Mar 2019 22:08:56 -0000



On Sat, 2 Mar 2019, at 07:54, Joseph Reynolds wrote:
> Here is my BMC firewall design.  I'll post it as a gerrit docs review in 
> a few days if nobody steers this in a different direction.
> 
> Highlights:
>   - firewall established by default when networking starts
>   - BMC-specific firewall rules to be documented
>   - firewall logging not started by default
> 
> Enjoy,
> 
> - Joseph Reynolds
> 
> 
> # Firewall
> 
> Author:
>    Joseph Reynolds <josephreynolds1>
> Primary assignee:
>    < Name and/or IRC nic or None >
> Other contributors:
>    < Name and/or IRC nic or None >
> Created:
>    2019-03-01
> 
> ## Problem Description
> 
> OpenBMC needs an integral firewall to monitor and control its IP 
> traffic.

I think this is a bit light. What I would like to see here is a discussion of use-
cases instead of a one-sentence hand-wave. How do we want to control its
IP traffic? In what circumstances? How are we monitoring the traffic given
the limited flash space to log it?

A lot can be accomplished by simply binding the right services to the right
interfaces, or not running services that you don't need. There's no need
to firewall a closed port (unless you're trying to cloak the machine on the
network, and even then any open port is going to give the game away).

Given that BMCs tend to be on a separate management network, what are
we trying to firewall them from? Are we trying to break down the notion
that they need to be (on a separate management network)? If so there's
still the problem of broken protocols like IPMI. I'm not saying that we
shouldn't remove hurdles, but I'd like a better understanding of *why*
when we're proposing to add complexity (with associated hits to flash
space, memory usage and CPU time on a slow system).

Cheers,

Andrew
