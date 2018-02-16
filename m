Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="u34M5zlW"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjjVt0jGGzF1QK
 for <openbmc@lists.ozlabs.org>; Sat, 17 Feb 2018 06:14:12 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id k25so5073128qtj.9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 11:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rcpOQ7h6w06w29LffVs2e6QLq4aB9pY0OJqjOlPk9+4=;
 b=u34M5zlWHg+lV3dVchon5z9+ymxfkYcpRPEXe6bmIOPF/YA4PeX9uXYEAmmZo8Hf3C
 4UzY7AMfpMc4o+DfZAn8WOnd8CRcRj1XXko6KuzMqa+GPNLhSqCgf9ZXzkk6wLCy4MJ1
 Hnrj5rEcW4UDaoWx/hD8JfNAPsXmILpFIfgg9Ml9xAH4eWBGmHJq6z+1gSEW013yzlZC
 +mq+pDYdEFgnpd/CpcPxZUk9hSvut5WgAm3JolOj29Yez1MzD+3u6RWRWlbCimDg/RUb
 aUcI08mpkdz1wfFWRI7onowvQeAaG9Vh4npJZcpwY06OJEBhjhYOyo9Pm/EYvmCMaFfN
 xYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rcpOQ7h6w06w29LffVs2e6QLq4aB9pY0OJqjOlPk9+4=;
 b=Epx0B1+639FE9KzZlqT+JSWhbXz+NYIMgEr0DFs6VSY4bnZuT7eyyXMPkqFXJ2W/jc
 Yb0yIPTHpe1ivh8J35U7joy7VuM203/x9YlECYS2puLYrDWOONeTNdhjTltJ4UjKX8kR
 i+dp4kHQiqDLnxgxOuHH1EiL+GCpoxZo3Dei7BjWg0LWpb13FKKRCqfbwtn09HSU2knz
 gAt7i1TiWq26lRn/PfZ1TeiUKYYVq8dY/1oYLGVKcMqDJhCFt08CMLu6TaQmNeYbC+vp
 M/f61gs+8N7LJQCKwWWqcjaPQUp6frSDp/0tLiA3bLrxFxARgnmVKGt2/CmOsY/Y83JW
 PQMA==
X-Gm-Message-State: APf1xPBraJn+w2maLvfGofZ1Ix2AsQBwi8GjNTI4zFTZkPYyIh0Uwrdo
 ZnDli9sntJfPSP7W8buDilwDPBMmqQkJtv/DNB/0SQ==
X-Google-Smtp-Source: AH8x225T3yZp/qYdgGRptxFbJgg6jfWFbAou4BMlrRizjrfZaApSNkmkcT1N9/0Q3SqbyuX3djuqVg6TuHfA2PslgkI=
X-Received: by 10.200.13.193 with SMTP id t1mr11571765qti.287.1518808450004;
 Fri, 16 Feb 2018 11:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.38.18 with HTTP; Fri, 16 Feb 2018 11:14:00 -0800 (PST)
In-Reply-To: <A86ACBBE-0825-482F-81BE-24B7CAED92CD@gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
 <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
 <A86ACBBE-0825-482F-81BE-24B7CAED92CD@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 16 Feb 2018 11:14:00 -0800
Message-ID: <CAFd5g44KScqzTZyH9Euwnsqjz5oecB2qovohjOmAwVZNtD1X9Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Julien Thierry <julien.thierry@arm.com>, 
 Philippe Ombredanne <pombredanne@nexb.com>,
 devicetree <devicetree@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 19:14:15 -0000

<snip>
>>Arnd, do we have this documented somewhere for new maintainers to
>>follow?
>
> I would add a few things that we had to go through before for Broadcom SoCs:
>
> - send your pull requests to arm@kernel.org and copy Arnd, Olof and Kevin
>
> - you would want to get your PGP key signed by as many people as people as possible which should not be a problem if you are in an area with lots of kernel people like the Bay Area (which reminds me I should do that)
>
> - if you are going to be reasonably active every cycle consider getting a kernel.org account to host your tree (we are still not doing that...)
>
> - for future pull requests, you might want to break them into e.g: DTS, board/Kconfig, drivers, defconfig, maintainers file, and have as little dependencies between each branch to minimize merge conflicts
>
> - build test and run test your changes against at least one other platform, e.g: QEMU to check for multiplatform issues
>
> In case this is of any value, there is a script here that will automatically generate pull requests emails for you based on branches matching what was mentioned above, it will also take care of CC'ing the people involved in the different patches:
>
> https://github.com/ffainelli/misc-scripts/blob/master/gen-pull.pl
>
> It still requires you to create an appropriate tag for the pull requests, though I might semi-automate that in the future, at least spawn an editor and offer some guidance, based on commit messages as to what should be in the pull request email/tag.
>
> HTH
>
> --
> Florian

Thanks Florian, this was extremely helpful!
