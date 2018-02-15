Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XdGo8Xm5"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhgFl0F86zF1KL
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 13:29:14 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id u6so10241801qtg.13
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 18:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7z//wWfQFSXzTvUhuLCy0rA9Mfn27VDaymnrlgeqkmk=;
 b=XdGo8Xm5VqAuBbQ3dBg2x7YzBzeJFHiJw/75BDwT4deEJj+PtWtIWY8f2yhVym/oAM
 DL95MGqFnejOGWjhADhX12wGNTrNIjwHl963wm9FsA4vzPs9vWhtTXm4sqPiKHwxX245
 8VxcXox5zStyz42wRhWMjyeOI3Tohp+S3aPkIs/N8evF5w0BoEvfxDoC1HM4koKXhmPN
 KDzF6e4ZJkRaVdTpfD+sHdaA3rYZE+854I4K+CeAYfpr2kwf5WfzJrJt8a55ZVcMR980
 BR1BfRlKExwzhxm1oVyv9Qa/buvCEkYxrogKS+NT7Ge/FSRlZxYYF715q1Zhwfe5Wzgm
 +8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7z//wWfQFSXzTvUhuLCy0rA9Mfn27VDaymnrlgeqkmk=;
 b=IRZCW92/3ecTvNVuMoE/LCPr4HJsmgbzymSY90ug52wIV9E+XmQ48+6ZDKxHLryX8m
 WPc/+ZqrG1lEF7S80+E7afJlo2zYHrEYmFfBKBiCbKiL7ItdHzpMr9tHZQfcjDsgnhDR
 t6R/x1Qy6UQ4slNDHHImNgZbZxLHXglgaR5XH/XIjB7D0dB+xw1HTsJsrxGqrblDtMlw
 H6wN+Gl3tBZhlRz1IcK/2/U2oNg233eW+BIRpIjetrUzmooL4cdL74Wh/CF3EaSmAaP/
 4kLkdkZdhOcgww5956MVqLZtEC9+og+p514jlQNm6VodPkuFZ47I5vEsgumqd/9+iDQX
 bo9Q==
X-Gm-Message-State: APf1xPBKJ0qGDIIwGeqsmse+B2mq9PlJPm9CyIVKH9pWprm1E2U8O94W
 gKUXBNipZORsFrMk+A8MUBEQO3e8aSGHFFYqemQ=
X-Google-Smtp-Source: AH8x226Pb35zWZPjZBMXH8/n7hAsNpubKzLDLaMBhLDuhCECyNP1pCVROOl3XzE9znBAJGzFx4EaqXsAbu4TZZUsVOs=
X-Received: by 10.200.12.68 with SMTP id l4mr1598623qti.121.1518661751969;
 Wed, 14 Feb 2018 18:29:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 14 Feb 2018 18:28:51 -0800 (PST)
In-Reply-To: <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Feb 2018 12:58:51 +1030
X-Google-Sender-Auth: UyzrrAqUK85-YDE5GHJHKbRT1W4
Message-ID: <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 julien.thierry@arm.com, Philippe Ombredanne <pombredanne@nexb.com>,
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
X-List-Received-Date: Thu, 15 Feb 2018 02:29:16 -0000

On Tue, Feb 13, 2018 at 4:52 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Brendan,
>
> On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>
> This looks well acked, reviewed and tested. How do you plan to have
> the ARM SoC maintainers merge your patches?

Following up on an IRC conversation with Brendan:

The process is normally to create a git branch based on on -rc1, apply
your patches, and send them to the ARM maintainers. You then push a
signed tag to a repository somewhere, send a pull request (a git
request-pull email, not a Github PR) and Arnd, Olof or one of the
other maintainers will pull your tree some time before the next merge
window opens.

Arnd, do we have this documented somewhere for new maintainers to follow?

Cheers,

Joel
