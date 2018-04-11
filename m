Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UijEdOll"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Y6a/mC6G"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Lj8j2lSVzF1RL
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 21:52:53 +1000 (AEST)
Received: by mail-qk0-x231.google.com with SMTP id s9so1448668qke.12
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
 b=UijEdOlldCP/ORYIWIAI2X+9gJLwfhSt4ZYn5EdF7hAUSA6A1Cp7CkvQNEoOCkIdiY
 rc3rCqYB2EucWKVi7wS06QciAzET5qVFx/hWO6R8/BZw0w9BZQVO/QwwGrhFBIUZFIVP
 dqMKYHAESrOvJWz3vufQSb4GOnxGcyXBO4/VvBLmRNDz2PNO1LNOZAu8TGpUg/egnIRx
 zJaEIE5hmaW1qgoz8AQgooohDGNV0x3zVuOfvyO7LiCCzZXuy95I7Ih9UV02M+L1yBjY
 2hvnlS6stiuWTorXOJ4yUWjnRwuH/gowb5lQBe6vSvFSrAKPulcbyqH7w2XyrsGln1tX
 BsRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
 b=Y6a/mC6GwMvMvbA82Hgodq6CpVZE7zxHa+xjl1knRuRD7muq1t1baQD+lo097iekHw
 xCdvwnTWTd2g7ou+7rcVc/2SrAk/Scb+48ydRBj+2iX8Lg15O2lDMewkMJdV3xS62NQd
 PZXwEchK1XAzJser6WzLMq0VtI2A5mmuwQf6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
 b=OMBfmYso9X6MyGALVnTRxHWL7iL0FDClLga6q07SEfR3yu8BobvrTMjfmAis24xg84
 lqUUjv/IS6crDc9UT9e+5NL/8KytMWbNatwhoSCGLdqM+GwFAt7ORacVzrprUZ8xz5m7
 1+IcU5Hghz1FJRAP2RuaCxhIBWxCzGacOxUsSzF6mZF5C1rZIZQS/tUKqbvOTtbkS3/2
 KavGyaxIXdz8lxvRFYwPnGhPZtF56dlHwRwmfuHE31UH6fIOzijOsrWmZ2GfWiG/Kbvf
 VPMCLrt6Zb9NpbnR2VpZL+NjOl/o5PUybYkWgCBDBTQkiaj3JmteDS/BBEi/mFZxaPBG
 F0Dw==
X-Gm-Message-State: ALQs6tDfWECHY8kiDCCCdPKtMCXmey9MC/FCcXuLfjXGFfLT9dsH7XwU
 E96+fGq9HzA158ZsbzoASzP9EAwcokGBbyHdDsI=
X-Google-Smtp-Source: AIpwx4+CEbXT5ARkZBDIWS1I9TrjyR5qyCB2d2eNgUsfOJ56oHM/RNIs0DHoLoR5nMFhcdIpdKaZiPCldcc6Dsr0rpg=
X-Received: by 10.55.4.129 with SMTP id 123mr6183010qke.203.1523447570916;
 Wed, 11 Apr 2018 04:52:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Wed, 11 Apr 2018 04:52:30 -0700 (PDT)
In-Reply-To: <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Apr 2018 21:22:30 +0930
X-Google-Sender-Auth: 9w3a5uKeB_4X891o5gliPk2JfvU
Message-ID: <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: peci: Add PECI node
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>, 
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 11 Apr 2018 11:52:53 -0000

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
> aspeed-g4 and aspeed-g5.
>

The patches to the device trees get merged by the ASPEED maintainer
(me). Once you have the bindings reviewed you can send the patches to
me and the linux-aspeed list (I've got a pending patch to maintainers
that will ensure get_maintainers.pl does the right thing as far as
email addresses go).

I'd suggest dropping it from your series and re-sending once the
bindings and driver are reviewed.

Cheers,

Joel
