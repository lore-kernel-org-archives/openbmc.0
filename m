Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRZCQ1sfrzDqp9
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uDtvoYrO"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id s143so2305511ywg.4
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XQryuBlDp8uygb8l9k2c3N3UqmfQ/SoFACoyTXWzG2Q=;
 b=uDtvoYrOGGwUATZOiU/3nqzFEGadSnW3Mdq93UeYOCaqF0lMTOpJ1dvkPezRvcNM0C
 46WrM1l+A0mGAp0xWdRCA9+jX4tLf0cQkODAaw2ROo5VGoYeNQH7KO69NmXvhzamLxmB
 i983kn0CWxLINVrYk8+TNZ+6+DsVbitz98+mBvFcfST3l51I6R+ZazJaPTNNTsAKkxHc
 HpBx7HprNwtAMDY6CTL2cfCscZM2IvwzwP5x7WiFqHAjiWCYLpTpoBsX8zCOwWQ3ZjxP
 1R7CKuBp8Tp8YD3Sr2IaY/zD6lAmCmwIW6yHNJgfcldoMfOnGBt/ADH4BSjfUMDcYz/p
 xYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XQryuBlDp8uygb8l9k2c3N3UqmfQ/SoFACoyTXWzG2Q=;
 b=KYlDqtw/EaSsaRetdwmFOQaWY8QOznhktMnR8ThEX7lBujqL+X/+hjUtORuDBcpnc5
 iC3vNHRIsVnZnhZ86TKHrMfiV1D74U2ovyaVA0ol+nqF+DGmgf8UPqtcUOiFeEnInUx/
 FutNJk4pAyk8kDnOrTcf/fULZpd0yID3BSdyVHBVB/zdZpBg6G9WU5hD2yI2uTIfK6cy
 E5XkMkUrBDhmrMYPaRRhAHbLqLYsJw6VLTblCFwv4iyYOoogiXEHGTH7tMDz0EXFJc1C
 KczLFRfclyq/ecLTis/e1sV5RsWNKlcD7BCTmnaXMxPsqlgkXrWPcq5+Up5LneycH77V
 Y2zg==
X-Gm-Message-State: AHYfb5hWEL4ekH6Y2tOR/VKqcD4o+1aljydE4QALD4hbndzKFv7NAwGU
 fw8mLbgc83BIPVAetAHdBGYGSBoEKw==
X-Received: by 10.37.90.84 with SMTP id o81mr3357164ybb.350.1502196976060;
 Tue, 08 Aug 2017 05:56:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 05:55:55 -0700 (PDT)
In-Reply-To: <7078c05a-dfa7-f6ae-62e5-70e2c9d019b5@linux.vnet.ibm.com>
References: <1502097540-10201-1-git-send-email-mine260309@gmail.com>
 <7078c05a-dfa7-f6ae-62e5-70e2c9d019b5@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 22:55:55 +1000
X-Google-Sender-Auth: np4DYN1y4ylHep0PuP05y_q0_iE
Message-ID: <CACPK8XfheEx3FkcuXhCOJsgrtUZpP4HsrR5_awpBg+wUPdiigg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: palmetto: Use new
 occ-hwmon driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 08 Aug 2017 12:56:19 -0000

On Tue, Aug 8, 2017 at 12:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 08/07/2017 04:19 AM, Lei YU wrote:
>>
>> P8 OCC hwmon driver is updated.
>> Use the new driver and compatible name for Palmetto.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>
>
> Thanks Lei!
>
> Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

Thanks for the ack Eddie.

Applied to dev-4.10.

Cheers,

Joel
