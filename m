Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYYBB5J7jzDqLj
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 11:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQ7V4ZbV"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so5451442ywz.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 16:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=lv5h2ZmACZo9gilpw2F3v4XsReIougkzwUlyNn9nB2w=;
 b=MQ7V4ZbV39QI7TkIxQPpZZFlDc3ktiBj58FdpFBI2aY2gYM2eUGHoGrVsoQINGi6X1
 bikB42gf4TosR7mC35cF4fhiKqEUTqYcHUaONVUSRjHR1UuH1RkqoZjXTSx8CV9si7nk
 nNEgVaBFjbxIb+Bm6fnqEwa24u6cdlvMIew83u8m4KKH0wSXdkHSWelFLV23Nvc0pyQl
 BL51grA9qhkxoo5WIQVt3xjyAx3Xv+2PJ5LiUjFLEcQHlAK7Rg6pZh9i2HcjBfz8s1p+
 A7tdgWTziAhkEj/YQ6AH31T+SAEllp7KeUaqeiQckCoRN1FiZ37bfRFkZfpcwuOKJ4hS
 /koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=lv5h2ZmACZo9gilpw2F3v4XsReIougkzwUlyNn9nB2w=;
 b=qMCpZ9aDK2sKXC0S30BLxPt4ReoyzWGl3yUisDGVqHAsVaSppD/DEncuyoD1nhXHoL
 u2FArZoY5vbX9Fp2qqURzt30S1z60+gXqQhKQkY1cpuJg0gMQMOKvSsKJg/28fd1f5+B
 9KK+KKGyY7nuBTl+Ckm9BzrchOFd8T7HAzvm/lkCu6PYWraQTFMBayEfLhZ865YmMzzB
 LoBn+Z34J9Yvlc5r13ljOT2bSNhAQvwp5wfXWLKJOzIzv7SVNrh6KGFTIhxFdOpwP6/w
 pTZJR9iYQ4YDVBMyFOipdA6+LZKeFULuvJFgWgKr9TRFBtftLKvkO62CNoTz2m7iqack
 3AIQ==
X-Gm-Message-State: AMke39mLjilQPRxu8Y8IdPsHsBTuuoCzwoyp8Cf8S9Tb3UeH805rNO4RHD4nIK6LrTW4rgDbeT9DIJGw2tCE2w==
X-Received: by 10.37.194.5 with SMTP id s5mr3398264ybf.136.1488414624657; Wed,
 01 Mar 2017 16:30:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 1 Mar 2017 16:30:04 -0800 (PST)
In-Reply-To: <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
 <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2017 11:00:04 +1030
X-Google-Sender-Auth: Q0ZzSBUXTzUkiGoEkWdisLnXi6U
Message-ID: <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Mar 2017 00:30:27 -0000

On Thu, Mar 2, 2017 at 10:56 AM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Emily,
>
> Welcome to OpenBMC! I maintain the kernel tree for the project.
>
> When you're sending patches for our fork of Linux I encourage
> developers to put the project and branch they're targeting in the
> patch prefix. This helps me out as we use the list for a few things
> other than Linux:
>
> https://github.com/openbmc/linux/wiki/TipsAndTricks#sending-patches
>
> git format-patch --subject-prefix=3D"PATCH linux dev-4.7"
>
> On Thu, Mar 2, 2017 at 9:13 AM, Emily Shaffer <emilyshaffer@google.com> w=
rote:
>> I2C mux pca9541a@70 for Zaius was incorrectly configured, preventing
>> hotswap@10 LM5066I hotswap controller from being configured at startup.
>> Adding the missing field results in the hotswap controller being present
>> immediately at boot.
>
> I wasn't sure why this would fix things. I had a chat with Xo and he expl=
ained:
>
> 09:28 <@shenki> GHF[m]: but i wasn't sure why adding the reg property
> changed things?
> 09:28 <@shenki> GHF[m]: was it not binding without the reg?
> 09:28 <@shenki> there's no device tree bindings that match what zaius
> is doing, so it's hard to check
> 10:44 < GHF[m]> shenki: correct, no i2c slave device for the hotswap
> controller was instantiated and the lm5066 driver did not bind
> 10:45 < GHF[m]> shenki: actually Emily noted that it did bind if the
> device name were changed to "lm5066" suggesting that the of_*
> compatible property match wasn't working
> 10:46 < GHF[m]> shenki: no idea why the reg property one level up
> affects that =C2=AF_(=E3=83=84)_/=C2=AF
> 10:47 <@shenki> GHF[m]: okay. i will merge it for now
>
> I've applied your patch to dev-4.7 with Xo's review.

I applied it, but then noticed this adds a build warning:

Warning (reg_format): "reg" property in
/ahb/apb/i2c@1e78a000/i2c-bus@300/pca9541a@70/i2c-arb has invalid
length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /ahb/apb/i2c@1e78a000/i2c-bus@300/pca9541a@70/i2c-arb
Warning (avoid_default_addr_size): Relying on default #size-cells
value for /ahb/apb/i2c@1e78a000/i2c-bus@300/pca9541a@70/i2c-arb

Can you please send a v3?

Cheers,

Joel
