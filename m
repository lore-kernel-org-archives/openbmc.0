Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405bbZ1XJWzDqZH;
 Wed, 21 Mar 2018 14:57:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="uFW9ghFg"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 405bbY3TFKz9s0t;
 Wed, 21 Mar 2018 14:57:13 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521604633; bh=+H494CqQ3ozPLmKVr528PMhBnCbdmymDLGVqQHkzJLM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uFW9ghFgRIbxBP1S+u3MJU538FL3Epu40N6NFSF4Ym2BAr1p0x6bFkNkzeUi6Haww
 fEPy/q/dr+i33y+P+0sHHl4R0otG/eXrchQFEDmqcFAhwAuKVRJAzYDlI5QvH4IU61
 bSU9cQetW9AnZekARLU16jrXQ3eBP6NNQ/au+TPgmtE1GqXKKSrEsj941rPR4ga5dJ
 Bv/6z3HdWi2LsNv1BJxc/BTukxXN6OuRiq8yJ0yQviFwiIyuTivX/DrhOCNU1sIaVB
 aJAWqKAycjh/b5KMxhnPuEKGNDRplsy/iwUwf1w5WlmKZ5JbHV9Po1fhXTBpl4DOYs
 C9CYLpGCwrRSQ==
Subject: Re: [PATCH 5/5] serial/aspeed-vuart: Implement quick throttle
 mechanism
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-6-jk@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <1db93cf2-21ef-a9ba-e1fd-0e3815ac8316@ozlabs.org>
Date: Wed, 21 Mar 2018 11:57:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-6-jk@ozlabs.org>
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
X-List-Received-Date: Wed, 21 Mar 2018 03:57:14 -0000

Hi all,

> +static int aspeed_vuart_handle_irq(struct uart_port *port) { struct
> +	uart_8250_port *up = up_to_u8250p(port); unsigned int iir, lsr;
> +	unsigned long flags; int space, count;

Yikes, wrapping is messed up here. v2 coming soon, with the proper timer
API too.

Cheers,


Jeremy
