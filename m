Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404v9g0wspzF1bP
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 11:35:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="u09LHuMr"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 404v9f2P2Xz9sWF;
 Tue, 20 Mar 2018 11:35:49 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521506150; bh=b2wPndRuxtgOAGrSfG3OFIEbRr3sfJooe7Rex47hfh4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=u09LHuMrHCloDhBvsbHRiVhZr42oYZL1ra9AvE6+T9On8lzECuPFeE52IAq98EdRS
 m01xvt3QMDXrSGBbmNZ8iOOO4IaSbI/RqWpAd76NG8AE6DssT5WAS1VgwxyjKDpfee
 wJnn0iXQtLHlv+WeizeIMPZ4eEZpWJAnjpcvV0esFTFtAIn8qrqyQ0R7nK2lE0QoBU
 XTGzr9qf/vUlR4zmRbphic6hZ4EWBd3en78I8wHVxgz2iyJx1V9vEyhfl3NCnNdy6k
 f9kawqPikk7jaE55/0wqnawTF/M4ytWusytxAsYayhc3mxWBZv6maaP5btc61Ey5O7
 vmFpMM+5yWRWQ==
Subject: Re: IPMI SOL performance
To: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <32dafbf5-2568-a85a-ad3b-abd8242bf251@ozlabs.org>
Date: Tue, 20 Mar 2018 08:35:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
X-List-Received-Date: Tue, 20 Mar 2018 00:35:51 -0000

Hi Tom,

> I wanted to discuss about an issue related to IPMI SOL.

Cool!

Given that:

> The same issue is not hit by the ssh console on port 2200 and does not
> miss the timeout of the petitboot menu option.

- and that we don't see the same behaviour with other SoL
implementations (ie, different BMC firmware on similar hardware), it
sounds to me like this might be due to our IPMI implementation?

Have you confirmed that we're making the best use of the SoL payloads?
(ie, we're not using smaller TX buffers for any reason).

> IPMI uses UDP protocol and the maximum size of the  SOL payload per
> packet according to the specification is 255 bytes. Also the ack for
> each of the IPMI packet requires a command lookup
> and execution. Compared with IPMI SOL, ssh supports 64kb payloads and
> ack does not need an application lookup, so the round-trip timing is
> faster. IPMI specification for SOL is written with UART speed as
> reference, but the VUART pushes the data at a much faster rate.

The console multiplexer will only push data as fast as *all* consumers
can consume it. As a bit of background: obmc-console-server will read
from the VUART into a global 16kB ringbuffer, and write to each of the
consumers (ie, the sockets that ssh and IPMI SoL daemons connect to).

If those writes block (for any one of those consumers), the ringbuffer
tail is not advanced. Only once the slowest consumer has unblocked and
consumed data, we advance the tail.

Once the ringbuffer is full though, we stop reading from the VUART until
there is more space available (ie, the slowest consumer has caught up).

This means that we have 16kB of space for bursty data, after which the
daemon will slow down reads from the VUART device.

So it sounds like our IPMI SoL implementation is slower than other BMC
implementations, as we don't see the delay on other platforms. Can we
address that?

As others have mentioned, there's currently an issue with the VUART
hardware or driver dropping serial data on high load, but that's
somewhat separate from IPMI performance. I'm currently working on that
now :)

Regards,


Jeremy
