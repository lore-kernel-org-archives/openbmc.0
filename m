Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fFi/dNyY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AOZW/3p4"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406jtq6PYlzF214
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 10:44:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 08F3121053;
 Thu, 22 Mar 2018 19:44:16 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Mar 2018 19:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=R9hyuKinCVTVya3+t4xTQd/6eyA9l
 7qeQZ8K2lyVIcI=; b=fFi/dNyYWJVyD2QJBWmE76NvskinngGMg3LS0+vNNjXq/
 AL5EVoxwoklvUr1B1DPo0kZ0QLChefVDor7XpzRt+eiI2qxPtCrYOTkAHcpG8pRz
 vwZFCOYDGDNjSi6OLU+sY/dip86Mv5ZBBlfdhKtf8WUSUvmFOLSx79WtYfTPGtUz
 2ZWH/6AvqWHiIYMtNpanKkMT+DZFIVUMGaGcJ8NGwf/DzwwSvvVBaJTGOmZnoRY0
 VOyuKqmh3EUiV/Khuu5p21RCsR8DI5mS7tBnh+LrnNlidCpHt+eU0pRvmvbXwyXf
 QelrWiuhtqNmH54nC5zhOuzT3+gquMNARhXoee7Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R9hyuK
 inCVTVya3+t4xTQd/6eyA9l7qeQZ8K2lyVIcI=; b=AOZW/3p4j6taUock20x2mS
 f5XL0W7DGorDJp8NkecoDzj7j782+Vvj3T5IlskUYpP3M0iydg9IKBVEuX+f+QmS
 I1rv52VQPbNnGBhNMqN+gaxk9HMhwwnysS7F+6hDpJBsa2a4LNJ4h7AvNJjtWh/o
 luL6LB7fhe6T4i5S/8HbNOHpIK3mYsZq5vB67K2GN/dZvZIFQktNXMcxy/I4oFBN
 8PSen69GFO4QZ5j4SWKhI2u6m6k8wWgqILpxIHWG59stoaqLYCQemu3vhEXMERgj
 z1ga1mgqyo9JQ2WDNb3NiIwhvjFm+tadH0s+Gyjh8FEVAR0BGcKxm3vG+zbxasvg
 ==
X-ME-Sender: <xms:zz-0WkgUyTV8bS1Uyl8em5oL6nzJYMR9pVW31iUSa1TPuUpxFekqIw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id CC237BA43B; Thu, 22 Mar 2018 19:44:15 -0400 (EDT)
Message-Id: <1521762255.2947317.1312969448.634F7523@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
Date: Fri, 23 Mar 2018 10:14:15 +1030
Subject: Re: BMC Health
In-Reply-To: <CAO=notzcXOJzJroXXhYkNc9cawMZcsVtE_M3GMkAcOk6RZTgrA@mail.gmail.com>
References: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
 <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
 <CAO=notzcXOJzJroXXhYkNc9cawMZcsVtE_M3GMkAcOk6RZTgrA@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2018 23:44:21 -0000

On Fri, 23 Mar 2018, at 08:33, Patrick Venture wrote:
> On Thu, Mar 22, 2018 at 1:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 23 Mar 2018, at 05:24, Patrick Venture wrote:
> >> The Facebook presentation yesterday talked about BMC health, free
> >> memory, etc.  I didn't see anything in the IPMI spec about this
> >> information, and beyond my general drive for metrics, just system
> >> health would be great.
> >>
> >> Things I care about:
> >> up-time
> >> free memory
> >> ... other things?
> >
> > * Free flash space
> > * Network traffic stats
> 
> I actually have an OEM IPMI command for grabbing the ethernet
> statistics that loads as a library into phosphor-host-ipmid.

Ok. I don't know how best to export the metrics, though we (others inside IBM) are already looking at the problem.

> 
> > * CPU load average
> 
> Basically a cleaned uptime result?

I guess? I don't really mind how we get the data, or how it's exported, just that if we're going to do metrics I think these values should be included.

Cheers,

Andrew
