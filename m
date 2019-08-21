Return-Path: <peterz@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D7Pn6R49zDr02;
 Wed, 21 Aug 2019 23:13:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3W7OIKWVX6WxkwIdgHyI0+xyh1dbNAC13qBYkWnh7Cg=; b=tD8p42oCitFiAd2hUZ+Uji3Q1
 UTEhTTlglHM2ajMFxM1/ed7h1OwiAn6VBoxeCJpSpFu6TxU9vl6pO5FOLDo/8pBOscWUF4+erLsKE
 DVD9OKxaoc74XOPq06NOx3kB+TM8L6TWfESV6B5H1lteMlHNTmc3MCUI+2FfmvgNUaDzqWbmfsyPU
 NHXcDSCT88u0KJbPatcwVHSfJyJm2OV7aeB5Z68YOUtMczSrgcW8TMpwCa1uRyvnXMKRjiHnnIdMW
 ERlrM+sksfjGoxMgu5/kM55o7iHgBv4Zy6FJTkno4qJN8Y21+XQlvmG0At3fEOWf++QvOvmrkFKBo
 hbmWgU+DA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0QOy-00077n-17; Wed, 21 Aug 2019 13:11:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 49C5330759B;
 Wed, 21 Aug 2019 15:11:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BF01120F0D378; Wed, 21 Aug 2019 15:11:40 +0200 (CEST)
Date: Wed, 21 Aug 2019 15:11:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Matthias Maennich <maennich@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, arnd@arndb.de,
 geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
 jeyu@kernel.org, joel@joelfernandes.org,
 kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
 maco@android.com, maco@google.com, michal.lkml@markovi.net,
 mingo@redhat.com, oneukum@suse.com, pombredanne@nexb.com,
 sam@ravnborg.org, sspatil@google.com, stern@rowland.harvard.edu,
 tglx@linutronix.de, usb-storage@lists.one-eyed-alien.net,
 x86@kernel.org, yamada.masahiro@socionext.com,
 Adrian Reber <adrian@lisas.de>, Alexey Gladkov <gladkov.alexey@gmail.com>,
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
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nancy Yuen <yuenn@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
 patches@opensource.cirrus.com, Patrick Bellasi <patrick.bellasi@arm.com>,
 Patrick Venture <venture@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Guy Briggs <rgb@redhat.com>, Tejun Heo <tj@kernel.org>,
 Toru Komatsu <k0ma@utam0k.jp>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
Message-ID: <20190821131140.GC2349@hirez.programming.kicks-ass.net>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
X-List-Received-Date: Wed, 21 Aug 2019 13:13:07 -0000

On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
> As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.
> 
> Generally, these symbols fall in one of these categories:
> 1) Symbols actually meant for drivers
> 2) Symbols that are only exported because functionality is split over
>    multiple modules, yet they really shouldn't be used by modules outside
>    of their own subsystem
> 3) Symbols really only meant for in-tree use
> 
> When module developers try to upstream their code, it regularly turns
> out that they are using exported symbols that they really shouldn't be
> using. This problem is even bigger for drivers that are currently
> out-of-tree, which may be using many symbols that they shouldn't be
> using, and that break when those symbols are removed or modified.
> 
> This patch allows subsystem maintainers to partition their exported
> symbols into separate namespaces, and module authors to import such
> namespaces only when needed.
> 
> This allows subsystem maintainers to more easily limit availability of
> these namespaced symbols to other parts of the kernel. It can also be
> used to partition the set of exported symbols for documentation
> purposes; for example, a set of symbols that is really only used for
> debugging could be in a "SUBSYSTEM_DEBUG" namespace.

I'm missing how one can prohibit these random out of tree modules from
doing MODULE_IMPORT_NS().

That is; suppose I stick all the preempt_notifier symbols in a KVM
namespace, how do I enforce no out-of-tree modules ever do
MODULE_IMPORT_NS(KVM) and gain access?

(the above would basically break virtualbox, which I knows uses preempt
notifiers too, but I don't give a rats arse about that)
