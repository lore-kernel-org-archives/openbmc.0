Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Xka2F/KR"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VZwF6KKLzDqFB
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 15:40:13 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id e5so35713277qtr.12
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 20:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlUUg3uk558Pm+dyybrSZ7IbeTH8LUqHc86zEt5Uw6c=;
 b=Xka2F/KRf7+nvlVXeXd7KpmCcbSfAeMV66DFMh8o53wv/lFiiNJMvu5LAajLMsvLKo
 d5GTBWr7gzN5lu/vxB8optIQTSEdSnt0DffYHvO4i1UXZEzj3M3Iac2sDA7RmFaZFhZH
 YNW4Nhk3rn9YGqxOS2OXrxmN6QCeeaKL27Jio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlUUg3uk558Pm+dyybrSZ7IbeTH8LUqHc86zEt5Uw6c=;
 b=Oi4VS+4jmJBQ2L2ftuEKamj8VIL3fM3rZ+SIoqyqjSLKKzOgrHV6hAA41m39Vhsyph
 MvC6f+9v1M5SdqkM65ehYoEhhcS6N5jqp6jUPJ1UcAmHOg3rvrOztq09KLPvxvEkC5ZV
 dLxyWLkVpTo3To9fSCs1lrlzdosmL5YG6rgUHzC2RqhuOgJkUDJbrJ3j6yaZWcRpxyzu
 ynOe6XEm9Tfrx7VpUDjhZXf4gXksXXgoCBkYbMCACgsEdIo6jiP+ljPjJoetGkhdpiLU
 Wu/5LKpROCSdnHxx4rSsHs55CdkptQaNISF384Yy2QYoJZ9Qq12ev97jd8qT3Y4EvNIX
 J/pw==
X-Gm-Message-State: AJcUukd27o9rKlDGyFeKwVu4UKSJlokb/LAsHNRj6IOBE+mhuMmsOGCb
 U9G+vBTaAW75hX7d1K9yWCxp/mY1Xg6KkGnOVD8=
X-Google-Smtp-Source: ALg8bN79FqxWxIxsqQMtxPU+DCuw41IpN02eRhAWsc86DIZO9TDMUM0VRC75Rhei6TicH3OJ1CR7v/sLMhv7p+tzmBQ=
X-Received: by 2002:a0c:c927:: with SMTP id r36mr46396641qvj.51.1546490410975; 
 Wed, 02 Jan 2019 20:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
 <de74fcec-78dd-f7fa-24b5-a3c861539daa@linux.intel.com>
In-Reply-To: <de74fcec-78dd-f7fa-24b5-a3c861539daa@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jan 2019 15:09:59 +1030
Message-ID: <CACPK8XcskPxX_Vb1-Tyg1yuTDmgpSCTNGwFtfba5yVv=8YE7SQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.19 00/12] PECI device driver introduction
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
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
X-List-Received-Date: Thu, 03 Jan 2019 04:40:14 -0000

On Wed, 19 Dec 2018 at 10:38, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel and Andrew,
>
> I'm sending this patch series to try pushing it to OpenBMC linux
> dev-4.19 branch. It is still getting review from upstream through
> http://lkml.iu.edu/hypermail/linux/kernel/1812.2/02368.html but
> some OpenBMC platforms need it at this moment to include dbus-sensors
> repository which uses this PECI kernel driver implementation. Actually,
> I cannot expect when it could be accepted by upstream but we need it
> now for OpenBMC development.

I have been following the upstream discussion. I hope the MFD
maintainer decides to merge it soon; it looks good from my
perspective.

> Can you please consider cherry-picking this patch series into OpenBMC
> linux dev-4.19 meanwhile it gets upstream review? I rebased and tested
> it on dev-4.19.

Sure. I have merged the series into dev-4.19. I will push it out to
github once it's gone thorough my build and boot tests.

Cheers,

Joel
