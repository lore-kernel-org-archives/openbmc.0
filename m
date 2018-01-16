Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DoVVy7gu"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLcw70KmbzDqgs
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 04:41:26 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id y80so15297381qkb.4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zy1RhGdMOUlxCJane9GMOun+w/xmtIg9ujWRsI8a0LQ=;
 b=DoVVy7gu6GOq4FCONfqLBNI87+naDjA5GNYFIlvxnVrZ8vtusjjT8mAo3NBEvIiKht
 AnyWRHz/GZ5wfnJ4WnW5oLdVvm5hHgcVbo9BxsGYNN8RnTY9C8Mvkb+UD+CVxO+OaWNX
 s1PVDchyQjAt0/5oo9gC100ujd2/oRkPUg/KLhgAVPNjA3ySQQ/VGO3jexQR8rMYyK9t
 r5Fe0MqybrXZb7dYv/lXITOGbEUkpwif9iQAxWVG9q8e7KW55cJf47w4a+tH0gcFj315
 Ca8ToDHINLbufcaaDk/ALHQmC0DMVu6kjbmlDdSp+VJwCq/gxk/pYZcqGm7wbkCVsVdE
 HVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zy1RhGdMOUlxCJane9GMOun+w/xmtIg9ujWRsI8a0LQ=;
 b=VMwxNNkP1MQ+I3xFsWn+gk+RPbPkl70hpvGPS6csIPSI7/RDAeUoPQo71/VSL97UQZ
 b0IEapuJ4RgB4VdPnfiZwnE50QxVA+gp7hR9Z3ALbStpoZuN8pgUICp+YGhXhKuoOhok
 k3z2BMn+cv/yQkUq2dM4w47OhO3luJIZDnRHXvLBr9fq+IPXVV3/7rofHNEZLgue6Ab1
 m6PHI3KbI9oCHfPhMpMuIGmbRR18v/NxnJoLursCFz/X8RBVkz1oswBKOUnel5Pll15l
 UqxfQDPcMh5PAPJUZTNTdIWTc7mO8PWIe7U0/Wm3RvY+NB7CyI8viMrZM5qWCsi4dE91
 CKhQ==
X-Gm-Message-State: AKwxytd3qljoJ0loNymQuphOqnozCRMkv7kPFbTKFqmxfkNxcvqyJFAB
 pk4v3NzLb5pLl26/UZSv5zvjGMxNEWn1uNehals=
X-Google-Smtp-Source: ACJfBosf6JytBATQV+qL1NUVXnW3871bpUdHxtdWjJLkABEXiRlZ6JviHpIbXXfTbUNhu9wVpt1lW1vUUtoyf0vuCLY=
X-Received: by 10.55.12.4 with SMTP id 4mr35486666qkm.158.1516124484424; Tue,
 16 Jan 2018 09:41:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 09:41:03 -0800 (PST)
In-Reply-To: <1514450286-580-1-git-send-email-mine260309@gmail.com>
References: <1514450286-580-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 11:41:03 -0600
X-Google-Sender-Auth: LgTpn6pFtoxLDOydkWXxnMm0a0Y
Message-ID: <CACPK8XefuKTsr6Z7jzMP0eXEHcJEh40=hvJ7VDBtzG9GNUhv5A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: hog GPIOS7
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 16 Jan 2018 17:41:28 -0000

On Thu, Dec 28, 2017 at 2:38 AM, Lei YU <mine260309@gmail.com> wrote:
> GPIOS7 shall be pulled low for CPLD to continue the power up sequence.
> With this hogged as pull-low, the CPLD workaround can be removed in
> OpenBMC.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Merged into dev-4.10.

Cheers,

Joel
