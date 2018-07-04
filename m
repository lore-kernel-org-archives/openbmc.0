Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::242; helo=mail-wr0-x242.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SiLKvDD1"; 
 dkim-atps=neutral
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LBGn3KsDzF1QP
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 16:41:35 +1000 (AEST)
Received: by mail-wr0-x242.google.com with SMTP id h10-v6so4103163wrq.8
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=lZxhTijPieI2mcWK2Nczv5x3950biSTVi88z2OK7a30=;
 b=SiLKvDD1tUZq0K0su+Xc9dChPA39zxYakuWm4YU5o1ZRlEastPiDDngc9bQumJUwvj
 fJHil7tPhBt4/vEeTux4OUZiVwvtyW7cgNdEID9z0pgX6iKqB5hjFsRRTnftYKEcAU+x
 RqopwdEYobcidMrcP0Z8XT3mcIZqYRl5v9/iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lZxhTijPieI2mcWK2Nczv5x3950biSTVi88z2OK7a30=;
 b=gugGl2N92ZIXoIU4BW+IdW55GXvA3qAu6l1rUu5KOOwaWw1kKVAKmD5ClqRMo8L1rR
 ROEF9cwOxDEsZVJTHwS7gQdLgzqqknhf3Up2IlpyzCQRmJEwn5M6/oRzVE5R86HNknxO
 8VtPZEqMhmf1JbCvL9oH7AJsLQ0Dzr9f4odEcrZr8DkRXYRC4dWiNVRU7rCmf+u7L768
 8rz2KVvy7rn+lVZDWc8xKWDV30J0oHOKWFUq2Lu0q/WWgNdPNL4yXTXQkvvmKVD53bd5
 euTbwwPnmAhMU9ozSv9V5ONMj8Ui7PFaB/m8hMLVrX1wBhCkOZy1kt2z37cv8ATaH+lk
 tGWw==
X-Gm-Message-State: APt69E0cQVsCctewVkh1S4Dox8Uxn7f7GSKPQ9muyd3OiH8G3hQqW+Zb
 7xIKpK16nh3m1ROLruzUK8Q6j5Gja+g=
X-Google-Smtp-Source: AAOMgpfnSp2xcNQeN6ymVaMGgi8tlunWETvZT5EYYm7GMwdrPX7PLgUsfy9Z857zaw0Otn9l3GDqmg==
X-Received: by 2002:adf:8bd7:: with SMTP id
 w23-v6mr542432wra.208.1530686492567; 
 Tue, 03 Jul 2018 23:41:32 -0700 (PDT)
Received: from dell ([2.27.167.87])
 by smtp.gmail.com with ESMTPSA id r2-v6sm5123925wmb.39.2018.07.03.23.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 23:41:31 -0700 (PDT)
Date: Wed, 4 Jul 2018 07:41:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v5 08/13] drivers/mfd: Add PECI client mfd
 driver
Message-ID: <20180704064130.GB20176@dell>
References: <20180601182227.23938-1-jae.hyun.yoo@linux.intel.com>
 <20180613063038.GJ5278@dell>
 <6663376b-2671-0c7e-93df-558728c92184@linux.intel.com>
 <20180618055941.GC31141@dell>
 <e387da06-1b73-a497-be59-9c25df9bb7f9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e387da06-1b73-a497-be59-9c25df9bb7f9@linux.intel.com>
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
X-List-Received-Date: Wed, 04 Jul 2018 06:41:38 -0000

On Mon, 18 Jun 2018, Jae Hyun Yoo wrote:

> On 6/17/2018 10:59 PM, Lee Jones wrote:
> > On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:
> > 
> > > Thanks for the review. Please see my inline answers.
> > > 
> > > On 6/12/2018 11:30 PM, Lee Jones wrote:
> > > > On Fri, 01 Jun 2018, Jae Hyun Yoo wrote:
> > > > 
> > > > > This commit adds PECI client mfd driver.
> > > > > 
> > > > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > > > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > > > Cc: James Feist <james.feist@linux.intel.com>
> > > > > Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> > > > > Cc: Joel Stanley <joel@jms.id.au>
> > > > > Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> > > > > ---
> > > > >    drivers/mfd/Kconfig             |  11 ++
> > > > >    drivers/mfd/Makefile            |   1 +
> > > > >    drivers/mfd/peci-client.c       | 205 ++++++++++++++++++++++++++++++++
> > > > >    include/linux/mfd/peci-client.h |  60 ++++++++++
> > > > >    4 files changed, 277 insertions(+)
> > > > >    create mode 100644 drivers/mfd/peci-client.c
> > > > >    create mode 100644 include/linux/mfd/peci-client.h

