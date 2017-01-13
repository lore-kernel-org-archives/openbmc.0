Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0GCh20YyzDqVF
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 19:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXov1Dsp"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id f2so3587769uaf.3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 00:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=6633OrkdDo/YbyWmXXW8XUKXAhSaIB/RMKY96pST+gY=;
 b=JXov1Dsptw20AeFMhmG5VR3AkCVWjqH05N1BK1gJzAIESfEBSjMXNKaMG6DTrlfErt
 kp/pOxsx1Rc2+BMvvkkF+JBJsYYZXHkL8ObdfGmDdOPueYRDQana72obdo58g90HzULJ
 UdVKXmITGzZG/fSSKQtji1bOWEIdhVOTiqs3lG2UJE2mR4r6p7DvlaK3UdtkQRnhhm8M
 EK0Hux18eVjDJ2FCUnqdqDpYYGOa2itcpfot+8n0c+STLL6DwqSWm5nzVGPAtqMuGQzj
 eiTWLlap4hG9j5pumX8cvgdTRPcVkuYYkp6ndpdf4A0MBRWxhk9TXu0VhAN6yq+0CYsY
 toEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=6633OrkdDo/YbyWmXXW8XUKXAhSaIB/RMKY96pST+gY=;
 b=ko02KqGDub6bsZGvpkljSMqRBpE3MGJX6ukvvLm5gLESY8sfbQR7MPvOiCSvr/v1KF
 WZSu9GPlz7auYvRKFXQfSDRDlEa32kmqAWoFMs8WeKSuChU8XAG05q5GcJjUnfX7bbUN
 f6pnNoNfPzIJEGJTXhku8dsTPHzda7v5tmLjMouFmDLTOHGY+YF0gRnRbL/wM7UBFTg0
 7qrvIFPxKJRZDK2WyOhSfMWNlgp9mljszxvGnLmiBuQVmX4I2Nt5uCFEl7Hx44u/YZdC
 bN3OSEGDpULOPcJ8IVlMktBlG8Lw6hd5PJ8AGfNmswIqBfmFB6LY+m/0C3/cKHIvuYcV
 Mg9g==
X-Gm-Message-State: AIkVDXJzaUxPK7NZvrIAerOoKvDchU+uTmPzsiE/TZpVbr1xSYnuVHkJKVOdmfZMRNAU/wWa8Ec1P5NeRFiYPQ==
X-Received: by 10.159.50.138 with SMTP id l10mr8421937uab.166.1484296510246;
 Fri, 13 Jan 2017 00:35:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.73 with HTTP; Fri, 13 Jan 2017 00:34:49 -0800 (PST)
In-Reply-To: <dfa90d97-5148-1603-74f4-88f68fa536ee@kaod.org>
References: <20170110225555.117814-1-rlippert@google.com>
 <20170110225555.117814-3-rlippert@google.com>
 <dfa90d97-5148-1603-74f4-88f68fa536ee@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Jan 2017 19:34:49 +1100
X-Google-Sender-Auth: bJ2XyXTk2MQod6664XoM2Xb0oMA
Message-ID: <CACPK8XeHMyNq__Y_UTBWxyROcnpAJ9PprmCuXUA0_rFZjtW4iQ@mail.gmail.com>
Subject: Re: [PATCH linux v2 2/3] mtd: spi-nor: aspeed: add support for SPI
 dual IO read mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 13 Jan 2017 08:35:12 -0000

On Thu, Jan 12, 2017 at 1:27 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 01/10/2017 11:55 PM, Robert Lippert wrote:
>> Implements support for the dual IO read mode on aspeed SMC/FMC
>> controllers which uses both MISO and MOSI lines for data during a read
>> to double the read bandwidth.
>>
>> Signed-off-by: Robert Lippert <rlippert@google.com>

Applied to dev-4.7 as db7536c39879.

Cheers,

Joel
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
