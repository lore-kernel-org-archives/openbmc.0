Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::243; helo=mail-wr0-x243.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZNONkOPn"; 
 dkim-atps=neutral
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418L5w4KSmzF0Pd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 15:59:47 +1000 (AEST)
Received: by mail-wr0-x243.google.com with SMTP id d2-v6so15376046wrm.10
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rD9gD8ggYmEFoH6fPPvCl5Q9HgQb816tR+30To1EZTE=;
 b=ZNONkOPn4UHRgFYayTmvhYMeZaCg9UXHj7D+ZyVzrNpnGltgsPED3E2xJLzbFmJiW5
 6Mbhz6UbfTFrdVYOdYS9yujJ9/g1ETg9HycSrtgbr6z+vlynmQo5CQgCsdHg5WUnvwfy
 1OusFgEzFT9yLT+SbPLHMEAUKuKhvic+vPIdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rD9gD8ggYmEFoH6fPPvCl5Q9HgQb816tR+30To1EZTE=;
 b=P9XY4imvGn3GVz6K62VB5rVwI7l3B1z2c9TJvHT2mmkC4KLBYt6kmwkc+LDySWdebG
 iSeoC8OxhIcSH56Wy/fwz34DniEecDehNs+qv4TaFuIuCVI/LxI+jMQU/Ow6e5iFRenC
 DTaePCKPW++Zj3yW6mLmk34C8Sban/PU03UsY9BWUvB0WLyCFRQUu+gemlGgkRK8YW3S
 EHdSUXu1W4LV1IJBmAUA1hcFvBvgqrlFBdCHIwWVnR2AT+ZZx/ZywxBS0utYrH0ziCsp
 nwo8s6iaaViJxfVk/HE85A5pUOAcRCL8XaEiyuNp1NVOsPiHZTQ1kXNu4KG/moE7PDvC
 VvjA==
X-Gm-Message-State: APt69E20igK2ocfuM0VYqK/ZU80fWSLmjmbpJ2uTemkuQPGiLSEWxQaQ
 U3QN2JEBkT6LB49POwdizmSApxT3k7U=
X-Google-Smtp-Source: ADUXVKJ1EZH29Fj4nj56W0nL4uj1nIWJPn/ssrzjWo067F7NJrUbX74TEWlbX03W5wktW71pd5sK3g==
X-Received: by 2002:adf:9a31:: with SMTP id
 z46-v6mr8648078wrb.47.1529301583898; 
 Sun, 17 Jun 2018 22:59:43 -0700 (PDT)
Received: from dell ([95.149.160.78])
 by smtp.gmail.com with ESMTPSA id n12-v6sm6484420wmh.30.2018.06.17.22.59.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 22:59:43 -0700 (PDT)
Date: Mon, 18 Jun 2018 06:59:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v5 08/13] drivers/mfd: Add PECI client mfd
 driver
Message-ID: <20180618055941.GC31141@dell>
References: <20180601182227.23938-1-jae.hyun.yoo@linux.intel.com>
 <20180613063038.GJ5278@dell>
 <6663376b-2671-0c7e-93df-558728c92184@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6663376b-2671-0c7e-93df-558728c92184@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 05:59:49 -0000

On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:

> Thanks for the review. Please see my inline answers.
> 
> On 6/12/2018 11:30 PM, Lee Jones wrote:
> > On Fri, 01 Jun 2018, Jae Hyun Yoo wrote:
> > 
> > > This commit adds PECI client mfd driver.
> > > 
> > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: James Feist <james.feist@linux.intel.com>
> > > Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> > > Cc: Joel Stanley <joel@jms.id.au>
> > > Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> > > ---
> > >   drivers/mfd/Kconfig             |  11 ++
> > >   drivers/mfd/Makefile            |   1 +
> > >   drivers/mfd/peci-client.c       | 205 ++++++++++++++++++++++++++++++++
> > >   include/linux/mfd/peci-client.h |  60 ++++++++++
> > >   4 files changed, 277 insertions(+)
> > >   create mode 100644 drivers/mfd/peci-client.c
> > >   create mode 100644 include/linux/mfd/peci-client.h

