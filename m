Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cNPf3tSpzDqkJ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 19:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ItLQatOg"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41cNPd2KGlz9ryt;
 Fri, 27 Jul 2018 19:06:45 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1532682405; bh=cKzMiOgrksKt090hSKsJbsk4+PyWFh6REfsQkok30NM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ItLQatOg6eNJ53+2w6/VIWCMFC8mfoZgmJUiqhszjDLZheAb2hOIs9aK4rdxxJkgD
 m77s4SRi38JNiHDTQowVX1Vvi3UtQl6/kaS5o01oU0b2kzE4QlNummXn9DN/eUmvji
 WxkLgttDVQDirl7kesv+LEmaHcSwfn00bWOLEjTt9nj3+7dO3G4tN5YcBZodt0DW1x
 /rPFuKD0+dc1H03oo2wfxLwe4enS1PAghibZtr1wJT+1uyeDYoVwuUlO5OuQRw4QNv
 IUvdNtPePn5ZK8pJ1E81bzZ3iCy5UCyC7/0AvWKXvcytlOd2fzJ7tkZWaY3TxZQHJt
 O0NbCI5mEZgKQ==
Subject: Re: Virtual Media
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
Date: Fri, 27 Jul 2018 17:06:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 09:06:47 -0000

Hi Matt & all,

> I hope to send out a high level design for RFC soon, or people can
> chime in now with any ideas they have for it.

So, as part of working on that design, I've been doing some prototyping
with the virtual media code, and just got some experiments working
yesterday, that expose a file from my local browser to the host machine
(as a USB mass-storage device).

The overall architecture looks like this:

  - the BMC kernel has a network block device (nbd) driver; this
    provides a block device, where read & write operations on the block
    device end up being sent as requests over a socket interface.

  - the nbd infrastructure allows us to use a unix domain socket (rather
    than a network socket) for that interface.

  - so, I wrote a little proxy that does a some setup and then just
    forwards data between that unix domain socket and stdin/stdout.

  - Using a websocket proxy, we can connect that process' stdio to a
    websocket.

  - I wrote a little javascript nbd server to connect to that websocket
    from a browser session, and serve nbd read requests by reading from
    a local file. This gives us a block device on the BMC, that's backed
    by a file accessed by the browser.

  - On the BMC, we create a USB mass-storage gadget (using the ASPEED
    UDC device), that uses the nbd device as the underlying storage.

Using that, I was able to forward an .iso image from my webbrowser on
one side of the country to a machine in our lab on the other. Speed
wasn't fantastic, but should be fine for most cases.

Let me know what you think. The main caveat of this is that this method
isn't able to serve writeable images, as sensible browsers won't allow
served javascript code to modify files.

If you're curious, here's the prototype code for the nbd channel (proxy
+ javascript server):

   https://github.com/jk-ozlabs/jsnbd

This isn't necessarily the code that we'll want to run on OpenBMC, more
a proof-of-concept to make sure that all the parts work.

In order to implement this on OpenBMC, we'd still need a few things:

  - integrating the nbd-proxy into the proper http server framework

  - integration into the actual OpenBMC web UI

  - adding hooks to automatically start/stop the USB mass-storage gadget
    on nbd session setup

Cheers,


Jeremy
