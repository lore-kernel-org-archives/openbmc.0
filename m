Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="VtgtyiDE"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ijb0lbRP"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn30b0lWNzF18s
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 16:33:01 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CA9B520B53;
 Thu, 22 Feb 2018 00:32:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Thu, 22 Feb 2018 00:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=71tXsC
 XZhzFdN1KpzSwe8D+uFEUQXFHPQbXYiwYmXEY=; b=VtgtyiDEpYAAKCpgVQkA2y
 ohXnNvod36TX1npruc+pZD9jP3ZV2AfE2jJzSrYFpUaEIwg1viwGLv+cmjHUBSfh
 /AgRxLNn7cH5xkwLpA8aNHVi633FezOizA05MH2/mE54vWmTZdNvHUyKSLF7NSX/
 4wAixEwQiIkGR69jLmfh4H5JVguiYnue0KRTCg5VqKNiPQrjn2tN+H3Fk5XXehnv
 HeMwsoHIdaW9IcYb7zAVwYbfY3iLyelzgzSvDmcCRm6dNKUFG6DOVH5/8qWtCxci
 YNNa7Gy1q4dz8dkm13dWzkX6s9cafPT3fG0LWYhwv5O/nuiDPOT/8m7qHhvki85A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=71tXsC
 XZhzFdN1KpzSwe8D+uFEUQXFHPQbXYiwYmXEY=; b=ijb0lbRPLcgGgEHhru+qnm
 l3fJWFzMgDRBs60sSjMv3vvIPtMdGC7VeHz9Dskt6mQUHiHx8npic78TPRr13y1S
 Hv70tIK2wvEGoDr4KXDmjKHaR5gX8qj0hzmPId0VwCEVTEka0ZkFL3kA8fhrFk0g
 h6ZupJyHmK93ydWBkrXqNk12HD3YbtWvZTt0GpZsDvoC14x8HKU+byqhY/MeHRy3
 lAuOxi0xnr+RBaRzvraytoKSousmo5Te3ccj6RUw/dTrf6ELw66RGwku1oIxJHzz
 qaJV3TB3mH0fHWP7DItuoFxEXfiUYcojAHAPYvmYyexfdEhEuNBUueE9tQyDcrIA
 ==
X-ME-Sender: <xms:ClaOWm6UwdJ4EF_MQ0gMi8cCCkIuHShMuEwyfSnICIYazFx9qsEvtQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7106A24108;
 Thu, 22 Feb 2018 00:32:57 -0500 (EST)
Message-ID: <1519277575.9261.3.camel@mendozajonas.com>
Subject: Re: [RFC PATCH] net/ncsi: Add generic netlink family
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: sdasari@fb.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 22 Feb 2018 16:32:55 +1100
In-Reply-To: <CACPK8XesK9Lhz+GMMnOAMcMkBAkW0DLw2KwzcFxxA=HwrHEM4g@mail.gmail.com>
References: <20180215033057.1766-1-sam@mendozajonas.com>
 <CACPK8XfYRUa4rj-pNhGMq7K3OkXgSsdO+nDBsDKXpZtBZVEbVw@mail.gmail.com>
 <1519192470.3569.1.camel@mendozajonas.com>
 <CACPK8XesK9Lhz+GMMnOAMcMkBAkW0DLw2KwzcFxxA=HwrHEM4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 22 Feb 2018 05:33:04 -0000

On Thu, 2018-02-22 at 15:51 +1030, Joel Stanley wrote:
> On Wed, Feb 21, 2018 at 4:24 PM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > On Thu, 2018-02-15 at 14:50 +1030, Joel Stanley wrote:
> > > 
> > > Would a netlink API mean we would have to write some userspace tools
> > > to perform this configuration? Do you have any code for that?
> > > 
> > 
> > And after some cleanups we have https://github.com/sammj/ncsi-netlink
> > 
> > Pretty straightforward piece of python, but it does require python-libnl
> > on the BMC which Yocto doesn't package by default.
> 
> Nice.
> 
> Where to from here? Do you want more testing on hardware?
> 
> Otherwise we should submit it upstream. We don't want to introduce any
> dependencies on the userspace API until it is merged by Dave, so
> getting the ball rolling is important.

Unless anyone has some strong opinions as to how I've laid out the API
I'll go ahead and send a proper V1 shortly - just cleaning up a few bits
at the moment, namely adding a _FORCED attribute and dropping all the
VLAN attributes in favour of just having a list of them in the channel
attribute nest.

Cheers,
Sam

> 
> Cheers,
> 
> Joel
