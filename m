Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsCOpsXq"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JIOfdP5B"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hK2g6lsvzF2SL
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 13:48:41 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id m5-v6so927059qti.1
 for <openbmc@lists.ozlabs.org>; Wed, 09 May 2018 20:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Wbs0E6QySDJIRVbC6OqzBtyKIEb/JgiaxAUjiz9l8YI=;
 b=bsCOpsXq86RaaWlFAiUTSpxH6ob79pnLms5dInIjZFgvmOJxUgE355e/eNguf6qvKy
 9hMSY8AqiqLiW+rFM64eytu3sYSm8OO/xEfPaBxvS8QlAsiJCfoe33UZ/GEYvXygnjVj
 IrbcbGx2HvMGsgImoIP7RB7eZ0YporoOkKKme25hKodW6vJbUvSJnbPxqSpft2ukfHo9
 +eCwJz5msKvHgJimNKp3EwS5pRujqZ0D6sQtGGaH3TJE2jDVVfIBNr0TpuyBGqtfa934
 YUWTpA/cOgiO2K7s8lzkvxZRzRD7i5azHd56XC/i+ZHVTzDXfAxOUxGf0OTVgcazy1iS
 CBKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Wbs0E6QySDJIRVbC6OqzBtyKIEb/JgiaxAUjiz9l8YI=;
 b=JIOfdP5Bwk7kXKVMunFyQKeSUQUq3cjJaggLICezydgD6dAae/ozjtEpo1CyNEWK0z
 Gkolw2j3McLoRyUAcfhbZ46qKFt15aGe9tG40DlLI1sQfpIic8LYfeEg5JMrwHVq5ML5
 LMGztEzNhLvjBbPX8NqyjhJ/tpfvTrYPY7+bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Wbs0E6QySDJIRVbC6OqzBtyKIEb/JgiaxAUjiz9l8YI=;
 b=DJLdbJRX5WRE3TSLoTkvHOUZdSW2ENmX6VSk4vcJOHBLPHOnTH6qh07H8YkNbrvoNm
 bHSe4f44LqzHKhWeIfKyz7Eftxg6++Lipg2Xs1zpw1TniTs+cWQRRpwHab6nuSyDoPuB
 8SVrAvDXemUs2ocQd3wQF+UUP9zldV4wIqTpnqPGkTUdVE9HD+Z0bWAm9QwyO9BKEOqc
 hCNjGBYIBUkSqc6jUUqJE/Ckz9GmiU7mWP9lqoCf3pCNffu0To2Kn3mF1N63FkzGZrig
 QKZg5Gy4vor4CormJyjDksYUvzxoIrSvd7Fo3txVQ5pDmQ5tm2ksnNcm2GJt5mgwJfR4
 9eeg==
X-Gm-Message-State: ALQs6tC1VQ78d5mQjOyJB4w41zO+Lk9+XPLFL5e4bnFN+KtHUqGrAsZE
 U45yg4Tx92Cb8JeTon8HmFffCCrFbrSqfBzpdm4=
X-Google-Smtp-Source: AB8JxZpAosTMts/8wN6C8WlEqXtXP065J4Z328rKPEKByBkmqTBKDGKOyl9ZGIIPr2xkrkdZHZyrlrDdPyKTrSTS4LE=
X-Received: by 2002:ac8:1a02:: with SMTP id
 v2-v6mr45546438qtj.342.1525924119273; 
 Wed, 09 May 2018 20:48:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 9 May 2018 20:48:18 -0700 (PDT)
In-Reply-To: <1525920616.2432221.1366964432.1752B0F8@webmail.messagingengine.com>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <b81ceb27-73b3-3060-54fa-7a703c422136@linux.vnet.ibm.com>
 <1525920616.2432221.1366964432.1752B0F8@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 May 2018 13:18:18 +0930
X-Google-Sender-Auth: IYJKC-L_ODwXvMBuHhykRvloLIM
Message-ID: <CACPK8XfMhZ1v=kCjK=0BBNq=Lo0FRMjm5-zL0LkepJAETecW_w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 1/6] gpio/aspeed: Set output latch before
 changing direction
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 10 May 2018 03:48:44 -0000

On 10 May 2018 at 12:20, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 9 May 2018, at 01:43, Christopher Bostic wrote:
>> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>
>>
>> On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
>> > In aspeed_gpio_dir_out(), we need to establish the new output
>> > value in the output latch *before* we change the direction
>> > to output in order to avoid a glitch on the output line if
>> > the previous value of the latch was different.
>> >
>
> I think Milton mentioned this in a review way back when I was upstreaming the driver, but looks like I forgot to address it.
>
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Ben, can you please send this upstream as a fix?

Cheers,

Joel
