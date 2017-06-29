Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wynn31JdDzDr4d
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 15:11:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oz3qbrOf"; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id j11so32578045ywa.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 22:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ehPj5OBCycHWHMSPFC0ox2lZulyxG4xmdWpFS+6zIiM=;
 b=oz3qbrOfe6Ft+5tIJM2cqCGBpN/8vscjifDCvU1bU0LSa9HyDA9XN5nAmQbf03RhqZ
 d9/ynNV6foFtjDX63H299ioM30B7cj3PdXNgCVpldjyRk7fxil6+UKOsSqRerwPTSnd8
 JL/mGaYZ2ZQEFOiBrPk7uqyg+uBw4lt4BP/k8vn8/HzyvwuoajudJJKs0dY92aTCgabQ
 sK98NsTjyZ6aWHewB6TdBi6vxCH7IPGcMkAihKLZIQYEQ13qyjMXGjM1ThoEKo5SIrDo
 5Tg/T/U79pk1RQaByzJX2e3xv5HbR7Z3zWVrg5EQkbnpSHoRg+otAEzIz9s3OajHrHmW
 GXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ehPj5OBCycHWHMSPFC0ox2lZulyxG4xmdWpFS+6zIiM=;
 b=DgrpbDsn9ppKWiuj2UZ/8ctzsj1D9eIdTpM4aYdx6NMzD4oQ24GzlD+ggn8IzQfPiP
 1Gmovq9jFE1OgfjDajgDO98V5FZpvb/2B8AJlzUU1RB8rrceYfSQSZGSdZv7Ve3xPZg2
 +AiuP8UkEo9XNsfGLMwp0kWQSODP1P4Ky1/ZFRiisJZCLxN0qAO88n2Oi7CGdaZW3cGy
 qShTlnUMn8Irh56tytVgeJuQ9iWktHvGg6NGoSsOseCkBr7iOzJcy8SyilwuAA99S5ty
 Kf27KRv+SyNtSshDun0jPWdNwlQ+B5zS17i2mGTAreHUSlzbHMEnK2ZzAd8xMdZuCq44
 lseA==
X-Gm-Message-State: AKS2vOwUd5RxpbEArchtAWUiv6LW7rwf/fqeTcU7w6CQd8Wf+q7XxgCb
 9EQtX2k79L92/l3WfTSyu4LdnMuftEBR
X-Received: by 10.13.208.67 with SMTP id s64mr11050746ywd.43.1498713060231;
 Wed, 28 Jun 2017 22:11:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Wed, 28 Jun 2017 22:10:39 -0700 (PDT)
In-Reply-To: <20170628142304.34433-1-venture@google.com>
References: <20170628142304.34433-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Jun 2017 14:40:39 +0930
X-Google-Sender-Auth: hHVo1DaKVBSeBLRIzGrHxXa325c
Message-ID: <CACPK8Xe0WRP-QZnRCwPD7ieKNQkLVv9kC618H9eD2_7buP76PA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pwm
 fans
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 29 Jun 2017 05:11:03 -0000

On Wed, Jun 28, 2017 at 11:53 PM, Patrick Venture <venture@google.com> wrote:

> +
> +       pwm_tacho: pwm-tacho-controller@1e786000 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;

Oops, this should have been #size-cells  = <0>.

This is because the child fan nodes have one cell for the address
<0x??> and nothing else (no size).

I fixed this up for you and applied to dev-4.10.

Cheers,

Joel
