Return-Path: <cyrilbur@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::243; helo=mail-ua0-x243.google.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZI4G/7Ch"; 
 dkim-atps=neutral
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qsYx30P4zDqL4
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 20:38:23 +1000 (AEST)
Received: by mail-ua0-x243.google.com with SMTP id g9-v6so11971957uak.7
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 03:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xUCiAtVb/RZd+g7yO5BaNL3K+1+p2j9OC2X2/ZG41k8=;
 b=ZI4G/7Chpzs43lwdR7fWEgRJ9VQCZ5epLeAEKtw7r7kzbYvWZaydjk8AgbpDtVoGky
 snbMJYZAtNXDiq/CEAbQcjZGWqrXM8q7RkrZKimudHWefbOQLPASU25fh5YmElRDC+SU
 RRV/GNxY4xMyf0wXZG1J+69CysueAsVZqwBXycL/HBJvU6KgFC8wJB4zrYDassUWNV60
 SUwYxXO/SQdWuLlrhEu/yweHPXwY3KWX6r/l6KSA91FFxgSkjDe57UkI+6s2vaCclU3y
 HzetumdysnnVYPEnRsyY+UQoulJMGHmsdIw/GEyF11ThIh4bqNsiJo0oZuAppiL804kC
 w3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xUCiAtVb/RZd+g7yO5BaNL3K+1+p2j9OC2X2/ZG41k8=;
 b=PJyDn4bNsf0RGvSB+p5+Omx/DnRUi3wuo9w2x2KclMh7GCXUpnZWH7vxdAdNBUI27o
 KLND8hK6TbcctC/3ytal+LPPbIRYrC10RIxz7xbaDn4JCI72CRrbywVxsId67mVxOONs
 CorrOKg5sH7I5wW71mHwgSUrJWF3Dbuarw8Ez0lr/hD7TRG20avFyJOw/j7maPYZZEdT
 i2jJkNHO4ZFNmLEqPtquB5xw0HIknWlcEKrCXwlSbB0h/vNnlQgeELqK/JgmkI635ypF
 o8mPId6pmcx8T2iz8PZTOEjskXhSjUKGCmq8/NjbWxPeM/WzS/N7kgBLmeBGUf1bHB9V
 mV3Q==
X-Gm-Message-State: ALKqPwfJ5zIq2NNQnKvZaJGpK192rkUWHzB6H3rufCYLkkd+IVqVcgz1
 RxlqmKgbLApFxHqVU5NamajKcOiRIjU4DTjF41s=
X-Google-Smtp-Source: AB8JxZqVWfKdvhfJaJr6SKgup5opthcbk8+Uzprdsl2dY9gVV1BC3JQD3OI3Nk9oEC62FiJQJSK5xnM/9BMyq8g5thw=
X-Received: by 2002:ab0:9ce:: with SMTP id
 e14-v6mr17063987uah.105.1526985500707; 
 Tue, 22 May 2018 03:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:3dd0:0:0:0:0:0 with HTTP; Tue, 22 May 2018 03:37:49
 -0700 (PDT)
In-Reply-To: <1526000360.3946551.1368145784.74E52A28@webmail.messagingengine.com>
References: <28825ffd2af2405eacbb48f1388992f8@AUSX13MPC105.AMER.DELL.COM>
 <1526000360.3946551.1368145784.74E52A28@webmail.messagingengine.com>
From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 22 May 2018 11:37:49 +0100
Message-ID: <CAN-ccASVchSQ_KzuM_SVWbH8WTkQ+hy31fp1ug=-qot5pGxzHQ@mail.gmail.com>
Subject: Re: common bmc mailbox driver
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Eugene.Cho@dell.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 22 May 2018 10:38:30 -0000

On 11 May 2018 at 01:59, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Eugene,
>
> On Thu, 10 May 2018, at 22:34, Eugene.Cho@dell.com wrote:
>> Hey Cyril,
>>    I was recently following your upstream submission attempt for the
>> aspeed mbox/mailbox, was wondering if there was been any progress since?
>
> FYI Cyril's moved on from IBM and OpenBMC, and so may have lost some moti=
vation here.
>

Hi, sorry for the delayed response. Andrew is correct here.
Unfortunately I won't be continuing the upstreaming efforts for the
driver as I won't have the time to rewrite it thrice more but more
importantly I don't have the ability to do anything more than a
compile test.

You are more than welcome to take whatever is useful or was useful and
do with it whatever you want.

>>
>> Reason I ask - is Nuvoton also has a "mailbox" for bmc<->host
>> communication, which does the same thing (shared memory + interrupts
>> both ways), and was wondering if we could just have 1 driver for both,
>> instead 2 separate drivers.
>>
>> Glancing at the aspeed driver, only key difference I see is the setting
>> and handling the interrupt. Thoughts on this?
>
> (Somewhat unfortunately) the ASPEED mailbox driver isn't upstream yet due=
 to push-back from the upstream mailbox subsystem maintainer*. Similar to t=
he misc driver it sounds like we should work together to get things moving.
>
> * It turns out the mailbox subsystem as it stands doesn't fit our needs -=
 it's written from the perspective of the host kernel communicating with so=
me firmware black box on the other side of the mailbox, rather than the ker=
nel of interest *being* the black box.
>

I wish you all the best of luck overcoming these     problems.

> Andrew



--=20
Cyril

p.s. Apologies if this comes through as html or anything strange -
I've resorted to using the gmail web interface.
