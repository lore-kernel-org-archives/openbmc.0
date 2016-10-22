Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t13dD2ZhzzDvbG
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 11:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FuKeFlx8; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e203so1282866itc.1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=etjrjBYMFEFyDp4yuGHSY3FDH61B5+NVGsuFQ3pfwfI=;
 b=FuKeFlx8ZhB/o6hk3N8f1qlPuYh4WRxLiB5dXLDT27fSIb3ilFr3PoXNyKPq9tmSkj
 ZPrBrx2l0cS4esm8VQUGEGGk1aK3UMLRLA7tWgDNbXGlbjiS+/paBB+IqOq+GqxBTScp
 IGoSqfPGn5JQ3fc+PUqFTzMi5wik/MkYnkOP/BpZ+kVDtSghc7Y65uygrEk2k6nYBS3V
 tdfxog2A9prvt5QYCiFx49hqOsPEecu7fQgJtUMGVZzfZaqVPvkRKLCvrJRs7PD85DaP
 B65O0zmAzxk8P8/VRgbhNnYVTXyZ3ochJRcYvHYeNNdBjHGbeX9+AkhLwoK39LpF6I3m
 gdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=etjrjBYMFEFyDp4yuGHSY3FDH61B5+NVGsuFQ3pfwfI=;
 b=feyPZc1MxB2q2XyxyiO5HgZ4sGLWNvIsWzx6dTL9G4YL9Uoj6EhvfM2Bk7mkEgUIWy
 ZRd6Nz0g4rZpWoW/87UFFdR5y+EPdm+W2cEtLxPVuRxtq91ilCPcMui3FhTIKRUQYn6E
 0oKnNP6UvDykw8M6xtnkm2LNfv1J+g/R/VYRm+dyMGDUf9HrotX2IsmGTQb8+dAnuLLA
 bW7Jc+qqwsGAeHm5gPEaOGxFrwXg47H6cM17hZPGG7MZzWV22OOATBl6uq3KEZPo5voK
 EE/9p3c1OtP2WaZTGQmuzZP+EkNrrUyUsf07gwrrpcrun/3OGI/IgokLo2Ti1/FY0NuL
 b9Iw==
X-Gm-Message-State: AA6/9RnZwoX+804q5kFRhY6CMNKXx515oNAOgo/OKslNf/bcAYeHMgZvTQdq3Xlgs7CZAIhIGB+gcVu78cgh0A==
X-Received: by 10.202.106.198 with SMTP id f189mr12644459oic.109.1477096878212; 
 Fri, 21 Oct 2016 17:41:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Fri, 21 Oct 2016 17:40:57 -0700 (PDT)
In-Reply-To: <1477070413-92621-3-git-send-email-xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
 <1477070413-92621-3-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 22 Oct 2016 11:10:57 +1030
X-Google-Sender-Auth: sZXW3l7rSMQDH46wOk8bkPV87vc
Message-ID: <CACPK8XctEBjeYF0NU7QNH=A6qQOkusgnFpgOLOiJQpfOOdCeMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] net: phy: broadcom: Add support for BCM54612E
To: Xo Wang <xow@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net,
 jaedon.shin@gmail.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 22 Oct 2016 00:41:21 -0000

On Sat, Oct 22, 2016 at 3:50 AM, Xo Wang <xow@google.com> wrote:
> This PHY has internal delays enabled after reset. This clears the
> internal delay enables unless the interface specifically requests them.
>
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/net/phy/broadcom.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/brcmphy.h    |  1 +
>  2 files changed, 49 insertions(+)
