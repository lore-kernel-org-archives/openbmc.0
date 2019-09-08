Return-Path: <andi@etezian.org>
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=etezian.org
 (client-ip=87.98.178.58; helo=17.mo3.mail-out.ovh.net;
 envelope-from=andi@etezian.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none)
 header.from=etezian.org
X-Greylist: delayed 2683 seconds by postgrey-1.36 at bilbo;
 Sun, 08 Sep 2019 10:23:58 AEST
Received: from 17.mo3.mail-out.ovh.net (17.mo3.mail-out.ovh.net [87.98.178.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46QsV63jkZzDqbF
 for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2019 10:23:55 +1000 (AEST)
Received: from player728.ha.ovh.net (unknown [10.108.54.67])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2237C224CB5
 for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2019 01:39:05 +0200 (CEST)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
 (Authenticated sender: andi@etezian.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 4B47C979D591;
 Sat,  7 Sep 2019 23:38:10 +0000 (UTC)
From: Andi Shyti <andi@etezian.org>
To: Yuehaibing <yuehaibing@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org,
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 eric@anholt.net, wahrenst@gmx.net, shc_work@mail.ru,
 agross@kernel.org, khilman@baylibre.com, matthias.bgg@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, kgene@kernel.org,
 Andi Shyti <andi@etezian.org>, palmer@sifive.com,
 paul.walmsley@sifive.com, baohua@kernel.org, mripard@kernel.org,
 wens@csie.org, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, yamada.masahiro@socionext.com,
 michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
 linux-spi@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next 25/36] spi: s3c24xx: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20190907233810.GA15768@jack.zhora.eu>
References: <20190904135918.25352-1-yuehaibing@huawei.com>
 <20190904135918.25352-26-yuehaibing@huawei.com>
 <CAJKOXPdq4as1Oe3U+9znkvP0RA=sxUoiWVBCSbzf_wq_um2t=w@mail.gmail.com>
 <3595bac1-e426-b4f9-4e24-01e104fdfe5d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3595bac1-e426-b4f9-4e24-01e104fdfe5d@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 4582412622624637493
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudekvddgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:40:47 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Date: Sun, 08 Sep 2019 00:23:58 -0000
X-Original-Date: Sun, 8 Sep 2019 02:38:10 +0300
X-List-Received-Date: Sun, 08 Sep 2019 00:23:58 -0000

Hi Yuehaibing,

> >> Use devm_platform_ioremap_resource() to simplify the code a bit.
> >> This is detected by coccinelle.
> >>
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> > 
> > This tag does not look real... First of all where is the report?
> 
> It is our internal CI robot, which is unavailable to external temporarily.

Hulk Robot is not a person and not accountable for his report.
If it is your internal CI, please write a sentence stating that
the fix has been made using Huawei internal tools.

Credit must be given to tools as well, but not accounts that will
never answer an e-mail.

Otherwise, the patch would look fine.

Andi
