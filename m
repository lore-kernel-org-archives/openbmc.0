Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::244; helo=mail-wm0-x244.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XfLrZ6S4"; 
 dkim-atps=neutral
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41MQgK2HMCzDqFG
 for <openbmc@lists.ozlabs.org>; Fri,  6 Jul 2018 17:03:40 +1000 (AEST)
Received: by mail-wm0-x244.google.com with SMTP id 69-v6so13353177wmf.3
 for <openbmc@lists.ozlabs.org>; Fri, 06 Jul 2018 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=5bm8o7brhtSVC/LhoKUd4JeWYd/MlVlmybLqKOAtBzg=;
 b=XfLrZ6S4JcVCoXCKx3OIUgfp/GrTzUZY0vesfPiHpD2O7aWkt3gWDzs5WrBwi6VdV3
 tiFdOrYypUOvmU42p2Bswzq6OpsoM0unWItlleAcA3BwZKpWQWQOPTOwBLQeJ91PCGqv
 BF97L8ia+r1UX8HGfa0w1YSPUIfgmv9w/cQrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5bm8o7brhtSVC/LhoKUd4JeWYd/MlVlmybLqKOAtBzg=;
 b=kh8rCZqVYh5qAkQSs/EWw9/0lXk9JnkFmDraDOUB1gra5tqd8Pt4VjKkWhvG9ny0rO
 cvarOvQHOJdQy+RHL/jygXfF0iCXwcGzwkzHYhbksG25MPQmgLvH1z1lIRX69Qhsn1F5
 vyMd/hIZe5AMOqyAlLsf9eQO8h2LTgL/xOcBIKFaARhqlJnsWgAO6V+dGhKK8y1ms5bE
 wnzFJck/WWyjH0EIRUdZYd2eGQlVYbcgFP5NqYVs14tvb57QUgH17ZZQaGapoEFdBDal
 j1zaWdjaodHWC0cOa0iwMu7Vi+anqqiX4vv99AiuFej0WyfG/ISHp883TMSo8nseDjp3
 gyWg==
X-Gm-Message-State: APt69E1MwVGo5286tf7ak98WwM4+rJueVgtcG0q3phyu/bRTufWhTE/8
 AVOpBH6v7uJeANyzNMRBXbjTQw==
X-Google-Smtp-Source: AAOMgpehIL1zuSRR4mpvp9Euc+5PfFinqw/nVwhXe/PIpv/Zuen7C61QSd573Idph8GXGJ8y5Hx/wg==
X-Received: by 2002:a1c:7d47:: with SMTP id
 y68-v6mr5369152wmc.62.1530860615815; 
 Fri, 06 Jul 2018 00:03:35 -0700 (PDT)
Received: from dell ([2.27.167.87])
 by smtp.gmail.com with ESMTPSA id 185-v6sm15338893wmw.23.2018.07.06.00.03.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Jul 2018 00:03:34 -0700 (PDT)
Date: Fri, 6 Jul 2018 08:03:32 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Peter Rosin <peda@axentia.se>, David Kershner <david.kershner@unisys.com>,
 Sagar Dharia <sdharia@codeaurora.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Fengguang Wu <fengguang.wu@intel.com>,
 Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Julia Cartwright <juliac@eso.teric.us>
Subject: Re: [PATCH linux-next v6 03/13] peci: Add support for PECI bus
 driver core
Message-ID: <20180706070332.GV496@dell>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621194014.20729-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180621194014.20729-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2018 07:03:42 -0000

On Thu, 21 Jun 2018, Jae Hyun Yoo wrote:

> This commit adds driver implementation for PECI bus core into linux
> driver framework.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Julia Cartwright <juliac@eso.teric.us>
> ---
>  drivers/Kconfig                 |    2 +
>  drivers/Makefile                |    1 +
>  drivers/peci/Kconfig            |   12 +
>  drivers/peci/Makefile           |    6 +
>  drivers/peci/peci-core.c        | 1438 +++++++++++++++++++++++++++++++
>  include/linux/peci.h            |  104 +++
>  include/uapi/linux/peci-ioctl.h |  265 ++++++
>  7 files changed, 1828 insertions(+)
>  create mode 100644 drivers/peci/Kconfig
>  create mode 100644 drivers/peci/Makefile
>  create mode 100644 drivers/peci/peci-core.c
>  create mode 100644 include/linux/peci.h
>  create mode 100644 include/uapi/linux/peci-ioctl.h

I'm struggling to see the justification for adding an entirely new
subsystem for what looks like a bespoke, and perhaps more damning,
*proprietary* 1-wire interface.  Especially one which has such
limited use.  Between yourself and the other silicon chip vendors
there must be 100s of these knocking about.  What makes this one
special?  Or even useful?  Will there ever be more than a single
source file in this directory?

Don't get me wrong, I'm all for upstreaming code, but to create a new
subsystem and bus for this kind of device seems very over the top.

Since PECI's main purpose in life is Thermal Management, perhaps the
whole thing should live in drivers/thermal or drivers/hwmon.  I've
also seen you reference this as a kind of BMC too, so maybe
drivers/platform/x86 would also be a nice place for it to reside.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
