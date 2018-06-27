Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22f; helo=mail-vk0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XiKZgST6"; 
 dkim-atps=neutral
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41G6D13lj1zF164
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 01:25:05 +1000 (AEST)
Received: by mail-vk0-x22f.google.com with SMTP id d74-v6so1409232vke.10
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dggo7TxUoHjedELYW+TUDeaDwkljmb+nbcBt9BfTz38=;
 b=XiKZgST69dtxLD9eOzrXLpflucWzaChGLsih4OhDAs+nTgLLoeTMYvY3mAztifE20I
 ardFZMsQjw5/UAGY/M8EhoCMGBEAQAUaZ5C0toEclnLmUK52H/AUK21ytizhlK1T98/q
 cMKxmijjhcnTQ+J1AWqg4hcZMBliTzOe4v27WQ8kf98q42Y7Iwtv3yoYxOBcGmPFlaDA
 Tz93mtueBcJsisxZ7g0IhqH5fhKbrliKyGj/mu35UYFScAuBc2pGf6p9LcRju5OhCVXF
 Ct9GOUi/WR5HqLNPd4TmD0r+B7ci9u9Ss6Zgb12red9I5DMqoBm7o9J6kJlmvJPj0Xa8
 xUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dggo7TxUoHjedELYW+TUDeaDwkljmb+nbcBt9BfTz38=;
 b=n040poHOG1fQDIGCE33PLWmZ6HVDIEYBZCAXL/G+eZuiob8ZYKfBLHNxsxpnJxiYvj
 g76/lzKkCqgMaf3npy1PdFoYpFAvRRX3LDm1A36+7bNS6PUb6eu+rB/2wDmQgjIqkU6o
 YM2FMejnSnqSIfwCF7dKObXjBHIi6UswT+XyemS4LfdXuOIP2RQXdkTD4g+IAcYKQ6v/
 O7r2HtG69ttVT9mw8pBCNAVU99w29YtCstyClKjORl8UHLcM/yd9YjUtpiJ/e3dbGEiH
 40KMNFemW3D5Igo7laO4Frj30FT0bRCC+A1zLWeMp0NG9Qj7V3hy70ITujU/yVtQhqQx
 3a2A==
X-Gm-Message-State: APt69E0O7UNXL+U453CmiPwcZcRjKC6hWSDaXPEPscObB2GbSK0hcx5H
 xtbdM6q8UKm1LlGE6gZTGDnAXrG5zDRX4z/ZtJgC2Q==
X-Google-Smtp-Source: AAOMgpcIITv6zbbOGMdIc7kB1OayTuJtUyrGRMl6k9YE+ib7jKUCYQRnCl3sa8XBZUNoozB3NuDvgRcCzhp4MalCnRU=
X-Received: by 2002:a1f:3089:: with SMTP id
 w131-v6mr3883568vkw.1.1530113102522; 
 Wed, 27 Jun 2018 08:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 08:24:42
 -0700 (PDT)
In-Reply-To: <OFEE0820A1.272DC24E-ON002582B9.004EC9E2-652582B9.004F578B@notes.na.collabserv.com>
References: <OFEE0820A1.272DC24E-ON002582B9.004EC9E2-652582B9.004F578B@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Jun 2018 08:24:42 -0700
Message-ID: <CAO=notxQYU+F8RiSf=0Ez7Ehpq8RNu84vD3+CDb2RsSGNk6k8g@mail.gmail.com>
Subject: Re: How to mock journal related methods
To: Nagaraju Goruganti <ngorugan@in.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Jun 2018 15:25:06 -0000

On Wed, Jun 27, 2018 at 7:26 AM, Nagaraju Goruganti <ngorugan@in.ibm.com> wrote:
> Hi Team,
>
> I am writing unit test-cases to phospher-logging server.
>
> As it gets information form the journal log for event and logging
> creation,it needs to make calls to
> below given journal related methods:
>
> sd_journal_open(sd_journal**,int)(https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L86)
> sd_journal_get_data(sd_journal*,const char *,const void **,size_t)
> (https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L115)
> sd_journal_close(sd_journal *)
> (https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L175)

From how these are used, there are a couple options.
1) You can try to write a different test implementation and link your
tests against that.  This has some complexity because you'll need to
trap those calls to your fake library methods.  I've seen this done
using a singleton object that is called by a thin function:

int sd_journal_open(sd_journal **ret, int flags)  {
  return GetSingleTon->sd_journal_open(ret, flags);
}

And your GetSingleTon will return the singleton instance, and previous
to this call you've set an expectation on the single mock instance
that it'll receive that call.

2) You can implement an interface.  There's already an sdbus and
message in one interface.  It might make sense to use that and add to
it, or implement one just for the journal calls, s.t. you can have
that be passed into the methods you want to test (or more likely,
passed into the initial object and used by the methods).

>
> I am able make calls to these methods, without any issue, on host
> machine(inside x86 sandbox) where we don't have journal service is running.
>
> Is it the correct way(don't we need to mock these methods) ?
>
> If not, Please someone let me know how to mock these methods?
>
>
>
> Thanks and Regards,
> Nagaraju G
