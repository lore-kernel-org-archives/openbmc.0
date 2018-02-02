Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HI3GuW7J"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NkZhNAwV"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXdd60MWSzF0YQ
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 11:48:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 84BDB2088E
 for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2018 19:48:06 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Thu, 01 Feb 2018 19:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=a+pcmyCShnqKCQPZ0LhOaYwXwV45M
 OT7WHoYrhK1Z8w=; b=HI3GuW7JUzrzriWfpX1hKtjd2g6+2Mn2/GYH9Js0AI17m
 zvLJzbwLEXaVId3Kg9Fhm011gIm6gi2eGA4HCrexZ0mrtmx2Btg6Y/oFZzkZ+liy
 tv7yT9l0GPS69M6893sC2IyOBSYOkTHNoR10FSiW2aEkIVg4ZZrLquo7AUhU4rHX
 plUhrDpuKDrkqq5Em3uI80QkZaWoVwEjD5SiA4gYbmP0lChPASJqWOKdOIBabsA0
 FuQ0c3ZC8W62S+1ZpoHSC7teW/pEvEnwY6Z2cVJcumrUytdkoCjw8HBzGq4NLXNT
 f4VyNZJfrvQqJiiT8XYvCEWCz0JB7UMf3BV1ytl1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=a+pcmy
 CShnqKCQPZ0LhOaYwXwV45MOT7WHoYrhK1Z8w=; b=NkZhNAwVBalQ2/6R8vyVGX
 yOjJ3iRFvE8cjd4NK2da/IlQGFHBWUGFk9DQ21rcoDAa9fGGMg3LEf5BI67MTKi5
 HKuOgnP1J9Ru1vUtFBI3w2Dh+v8U8DEuIEuB1F0VEfSvmwVRlT7FxiqtoehDjj9b
 LQPLvQ56udC7xNvJz0dfoyMGbj9trqJOVdpZ5MreRY89lj+DGYx7wsmMr9G+Y6TJ
 B/px7S2qe2LpvszgqPeUMxnciDJLaQtOIUeFu6IIUBPmFskEZ7Y1ERVp0WGsdld+
 ZPW+OxoCxgCXjog0R9lBtGZxEY6YVumV8C7Rqh/i59axwjfdk7xZLh8CzNG0NJTw
 ==
X-ME-Sender: <xms:RrVzWpKcH5a6NHZZtmyXhQMz4mr-hkdZuUBQUzah2_tooukrziG3Xw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 604A49E47D; Thu,  1 Feb 2018 19:48:06 -0500 (EST)
Message-Id: <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fde26eb3
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
In-Reply-To: <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
Subject: Re: BMC redundancy
Date: Fri, 02 Feb 2018 11:18:06 +1030
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 00:48:12 -0000

Hi Deepak,

> So several of the existing OpenBMC apps implement specific D-Bus 
> services. What does it take to make remote D-Bus calls to such apps?
> - It doesn't look like the D-Bus spec or libdbus officially has anything 
> for D-Bus across computers. There are some good notes at 
> https://www.freedesktop.org/wiki/Software/DBusRemote/.

Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:

1. Slave BMCs connect to the master's DBus daemon, and applications namespace their objects appropriately. Multi-BMC aware applications on the master access the namespaced objects as required
2. Slave BMCs are willfully ignorant of their role, with the master connecting to the slaves' DBus daemons to form a coherent global view of the bus for its multi-BMC aware applications, which access the remote objects as required.

Given the support DBus has today it might be easier to go for 1 than for 2, if we go down this path at all.

[1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html

> - There are ways to achieve this via Qt D-Bus, but it would involve some 
> amount tweaking with the D-Bus configs.
> - I'm not aware of any open/active project implementing remote D-Bus.

Here is someone's attempt at making it easier: http://gabriel.sourceforge.net/howto.html though you would struggle to say it's active given the last contribution was 2013-05-14.

> - Thoughts on doing remote D-Bus over WebSockets?

How do websockets come into the picture? Why do we need the extra complication vs normal sockets?

Cheers,

Andrew
