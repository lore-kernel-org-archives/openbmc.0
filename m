Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMx8r0RkvzDsVj
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 00:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIe8WUDS"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id b130so5876578oii.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cDKsZznBvj4Exzx+82ifRPMcJxGsDjTyKauw3DZ48BY=;
 b=lIe8WUDSOyFPW5L+wA2x4TxAb2EK5IJdLqneYtOLZjy2qQPJ/hMppWqjEYNQz6sowH
 t4iX9y1TtCXMbgIDND+Em4kKekt3CV25dUST39f2nG9Nplz1r7gduNmFAtMgGjqbT1Bf
 VLprszjK4VEdUZRKoCDe7rZZu8Q0LXR+B4GjRec66NlSPwk8vTqBlKLXTegcbMPyVc33
 d31QBZn2/vz9WwkSqIVkcmBRm8uGr9x6DJlK1uBBKs9b/Qzro47C83mDRXep891iTWp4
 kyaDLGmHoZaRQTTD9/i0A8pT4BTKS77UIaG/Zzs0uoFCGj/LZWbIHn0+L1VFSw/lrrNW
 dFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cDKsZznBvj4Exzx+82ifRPMcJxGsDjTyKauw3DZ48BY=;
 b=rvVd5B+8GWQAfi3Gi+i/7RFB1nT/PU6WJbZnEySc/SDLQe8nh2rLQWpZQ0UM5wPWl5
 bDCAR6Cj/1eoRT8DVgm5QlmupRE86aFgV/jLICM8mrzRKkpBzzWLr9d507+S88HytxUw
 Sh7wFK71bZCNRXucqvl42EvBz85eyqFVcbNimVf+TT/mF7rtZzBueHBCuC28ZgFmPcj8
 bSgHquTpcBCnyI+Dz5/TpwwHXTwGwJbq+i/gFF4zgMQbxRKmI3EQa41Vl3gDfsVKv+W/
 Kj7moWZPaTzvuWaFVhBw+kZ+Nlx4HpPWvNqw1puzEfIL1BR5eV5gNbGkPSpZO3VUfDZ0
 8q7A==
X-Gm-Message-State: AIVw110EsjGXHOma42YjHA54sSKIb64S1a9Q58euXDbnpuFyRFLPWqNc
 slWrPWy5syldJ0vzOjQ+Hyb0xlTTk+XM
X-Received: by 10.202.114.151 with SMTP id p145mr21205362oic.41.1501685785952; 
 Wed, 02 Aug 2017 07:56:25 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.182.29.34 with HTTP; Wed, 2 Aug 2017 07:56:25 -0700 (PDT)
In-Reply-To: <2578d94a-fd1b-9598-251d-59764a870933@baylibre.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
 <2578d94a-fd1b-9598-251d-59764a870933@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Aug 2017 16:56:25 +0200
X-Google-Sender-Auth: geKTYqfnBuJY3Rwcl_MkCXVLbbc
Message-ID: <CAK8P3a20dXeeNkRCgs8BNWOo1zvNpBLqkQNwpj8dS2bOq1cq+A@mail.gmail.com>
Subject: Re: [patch v1 2/2] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>,
 gregkh <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 system-sw-low-level@mellanox.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mec@shout.net, 
 Jiri Pirko <jiri@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 linux-serial@vger.kernel.org, 
 vadimp@maellanox.com, Tobias Klauser <tklauser@distanz.ch>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Wed, 02 Aug 2017 14:56:28 -0000

On Wed, Aug 2, 2017 at 4:30 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 08/02/2017 03:18 PM, Oleksandr Shamray wrote:
>> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.

>> +static u32 aspeed_jtag_read(struct aspeed_jtag *aspeed_jtag, u32 reg)
>> +{
>> +     return readl(aspeed_jtag->reg_base + reg);
>> +}
>> +
>> +static void
>> +aspeed_jtag_write(struct aspeed_jtag *aspeed_jtag, u32 val, u32 reg)
>> +{
>> +     writel(val, aspeed_jtag->reg_base + reg);
>> +}
>
> Maybe readl_relaxed/writel_relaxed would be enough here.

I'd prefer keeping the regular accessors here, unless this is shown
to be a performance bottleneck, and there is a comment to explain
how the relaxed accessors are determined to be safe.

        Arnd
