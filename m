Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YM0SOOYj"; 
 dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fK602plxzDqH1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 19:45:43 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id t4so1508523ljc.2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNwBcNV2ZGL3xCgqmgaTn2Ctp9Q3kkymMKMll28u2vw=;
 b=YM0SOOYjeiMX8egNAS1OOmXNV2qsLlixMkX3aWaZhjgkvS1dezmCL+5+5mpRQgoTPy
 wWlmTl1FUQ9kQQuKgtZBFfNfUXVzancs5YH6E7LIdGh14KGg4FRntVMk9c0du9cKQOTc
 Cuixq6JawtMUA7sdBdBM22b60cR11j7mlSo4YmL93zUcD4jmtS82JJY5uBgvg7eZekR5
 yUoF++33W6cOgjumlo1ltUvW3VwC0aSS8rFLlk5zQpIr7xqWP6XRa6usW8NR3y4vGT1i
 wEb42KuWPfOs4ww61lOrFzbQ2Bj3XPLiXhDBvrmYOM1TT5kp3RdzHy9HxfyHx4cVP7Sr
 NxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNwBcNV2ZGL3xCgqmgaTn2Ctp9Q3kkymMKMll28u2vw=;
 b=J/BUV7bDqjFIkZWit0VvIVEKH3xyUEBpVzGag2wR9wGV5aFVJc8cODkPNzFAN3l/pL
 84Z/+IHEKQdaLpwVbc2+YlNX7TWDjtQ7xVVusUw2frDYAefTaOew++PqSOAGk3qruSYB
 Fe69lWbLCD4lMnnigo9umJhn75HN5EkaM7pAAz1K2BLDKvkj5DKX58NB5yV4VeoeQN/G
 dtsF6vBIgN+Gfnm2bSu3eGoXOCCDma1KTBpIy4errzXGuXXxzSz4BGHchr6OLQynFpPH
 cOWyx++CgMzDwfLdTTDx4QbMyIjKTrB/l4v8XLe8/qyDLjupDGWORg186FG8RjTOLIbi
 244w==
X-Gm-Message-State: APjAAAUOoX5Fb5zmuGkV+ByrQY+H4CXb7O1EqeoDbTsjLGTIPvZ/eWYG
 i0BcYWem+LzaiLWSgJzG+BVvSWr4sqMHSlvM3C1dOQ==
X-Google-Smtp-Source: APXvYqwTu9ubL6Ft7dphjRTKlUO6ClFwOdFg1U+zj+HxaLU2gWlH/KEomaV+8fAf+F+bBFKqLfGIgcPAA07ZPbkSfxk=
X-Received: by 2002:a2e:960b:: with SMTP id v11mr9852589ljh.135.1554889535505; 
 Wed, 10 Apr 2019 02:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
In-Reply-To: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Wed, 10 Apr 2019 02:45:24 -0700
Message-ID: <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
Subject: Re: Switching to static network address issues
To: Troy Lee <leetroy@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Apr 2019 09:45:45 -0000

What are the configuration steps you are using to achieve this?

On Wed, Apr 10, 2019 at 2:36 AM Troy Lee <leetroy@gmail.com> wrote:
>
> Hi there,
>
> We met an issue about switching network address from DHCP to static issue.
> If we manually set the new static IP address which is the same as
> DHCP, the network setting will be dropped.
> This issue could be reproduced on qemu with romulus-bmc daily build image.
>
> root@romulus:~# cat /etc/systemd/network/00-bmc-eth0.network
> [Match]
> Name=eth0
> [Network]
> LinkLocalAddressing=yes
> IPv6AcceptRA=false
> DHCP=false
> Gateway=10.1.1.1
> [DHCP]
> ClientIdentifier=mac
> UseDNS=true
> UseNTP=true
> UseHostname=true
> SendHostname=true
>
> Thanks,
> Vertiv Avocent
> Troy Lee
> --
> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
