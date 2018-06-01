Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aB40rhBJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JVt+fyo7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xtky24KczDrbW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 15:52:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DA6820DF7;
 Fri,  1 Jun 2018 01:52:07 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Fri, 01 Jun 2018 01:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=65pLUBWEPCsojhjEIyCyARknYXaSD
 0A9hSwDebCphrk=; b=aB40rhBJOESKkdyZq3hCNXMgDGWxtzvf2fSEywiCd4C2C
 xbLlZx2b4rHi3LHtvgZFlFQEd7varjIQjBtTEmOTwwvfXqZ7uQ22v2Lv0EfltqRa
 HZrnCRANLXca3uR285QaxT/PZQLiSaFawMaCxIHPSRsPot8Il2feV1NSJfQhIpNN
 8BC2ZyBijujIvQBO2OPbvc/BB6q6lmkkqT68cGPGfqw7Jf1Vpn4teoexrcG3qnZb
 ARoa3FAnfgA9NCxRD5Y97QdJj3Op3un9d2vB6mqFTqLAjFBPaTJq8VgoaAyCGodm
 HjhWWOy7cxcNzluqjDSZqKQ71QCMVcibGxz5mExoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=65pLUB
 WEPCsojhjEIyCyARknYXaSD0A9hSwDebCphrk=; b=JVt+fyo7A/eDt+shGqakbk
 zyODs19OpjQeyXSMkqiOB8FqFTjyUmFrk5+VgwKPd45Oo0gstA0WF6TKmAWOmk2q
 ZnmkGm5W7G0RWpfQI+JmHMX4v+DTR/Re3AXV8Kq3IEmAmhUdwCSbbaCg2OCqyyXw
 8kQqgor3ISAo97rQ8CWuLncG0yxIxMSiUvzgD6VQAwKUH/NSVcdDT6TK8WCd7FCi
 OMwuVCo06R8OQ7cCeGT0eNeBUwFAoi7AuiEOuirc5y+3LxZbYAV7C/JvUkHv7znu
 hwPN59bA7//BLMz/FwtLGK2FLmiFoaPlJq0TWi+otrlnH3I9gk/K15tI2jqimL4w
 ==
X-ME-Proxy: <xmx:B98QWwDe1s1i31VwTQtNY0_zTzUFqql7SAd2f3h_G9QfsELfc-F8Wg>
X-ME-Proxy: <xmx:B98QW9GT2sXUOv8QuwE-xUNjNy5QwT3sRIf2isnP6VEIYiqnrGdvFw>
X-ME-Proxy: <xmx:B98QWwLEqvpmJ9v6W7vCaO5Yt09B7XqKfm4EOKuiJb1UgNAF5Jfo5Q>
X-ME-Proxy: <xmx:B98QW5l26EH2r6QxvV_ygTQnDfai1ut5Ig-dBpICHKyID-M-L3sX1w>
X-ME-Proxy: <xmx:B98QWwRDKjyOsQC3Fassy4w7zNR5uf3_SHDtXy_bI5YBsGBFFuDVOA>
X-ME-Proxy: <xmx:B98QW0DhaX8WnEYDNHz3zq9bIymlQKaPPJZazC78CFzQ6uZpHa1JMA>
X-ME-Sender: <xms:B98QW-KVfczsCObOe5z9b7-VA__9w8qiXYpGjzavIGIY4psEX6PNUQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id F319DBA780; Fri,  1 Jun 2018 01:52:06 -0400 (EDT)
Message-Id: <1527832326.1573871.1392638136.4D3CA167@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembeded-devel" <openembedded-devel@lists.openembedded.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
Date: Fri, 01 Jun 2018 15:22:06 +0930
In-Reply-To: <CAMKF1sr-k=TK-wyUtDJMUT8DK=EcS3A08jCJD-xjOD_Aw-MbQw@mail.gmail.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
 <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
 <CAMKF1sr-k=TK-wyUtDJMUT8DK=EcS3A08jCJD-xjOD_Aw-MbQw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
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
X-List-Received-Date: Fri, 01 Jun 2018 05:52:11 -0000

On Fri, 1 Jun 2018, at 14:07, Khem Raj wrote:
> On Thu, May 31, 2018 at 7:36 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Hi Khem,
> >
> > Thanks for testing.
> >
> > On Fri, 1 Jun 2018, at 02:18, Khem Raj wrote:
> >> fails to build on qemumips
> >>
> >
> > Do I have to support MIPS for the recipe to be acceptable? Is there some way we can limit the recipe to architectures for which the software is known to work?
> 
> Ideally we tend to support the core architectures and mips is one of
> them, so unless there is a very basic
> reason e.g. missing support etc. we tend to fix the problems,

Doesn't the fact that the source doesn't build indicate missing support?

I don't know what C library you were building against, but glibc for mips doesn't contain a definition for struct user_regs{,_struct} in sysdeps/unix/sysv/linux/mips/sys/user.h. It's a bit nasty, as the header very clearly states that user.h is purely for gdb, but pyflame is making use of it anyway. Patch 2/3 fixes the pyflame source for 32-bit ARM, where the struct has a different name, but at least it's present. I haven't investigated whether we could pull in the appropriate header from the kernel instead of libc, but again because ARM can be made to work with relatively little effort I hadn't bothered.

> so I would suggest to see if it can be fixed preferably
> if not then we should cite the reason and probably we can add mips to
> incompatible hosts but that is last resort
> once a recipe goes in it becomes a maintenance work and I would like
> to make it as light as possible.

I could go down the path of working this out for mips, but fixing mips falls outside the scope of what I was doing at the time (I'm several yaks deep here), and given the problem is external to pyflame itself I'm not terribly motivated to fix it.

So I feel at this point it's either blacklist mips or we leave the recipe out of tree.

As an alternative to making mips work, can I assist with the associated maintenance hassle in some way?

Cheers,

Andrew
