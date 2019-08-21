Return-Path: <nico@fluxnic.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fluxnic.net
 (client-ip=64.147.108.86; helo=pb-sasl-trial2.pobox.com;
 envelope-from=nico@fluxnic.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=pobox.com header.i=@pobox.com header.b="coNCGrqw"; 
 dkim=fail reason="key not found in DNS" (0-bit key;
 secure) header.d=fluxnic.net header.i=@fluxnic.net header.b="Bm6jH5Te"; 
 dkim-atps=neutral
Received: from pb-sasl-trial2.pobox.com (pb-sasl-trial2.pobox.com
 [64.147.108.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DKW90R3wzDqSd;
 Thu, 22 Aug 2019 06:48:16 +1000 (AEST)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 9CC8E19709;
 Wed, 21 Aug 2019 16:48:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=gHPWV6ywNNDw4FaVfFzykWXQZaE=; b=coNCGr
 qwt7i3R4tUyQi0ZhT3/3VIDhWBBLTzAw70AivukbL9ghU9nPl7F0FIRPBuvKPbKw
 c7CalAaCzCWnkkCCcwbqy1o3zKk9TWKjPdhJsnfKwF9VQuO/B09UmksTxgYUz9wu
 bRu8C5k5LKc4Gf9x7hn/+DaQYD2aeK8p0IeXw=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 79D5119708;
 Wed, 21 Aug 2019 16:48:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=tGJUtEAORBsdDqaz81artd/xlpJm4+O0vI06mhjfh+c=;
 b=Bm6jH5TeJ8u7zHDr3U+j7uM4LAxY52cFgZwdS2EFFWXNFK9GQtn5eZUA1GzXW9KWEcBn6hCr6F+jjjS1njBtHu40IijCBy9feUsunydCJOnkBH26hfO8gr4uvy5QgPrfiAWE7p+UCt2+09N9I0cpH0M/jOvLnV1kk5DmQyr29ak=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id DB83015BE3C;
 Wed, 21 Aug 2019 16:48:11 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id E8EF12DA023B;
 Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
Date: Wed, 21 Aug 2019 16:48:10 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Arnd Bergmann <arnd@arndb.de>, 
 geert@linux-m68k.org, hpa@zytor.com, jeyu@kernel.org, 
 joel@joelfernandes.org, kstewart@linuxfoundation.org, 
 linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
 lucas.de.marchi@gmail.com, maco@android.com, maco@google.com, 
 michal.lkml@markovi.net, mingo@redhat.com, oneukum@suse.com, 
 pombredanne@nexb.com, sam@ravnborg.org, sspatil@google.com, 
 stern@rowland.harvard.edu, tglx@linutronix.de, 
 usb-storage@lists.one-eyed-alien.net, x86@kernel.org, 
 yamada.masahiro@socionext.com, Adrian Reber <adrian@lisas.de>, 
 Alexey Gladkov <gladkov.alexey@gmail.com>, 
 Andrew Jeffery <andrew@aj.id.au>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Benjamin Fair <benjaminfair@google.com>, cocci@systeme.lip6.fr, 
 Dan Williams <dan.j.williams@intel.com>, 
 David Howells <dhowells@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Fabio Estevam <festevam@gmail.com>, 
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, 
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Julia Lawall <julia.lawall@lip6.fr>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-hwmon@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nancy Yuen <yuenn@google.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org, 
 patches@opensource.cirrus.com, Patrick Bellasi <patrick.bellasi@arm.com>, 
 Patrick Venture <venture@google.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Richard Guy Briggs <rgb@redhat.com>, Tejun Heo <tj@kernel.org>, 
 Toru Komatsu <k0ma@utam0k.jp>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
In-Reply-To: <20190821133737.GB4890@kroah.com>
Message-ID: <nycvar.YSQ.7.76.1908211642050.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
 <20190821133737.GB4890@kroah.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: FD6832B8-C454-11E9-A575-46F8B7964D18-78420484!pb-smtp1.pobox.com
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:53 +1000
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
X-List-Received-Date: Wed, 21 Aug 2019 20:48:22 -0000

On Wed, 21 Aug 2019, Greg KH wrote:

> On Wed, Aug 21, 2019 at 08:46:47AM -0400, Nicolas Pitre wrote:
> 
> > One solution for drastically reducing the effective export surface is to 
> > have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
> > namespace, but might be worth mentioning nevertheless.
> 
> Oh that's amazing, I never noticed that feature.  That is a nice thing,
> thanks for pointing it out.

For those interested, this feature was demonstrated with numbers here:

https://lwn.net/Articles/746780/


Nicolas
