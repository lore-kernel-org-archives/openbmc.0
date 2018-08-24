Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SJnWy/6C"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xq4n4XXyzDqk8
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 04:07:36 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id v66-v6so4626987pgb.10
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ8d75X6efNhuiSR+F9emyRufvOmWvK2+gL20IeWSe4=;
 b=SJnWy/6CI+LfmGRvihxc5V4A2ldgz7QaKmvfjEpUyaKM05dEvUugVR3p1MO9dlB6My
 x6sKdqcWI2M5MgvtFh5u44rgNTLHEO2OsAtsAWNryf4EYiF2kkON5Pltj5sgAOA12ATc
 BSM/gzEnPmpxNe8RtnXONv6lwK0aTgxMHqex/bSW/Fz1A5sjUQamemK0rVDTwrmoQYzu
 5zUuPGeOxiH7hZuoNT+29nPbhJ9JJQcDPs5/xIQqU379l2fabAio0OQD3qe/etPSEuQ9
 5UkFVYMxgNHBieOWdke70/PUQVpqyjAk/h7ckIcoPZdeZCFUjPkt/DevfKjsRi7n4wMX
 KrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ8d75X6efNhuiSR+F9emyRufvOmWvK2+gL20IeWSe4=;
 b=GbDjWABMdlfxdi3MHUQT/OuNEeMrwwaUqvmJybZNmH4evZwNMURJ600NLrkwvXkOuv
 kzmcMoeRuYAvdGbphJyi+MvbAnAQudbRMiQ513omxTUb3BRRZZ7omq8dGuaaLrY5cglx
 aN9PlSMRSim6sew52eFi6qMO9V8u0FcTZSxMBt3jlSpW+ljQPN4YoinsEZ4tSX+uAyom
 R/YfCNXVjVA5mJfdEQYhyes3VvBmfZa+/HoCnc2PHrmByyFXn7nPtebQs+LJ2oBqymNQ
 MF2ROL+H8HG76odq38HyoeDLh6wsJgJzYrP9hpF6Pf/TLMC4tot0+rR4Ll+pBEUvsaTM
 1kyg==
X-Gm-Message-State: APzg51B8F59EIZ3h594EVBT280mzRCwzGODTlp9m8OeMIHAOh4d5CnHD
 FHKqL3RNuRvZiW8+w9IQ/PVEtX8j/GESKqK2UYO5FQ==
X-Google-Smtp-Source: ANB0Vda5adfhtAC09cePRmWRWAyFiO9CxLCn+RxqYhgly7pq74X9tm3+mQH7x8rS2EkCZhM878YQiouDLhw/8TjWy1s=
X-Received: by 2002:a63:5464:: with SMTP id
 e36-v6mr2648669pgm.449.1535134053332; 
 Fri, 24 Aug 2018 11:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 24 Aug 2018 11:07:21 -0700
Message-ID: <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
Subject: Re: Proposal for caching/buffering POST codes list for one boot
 process.
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: kuiying.wang@intel.com, kun.yi.731@gmail.com, 
 "Mihm, James" <james.mihm@intel.com>, hai.v.nguyen@intel.com,
 james.feist@intel.com, 
 chunhui.jia@intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 yong.b.li@intel.com, 
 cheng.c.yang@intel.com, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 qiang.xu@intel.com, geissonator@yahoo.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 24 Aug 2018 18:07:39 -0000

On Fri, Aug 24, 2018 at 9:13 AM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> Would it make more sense to simply include multiple post code paths on dbus?
>
> /xyz/openbmc_project/host/post/current
> /xyz/openbmc_project/host/post/1
> /xyz/openbmc_project/host/post/2
>
> This would allow the interface itself to define an arbitrary number of post code collections, rather than just previous and current.  Initially, previous and current is likely all we need, but in the future, it might be good to store more.

I like this approach, but one would need to enumerate the tree to know
how many there are cached available.  Albeit, maybe that's trivial :D
