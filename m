Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTLBK1hm5zDq5x
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 15:00:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nl3dJEyY"; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id q127so11445725ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 20:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=s/mHTmtJB/NOLD6SMirdkOxMmB6nQ5zhcrxWExAPDo0=;
 b=nl3dJEyYstweVZqKUvZaPJ3w72CBpg16Bd9pbNk9JR6m01Wqo2H285AvAYFGQYhyN9
 JiAHxNwsXXCxkZCeVGpEnDqFdjIl1m1CvpzYozoEaa98x96JfRXMgNMo9vsD73Rs4Pcu
 1TaXb1T3b4o90YqnGBn4wBe7Ta3ozyGRwHrIHPta681IizP+JH9ZxVGKe4Hp9jgVS+SM
 nNum2ng/lt423zht8eQklHe97WA0vid8N0HEtrm4+HEj4qUQN3JNqVrpyKCDzmCXST1R
 lhPEPu9GPzPd3xI07AWIAN4cGHwdokqkN/8QGAc3u6GZXTVrzXzpsO0NPaNCrC4gVXsX
 Hxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=s/mHTmtJB/NOLD6SMirdkOxMmB6nQ5zhcrxWExAPDo0=;
 b=ujOFZUgzjSfmacPG+zhdBC7AM9K/ZkJEKXmB2/vYii/e8Y11DDFh7epybg07v7+JFs
 c7yF4dFjUMyXkl7xEynt95l0A1AEUWslmuL/LBh4yOSvbw75EwxYvskS06Bb8JU5Mxwk
 IvlMLGLRulkIaAXaEdP2AJcyAyF7vIYrXDW8vPAp0hzpSGOQkPVSgzUboiYplsua7/+C
 YI/sEP6p4n7v540TpBomLvBQssd8D7impalGmAVCMl9QkLSYIfiXOuGeXhFoL2IsBv+u
 ohi435nynLTXZYqnmmxHqvlLPpUT4akdQuUmSW2Z6QMRjMqJAJ2pKRzmHb8Bp5lnTSxu
 ANBg==
X-Gm-Message-State: AMke39lNzP3AzPNc4X/kWYXjBFZ1pnbS+IMU7JxYzJzpqtF4BCMYQdjUmpMCNxl3v5tmPVvhc2BRH1VGP0KjCA==
X-Received: by 10.129.73.65 with SMTP id w62mr25681808ywa.288.1487822454608;
 Wed, 22 Feb 2017 20:00:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 20:00:34 -0800 (PST)
In-Reply-To: <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
References: <20170221051259.18383-1-joel@jms.id.au>
 <20170221051259.18383-2-joel@jms.id.au>
 <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 14:30:34 +1030
X-Google-Sender-Auth: myr-Gdw9ERN6lHcNfRqXjk8yjUA
Message-ID: <CACPK8XfnX3ueMh674qrzdttF-X5r8ZSUe3Gm-8gNGJ2zkGiMAQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on all
 P9 machines
To: Mine <mine260309@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 04:00:57 -0000

On Thu, Feb 23, 2017 at 2:04 PM, Mine <mine260309@gmail.com> wrote:
>> -               flash_memory: region@94000000 {
>> +               flash_memory: region@bc000000 {
>>                         no-map;
>> -                       reg = <0x94000000 0x04000000>; /* 64M */
>> +                       reg = <0xbc000000 0x04000000>; /* 64M */
>
> For Zaius with 512MiB RAM (what I saw in Foxconn), the memory size
> will be adjusted by Uboot,
> which is OK.
> Will this reserved memory be adjusted from 0xbc000000 to 0x9c000000?

You raise an issue I have been thinking about.

u-boot currently adjusts the /memory node to account for the VGA
framebuffer. We could instead have it populate a reserved-memory
region.

A compromise (for cases where the u-boot hasn't been updated, or the
user is testing in Qemu without u-boot) would be to have the node in
the device tree set to a default value and get u-boot to update it to
the same as the strapping.

Cheers,

Joel
