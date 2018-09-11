Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RX/VHagr"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428xdg11GrzF35x;
 Wed, 12 Sep 2018 06:41:10 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b30-v6so9584396pla.0;
 Tue, 11 Sep 2018 13:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9RzB/BRDpX7q84tdyLiCljnkba6k7dGT74G52O2J7lo=;
 b=RX/VHagrNz4hez4DMpIbo+pAB3SPXUfDVRgLhceP2eUSoj6jJRB+W2d1mn/yLvoJai
 UpTBldh3dNRhkZeFuO4QtXgs/A5a8wSra9WLqwoysoKKAkDLz5sYFXYiecpD/ONq8hCB
 e0TLxE/+xAvevdTWUhvMNTe9kVKDx9rcTuV4VAGbi7MPB2sxKkUSOGtakGrhHBqRIeqO
 UcWVsKC28iI6eBlaoViUfZOmKGyZeTVOLkcF0tmfzISHq68nPJmCg9utcs3TmatP1gmq
 mWNvVDe5yGosGfawnCOFYxGaSCIjdbreLawGRbhQBFI+5h1J7C1m8P8sgjaeNYN30YvX
 9HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9RzB/BRDpX7q84tdyLiCljnkba6k7dGT74G52O2J7lo=;
 b=k1+bkPk0JiQOEolVShOzr2pt6uBY2tfhP+JbBsqE9dIlIGErmSQdekpWmvvR4CwGJd
 I4pPM/ke/V5pNHpyGAW37tCwklBl/v/+YpF6qt0WPQIa1dtVP+jlKf/CZia8rJ4YTrGv
 PDi+yQl+t3Gfwzb26US/GWja6Ag0V3ZODc9rN/PaZK+86MsNoqmlh/lqOt3jj5sAfcOw
 YR5VkfJ2VNhaPHij8lI6pyH+WPDrFqGNAMCjA25oCD5eWwNfjxHN4NNZ90rhzYGG5rry
 fIqgSBtqPlWTdfwBH6OV/kBmn0e4+9bdG7/3mjA62bRORFVkczl91+E54nvHKQJUe3cb
 vcpg==
X-Gm-Message-State: APzg51DIOwioSGnBrxx92Ml5sG5Lm8Vpfz5kxDY7p3s2Dt5qS5CWO//n
 r04gZUcLK9gJEpjHcers3Uk=
X-Google-Smtp-Source: ANB0VdZCKFKSrPX7Awp/SrcXkckLI5qo0g9ymj+hCmEvL5mCRKwkg+FgsBVT6CyP40fkehablCCUqA==
X-Received: by 2002:a17:902:286a:: with SMTP id
 e97-v6mr29141117plb.340.1536698468782; 
 Tue, 11 Sep 2018 13:41:08 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id z8-v6sm24348414pfe.163.2018.09.11.13.41.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 13:41:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Sep 2018 13:41:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined
 irq events properly
Message-ID: <20180911204107.GA26017@roeck-us.net>
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
 <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 11 Sep 2018 20:41:11 -0000

On Tue, Sep 11, 2018 at 01:30:41PM -0700, Jae Hyun Yoo wrote:
> On 9/11/2018 11:37 AM, Guenter Roeck wrote:
> >Hi,
> >
> >On Thu, Aug 23, 2018 at 03:57:31PM -0700, Jae Hyun Yoo wrote:
> >>In most of cases, interrupt bits are set one by one but there are
> >>also a lot of other cases that Aspeed I2C IP sends multiple
> >>interrupt bits with combining master and slave events using a
> >>single interrupt call. It happens much more in multi-master
> >>environment than single-master. For an example, when master is
> >>waiting for a NORMAL_STOP interrupt in its MASTER_STOP state,
> >>SLAVE_MATCH and RX_DONE interrupts could come along with the
> >>NORMAL_STOP in case of an another master immediately sends data
> >>just after acquiring the bus. In this case, the NORMAL_STOP
> >>interrupt should be handled by master_irq and the SLAVE_MATCH and
> >>RX_DONE interrupts should be handled by slave_irq. This commit
> >>modifies irq hadling logic to handle the master/slave combined
> >>events properly.
> >>
> >>Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >
> >This patch causes a boot stall when booting witherspoon-bmc with
> >qemu v3.0, and all i2c device probes fail with error -110 (timeout).
> >Bisect log is attached for reference.
> >
> >With the same kernel configuration (aspeed_g5_defconfig),
> >ast2500-evb and romulus-bmc are still able to boot.
> >palmetto-bmc with aspeed_g4_defconfig also appears to work.
> >
> >Is this a problem with qemu ? Should I drop the qemu test
> >for witherspoon-bmc starting with the next kernel release ?
> >
> >Thanks,
> >Guenter
> >
> 
> Hi Guenter,
> 
> Thanks for your report.
> 
> I checked this patch again but it doesn't have any change that could
> affect to the probing flow. I'll debug the issue on qemu 3.0 environment
> and will share if I find something.
> 
The problem may be that qemu and the new code disagree how interrupts
should be generated and handled, and the new code does not handle the
interrupts it receives from the simulated hardware. This will result
in i2c device probe failure, which in turn can cause all kinds of
problems.

Thanks,
Guenter
