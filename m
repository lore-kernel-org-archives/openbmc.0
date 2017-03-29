Return-Path: <clg@kaod.org>
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtXqS2lmszDqJC
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 03:13:07 +1100 (AEDT)
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C3A7977A5B
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 18:13:04 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 38F0A4E0096;
 Wed, 29 Mar 2017 18:13:02 +0200 (CEST)
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
 <5b1b8621-c20d-f100-0875-8f2264d70e8e@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <45ca9dbf-1b24-3114-ae9d-cf81a9dc197b@kaod.org>
Date: Wed, 29 Mar 2017 18:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5b1b8621-c20d-f100-0875-8f2264d70e8e@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15929231885737233154
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrkeejgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Mar 2017 16:13:09 -0000

> I reworked a bit the way the rx queue is flushed but this is not 
> enough to support iperf yet. it needs more work to sustain high 
> throughput. U-Boot support would be nice also but I think we will 
> need a more complete NCSI model. 

So, I was wrong for U-Boot. The ftgmac100 QEMU model is good enough 
to use the built-in TFTP server of the user mode network stack. We 
have a simple NCSI "echo" model for this stack. For the records, 
here is how to use it with QEMU.


Start the Aspeed guest with :

    -net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100 -net user,id=netdev0,hostfwd=::2222-:22,hostname=vm2,tftp=/var/lib/tftpboot/

when under U-Boot, set the environment :

    setenv ethaddr C0:FF:EE:00:00:02
    setenv serverip 10.0.2.2
    setenv ipaddr 10.0.2.1

and tftpboot the image installed in /var/lib/tftpboot/

    tftp 0x48000000 fitimage.ast2400
    bootm 0x48000000

Cheers,

C.
