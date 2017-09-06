Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yqc5SenU"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnbPT0x9MzDqZf
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 06:52:28 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id d10so3796079oih.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 13:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=D/QUZ+aqKHxUztFWJ//HuKp/WM/Feb70kopqnRjeGeA=;
 b=Yqc5SenUrZbq5CXvSze6uCelJAfh4XNoRcoDo3evQbqbWmBBFXAes1begBp8xFF7AY
 0Ji9N3aoMEo5FCmrDsAQGOOmQrdrjKXxNV+QPgrYmJf5JEXuREFOnZWp5vBbXSwRel7a
 UjDo7e+LZfn9h2iu5KFE4f+B7U8rMmB2M0uSMucIlYNun+rKIv1SLB0Lk1tDdSyWZfJT
 RtyJD2qNSDLUHxHRnjWu6IfwqSZZ/DAgDoydZOFhi0Zx44ELAATYehIyyckiPua3amAw
 h6JNi/7E6oEhfLJm2nhut6wjx+1DZ4smxPoXutyck+3ab/pVnQGdIgTt4xZtUz75cBK4
 PH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=D/QUZ+aqKHxUztFWJ//HuKp/WM/Feb70kopqnRjeGeA=;
 b=hOraPCiGgiYkSeCRZOZoJ+BdEPfZN7qMAdGjsetlswy7TbZ/78k+4UNjWgw89M7aTN
 oTsJssm39Bb6BNqIuXU3oBM9pdScoJqNJ27Wq6GgYM37PGz3ueP2FhVqGyz+cfc+aLtQ
 sqmixxLp3ajgbnQMf0GrPGN7HhUPhpFFDjmTO2qO4T1jNSf3/sVoTFUn/HeXYf16BTuV
 iaZWI5vHKWSrxWmgs/B17PsbD04AIFzAUxqHm1e+3a5lH3Oj4/yUZ0DRCU0J9BxeYnh6
 FdKmAEIrXBGeB+WRF4gLvabEmtF84hgm07oN+WdajHinZGDbd30e2DTyYw1bvJ2R8xGT
 1mlg==
X-Gm-Message-State: AHPjjUj13wYaO15DD5ZWQEYj77a9Du9L0DU7qC5W70TAsxHLS+syTr1O
 6swLfbv5NiUur56Twu4dmbJcVbWWgNV3
X-Google-Smtp-Source: ADKCNb5GTz+pdRx55021OYWz4jkvsomPp5RtZWa0gpS1NnNaeCF5r/A1Mv6g4euqA0r/IpnWJf3IejFZiT/4Knawylo=
X-Received: by 10.202.193.65 with SMTP id r62mr519039oif.313.1504731147008;
 Wed, 06 Sep 2017 13:52:27 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.91.35 with HTTP; Wed, 6 Sep 2017 13:52:26 -0700 (PDT)
In-Reply-To: <1504281966-6199-3-git-send-email-oleksandrs@mellanox.com>
References: <1504281966-6199-1-git-send-email-oleksandrs@mellanox.com>
 <1504281966-6199-3-git-send-email-oleksandrs@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Sep 2017 22:52:26 +0200
X-Google-Sender-Auth: 5paTLAYr-MhdgCIcI1DQIdEMlRQ
Message-ID: <CAK8P3a1Ym1UxbFyeUBrSBeHnoQh9NtBn5r6iVEjU_1ki_p3W5A@mail.gmail.com>
Subject: Re: [patch v7 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 Linux API <linux-api@vger.kernel.org>, David Miller <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Sep 2017 20:52:29 -0000

On Fri, Sep 1, 2017 at 6:06 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.
>
> Driver implements the following jtag ops:
> - freq_get;
> - freq_set;
> - status_get;
> - idle;
> - xfer;
>
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>

No further comments about this driver, if there is agreement about the subsystem
in general, it looks good to go in.

Acked-by: Arnd Bergmann <arnd@arndb.de

       Arnd
