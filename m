Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::241; helo=mail-ot0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zk11ksrj"; 
 dkim-atps=neutral
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGpHB2PytzF0hd
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 23:29:41 +1100 (AEDT)
Received: by mail-ot0-x241.google.com with SMTP id d10so14108339oti.7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2tEVdyUPGN4NnWXR5Ctrpp93KhRpNxk6eN/n5f+/F1w=;
 b=Zk11ksrjDRZ1ZtAuEXGIJhFURUertKbvMH+yU7AlS69XsVx2OwFAYl/987r5K1hpTy
 vyUoi5H80YFXWzjSnzfePF/hvSAcXkWun5WKQwZr4C8/NtL8G1g8qBw28hCdAtImH/jq
 SJV0cWe5Ft6Xp5s61g7M7hJ6d6c+vk6wwed4rVbXvHewll17Tquufoe9O5i6TAFZeSXC
 KZe/LkSMsn3SXtRckny8z1GxTipiOk1VnLOl0ub2bUxJ3gHOrzdOXkstVN2GRWFrShTq
 qmmTq7HlwrJAM3Fr4x1N1iyUvPxYu6U6K8lbStn7l84fPvKLrxjd9SrUg1ZSe4uRd98z
 AI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2tEVdyUPGN4NnWXR5Ctrpp93KhRpNxk6eN/n5f+/F1w=;
 b=BKQCrPSs38vQIWQWLurawrKCaosMdBufDweUKz+xbjBWsig8SdsqV3pPflj2sYD22f
 i6BBrBagXO3KJYefc+hJWmgA406KJNEzM1VdO5Xangl7CW8mRJHXMT+CabqruHU08TG4
 Un1iciw9CplvJByJQc0zMjx5wUQRRTCaKZzDYl7hIupmiq6aWh0BA2QkkKlujI2rriyg
 ROyPPZ3K6mRGdajbLHUbzf1Y1/mlsA85Kva8ePpyzjtzvjPAG45Ng6LZokuYs8l43t3b
 sL+yglOuf8tl82FOe4cDNMiQTyduSlYSvn6HcFGZeX3604L7NI6VeaTbpWejOoBRnu6g
 2VSA==
X-Gm-Message-State: AKwxytdyQBywJLtuq4WlVSO13ssJhsBdCArdRbM7k1mVHUpHv3JZYRyt
 WkzcCCUzRE/GQIMz3OTQdHpMU67mr5QmfwUTCcM=
X-Google-Smtp-Source: ACJfBov7V9f5/vOXTUtozSlAegohcXb/QTYx18O+gFSRWmM0E/ziz4ConUWDkm5fufDzdhej3DK6fxzSTuR5s9EJqns=
X-Received: by 10.157.114.221 with SMTP id d29mr934044otk.104.1515587379605;
 Wed, 10 Jan 2018 04:29:39 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.2.226 with HTTP; Wed, 10 Jan 2018 04:29:39 -0800 (PST)
In-Reply-To: <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Jan 2018 13:29:39 +0100
X-Google-Sender-Auth: 2beAg-IprDuvtWdmqqYU4nzBuyQ
Message-ID: <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 6/6] drivers/hwmon: Add a driver for a
 generic PECI hwmon
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 DTML <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 12:29:43 -0000

On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds driver implementation for a generic PECI hwmon.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

> +static int xfer_peci_msg(int cmd, void *pmsg)
> +{
> +       int rc;
> +
> +       mutex_lock(&peci_hwmon_lock);
> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
> +       mutex_unlock(&peci_hwmon_lock);
> +
> +       return rc;
> +}

I said earlier that peci_ioctl() looked unused, that was obviously
wrong, but what you have here
is not a proper way to abstract a bus.

Maybe this can be done more like an i2c bus: make the peci controller
a bus device
and register all known target/index pairs as devices with the peci bus
type, and have
them probed from DT. The driver can then bind to each of those individually.
Not sure if that is getting to granular at that point, I'd have to
understand better
how it is expected to get used, and what the variances are between
implementations.

       Arnd
