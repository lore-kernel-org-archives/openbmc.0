Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22c; helo=mail-lf0-x22c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vOMJajcr"; 
 dkim-atps=neutral
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com
 [IPv6:2a00:1450:4010:c07::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwm793KZszDrW1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 22:49:56 +1000 (AEST)
Received: by mail-lf0-x22c.google.com with SMTP id y187so416061lfc.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=5tnQNZ7mmi68mtkfmcQfA3WeeyX2mEhizqh3ahorQVw=;
 b=vOMJajcrAB8rvK0uQY3zfiXcKQFCafhndWSZjbr6QDP4YEa4fUuTPzL2gNaJ9Yo+aP
 KYL17sejjUr6lZkCcCVIjLuXPNJUf8MxPAIBAejTWrnZrmywxU3H66B8EgtsPV/+kFFs
 IJu7OMenrubZmSDDsQ9IyMVHX1OXK/lPNwi2yMWviOuTvnrtNJQA6CgAvj5xrRKYBOqJ
 Y2t6YIlTkoOynebdKLwhmsc2oRVGokYn4z2evj9xWVda35iguFbQDP4Fev8m76Xv7clC
 +1WqoreDuhjPlUF64Hn+rSiTBCXxrjI61/tfg+gizrsjJnJF71GZPLX4EkMgUCI3txpM
 G0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=5tnQNZ7mmi68mtkfmcQfA3WeeyX2mEhizqh3ahorQVw=;
 b=F3CrIcRsdB924Cy10Um9amQ6J4eZsNjmgL1vzIuuiqHWTXEfjQ248LkmR0X0IKX/g+
 ZgC0ffEvsmMAvwJoSPnGZgy9gJExPDJh3wepYuAQPVweRSNDSkMa79Dbu0Azg8IVes8k
 iS9HFNL+dq4KrmjMo4955pU6v/KOynydNkscj8VE65FvLIBPUb5KPpO+rFMrvfXmzspT
 a9+oBgv2p5llA6pWxlh6lYc45K9J3H8FQtl2mJxPRWo3/sU1GHKqUUicvBuh0wJ0XYY0
 A938ROFSgw98N8gNo+U41zOvFfNmXNqm5kcgwYRRhtQNE2BY8jpHWmNqdna29EiRrnsA
 TxFg==
X-Gm-Message-State: AHPjjUhK7ozm2VtfnLeZn7xn6f8kOy3YDp31ALeberXW53pXxmPHJ0/w
 Sxr6zwJXrXjvSIYPLXHqeQKK0K+dqeFYM4x5fVc=
X-Google-Smtp-Source: AOwi7QBnEAWDydDZA7jZTWwirFOnmKRqVPdaF+aTu6aAscRhx2hV9XGNsYy4WtcWLp7EH7gPRsv0u/DDarOwVPYcUFY=
X-Received: by 10.25.181.5 with SMTP id e5mr3303497lff.42.1505738992636; Mon,
 18 Sep 2017 05:49:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Mon, 18 Sep 2017 05:49:32 -0700 (PDT)
In-Reply-To: <860fa7c3-1d04-6df5-61dd-2a991414197c@kaod.org>
References: <20170915061830.1527-1-joel@jms.id.au>
 <9659eb97-6d10-d204-02a5-9359e2a09b8f@kaod.org>
 <CACPK8Xe3_XNjoLF5CzmY8dDFbg8ivs1Fm4nLXbpNonds85rW+Q@mail.gmail.com>
 <860fa7c3-1d04-6df5-61dd-2a991414197c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2017 22:19:32 +0930
X-Google-Sender-Auth: rJfdYCIFG2ruH0u7nMyXBLg0uHM
Message-ID: <CACPK8XdV21+rY5zoKxhYReBVdm2PHz+ibqMpJ3rm6HVS4AyhGA@mail.gmail.com>
Subject: Re: [PATCH qemu] arm: aspeed: Add palmetto and evb EEPROM I2C devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Sep 2017 12:49:58 -0000

On Mon, Sep 18, 2017 at 5:29 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 09/18/2017 05:26 AM, Joel Stanley wrote:
>> On Fri, Sep 15, 2017 at 4:55 PM, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>> On 09/15/2017 08:18 AM, Joel Stanley wrote:
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>
>>> We could fill the eeprom_buf with some valid data if needed.
>>
>>
>>
>> That's a good idea.
>>
>> When I use this I see the following error:
>>
>> # pwd
>> /sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a100.i2c-bus
>
> hmm, the address is I2C bus 3.
>
>> # hexdump -C i2c-0/0-0050/eeprom
>
> But you use bus 0 ? weird.

The devicetree I was using lacked aliases. I fixed this (so bus 3
shows up at i2c-0), and I get the same results.

Palmetto worked fine for me, so it's just the EVB produces this behaviour.

Cheers,

Joel
