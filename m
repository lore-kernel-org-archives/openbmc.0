Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAEbpOPM"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WnfF2RVyzF3Ss
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 23:47:01 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id r9-v6so6144968pff.11
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hb/s97UjDaC4OsZ9bV876QEA14xkwyhjLLXZcihS/wE=;
 b=HAEbpOPMHakODEHGl5O9YfhC7rufD3+dW+DYb0EC6Isn6XVpXWPCrYZlutm2OnqCIz
 Z94TTL40KaZpq+nbZ7ZLB8NoO+YW3tBMqybF90QsBeqwAkJ0/vwn0PcwiGdUqMQUQLgn
 IiGyEpHIXq+lR0Ys016D6370U+e00y2iRxEOvZ5AJI3T0HZYE2Vs3r9NtXybKGWG3k5P
 yQ+4D/YBaFz+/AANxij3DBnoTkJiDbYxHcZybmqvrZBC0J43TTC9SFuZuf/m49O/IlMR
 3QnKShdLSP6don1sRTfCxnCqFvMj9cfgn0uv7EgRVgQSVMxz6vpjNCet4uFjvB8YmzXx
 evlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hb/s97UjDaC4OsZ9bV876QEA14xkwyhjLLXZcihS/wE=;
 b=BpsioWxeh8vB+xaviCYoKBGJPTZ0snmqJNKcgYFJ3ln0Tx8fV0amfHfMvTVDD4S75o
 o9smGeFXiW+LLrD0PkYE6Mf8Cp/4OTrrCeU4wV9PeCOBdflbzQCKmNyMDiGaPLY8RGar
 LjLZub9FojonYZTRmI4wSSzPiQohSb1JDBVayt1mrd4Ix+6fozXZ88UyuHMzU/Eet2g7
 D1GH52q3O0/lo4Q42J+Sx/oqrZDLTTyDAHMnc/1xtUtLzKC4BcxOhFGLkZUaRmklFXZZ
 +GlnSdu2MeQqLY8vCTfvn6xVV6BWv1RmvQ6dCmXgWtRKRHxwUEnf1B8lyxpbUZ38ra6x
 m3EQ==
X-Gm-Message-State: ABuFfoi0aOWRX+MvYk/P3LTJLU+vhvQnK538A/AB6MiGskRBQT0F+K1U
 uKgTTriDZHm2DVnHXwUwQRo=
X-Google-Smtp-Source: ACcGV62E4q5+qY+XyeZSQeQAVQspifWCvN/E0fxLTxdzLex0Ynokuy1fH0pDZbcm65nO8mpmmNKsdw==
X-Received: by 2002:a63:700e:: with SMTP id
 l14-v6mr5273282pgc.359.1539348419454; 
 Fri, 12 Oct 2018 05:46:59 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id f3-v6sm1445431pgd.41.2018.10.12.05.46.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 05:46:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 Oct 2018 05:46:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 jdelvare@suse.com, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 gregkh@linuxfoundation.org, mark.rutland@arm.com, joel@jms.id.au,
 benh@kernel.crashing.org
Subject: Re: [PATCH v5 05/10] hwmon: Add On-Chip Controller (OCC) hwmon driver
Message-ID: <20181012124658.GB11386@roeck-us.net>
References: <1535664761-86018-6-git-send-email-eajames@linux.vnet.ibm.com>
 <201809011808.kL7L1gpv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201809011808.kL7L1gpv%fengguang.wu@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 12 Oct 2018 12:47:02 -0000

On Sat, Sep 01, 2018 at 08:06:16PM +0800, kbuild test robot wrote:
> Hi Eddie,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on hwmon/hwmon-next]
> [also build test ERROR on v4.19-rc1 next-20180831]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Eddie-James/hwmon-and-fsi-Add-On-Chip-Controller-Driver/20180831-165247
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hwmon/occ/p8_i2c.o: In function `init_module':
> >> p8_i2c.c:(.init.text+0x0): multiple definition of `init_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.init.text+0x0): first defined here
>    drivers/hwmon/occ/p8_i2c.o: In function `cleanup_module':
> >> p8_i2c.c:(.exit.text+0x0): multiple definition of `cleanup_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.exit.text+0x0): first defined here
> 

This will need to be fixed before I can pick up the series.
Each module must have only one set of module initialization
functions.

Guenter

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
