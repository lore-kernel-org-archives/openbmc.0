Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5k84hsMzDt2p
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VMEIkT4K; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 130so4885416vkg.2
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=rJnIuPfpE5+w/78yE/PevPDev1s3ygbbXpIhG0p3rNY=;
 b=VMEIkT4KVyVYH2WIGehjbxUfLEmldsfv7MicuBzBdInZjJRA9d/g1BkjtGUqps8nfh
 gHx/W7dhY7/IRxHxKXl0ubh2/BqHgM+No3hWL+CB0Tmmsvb6NPSAWxnBjw7JES+4b7Ua
 z9i9q2X0uDc0k+kLTDXe3MG1P8ydOkpsgnunsXUHaJXbxYTGJ6EwbGJNBJVpsc9GqxTh
 XfIY1ZZAA1F8EVYSSa7PpYxAHst8MgmtLRits06YhPtKDMLCFx2QSQlGbiTkW2ZifRxw
 xLt/4BQqXOiuPAQ0ouv2SWfm1Ei8bWZVZBVjh9Cc8gE7AzKi8AtyFk/mDi5k3B+AFOjn
 tQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=rJnIuPfpE5+w/78yE/PevPDev1s3ygbbXpIhG0p3rNY=;
 b=LD+O+ertnnYscclQmaRiWHRm+hW4uhv8jcKJFhkpVftFT1nRUAkw8/aBLx83rsXhEZ
 bsTAOppSUVmgNf52iQebOP0sGkSm/beA4h5nUgED505XGocBI7mdIHiSxm4VmFoTqxhk
 pmtGQaU+xYNgmlPh0N2SF4tGWfdCdZO6uc+fG1lWP0CEoyaPyy8JPMi7V4yrefLvWbW9
 h1HIMCpRStdWMHoU6eEP7caEaXbU0lq4cgDj0tfYZKHna6kA3ld6sBjvi0i+DkF7QY4w
 Iy8xtvuPuRyYWZyJu9tNx5QCacY4GAWRwSCkUOd7mUPU/+yKZ/LVdRcdL6qGQXP923q/
 3vhA==
X-Gm-Message-State: AA6/9RmY7+NWt9JMnZG5tg+4NWsJpiKIdELmD3f/qcqrAFY06Oyx4Kn6Rg/mtlgmD43fvj5ppM3FZ6eRfyefSg==
X-Received: by 10.31.138.143 with SMTP id m137mr2099540vkd.148.1476680718785; 
 Sun, 16 Oct 2016 22:05:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:04:58 -0700 (PDT)
In-Reply-To: <1476448684-6149-13-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-13-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:34:58 +1030
X-Google-Sender-Auth: JmrQH27j-8VNQBkH9H1ssuMTa1M
Message-ID: <CACPK8Xf0sLXLkfV_rGVZ6ppLN0590d3TTugYCTrT4sMNe5XBAA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 12/12] mtd: spi-nor: aspeed: use fast read
 when doing DMAs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:05:21 -0000

On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Try to improve the speed of transfers when doing DMAs

This could get squashed into the DMA adding patch I think.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
