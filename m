Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYY911z1HzDqLf
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 11:29:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSY3eOt3"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id s15so2624748ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 16:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=HdZlVxEVnusi7U/EDC6BuqVAgp6AKEJoYum2YajrIz0=;
 b=QSY3eOt3fmjA2jNr2QhdvWflQdzqQ9+lphWasKMH3bZGSzZ2c69lrnRKhTnF7Xpioi
 TOa5aez/JoXsCCyrhfOpe5nm6erB4tmrz4ZLR250/VAoMsTUTHtqnVg345sbMsAz8voX
 go9oszcItDi7PpCtATgcktbwjEAdLfkqUQJ1HkCSfusbjxxF6U/mnPzP5cZkrMdIPkOa
 /RWfQPxjdRfMKIbYxFJc/dtnShh/CMGt+emzM85/0l/KZ9QjHDTFSyQHhcAIT2OY+u86
 7WGlv69y/nZ90EZIpwi9YqZ6vRAijd6uJcY/twkaoJroNklUfUlYhU1FG8j8lxDWGf/y
 0TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=HdZlVxEVnusi7U/EDC6BuqVAgp6AKEJoYum2YajrIz0=;
 b=sovM4pOOcC19qjFmYNxZ/wbeAhR3rkJwm3Ba1cS8Zfbve8zJl6PnbZsMqdD40Q+eKf
 rN5ZmpzyFHgB/XButeVlU4xU5vsjxTnZFykeaapaTNNbfnemDZDXiiFw4kc1mzhL4T8i
 AdnIX5yT3KS4ei1/n+KQcn4kMp/kGOLo//afU4cwMsMvfH5Ym7U9WR93FTRmSj7mdnRe
 La5tnWg9i48n5SaH+XWayHh2KKLDQXSI3v/e+oxO2qbY3S/LdTL1o/n9tsCrM0mgupKW
 pDN2qVTStAeZrJFmfD2T5bNY9HIGUeDNmX26oFdarIC0N9KUd0Ojv576aLcg/k01DJv1
 CeHQ==
X-Gm-Message-State: AMke39lEPcJNIVWfb1X7VkP+warIPXJfDUhtPvZRMBwfaFKIGD8i5m+GTRs3tkapc0wvsn5TmbPrWt2ZyrOdJA==
X-Received: by 10.37.16.214 with SMTP id 205mr3613837ybq.17.1488414562240;
 Wed, 01 Mar 2017 16:29:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 1 Mar 2017 16:29:01 -0800 (PST)
In-Reply-To: <20170228180707.6720-1-cbostic@linux.vnet.ibm.com>
References: <20170228180707.6720-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2017 10:59:01 +1030
X-Google-Sender-Auth: sX4jHVgtL19a_ZoEFB2R1roRMHQ
Message-ID: <CACPK8Xetxm6ZnLzek5ERhA_5cZy8R51kLNtrHWNQmrKttqHP+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Change hub sysfs name
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 02 Mar 2017 00:29:25 -0000

On Wed, Mar 1, 2017 at 4:37 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Use the slave's master ID as the ID for the hub master.

I don't know enough about how the driver works to know if this is the
right thing to do. Is it fixing a bug? Why was the old value wrong?

Cheers,

Joel

>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 542544e..b9573c5 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -437,7 +437,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>                                 return -ENOMEM;
>
>                         device_initialize(&hub->dev);
> -                       dev_set_name(&hub->dev, "hub@%02x", hub->master.idx);
> +                       dev_set_name(&hub->dev, "hub@%02x", slave->master->idx);
>                         hub->dev.release = hub_master_release;
>                         rc = device_add(&hub->dev);
>                         if (rc)
> --
> 1.8.2.2
>
