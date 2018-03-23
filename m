Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rDMgvjwa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dE2pkHo1"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406khS50StzDqwZ
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:20:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8091920E5E;
 Thu, 22 Mar 2018 20:20:22 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Mar 2018 20:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=CuOYq6Oa7ueG1kPbFniycaop3Z/Bl
 7/5aEuwbKAeZCU=; b=rDMgvjwa3h2Tzn4RP4cDvk/mZ1XZoqotT225jjpwIogrB
 z3lU36IkzqSg9+xzvbBjyz/EfTH8gf+7CeqHzvolv3r0MG85MXBF0OxEzwxTK15p
 QwlswCmx7Bp2WbdW0hS++UzpkqfvKKCQSYNL45wjafllEJq7aFuduNSdlc/7P4MF
 qrQmj1ZZE9SZ4yFgpEKEg31ro6iclPc0SxfCN0/llkLj0F0sSA7YXuNaT/HP91ua
 UDLv8NuJ+NxT7aN2CUY9Pmt4/G5XW5HA5JDvRB+hRLHP8N6Fwh8bIgzCgDWpvM5R
 i5oKv79z8LSrkvQno2y51HZ2Gw46qs3I5wypyGeig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CuOYq6
 Oa7ueG1kPbFniycaop3Z/Bl7/5aEuwbKAeZCU=; b=dE2pkHo1F1zeMYHVkCuXkm
 GgYD3/c6pFLk2Y05FmJjmJpy3NFmiZu45adMyqREf1dXgaZ4OEm0TRRJMJlZrGKI
 M+fkFOPdvZLn6JtwvutRqFiQ5hZYGY3EP3LRR6asT0i5u6a/nZElq1PLv6SaTQ+l
 S+iVZZKV+Bpga93VBfI1NehXc3OyVj8O4Qm35JA241K6WwYvdpU97xH9BqBVOJIu
 vMnqvGKihes+LcIbDpcSdLy/JCQYydfY/7+9iNqn+xxw9eJnakI1rH8KgfoGKSFE
 9gSNC03HprxQw8elPUNKj3TMnpco+cv6lVMJi+STwAeqGGZ9FFD0XUtl01nlOC+w
 ==
X-ME-Sender: <xms:Rki0WnRyQLIOIaD6NWwjkCP_9_ygcnxKjWwSwlj4oJ2mg0sSTy2-6w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 5B7C1BA43B; Thu, 22 Mar 2018 20:20:22 -0400 (EDT)
Message-Id: <1521764422.2961526.1312998048.44165FED@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
References: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
 <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
 <CAO=notzcXOJzJroXXhYkNc9cawMZcsVtE_M3GMkAcOk6RZTgrA@mail.gmail.com>
 <1521762255.2947317.1312969448.634F7523@webmail.messagingengine.com>
 <CAO=notzwNGmghGFGgAGG_ftx1tnA2NDgMvLHvArCSYZmDM64JA@mail.gmail.com>
In-Reply-To: <CAO=notzwNGmghGFGgAGG_ftx1tnA2NDgMvLHvArCSYZmDM64JA@mail.gmail.com>
Subject: Re: BMC Health
Date: Fri, 23 Mar 2018 10:50:22 +1030
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
X-List-Received-Date: Fri, 23 Mar 2018 00:20:25 -0000

On Fri, 23 Mar 2018, at 10:29, Patrick Venture wrote:
> On Thu, Mar 22, 2018 at 4:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 23 Mar 2018, at 08:33, Patrick Venture wrote:
> >> On Thu, Mar 22, 2018 at 1:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >> > On Fri, 23 Mar 2018, at 05:24, Patrick Venture wrote:
> >> >> The Facebook presentation yesterday talked about BMC health, free
> >> >> memory, etc.  I didn't see anything in the IPMI spec about this
> >> >> information, and beyond my general drive for metrics, just system
> >> >> health would be great.
> >> >>
> >> >> Things I care about:
> >> >> up-time
> >> >> free memory
> >> >> ... other things?
> >> >
> >> > * Free flash space
> >> > * Network traffic stats
> >>
> >> I actually have an OEM IPMI command for grabbing the ethernet
> >> statistics that loads as a library into phosphor-host-ipmid.
> >
> > Ok. I don't know how best to export the metrics, though we (others inside IBM) are already looking at the problem.
> >
> >>
> >> > * CPU load average
> >>
> >> Basically a cleaned uptime result?
> >
> > I guess? I don't really mind how we get the data, or how it's exported, just that if we're going to do metrics I think these values should be included.
> 
> Right.  I'm reviewing this from an IPMI perspective, things that can
> be reported that way, instead of a network interface -- the network
> interface being more .... solved as there are plenty of packages for
> exporting metrics over the network.

Looks I should have absorbed more of your original mail :)

Cheers,

Andrew
