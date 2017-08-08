Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRYfg1yxszDqrN
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 22:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VfBm0bcJ"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id n83so2270047ywn.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ds6Nhd7RTXtqjgWsHZ7mox50JHHA5+vcb3J8vmSUOE8=;
 b=VfBm0bcJSbYz2+9XJQJlKXvefmBMEVuBM/65ou5u4OExwXJiy4isvKb7ViOZIIIbAP
 l/1bE9KZt6zsXPKoaKqpG28R06xopf0R2J7RjyIj4SMHu+A3IbALak5R/JNTh2Ugt6IT
 CjSDwLOZ0lT4e2IyP+pugzY9ZKi+L3nIJexzWD0nXulsoDWtX7JYj3MF3cwrJEONXnmg
 iIWs1QGNFNEYV0jKWtxwqEd4MtIZTquINsfzwUCDO+ksoZyRnW4TxMomoAbB8q2qaB8e
 NCng8aAn4XEx7Buy0VqkkqtAzSSLYUtR4FFDjt5k3JLZtBfWxs2bXGzYOh5UDKIXc4h2
 vTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ds6Nhd7RTXtqjgWsHZ7mox50JHHA5+vcb3J8vmSUOE8=;
 b=BJzDJg6m2m0MsIsPDZUCRVhP3zWu5VzYb0eKKUtBzKv92nvSiUjMMl1BKwQu8Wx37R
 e1gC6INeZJw6jTXBrUmvEKPDhM41CGAkYatI4H8ybbIF1pycri2vHWbPqcVUEZK7PwiR
 xuq8nPczJFN27XaKkcI/m2QnHksVqpzKAyjtWS2Pt4/iRzlXCobsqQHZ6SA4W6Dzzdip
 VKUvFFyW9xHT8thfevGbkDF+CoZiqFXcgpoBF76rdnU508aqW7LVtCgAG55axwGY1yF4
 BtqljFACZfQ9ED4ldiUedtpINHiwvPlOjI2TSUwU3tcy/lnYadmKVAvQsVEjB7B4iy65
 L6eA==
X-Gm-Message-State: AHYfb5hEtIVKEHRZP5YjeIcNgpZ+mJc5h24IrpRaHwgJKDouH3ALA64v
 08VotSksO5LX6kHaNoSTk7JrBZ+FVA==
X-Received: by 10.129.156.198 with SMTP id t189mr3363870ywg.392.1502195480066; 
 Tue, 08 Aug 2017 05:31:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 05:30:59 -0700 (PDT)
In-Reply-To: <0afaecee-1c26-2283-5fc1-138396455bbd@kaod.org>
References: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0afaecee-1c26-2283-5fc1-138396455bbd@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 22:30:59 +1000
X-Google-Sender-Auth: TEidn-wZqPXV2ho-E9Mx_zF2v78
Message-ID: <CACPK8XdK7RHiVQGQ_v-2zc660jasn8G8so1XaYDgZ49HL2nWwA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v7] ARM: dts: aspeed: witherspoon: Add
 gpio-keys-polled for fan presence
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 08 Aug 2017 12:31:24 -0000

On Fri, Aug 4, 2017 at 8:16 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 08/03/2017 08:50 PM, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add gpio-keys-polled node for pca955x fan presence lines. Change the bin=
ding
>> of the pca9552 to remove the leds and instead define all the provided gp=
io pins
>> there. Add back the leds in a 'gpio-leds' compatible entry.
>>
>> Polling period of 1 second to be determined to be the max acceptable
>> value based on discussions with Brad Bishop and Matt Spinler. Tested
>> with gpiomon program - verified.
>>
>> Patch based on Cedric's example - thanks! Tested on witherspoon.
>
> You did the most difficult part: testing.
>
> Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>

Woot, we got there in the end.

Applied to dev-4.10.

Cheers,

Joel
