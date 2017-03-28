Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsgzy6TBdzDqZQ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 17:32:30 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S6WAfF007441;
 Tue, 28 Mar 2017 01:32:11 -0500
Message-ID: <1490682729.3177.105.camel@kernel.crashing.org>
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 28 Mar 2017 17:32:09 +1100
In-Reply-To: <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Mar 2017 06:32:31 -0000

On Tue, 2017-03-28 at 08:28 +0200, Cédric Le Goater wrote:
> Simply, 'iperf -s' on the BMC  and 'iperf -c' on some other machine.
> 
> Your v3 fixed the issue and iperf now finds :
> 
>         ~76 Mbits/sec on the AST2500 
>         ~32 Mbits/sec on the AST2400.

Remove all the stupid debug options in your kernel config, and you'll
get >400Mbit on the 2500 :-) I get about 200 on a Firestone with a
2400 (after manually hacking the RGMII clock delays to make it work
at 1000bT).

I'll post a rebase to 4.10 tomorrow. Sadly 4.10 loses another 100Mbit
probably due to kernel bloat.

Cheers,
Ben.
