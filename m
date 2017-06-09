Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wks7713M5zDqLF
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 05:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fz3pgmTA"; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id s3so34277302oia.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R6aQ0PmysZauejkwvRBbJiuZYdZHH0NbY4jTebSChF0=;
 b=fz3pgmTApQ92gaUhg45CF2VeGEF2Xr1uMBqUan0WKMSZ4h5NL25pQ8buHxzBgmJPaC
 +Ch/asFlhXiRDiIeamD+YWZaijRf1SDlvLzHEMA3RPelNNBTp/8yG5pfSvEQ1SbVeNoQ
 EcqWIJPTJ4GSF9vLC9hc0l785q8OqiNB3EFQBuLaaPzJLHggo3ClE3XXm7MZkVdarcsx
 1wGdnjpifbgaewJCC/Q2O3k0rvMQnoW6TJC/uu8UgXBupaNgE+onVO2LtQ7vSgdX+Qpc
 sOfBRjdgi26u516GFAq8Jtts2OgVXL1JyuzFL3YS0I7aMZerXLDlljbgE83q0tJDXcRc
 UhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R6aQ0PmysZauejkwvRBbJiuZYdZHH0NbY4jTebSChF0=;
 b=bXbVps1NVxqi9PVZ/hxcVWAoDKbkjIvVgj8Y1g9FVgdlY9MwTfiSO2JTZE1o9wFj07
 nsiIFojc1E4VYRYBOtOR0WJTAHvqGA4KPdKEZREdr4A1ww6h7457Y/lOWCw4pXq2Zn/Y
 jqHkROe3oI4PMzQYxiZMy+N7+GofrYUL03Jm+UciUeQX8no34Ph1aG5JMKnu+Y436GOi
 6Bo/rU2+h/1lAgVVChrp+YB0CkHOhnyBZyhGGhzTQMXULZ2JmFIMBlu+p+eH84V3wJHy
 0DMFUP8SstYCyETuWPS3xCsoyjwVBKQAKoRAFtsC1MGTj8P4iJZsNBSHQha03Zei9ups
 29HA==
X-Gm-Message-State: AODbwcCLDuXf/6MeD3YZTtgO2MyjdFbRJR1QY38UKgYeOa/kFNyM0CH9
 vmAGNoYwRp1QqF2pqAnzR92e2TleHw==
X-Received: by 10.202.196.67 with SMTP id u64mr18202119oif.40.1497034817192;
 Fri, 09 Jun 2017 12:00:17 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.51.139 with HTTP; Fri, 9 Jun 2017 12:00:16 -0700 (PDT)
In-Reply-To: <CAPLgG=mYiODs6KAjdJV3dZBXrdR=OWsFwdEJ9jT+5-_CC9_pYA@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
 <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
 <CAPLgG=mYiODs6KAjdJV3dZBXrdR=OWsFwdEJ9jT+5-_CC9_pYA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Jun 2017 21:00:16 +0200
X-Google-Sender-Auth: RhpR-k7QTXl-9nyDoXbulyw4IUw
Message-ID: <CAK8P3a0ditvpCzsCA+5uwZ8wVTvbsob0OywNZu_VK1eKD=K4BQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Rick Altherr <raltherr@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <roblip@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
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
X-List-Received-Date: Fri, 09 Jun 2017 19:00:20 -0000

On Tue, Jun 6, 2017 at 6:51 PM, Rick Altherr <raltherr@google.com> wrote:
> I expect Nuvoton to be sending upstream support for their BMC SoCs later
> this year.

Ah, good to hear!

> LPC is slowly being replaced by eSPI so, even though I expect a
> few more companies to introduce BMC SoCs in the next few years, I don't
> expect a huge increase in the number of LPC slave drivers.

Do you know how eSPI slave drivers work? Are they regular SPI slaves
that implement the eSPI bits in software, or is there hardware level
support for eSPI slaves that makes them look like LPC at the high
level?

        Arnd