[...]

> > I thought you defined this device as a simple-mfd?
> > 
> > This leaves me wondering why you have a driver as well?
> 
> Then what is proper setting for it instead of a simple-mfd?

Drivers described as "simple-mfd" have a special function.  If you
don't know what that function is, I suggest that you do not need
it. :)

"simple-mfd" devices do not usually have drivers.

[...]

> > > +/**
> > > + * Architectures other than x86 cannot include the header file so define these
> > > + * at here. These are needed for detecting type of client x86 CPUs behind a PECI
> > > + * connection.
> > > + */
> > > +#define INTEL_FAM6_HASWELL_X   0x3F
> > > +#define INTEL_FAM6_BROADWELL_X 0x4F
> > > +#define INTEL_FAM6_SKYLAKE_X   0x55
> > > +#endif
> > > +
> > > +#define LOWER_NIBBLE_MASK      GENMASK(3, 0)
> > > +#define UPPER_NIBBLE_MASK      GENMASK(7, 4)
> > > +
> > > +#define CPU_ID_MODEL_MASK      GENMASK(7, 4)
> > > +#define CPU_ID_FAMILY_MASK     GENMASK(11, 8)
> > > +#define CPU_ID_EXT_MODEL_MASK  GENMASK(19, 16)
> > > +#define CPU_ID_EXT_FAMILY_MASK GENMASK(27, 20)
> > 
> > In the case of X86 based devices, are these being redefined?
> > 
> 
> No define even in x86 arch build. These masks just for PECI use cases.
> Also, the CPUs in this implementation is not for local CPUs, but for
> remote CPUs which are connected through PECI interface. It also means
> that this code can be running on non-x86 kernel too.

This is starting to sound like a 'remoteproc' driver, no?

> > > +enum cpu_gens {
> > > +	CPU_GEN_HSX = 0, /* Haswell Xeon */
> > > +	CPU_GEN_BRX,     /* Broadwell Xeon */
> > > +	CPU_GEN_SKX,     /* Skylake Xeon */
> > > +};
> > > +
> > > +static struct mfd_cell peci_functions[] = {
> > > +	{
> > > +		.name = "peci-cputemp",
> > > +		.of_compatible = "intel,peci-cputemp",
> > > +	},
> > > +	{
> > > +		.name = "peci-dimmtemp",
> > > +		.of_compatible = "intel,peci-dimmtemp",
> > > +	},
> > > +};
> > 
> > A couple of temp sensors?  This isn't looking very MFD-like.
> > 
> > What makes this an MFD?
> > 
> 
> Currently it has only a couple of temp sensors but it's just one of
> PECI function. Other PECI functions will be added later so it's the
> reason why it should be an MFD. Please see the following PECI sideband
> functions that I introduced in the cover letter of this patch set.
> 
> * Processor and DRAM thermal management
> * Platform Manageability
> * Processor Interface Tuning and Diagnostics
> * Failure Analysis

Are these all devices in their own right?

Will they each have drivers associated with them?

Is there a datasheet for this PECI device?

[...]

> > > +static struct peci_driver peci_client_driver = {
> > 
> > I'm pretty sure this will be NAKED by the platform Maintainer.
> 
> Does it have problems? Can you please give me a hint?

New bus types are usually only added for well defined, heavily used
buses which AFAIK all have their own subsystems.  Why can't you use
one of the existing bus types?  Platform is the most frequently used.

> > > +	.probe    = peci_client_probe,
> > > +	.id_table = peci_client_ids,
> > > +	.driver   = {
> > > +			.name           = "peci-client",
> > > +			.of_match_table =
> > > +				of_match_ptr(peci_client_of_table),
> > > +	},
> > > +};
> > > +module_peci_driver(peci_client_driver);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
