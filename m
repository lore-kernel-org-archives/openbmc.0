Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHxl154F4zDrDB
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 13:08:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AKPzzr9O"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p68so5760891ywg.5
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ovE5dPYfjjbjRn7YJDR4Jwyal/ZrrE0NbT+FbrEcEN8=;
 b=AKPzzr9OuoQ3Q5tUbzRhrHjjLxpigkaxyuvJ+s3EsJHxbku2cIgcG+yb2uPX9be05V
 Xuc38Pk6u7VBeO8D+I7Rmp7Esh3/SgfaTlu5j6XJr4Tis2lugg6MQppaxXGjR8/6o+3z
 MRdPwDK36zSrs0dnbAflTu1NAV01UtB+iL3LS3yLlHwGbjuIr0hOcGMmdkT80279dvgz
 njIh3ypvHcWonU1SCpe/DAb54sEzRW9r2UgsPNyjGM/MFdXW5TbXik+BNJL7GGPRWMsP
 IfFe3tZa6JvZpwyhzSAYq3E5ETSplWpVpj7Mta3a+mGR2tKewGnPTBxoTq8g9dmRtQlF
 Uofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ovE5dPYfjjbjRn7YJDR4Jwyal/ZrrE0NbT+FbrEcEN8=;
 b=smwgJCRug+XLIDzF4vrK6EP/qn7yL9wc8Jsrr//o7XJiUWRpMsaFo6WJVXIUiBbbjC
 xURdLYqwURNd5h1oebv5+pKWp10kl2g0ZaYk+ILBgKy0+2zaoQZa2yulzFbIoJW7U+6z
 xgmF52cuLyU+pFCv4YcSlin8oobdkXGC21duktlpLNRDc4XvWm1tScpi5+jWROdvuYRD
 Q8IN+yl3e1ihHn/VM/jnJBngetTBCErIDp2XvO5HbNIAFB/4V9AnsI6ReE5F8zhYVp0S
 ahIK4M4Skoy8GIA8t76q3fVUjx/xJv4Q4eIma9AP3aEkdkKV1taP37KF//ArIIeHsGak
 Lj4A==
X-Gm-Message-State: AIVw112qPGrd7OPZfUi/hYIZhjuaeJvCa3RdxxFlq7bQJmx+cTrYPVTI
 QNsRv+Wubz9sL4A9uQjIBfHzgzGefA==
X-Received: by 10.129.172.75 with SMTP id z11mr2698876ywj.369.1501124923309;
 Wed, 26 Jul 2017 20:08:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 26 Jul 2017 20:08:22 -0700 (PDT)
In-Reply-To: <20170726215109.23044-1-cbostic@linux.vnet.ibm.com>
References: <20170726215109.23044-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jul 2017 12:38:22 +0930
X-Google-Sender-Auth: qezTa4pUOLFTeR17xjjhPC2Caas
Message-ID: <CACPK8XcyoH5eU305aKLz1y=+zHNT_hE9nWocHH3bmL7OvTV7Fw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5] ARM: dts: aspeed: Add gpio-keys-polled
 for fan presence
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 27 Jul 2017 03:08:46 -0000

On Thu, Jul 27, 2017 at 7:21 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Define gpio-keys-polled.  Add pca-955x chip IO as GPIO source.
> Polling period of 1 second determined to be the max acceptable
> value based on discussions with Brad Bishop and Matt Spinler.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
>      gpio cells property and wrong format for poll-interval.
> v4 - Add details regarding polling period to commit message.
> v3 - Remove 'autorepeat'
>    - Increase polling period to 1 second.
>    - Remove GPIO specifiers from pca955x in dev tree
> v2 - Change 'linux,code' from a unique global value to a local one
>      for all the gpio-keys-polled devices.

From off-list:

On Thu, Jul 27, 2017 at 11:41 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>> Even after these probe fixes something more is needed.  I tried a bunch
>> of stuff but I could not get the input subsys device created by
>> gpio-keys to work, for these gpios.  I ran strace on my test app here:
>>
>> https://github.com/bradbishop/gpio-keys
>>
>> and it seems like I=E2=80=99m getting ENOENT back on one of the ioctls. =
 Do you
>> have some
>> time to dig into this?
>
> I'll have a look at the ioctl issue.
>
> Thanks,
> Chris

I will hold off on merging this patch until it has been tested.

Cheers,

Joel
