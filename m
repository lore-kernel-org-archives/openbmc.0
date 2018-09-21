Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WSGXuhFV"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H7Kg5sRwzF3Qf
 for <openbmc@lists.ozlabs.org>; Sat, 22 Sep 2018 08:18:47 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id m84-v6so13320292lje.10
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3OhHuPECveKDJDZ5tXvJbEZVsYgC8HZFyLc+N7hJWQ=;
 b=WSGXuhFVU1bBTKup0hmvrtHsCX3ryYBoUmao/HI7G9NiM15IJavD/JgyJRMQW3WoUX
 e8204iJOV0kVbRosIPdlBTFGkfwgu0JTB0i+7AZdJo9vlRzTldPufqr+TOZns1fFyTcT
 REzw6KqADxPhPKcYaZMKfBG3I4npP/EHx3j0FALLTNYfxCl2Gp4dwVU/EtCx+e4esPHg
 kdKFP2VBYGI9jtgF+0wf4CqijoQ3z/ZBhXizzl2NEe1OemTQwNMICokd2NE77/nhUWkL
 WEuS2k8Vx5KGqm1aBXELqP8582X9Es16YMzHGCPKk8uSwcP217RPlqMvZV5cWKDA64F5
 BaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3OhHuPECveKDJDZ5tXvJbEZVsYgC8HZFyLc+N7hJWQ=;
 b=NgsIMHB2nGzGrRz9xzD6vvR500eQBmtRMzmHX7vXp8R4k/pVZCiwAT+C3FK7tsAF/T
 WfEdHnMosNhpvjsLGlQpkeKzgaWBhDUIH7/AkxUtlUPVmvVT4pAoSCIq838wCqiV4Q1l
 zkr+kfc8n951jsAFjDFNtvckcjkANH9CdvsOjtAAPFWeADTVPVjSceGKEhf7zoFi1u/N
 YLIdu9srD9mb9G3nvwA6347qSSfdEuhfadsEgSPJAQKXaqZHwp22BeIxo/gNWpkh5qiK
 PnfZfjPsFXO8jOQ2ffs96dNiGb4ccnwM6dXh6P38sm2l+iS9O6fqilNxYFS+Q6PidjdE
 Y/zQ==
X-Gm-Message-State: ABuFfogXn1p9GxasKRi+FYkNzhKt+kU1h8rDype2OW6qaYXWk4+JSMT8
 0nlNZ8P3CNcG8i+Qj6DaLnuOwQQrdNtL0ZYATfBP5Q==
X-Google-Smtp-Source: ANB0VdZnhWxWB0FQpcbZk5Wcrf++hTXIWk1xPNJnpVNcc84p7AtigQESbnjVOz5IP1NLQQJbQXGdldNqlQmz8dUiGMg=
X-Received: by 2002:a2e:92c4:: with SMTP id k4-v6mr4006976ljh.18.1537568323046; 
 Fri, 21 Sep 2018 15:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180920232820.243734-1-brendanhiggins@google.com>
 <07af0253-1efc-2ae1-93fb-ebcc1996d768@linux.intel.com>
In-Reply-To: <07af0253-1efc-2ae1-93fb-ebcc1996d768@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 21 Sep 2018 15:18:31 -0700
Message-ID: <CAFd5g455kDnOQfkZK=U-gs2JrPVXdnA0GViRuWEcHrvjFASOEw@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: fixed invalid clock parameters for very
 large divisors
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Fri, 21 Sep 2018 22:18:49 -0000

On Fri, Sep 21, 2018 at 10:46 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Brendan,
>
> nit:
> Title in imperative mood. I'd put 'fix' instead of 'fixed'.
>
<snip>
>
> One minor issue is, 'base_clk_divisor' instead of 'base_clk' could avoid
> misreading on this code.
>
> With that, it looks nice to me. Thanks!
>
> Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Thanks for the review!
