Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsf6N72RJzDqZX
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:07:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o1cGcCZO"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id i203so8297655ywc.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wZsRurwO1REviPGTmub30tz5Wuhdi5ChQNTrq0JfrBg=;
 b=o1cGcCZOihlKurh00QvOQOdbfOP+BEfzIutloBYMFc8ioZyJSQacHFqHDOBuDStSsY
 MrX7MNoK3xqPUz185CWRMzakTecjcCVyUkBB7WVmF98ZGb1+f7H2j3hb7gE6aReXpAdq
 sEc7VESj+Vul/Ow+JC/9FrIMoHZWPV1zqJzQ5NtV3uhOeJFZfm8vkULy6c/y9XT5ajSz
 R5T2aqALhcKW9ldxzMYxVfkh3Iu4nHMZzOlcn4Tw4bh98nMoDCE3Ysscxrinc+eLRu/V
 vGs5wH2zRu2iMjYEEAZwdQc+yA2jfn5P/3/HgTtx64LBambID4RZGLsC9LECw44/+9WP
 7HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wZsRurwO1REviPGTmub30tz5Wuhdi5ChQNTrq0JfrBg=;
 b=FkcK+LCi7kLQ/9DruWSCI1so5cH8PhoOD2ZuMxujXWY/Yg8LPbL7gRVkdxMXeszKT1
 4GckSafiQF3PyUyHVAOySr1CIKiRm4cBW7E06hn2ScuSk04MbH1lZtSfzHGV8+xFH0bi
 uDi2bF8ugxhJ2azRLSe6ySjWcUv7fEJt06czaobxyJ3qe3qmiaDMGq6iD1Qly3vnrs1D
 /ggGL5lhGxMjrWL6ihpttTM+EM4qNRy4YfnU43FRB9Iiw6wShPabMvsh18SOT1r913eg
 08suugQy/bdjz9GuR96K+H7n6jUWhHtQBP9Y7mT+tT/J6QyJLiP/VEtSepdViOISKVEb
 +2lw==
X-Gm-Message-State: AFeK/H1JW4jK+aso1YMnHzsaKCntu3DQthi867Y021aJzUixucCQtpDK+iBGH7SkSxWqiJ9Bno+LxBWd4lVLtA==
X-Received: by 10.129.116.214 with SMTP id p205mr22101223ywc.268.1490677674663; 
 Mon, 27 Mar 2017 22:07:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Mon, 27 Mar 2017 22:07:34 -0700 (PDT)
In-Reply-To: <6f0fa72d-2070-8677-13c3-371a311021f1@linux.vnet.ibm.com>
References: <1490637256-10584-1-git-send-email-eajames@linux.vnet.ibm.com>
 <6f0fa72d-2070-8677-13c3-371a311021f1@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Mar 2017 15:37:34 +1030
X-Google-Sender-Auth: H-ug83P9hNcYLZN7om8qs18IOuM
Message-ID: <CACPK8Xem5yJmoxpix=zxm9JGtL9CB4yb8Tt6dx9G58fJLgorXg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Remove scom reset
 before every putscom
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:07:57 -0000

On Tue, Mar 28, 2017 at 4:35 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
>
> On 3/27/17 12:54 PM, Eddie James wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Reset was causing PIB I2C master issues.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>

> Looks good to me.
>
> Acked by Christopher Bostic <cbostic@linux.vnet.ibm.com>
>

For patchwork to recognise your review, it needs to be in the form
"Acked-by: ". Otherwise it ignores it.

I fixed it up for you this time.

Applied to dev-4.7.

Cheers,

Joel
