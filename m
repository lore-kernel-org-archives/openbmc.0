Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eulBn6Rj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IpKWUIgh"; dkim-atps=neutral
X-Greylist: delayed 524 seconds by postgrey-1.36 at bilbo;
 Tue, 19 Mar 2019 11:11:34 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NYPf5S3DzDqJX
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 11:11:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 407303D6D;
 Mon, 18 Mar 2019 20:02:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 18 Mar 2019 20:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=70vJyIAHYxYlUgHgKldX7FDusApGziZ
 XRbzOdBHm13o=; b=eulBn6RjJjbMRUNptdWLYVhtef7cC38slVaWNXcRCND43ya
 1BeQ2JpU68TQLwxcLjM7maKY3ZUXNLOYwDIAV1lkzbQmBy7VAy5smuvpm9m/4z24
 22ZqIsSEfJftC+wbbHy7qstyUaLFB6sY+uzj9fcvLmRDITlcWuxUGO5C4wArAqzA
 HpeQyJgxu64L3fBKK2joIMj2aDUqTg9bAnSKofyNDCaAnKy9ZDR85cTjNx2CxRFX
 UjvB4wYOJO8Kuq6C14rE1k8fPssBQu7jbDv77jVTZ1F1F0j6+EsCZd+tVr0tpbZu
 1yf9yprZgwu083nCA1m9RNjUoiRKRvsvAFDkvIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=70vJyI
 AHYxYlUgHgKldX7FDusApGziZXRbzOdBHm13o=; b=IpKWUIghQbPBErkvNa4rpK
 5WjkfsaMDeJhFhaZaNxguI2AHeLEjuqXiC9yaYzmufI3k3L6k4QmBtHJ2FyWL6vH
 wAn5fK0aeFaH6s6NmkgtOv17zNFrkBIcVOdE+8BglLSOZHGcgeKvwYXmB3h2Dmov
 Mvjm/KyTAQ/gquEcKCcZogNwehVq3L+HwlXnWeUl+KGO0Oc3imXQbvqRuF20uCcs
 LyFCLJ3AcmZPAGZlh8czGWNxE5XGB4BiMGVPJCsHqiEiY9eRPWzaxyyyz9FUPkGR
 VEHJXhpybZdiOwHrQeyVmbNAtPQlLJC/8K+hUt+byPQe9IwugzsCwsN72QCRfLNg
 ==
X-ME-Sender: <xms:ozGQXERsQQ6HmTgJOD6JyejMwE-BqsXzyetYMp_Wr6wbuvOxszIfXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrieefgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:pDGQXI39YSGxCYiyS7iMpvhzsrR2gnZy6SAXb7-DPDf3pBV2jfpT-g>
 <xmx:pDGQXJ3rtpOBDIIWkxUC605goP2BeP68jGV2mDqixdwenIYtn6Jvng>
 <xmx:pDGQXJtsrReqwE_jXvXsyAYZYjwlMlMXb53-5wjNKvtaG4raqJktqw>
 <xmx:pDGQXDKPt4kOthrM-B0bzqkq2vIY2YkT0irwL0n2oA2JPCo4jbzVkg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E29337C6B6; Mon, 18 Mar 2019 20:02:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <859d9ad0-686a-4580-995f-a9d34ff2bbeb@www.fastmail.com>
In-Reply-To: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
References: <CACPK8XdnESPUxPqX005x64sCehJTPyBw9vnCyHk7UP8vMrz1vg@mail.gmail.com>
Date: Mon, 18 Mar 2019 20:02:43 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: Moving to Linux Kernel 5.0
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
X-List-Received-Date: Tue, 19 Mar 2019 00:11:38 -0000



On Mon, 18 Mar 2019, at 16:47, Joel Stanley wrote:
> Hello,
> 
> It's been a few releases since we bumped, so I'm going to publish a
> 5.0 based tree this week. I've done some testing on the machine I have
> (OpenPower Romulus ast2500) and it looks good.
> 
> I'll be rebasing without discarding patches for this release. That
> means if you have non-mainline patches it will still be there for
> dev-5.0. Next release we will do a cleanout, so please ensure your out
> of tree patches are on the upstream lists for 5.2 now.

Hmm, guess I've got some work to do.

> 
> Cheers,
> 
> Joel
>
