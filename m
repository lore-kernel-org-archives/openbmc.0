Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SoDElslp"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nmN0IgFK"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RLDr33n0zF20x
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 10:57:32 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id s2-v6so3860952qti.2
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 17:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gxYw6m8u+4vZul02wMjCPQvmgS9C2KUi28UkOLb/HL4=;
 b=SoDElslpeHh2G9D9jljTwNsA8oz9CqmaVEPGM4TsGS/UlVwIhU+cVBvPWNmNhxaele
 9erCN2BX1F23Vu5u7ejBC6th5CHP5co7Fo9dNNedUfMINex3jRNmSfihPkb3CNjhxUgn
 yh8pxcAMyxtWmtwlWRugstbKCRniLTpJg7633oqUdi/XmSbOMO9ccWqu22i+2t/62u+M
 rj5B4CooktJD+Aio8ifqZp+qQdfR5elJSDrGIScDQd6qJwTk9kNnSaSuC+PJQv8PE7vf
 NF0FOnFCSpIYO189MmYYN0a2SB9NQfxArVkvHxef+gb/dXTxUscJQLJXs01iQ3IIYi40
 GDwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gxYw6m8u+4vZul02wMjCPQvmgS9C2KUi28UkOLb/HL4=;
 b=nmN0IgFK/3pa70SAUjRDDRVek92W4dx9EwS9iR2dSJvXC27D77SCondtRIlu09yQu1
 1hvxunBkf0IHM6RKDzUHQIkhXqIxyqNSZGT5XpzQwqDABaZvYaWeAAefY9ruYbwph3mO
 JKhy1Z+tSUKPW7y4t26LXsEN5se7m7bPv47dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gxYw6m8u+4vZul02wMjCPQvmgS9C2KUi28UkOLb/HL4=;
 b=QobJK/+241a+WT8w2OtSEU09wm4AGLm+2ufNu6sihkR6HPu90yvISEnYt4R3i5sk9o
 uPVww6tfDuCfszgaMGd/W7ESVtiJmcgZHJNUmPuwByqhnbMjBN/fxFtBSSGHuJ+3Mfbt
 nKAdWTL1LKKOGFdj2ZuDkYtIHII8SPQF8WsEjnIUYPekQXFiGnhfJRQnrQFi4t6GGq2H
 4zeiC/k0Sd7pRMCftFgITjWOSlR3jHjhvciWtiTOZKNSTMh95kIuReESBBZa7wAbId7z
 QWFE6P1CNlm+qtug+ggKI8zXBK8afKAX2NoQOkQ/YovviBX1KuqhB14yUNkOgLsZ2CY2
 tgbg==
X-Gm-Message-State: ALQs6tDFeyb3jvnZuE1q/kUCSRbIMq1oGiVvWr7qTl0YP8tnGnrnGqT1
 0ambsIzKsk/slDdwFIcdw1qgQ3C7eyRa5Dl3Yro=
X-Google-Smtp-Source: AB8JxZrCynk1z0etcRH162bIlulsImZxSiKhD6KZbKJ8ZCCluS+PrvdF0LIUpVtw9+jiUDsGz3ICJ/nbqS7LgY3I/mc=
X-Received: by 2002:ac8:1018:: with SMTP id
 z24-v6mr3991292qti.387.1524099449363; 
 Wed, 18 Apr 2018 17:57:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 17:57:08 -0700 (PDT)
In-Reply-To: <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6B7921E@IEC1-EX2010-MX4.iec.inventec>
 <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
 <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 10:27:08 +0930
X-Google-Sender-Auth: qXRETD3cjd_ENTRC075NHdgDCXY
Message-ID: <CACPK8XeRZ_NbaduF-jbPoSA+-HO6O4Zoy3M1-geqkhkyohq6ag@mail.gmail.com>
Subject: Re: FW: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
 Lanyang BMC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?=
 <yang.brianc.w@inventec.com>, 
 =?UTF-8?B?Q2hlbi5LZW5ZWSDpmbPmsLjnh58gVEFP?= <Chen.KenYY@inventec.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 00:57:33 -0000

On 17 April 2018 at 11:35, Andrew Jeffery <andrew@aj.id.au> wrote:

>> >> +&i2c11 {
>> >> +     status = "okay";
>> >> +};
>> >
>> > Do we need to enable all of the above i2c buses? By comparison, Zaius enables i2c0, i2c1, i2c4, i2c7 and i2c8.
>>
>> Thank you for your review.
>>
>> We need to enable all of the above i2c buses because we want to verify
>> the i2c bus is fine by i2ctool.
>>
>> Because we use the above i2c buses on Lanyang platform.
>
> Okay, it's still not clear to me. Are there devices on all the buses? If so, do any have bindings that we could use to describe them here? It looks odd enabling all the buses but not "using" any of them.
>
> If you're just enabling them to test the bus with i2ctool then I feel that we might be better with that staying as a local change for your testing, rather than merging this as is. Joel?

If they exist on in the design, then enabling them is fine.

The distinction I've gone with is it doesn't make sense to have them
enabled when the i2c pads on the SoC are not broken out, or if they're
only connected to ground, so there's no way of them ever "working".

I'm happy with the dt as is it is. If you're happy then I will merge.

Cheers,

Joel
