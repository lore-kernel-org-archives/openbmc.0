Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::243; helo=mail-wr0-x243.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="gToN+Xnr"; 
 dkim-atps=neutral
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LBHw2H5MzF1Ss
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 16:42:36 +1000 (AEST)
Received: by mail-wr0-x243.google.com with SMTP id j33-v6so4105250wrj.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Vi2OjfJiv1jAHD3tY8E0gLT4kWHPWS5ORX4GTpb2K/I=;
 b=gToN+XnrKY3GQgyYpcw3fMZxPmPwG96Vo2qbpFrwPW/CWjhgCHa7jqsgoingqZ+6PV
 Zn9XPzxk+Bpj9HKhrsF/VgPZkKkMT73YD+/lQjqjdsrKVi7q9ES9/4E2sOGyicnnalra
 hCpMIRLuv7f0ITMDgT830zmQSf/hRxyOdZX7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Vi2OjfJiv1jAHD3tY8E0gLT4kWHPWS5ORX4GTpb2K/I=;
 b=IUg5XwmO1pZl15iM6L+Mgi5LduDLQM784gVr/4LgqG0FC0fIh+j+GeAn3+BRPXPvLh
 /R/cz1pCg4U4C7VUCIiqHkYS9zOO9TgRfyT/YTVms0qXzA3hLxdckvKQS2duHh1LUC5w
 /NdV2/lLn5dU+A1RMXZ090ps33A6bFyHN5Ex+v+OoFSTr4pQX/Lzih9yOB6fr5DyjEqp
 LkdNeilFX+tNwM3ip7rFY8n4ymPAKad4ExVTJ9i3Uh4UZByF3+6CGgblfjm0Nv+kWwxe
 sI+ON5UYmdKaPzpJuE5bN5RndDEEMU6dicjX/DwlSm6ns3ZmI7uvUh8XWz07jwPn54s+
 zsZg==
X-Gm-Message-State: APt69E1AYbJxonSmSKTA3lQFZpV/6zZkvw4Hat/dELE2W3JvQGr1HWET
 gSmKue5H794cPvAnhp1r5dWIWQ==
X-Google-Smtp-Source: AAOMgpf7spCpn95dW6v4XGRIUeAffFWdz8Vyg9QMnmmoIind8PumMdE9zBU3AuzNJzPV/VayuQRzhA==
X-Received: by 2002:a5d:4007:: with SMTP id n7-v6mr595948wrp.258.1530686553090; 
 Tue, 03 Jul 2018 23:42:33 -0700 (PDT)
Received: from dell ([2.27.167.87])
 by smtp.gmail.com with ESMTPSA id q140-v6sm4263443wmb.35.2018.07.03.23.42.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 23:42:32 -0700 (PDT)
Date: Wed, 4 Jul 2018 07:42:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v5 08/13] drivers/mfd: Add PECI client mfd
 driver
Message-ID: <20180704064230.GC20176@dell>
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
X-List-Received-Date: Wed, 04 Jul 2018 06:42:36 -0000

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
> 
> > [...]
> > 
> > > > > +static struct peci_driver peci_client_driver = {
> > > > 
> > > > I'm pretty sure this will be NAKED by the platform Maintainer.
> > > 
> > > Does it have problems? Can you please give me a hint?
> > 
> > New bus types are usually only added for well defined, heavily used
> > buses which AFAIK all have their own subsystems.  Why can't you use
> > one of the existing bus types?  Platform is the most frequently used.
> > 
> 
> I implemented this PECI drivers as a simple platform drivers in V1 but
> I had to change it to follow other maintainers' suggestions. I believe
> driver core maintainers are reviewing the PECI subsystem implementation
> code in this patch set as well.

I don't see this discussion.  How is it progressing?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
