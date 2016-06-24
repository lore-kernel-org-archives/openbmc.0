Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbVMF4K33zDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 17:29:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=b0uD0AyS; 
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id c73so136552112qkg.2
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Vb3ccBfNX/+gRJ3g+AvVZxRBuwMDmFmFkMPPk/0XD/0=;
 b=b0uD0AySChaYkKLYItPKPtvf2kQxRl3X94U5j4FT7rpYv2SBwdYXcWEWnWSeDFkX2N
 MpRrOq8iuOUR+EpvcSP6eoIA36A5fHFrZrsvwBQlmBxdXdd5FNW9jANelLr9+TRSt1Uq
 +Hpjc2fTS+SfJNS5VNrPQzudj8RKifrR/zJjz5yMAZDMMVUhRb5rqIIRreKLZeH1fYIB
 x7VepvLKu8G3NY75T4EEr8BdwPvfrDLvJdkiKQZPWfaYjJkl201R7fN7GJwSXTNF2Qiu
 1h0+Gg3CQlpStM522MjlUZIhNsARdTpGF3HGUS7NWPbjXtKLDI260tMosXK2j/pcLgNS
 dX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Vb3ccBfNX/+gRJ3g+AvVZxRBuwMDmFmFkMPPk/0XD/0=;
 b=Y1jlk11Df0G038NMPTEoPfTpPzMPXGDcrEIH0G4GcO0CFBZ23l0Hrm1obCpb9CTMpG
 k7oPg+/Irg6+vpnrS03T3DpyMtcM+4ykI8hgxynvZHVImu7nCFWAjwXPK/Q2ppPE/1Ep
 iyfUs/g40Fu4dIo98EwOtPfa3IedfYmyHpO0nHp63FlWrI5m6+U+JAktWU3at5bzoo5r
 auG15wYn0o13pWeTzgnJJe51CuHZgqC8HzKmJcjIAxIT8K6xx7oi8X4qcHObNuHGcUle
 Ox34Wfr901uuJbMaOXUxLtptEb7dUVvv2wKtLnbzJnffQsOFgwL8Er31wMjLWSvgL0oE
 /M9g==
X-Gm-Message-State: ALyK8tIBLkZCLnCRW31IeozZLUp4NSfBqFYUVIcD78trHjHA4IZ9uOKWalgBXMKrR47m06+sPS8DkyxIRmhY0Q==
X-Received: by 10.55.149.3 with SMTP id x3mr2970311qkd.140.1466753350976; Fri,
 24 Jun 2016 00:29:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 24 Jun 2016 00:28:51 -0700 (PDT)
In-Reply-To: <bfac8b51-733c-e7e7-635f-bbae2b0d6a8c@kaod.org>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-4-git-send-email-andrew@aj.id.au>
 <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
 <575AADB9.5050501@kaod.org> <bfac8b51-733c-e7e7-635f-bbae2b0d6a8c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 16:58:51 +0930
X-Google-Sender-Auth: __oLcy1GPhcP7Mr6SyD3v0Fmdl4
Message-ID: <CACPK8Xder8cQfN6ZGsqRdZ_KzNCz-TebYtXXfSP652Y2ici4CQ@mail.gmail.com>
Subject: Re: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed
 g5 register interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>, 
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 07:29:14 -0000

Hey Cedric,

On Fri, Jun 24, 2016 at 2:39 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> So, given that there always has been fixes from Aspeed on the driver in
>> u-boot (see below), it seems that these EDO bits have been wrong since
>> the beginning in Linux.
>>
>> I am wondering what how this was working. We should probably contact
>> Aspeed to have some clarification.
>
> Aspeed said that they have a different design than Faraday and we should
> be using :
>
>         #define FTGMAC100_TXDES0_EDOTR          (1 << 30)
>         #define FTGMAC100_RXDES0_EDORR          (1 << 30)
>
> for all boards : ast2400 *and* ast2500.
>
> I gave it a try on a palmetto and indeed, network works fine with the
> Aspeed EDO{T,R}R bits.

Nice investigation. Thank you for doing that.

I have sent a revised patch for the kernel that incorporates Andrew's
work with your findings.

 https://lists.ozlabs.org/pipermail/openbmc/2016-June/003876.html
 https://lists.ozlabs.org/pipermail/openbmc/2016-June/003877.html

Please review and add your tags, and I'll update the branch with the fixes.

If you want to do something similar for u-boot then please go ahead.
Otherwise I'll do it on Monday.

Cheers,

Joel
