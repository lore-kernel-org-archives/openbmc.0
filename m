Return-Path: <clg@kaod.org>
X-Greylist: delayed 601 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Jan 2017 01:45:06 AEDT
Received: from 7.mo5.mail-out.ovh.net (7.mo5.mail-out.ovh.net [178.32.124.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzBWQ2qPvzDqHm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 01:45:05 +1100 (AEDT)
Received: from player688.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 283C869B16
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 15:27:44 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 098EA2009C;
 Wed, 11 Jan 2017 15:27:40 +0100 (CET)
Subject: Re: [PATCH linux v2 2/3] mtd: spi-nor: aspeed: add support for SPI
 dual IO read mode
To: Robert Lippert <roblip@gmail.com>, openbmc@lists.ozlabs.org
References: <20170110225555.117814-1-rlippert@google.com>
 <20170110225555.117814-3-rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dfa90d97-5148-1603-74f4-88f68fa536ee@kaod.org>
Date: Wed, 11 Jan 2017 15:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170110225555.117814-3-rlippert@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4674454941698722652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrvdekgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 11 Jan 2017 14:45:07 -0000

On 01/10/2017 11:55 PM, Robert Lippert wrote:
> Implements support for the dual IO read mode on aspeed SMC/FMC
> controllers which uses both MISO and MOSI lines for data during a read
> to double the read bandwidth.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 
