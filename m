Return-Path: <ross.burton@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::12a; helo=mail-it1-x12a.google.com;
 envelope-from=ross.burton@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="MXpyyxS8"; 
 dkim-atps=neutral
Received: from mail-it1-x12a.google.com (mail-it1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KVlX4mjdzDqQs
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 21:01:08 +1100 (AEDT)
Received: by mail-it1-x12a.google.com with SMTP id m62so8763657ith.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 02:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SnGzxp1nTLaWm7Cn5ULLf/Izfms0GJdJ05c5jbohfw=;
 b=MXpyyxS86iEyhBPWvuANAN3brmV04YdM/9xaz/YP4NGzBCmRvr+qiB0not7J1Z39xI
 HpJHYMQ+OX0V52CY3TWp9VGQU7/397XQZKxak4seWZ5YCpvI0cMbo9WiHU3GQ1L3Qb5d
 He60/5Hzyg0yMFX9JhEZpU5CMCaZmg8ZPsUGuzUllINx8T17oicAcCXRVqsXSs727JqG
 0CbrQkyV4KnikW3Hrs72iDzRScMde1TEIlwsYBJHsiNJSPMgJsLFOVn8MQEs86iPVh0m
 nHKhGCIEBEUeCPQvIByO0QqvfD4fh/dBUnOm6qCijCvAtveJFPvbvTuhWUch4Fnd5RV6
 mlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SnGzxp1nTLaWm7Cn5ULLf/Izfms0GJdJ05c5jbohfw=;
 b=HLEjAUN/hlDcHiGq2qinmC0pMfMmSBTHUFL/lHpGEa7XuqsR+A8x8L/ZXr+ym7XdbH
 aX1bpNisU5r09kcvcSp7d0Vgn9tFMDpT1SH8oDxPk7dg5wnA034jC2brIzSXCDQ+GqBz
 0atxMxTSm4wIxJH2higRGTEfRD/nwSHLQjzPz30epoLw7lANAnWB2dvfZoRz9IQhj5RK
 +qWMTco9QaR5zhujRNZ/rBVdv9U59RF+NWoUrQTUVpJaioC9qKkNI+F58/c/1XvWYQlR
 z6+AQqIiflZ0WNgsc7Dr9ZJ1dWdGsXv5pexhxsBHaqkRT83Gh3iWzyp02stQ93OOKoxj
 enMw==
X-Gm-Message-State: AA+aEWaUEoa+oPC5GW50b+XYhvB6I81ivERgEMYrCU/JA1MDFp43mrUC
 pKqRBX2SA208gZifbERlP1MAMLOV2etQuIh+BtnUFA==
X-Google-Smtp-Source: AFSGD/VfsHmOkCEHsKtvBA89QhkGaftVxo7qf5rjfHmEhNakORRuxDqz7pyXY2+yEpcb3WRyNFGdZMYy1L7yf2/ja1g=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr5537134itj.62.1545213666613;
 Wed, 19 Dec 2018 02:01:06 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
In-Reply-To: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 10:00:54 +0000
Message-ID: <CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: Bradley Bishop <bradleyb@fuzziesquirrel.com>
Cc: james.feist@linux.intel.com, OpenBMC <openbmc@lists.ozlabs.org>, 
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 19 Dec 2018 10:01:14 -0000

On Wed, 19 Dec 2018 at 01:07, Burton, Ross <ross.burton@intel.com> wrote:

> That however leads to the question of should we just change the
> defaults? Does anything break if we use gcc-ar instead of ar?

Answer: yes.

| x86_64-poky-linux-gcc-ar  rc libgcov.a $objects
| x86_64-poky-linux-gcc-ar: Cannot find plugin 'liblto_plugin.so'
| Makefile:932: recipe for target 'libgcov.a' failed
ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb:do_compile)
failed with exit code '1'

I don't know enough about gcc...

Ross
