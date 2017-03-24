Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqC1Q4R4mzDqY6
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 16:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="juiOrpGN"; 
 dkim-atps=neutral
Received: by mail-yw0-x229.google.com with SMTP id p77so2825397ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=wyi7PUPRL4G08H9XYDkmx4/rvPoBAEMaXg9coE4mrUY=;
 b=juiOrpGNTVXIgVdidP+RfLL/D2CteR/hy5H/5aWoDWvNDghnAdFYHb3s6TunpKARJz
 92kNDKhZUjPjJuDsZGkymzj1JYLkpGChjxTRc6kbDxAJP6b0A9HomscLkkEzox6kqRxN
 dD/kpmz7GV55H19EqZjDI/ot/47urc/T7oWJ4nCE/kORAF/+xG7IRljoLXTuq8ashINM
 ZWqL8lpNeQ+pmYor8dwz6RjVRJQAj+tMq7hEQR0DBv1RUP79nbHvqNarXmsCoDDLydA7
 pd4ykxQZ7WszTfrSKzw0oM6Mhh5huSUycJIOh0x/5BQmW4TP5n1KQfzIbMOhn3/+Ti9f
 kCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=wyi7PUPRL4G08H9XYDkmx4/rvPoBAEMaXg9coE4mrUY=;
 b=p+GQAEtNMwIaFTOD+wEzl9mENBUFnTvXOAuDcajvuqjt7pWWKiNY05cqz3zXekKKBi
 VleLdQnh6WOfkDy7E6QdtoLgXbZuRBShYV+j7EUzzguL3ZrTCBlzV4ALkZRN/alVp8dL
 gmHU+Nu+QLUxpObrUSYsM05RzFN911hVL2KBR1ANLg8PLMCgVzwPQtQyB0DzLgfVgrcD
 tiMqY02l9+v4APewC1DsKCIf3FH66zvq7DgFnNFv8NieVl9v17XvFUdGUO43TLE6CBfB
 oximmGLZLjaeWthIm7YK6j+GXPn8eHjtb5ld3I04H/50F5+FoT7kBn6z79bipWL7rBb+
 pHoA==
X-Gm-Message-State: AFeK/H0fFydZsaXMj9pukrnGPQjWl2uNbIYhZq+AUuRpceswfa1/rwOxSjNVJh35okx+U8LtwjB6nOuaALTngQ==
X-Received: by 10.129.116.214 with SMTP id p205mr5186920ywc.268.1490334007764; 
 Thu, 23 Mar 2017 22:40:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 22:39:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 16:09:47 +1030
X-Google-Sender-Auth: sxwcevfoYlTfBbCNPhnB4hehEuY
Message-ID: <CACPK8XdVODAk47U1OgQzzW5eoK1Rv2SVyxhbhMYjNACpnvaV6g@mail.gmail.com>
Subject: dev-4.10 kernel tree published to github
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 24 Mar 2017 05:40:11 -0000

Hello developers,

I've pushed a Linux 4.10 based tree to the OpenBMC Github repository.

Based on 4.10 plus the latest stable release (4.10.5). Drivers that
were merged since 4.7:

 - clocksource
 - IRQ controller
 - GPIO
 - Pinmux
 - IPMI BT

The tree also contains backports from 4.11:

 - Device tree updates for LPC, syscon, gpio, framebuffer and pinmux
 - GPIO driver additions supporting all pins in the ast2500
 - Pinctrl driver additions
 - spi-nor MTD driver

Backports from linux-next (commits that will appear in 4.12):

 - LPC host interface controller (HICR)

Drivers that are not upstream, but are included in the tree according
to the new development process rules:

 - aspeed clk
 - LPC mailbox
 - spi-nor DMA support and other enhancements
 - i2c
 - rtc
 - vuart

A summary is provided on the wiki at
https://github.com/openbmc/linux/wiki/PatchState

If you want our out of tree driver included, please submit to the
mailing list patches against the dev-4.10 tree with the "linux
dev-4.7" subject line. I'm hoping to see PWM, ADC, OCC and 7-segment
drivers coming in.

  https://github.com/openbmc/linux/wiki/DevelopmentProcess

If the code is in an upstream maintainer's tree, then send me the Git
SHAs and I will pull it in.

Once we have the latest FSI code in we can start testing integration
with OpenBMC userspace and move systems over to this tree.

Cheers,

Joel
