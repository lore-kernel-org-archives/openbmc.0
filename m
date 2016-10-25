Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3Bp41PCxzDvk1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 23:11:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aCqdQYLX; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id n202so3162739oig.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=OljKHRlnHGnEvRx4sM5P+IzeGA4aHuxzW6DXyDWMubE=;
 b=aCqdQYLX1pgCF0LO7CxlRHuSgh08ciYZMgx7rCaiL4CdE8/+oL1/OIVi2nfwf2kVsS
 qUrzVM+Ooz0wGSFEGoE1K0fPuUAou11FRxWKYsGj1172o+VgOSLCWSbe0bpkdsRQCRw8
 1IA/LcdDC8SgUQ9F5W4PcxNarT4liRhbgJKdMTXoYEdVyf4OzbP/4241d3dfY+phb6SZ
 N5m9dxJIQFSLmtzP7EDFZ0WSQJqRu3vWBdWUejYJ1fB/aDAyWlKtkz+9HcwRYitSHvMR
 R5VbPtrzZAG5Emfk7+xT4j1DCKY9UGvm0vi/VH8zz7pFzcGdhLQYBREpTmaFce7vdUTJ
 EHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=OljKHRlnHGnEvRx4sM5P+IzeGA4aHuxzW6DXyDWMubE=;
 b=ITgNvlmL54s+MYFnq41ddD82Iruit5XUJCTt1Gp0DUAKJfczlRpCHhvm+AwAJeAAFu
 JMjUvC0WUg8EGLOfeJCg+kWZeo70dytGZ4pwYiOM3p7Ou3JctM3rOu8UtNeYcufzmyQ5
 RcVks1akZtxr2YPSNMYux/uMsoTt25vmx79O3s1ZJoMZWVvdYOVMSuy04tv9Cxzw4kQR
 5DUJue1OMyHn5AMJlZYDlonHgG7tW3mFvI1DGcQPTsKUpTSon+Xb1/vCMDgFZa7xAaGJ
 JKMcwdL8PbljA6jPlKwDGhcJCXYe0AigOx9nuDjFZB6HLrFMHAbVjqN+3P7bCV8i3sWK
 86Gg==
X-Gm-Message-State: AA6/9RlZ1KWofVJHUHPLuW/jRPnvYBKRuAQTDMV/WTBO2PgmIG8lom2l7Zf4LlAZ2iDJn6q7bv6iB/X4k3Q6WQ==
X-Received: by 10.202.106.198 with SMTP id f189mr23445386oic.109.1477397482235; 
 Tue, 25 Oct 2016 05:11:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Tue, 25 Oct 2016 05:11:01 -0700 (PDT)
In-Reply-To: <d2ad5ccb-90b0-b5fa-1d70-f0bd6757ee1e@kaod.org>
References: <1477039467-25076-1-git-send-email-clg@kaod.org>
 <d2ad5ccb-90b0-b5fa-1d70-f0bd6757ee1e@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Oct 2016 22:41:01 +1030
X-Google-Sender-Auth: 3qFZVg8rOOTtrHDmZOIVF5zxdQ4
Message-ID: <CACPK8Xc74MxOwNG83W-TFvJcMATAUV=ENmT7At_oZ7MWNxGrig@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] mtd: spi-nor: add SECT_4K to mx25l25635e
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 25 Oct 2016 12:11:24 -0000

On Fri, Oct 21, 2016 at 8:22 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 10/21/2016 10:44 AM, C=C3=A9dric Le Goater wrote:
>> The current setting is to erase blocks (64KB) but the chip supports
>> sector (4KB) erase and it is currently a problem to erase "partitions"
>> which are smaller than the block size (64KB), the GUARD partition for
>> instance.
>
> There are few other macronixs that would need a similar change but
> this has an impact on existing jffs2 filesystems on the flash. I am
> not sure we will be able to merge this change in mainline.

We reverted this one in [1] as it was breaking JFFS2 [2] as you predicted.

[1] https://gerrit.openbmc-project.xyz/#/c/892/
[2] https://github.com/openbmc/openbmc/issues/701

Cheers,

Joel
