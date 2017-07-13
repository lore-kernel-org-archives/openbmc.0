Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7Mk60JsnzDqk6
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 14:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sMt4DbXT"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id a12so2453909ywh.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 21:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dSk8Y1k2+XIqxD4bMvFtRdpTBRyt1aLXgIQjJsGHv1I=;
 b=sMt4DbXTod0NW4aK323pSNiyqPTKxJQeybl/10FFCz4mxNaWbjy4CU3PnRpEmHSLX9
 KSTtaTmvzCDrQV0yyQjbJhO4BAVVTAtyAsspsA8BatBpzLJoxmGHhiAy6ZCMUzQTVS05
 lPbbA3lUC6LjO+VDGF0nNwQnBELIchSUiuFkcSCxNNMhrEoCUPZ37zeoqfbNcoGd7gxr
 wVLVuDNHtaLmV1N26Lrx2xU86ANAvKcEdZT+maQDXBJvuyR8yma0GYcM0rlks7xU0G51
 MFglCKv6eA/k2drjs89/4BzEr9Ra8/K5ZSk/Sk2JJP0DWReyUEifmkBnrMXVAmGmAYes
 68hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dSk8Y1k2+XIqxD4bMvFtRdpTBRyt1aLXgIQjJsGHv1I=;
 b=po22eHIfe4IirZvrWthZkmW0xT2RZAULfBnrM1H+EnR+iogohtMbIom2jAWB40IqM9
 zuyWeLWaw26o58uL9FhPzNTqVL/kmd5xoJwVxGL1nWvZkcL1XK8+kQOhxYafDSipBxnZ
 Ud7EdPt5mErn1ehhdQIld3l9omPvfCAl5y+RCGSUtJEDGjHkPIwF9JXm4gzgrJbeEBvD
 b9O3u/5qiV4mVAuo2MLDSaUjoSErH8hGgcUn9Jy9/UmM6Gq1AkfMfZWaCu9miSH8qcit
 cZsAtTFXXfU75vY/sFYGMIw2HioMWiW7WPissYtj7GRt1LPL1TiZebHQCIr1P+d+O1U3
 9wRA==
X-Gm-Message-State: AIVw1131Tq6uMkBArh9CiGG+Thhwd2eBybtFWYRiFEHu4qzrwqFfL+sG
 13qiKp1p15jLIzzKyHza5y5gjKINrA==
X-Received: by 10.13.233.70 with SMTP id s67mr520125ywe.93.1499918891899; Wed,
 12 Jul 2017 21:08:11 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Wed, 12 Jul 2017 21:07:51 -0700 (PDT)
In-Reply-To: <CALLMt=qTEZn5zNYRVad8+pBGuns4ekCxHgvct8zkwy888mw70w@mail.gmail.com>
References: <20170707072544.25003-1-andrew@aj.id.au>
 <CALLMt=qTEZn5zNYRVad8+pBGuns4ekCxHgvct8zkwy888mw70w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jul 2017 13:37:51 +0930
X-Google-Sender-Auth: NaG2rQiskjvcCyVMq6y0vurenQ4
Message-ID: <CACPK8Xd3ADMj9ioYrFNguxPBZNTPjgNvxPCdu-ep5Sy=cHhnSw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: witherspoon: Add reset
 tolerance for host power GPIOs
To: Andrew Geissler <geissonator@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 13 Jul 2017 04:08:15 -0000

On Thu, Jul 13, 2017 at 11:18 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Fri, Jul 7, 2017 at 2:25 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Enables the host to stay up across BMC reboots. This is a temporary
>> approach. Ultimately bindings support and reset tolerance capability
>> will be added to the GPIO driver, and the behaviour will be described
>> in the devicetree.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Our test team took for a spin last night on a witherspoon, looked good.
>
> Acked-by: Andrew Geissler <geissonator@gmail.com>
> Tested-by: Andrew Geissler <geissonator@gmail.com>

Thanks for the testing Andrew. Applied to dev-4.10.

Cheers,

Joel
