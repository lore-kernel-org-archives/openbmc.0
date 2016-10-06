Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqqBg29fgzDrL1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 10:49:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nUs5YSyq; 
 dkim-atps=neutral
Received: by mail-vk0-x231.google.com with SMTP id b186so32470898vkb.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OINx3qUhjt8TqPR2pqu9wGBnV2mFEfr1pdn0T1Za8F8=;
 b=nUs5YSyq7ubJ+QbuceJRWfQ9b0Cwub9Gl18SwWi5gAM2vFqVfn89e5NPgNVWH8PanG
 B5/m+55MiYhG/d6CiUnWI5mABq2v3/zrTjFioq1rtiHu5qRbCpHLxsQhceQf2mLr7IUK
 D7iZsDFb0+agYPVJCChl0OdvDsgL5rTNbmiT5SzfiOYfZhmo/z+cEaZSM7M1TgiXBWvb
 nCq6SaEPFWBLvWgdLQqGummmIRqfSN2z3hnbuQNXibw1BTzibOI2SwkOwqaOoqLpMQZm
 AeeEhxExUgNfgkCMx0gG6J7yGDKL2xLRuDcZEq8oMTw36RfeHmdCObWJZ8r7iw9fZDEp
 +xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OINx3qUhjt8TqPR2pqu9wGBnV2mFEfr1pdn0T1Za8F8=;
 b=I93FdxrESXKQn54vYF6fhLKom/S4409JEZpaoD6a9F0O09xrIVM3dhjcY46w1NrrD9
 xfiHWTZSsFHxxJQ7w+0YJvJLtIeJ/XA9XqxaRk3FSISXsdn/FMov7n8Pj790NAMZYY1d
 oHyPEJhCYAZcwICY1mmK6/VVl5q/a1KUjvaafFC89eC73regLxQK6u6YBrkQPLwOk15G
 s/4sqW5aq+7ESTVnJ0k8TFH5uJx7G+4QlvsbocEh5bnlUEtbpKfrBNH6V0c6RNZd4PfO
 TgmqzHnHAuUUuNEVbAN/Ommsf6n1cuJz893hUv8rGz3LmqPLw6AQApuQ+V3wf6fCmRSH
 00gQ==
X-Gm-Message-State: AA6/9Rk79wfjT4FNxTUmYy728ZzZu1NeXcW81UU7Zu6fVBr0bvnKUYmNrVZI0W7vbVjPtFL5gORLLhq/KaLlOg==
X-Received: by 10.31.168.145 with SMTP id r139mr13116993vke.124.1475797785116; 
 Thu, 06 Oct 2016 16:49:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 6 Oct 2016 16:49:24 -0700 (PDT)
In-Reply-To: <CALLMt=q+QdROYMq5i2+xTBtgyfBn0UW8xStRjZEntnc+CL-ivg@mail.gmail.com>
References: <CALLMt=q+QdROYMq5i2+xTBtgyfBn0UW8xStRjZEntnc+CL-ivg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Oct 2016 10:49:24 +1100
X-Google-Sender-Auth: 1QCUxUWZ9uEpeLd_KhCgAjvIYD0
Message-ID: <CACPK8XdQa5pptYRHop8iRapDG9NsG6kaHB-SuWOkNg=6Y7DGUg@mail.gmail.com>
Subject: Re: Adding firestone, garrison, and witherspoon to the CI job?
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2016 23:49:48 -0000

On Fri, Oct 7, 2016 at 2:33 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> We've had a few recent regressions in building of firestone and
> garrison.  Any time or space concerns with adding these plus
> witherspoon to the gerrit CI job
> (https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/)?

I'd like to see Witherspoon being built :)

I don't think Garrison will produce bootable images, as no one owns
it. Doesn't hurt to keep it building though.

The current disk space situation is:

/dev/xvdb      1008G  567G  390G  60% /scratch

Do you know how much disk space adding one more machine will cost us?

Cheers,

Joel