[...]

> > > > > +/**
> > > > > + * Architectures other than x86 cannot include the header file so define these
> > > > > + * at here. These are needed for detecting type of client x86 CPUs behind a PECI
> > > > > + * connection.
> > > > > + */
> > > > > +#define INTEL_FAM6_HASWELL_X   0x3F
> > > > > +#define INTEL_FAM6_BROADWELL_X 0x4F
> > > > > +#define INTEL_FAM6_SKYLAKE_X   0x55
> > > > > +#endif
> > > > > +
> > > > > +#define LOWER_NIBBLE_MASK      GENMASK(3, 0)
> > > > > +#define UPPER_NIBBLE_MASK      GENMASK(7, 4)
> > > > > +
> > > > > +#define CPU_ID_MODEL_MASK      GENMASK(7, 4)
> > > > > +#define CPU_ID_FAMILY_MASK     GENMASK(11, 8)
> > > > > +#define CPU_ID_EXT_MODEL_MASK  GENMASK(19, 16)
> > > > > +#define CPU_ID_EXT_FAMILY_MASK GENMASK(27, 20)
> > > > 
> > > > In the case of X86 based devices, are these being redefined?
> > > > 
> > > 
> > > No define even in x86 arch build. These masks just for PECI use cases.
> > > Also, the CPUs in this implementation is not for local CPUs, but for
> > > remote CPUs which are connected through PECI interface. It also means
> > > that this code can be running on non-x86 kernel too.
> > 
> > This is starting to sound like a 'remoteproc' driver, no?
> 
> This is driver for remote Intel CPUs that are behind in PECI connection.

Sounds like 'remoteproc' to me.

> > > > > +enum cpu_gens {
> > > > > +	CPU_GEN_HSX = 0, /* Haswell Xeon */
> > > > > +	CPU_GEN_BRX,     /* Broadwell Xeon */
> > > > > +	CPU_GEN_SKX,     /* Skylake Xeon */
> > > > > +};
> > > > > +
> > > > > +static struct mfd_cell peci_functions[] = {
> > > > > +	{
> > > > > +		.name = "peci-cputemp",
> > > > > +		.of_compatible = "intel,peci-cputemp",
> > > > > +	},
> > > > > +	{
> > > > > +		.name = "peci-dimmtemp",
> > > > > +		.of_compatible = "intel,peci-dimmtemp",
> > > > > +	},
> > > > > +};
> > > > 
> > > > A couple of temp sensors?  This isn't looking very MFD-like.
> > > > 
> > > > What makes this an MFD?
> > > > 
> > > 
> > > Currently it has only a couple of temp sensors but it's just one of
> > > PECI function. Other PECI functions will be added later so it's the
> > > reason why it should be an MFD. Please see the following PECI sideband
> > > functions that I introduced in the cover letter of this patch set.
> > > 
> > > * Processor and DRAM thermal management
> > > * Platform Manageability
> > > * Processor Interface Tuning and Diagnostics
> > > * Failure Analysis
> > 
> > Are these all devices in their own right?
> > 
> > Will they each have drivers associated with them?
> > 
> > Is there a datasheet for this PECI device?
> > 
> 
> Temperature monitoring driver which I'm trying to upstream should be
> added into hwmon subsystem, but other function drivers should be added
> as a platform driver or as a something else, so it is the reason why I
> made this MFD driver because these function drivers are separated but
> use the same device - the remote CPU - actually. Datasheet is available
> through http://www.intel.com/design/literature.htm with an NDA process.
> Intel is providing the datasheet to HW vendors.

I logged in an searched for "PECI".  These were my results:

  https://i.imgur.com/y86S96I.png

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
