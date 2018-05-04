Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QV2gluCo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZvNiVjIC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cknz6G2fzDqjP
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 17:55:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2BD1A225C3;
 Fri,  4 May 2018 03:55:17 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Fri, 04 May 2018 03:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=RglbezD/KFEOnPEFJbxWwJW6+33RZ
 pdB5vXNkIJ0kRk=; b=QV2gluCougL9Hh8TZp6JpBB0KMr185aWxjZQoOXUcjssg
 BhmJ+pmcJVLMARQCJx4/KIBG3qkYRO9BBZ5R3XJA3kXWKCH2oq3jwacNurtJRsUR
 JsrXFYRpLN+Ayf3WHwAsPO8mJCTnH94KRmxEaEBnR3Jo3Xl8IWTJqKyK+YyHkbEy
 sHwcwFQp3PvFHc63R2SboV15D8SC1QkuQP8TTpVKLdJExNmbPRjr56URI3O19PYe
 YAHYQHokybv6U1ZvuHREnMItzq/3BqeRbUSomww0tN8HQfdvd/wXAUHew5kHbkSm
 VcMXbKl0EbaF0YQzACpCzB4EnxMk43cJNLzbONJJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Rglbez
 D/KFEOnPEFJbxWwJW6+33RZpdB5vXNkIJ0kRk=; b=ZvNiVjICJF1dAejpVhNBBB
 Xz30RivdpIc6McpEYpwVtbk1BHlCJdVGeDyLP2rM6wWuT2PFgUQ3NciIc4KQJbjj
 XsFwp5KwC/8jOVFTat3nke5VIOPH8VgCGyP9FdU5pXuWdY0bDWsUa+t+DY6nS2zG
 ToNsZsJPltdvie3z2pHGkSecHWvydtrRA5AV6XA6XKvGZyjKUPd4+12xkbGX2BNL
 X7KMzZfnFYcVpiS8E8oEcCfv2w+Uxkjo/3bu+E/CQsva9vScHjVcblUK8Vx5lMq8
 jJJi86f/H5Rsnjv96eyt4SqL26RFtTWXC4TbFDxwDNEZkjWAX5ndcSvWm+Jd0yVQ
 ==
X-ME-Sender: <xms:5RHsWmXlG76OHzXZSaD65ih-ZNkP3G0Gvc4WX8BjDeOCAn07g7YgqQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D8E48BA781; Fri,  4 May 2018 03:55:16 -0400 (EDT)
Message-Id: <1525420516.2510070.1360549248.0F065DEC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Anuj Mittal <anuj.mittal@intel.com>,
 openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-62b61488
Subject: Re: [oe] [RESEND][meta-python][PATCH 1/3] meta-python: Add
 python-pyflame recipe
In-Reply-To: <ab208a40-d4eb-4807-8f38-824738aff34b@intel.com>
References: <20180504070916.11024-1-andrew@aj.id.au>
 <ab208a40-d4eb-4807-8f38-824738aff34b@intel.com>
Date: Fri, 04 May 2018 17:25:16 +0930
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
X-List-Received-Date: Fri, 04 May 2018 07:55:22 -0000

Hi Anuj,

Thanks for the quick review!

On Fri, 4 May 2018, at 17:20, Anuj Mittal wrote:
> On 05/04/2018 03:09 PM, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  meta-python/recipes-devtools/python/python-pyflame.inc      | 9 +++++++++
> >  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 5 +++++
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
> >  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > 
> > diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
> > new file mode 100644
> > index 000000000000..37ceab888533
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> > @@ -0,0 +1,9 @@
> > +S = "${WORKDIR}/pyflame-${PV}"
> > +
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> > +
> > +DEPENDS = "python"
> > +
> > +inherit pkgconfig autotools
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > new file mode 100644
> > index 000000000000..c902e121231b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > @@ -0,0 +1,5 @@
> > +require python-pyflame.inc
> > +
> > +SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"
> 
> Archive tarball checksums are known to change. Perhaps you can consider
> using the release tarball instead?
> 
> https://github.com/uber/pyflame/releases

What exact URL should I use? I got the URL used in the recipe through the releases page by copying the tar.gz link.

Cheers,

Andrew
