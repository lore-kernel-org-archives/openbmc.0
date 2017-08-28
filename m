Return-Path: <clg@kaod.org>
X-Greylist: delayed 3601 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Aug 2017 17:53:06 AEST
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net
 [46.105.34.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgkXL6HFkzDq5b
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 17:53:06 +1000 (AEST)
Received: from player778.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id A92846BFAF
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 08:36:38 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 110A6180076;
 Mon, 28 Aug 2017 08:36:35 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 2/2] leds: pca955x: check for I2C errors
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20170827164546.22903-1-clg@kaod.org>
 <20170827164546.22903-3-clg@kaod.org> <1503888051.32695.13.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <59a01762-afb1-381d-dc5e-4f86f9fd4d6a@kaod.org>
Date: Mon, 28 Aug 2017 08:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503888051.32695.13.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13399897743680179155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledruddugdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 28 Aug 2017 07:53:07 -0000

Hello,

> I don't see a corresponding change to pca955x_gpio_set_value(), though given
> it's hooked up as the gpiochip set() callback we would have to reimplement that
> interface. We should do that and return the error code rather than swallow it.
> This flows on to pca955x_gpio_direction_input() and
> pca955x_gpio_direction_output() where we currently just blindly return 0.

yes. Let's do it right. Sending a v2.
 
> I think that's it though, looks good otherwise
Thanks,

C. 
