Return-Path: <tglx@linutronix.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nRjt1fWKzDqD7
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 01:08:17 +1000 (AEST)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hn2aG-0006iR-Bm; Mon, 15 Jul 2019 17:08:08 +0200
Date: Mon, 15 Jul 2019 17:08:07 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Avi Fishman <avifishman70@gmail.com>
cc: Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clocksource/drivers/npcm: fix GENMASK and timer operation
In-Reply-To: <CAKKbWA4jBMG8v4unqWEpGWgRm9CH+EJvojsOwMWTvnQH15HWdQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907151707200.1722@nanos.tec.linutronix.de>
References: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
 <alpine.DEB.2.21.1907151435080.1722@nanos.tec.linutronix.de>
 <CAKKbWA4jBMG8v4unqWEpGWgRm9CH+EJvojsOwMWTvnQH15HWdQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Mon, 15 Jul 2019 15:08:19 -0000

Avi,

On Mon, 15 Jul 2019, Avi Fishman wrote:
> On Mon, Jul 15, 2019 at 3:37 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >   9bdd7bb3a844 ("clocksource/drivers/npcm: Fix misuse of GENMASK macro")
> 
> The automatic fix changed from
> GENMASK(3, 27) to
> GENMASK(27, 3)
> I reviewd again the code to check how it worked so far and saw that it
> should have been
> GENMASK(28, 27) - this is a different value than 9bdd7bb3a844
> For our fortune this wrong value didn't effect the our final write to
> the register.
> But still this should be fixed.

Fair enough. Please explain it proper in the changelog.

Thanks,

	tglx
