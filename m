Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpr5R19C3zDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4tnD3uU"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id b63so1344461yba.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8DoLkRvH3pY31r8joUT5l1wNWsrGSkLIzPbiMLjqcn8=;
 b=G4tnD3uU+YXShzma3BQhRbOFcAzxe+uCDK1ZFaP6ktNPfrALSZkPispQlK3HF2Brqi
 ImK355Tlrvf4uOQGpaWoBAzVoD7mqIPHB/vBMQ3fQYQtPxboWO1DitWT1Lr9m5d/bYCa
 CVPCtPGZ9j2E+zmzwvW2sM24MVwlh8/DEpg2UoXG8jKNHDfogOB1oZg9itE2fdNOmFpp
 KQQQxA2z+flc1hV6QFIl5lBNWpDJDUKHj96A0I1fvY02dKvwdR+NZhLfLNYnFsdQmOaM
 9Fp2Dbo11cp1pXzkz6cmolAjSf+zocElFc++I6/7yy8i9iywzqv3BZyLGkqn097cH7DX
 YSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8DoLkRvH3pY31r8joUT5l1wNWsrGSkLIzPbiMLjqcn8=;
 b=cPVCDMYuQ1UlQQKfDJoKvf5RRX6eFZhuWceRysuGMhRcUftCWaShtVNcXXmfRJnlW0
 6XO+LLcdKRh4a4tSlF24GBA5mKb60Wn+FRMtMZ7V3O8DzosHRsRWsM6owGJ3GSKyvJ9x
 PwwV9jAGbh6SdgoFyuAWpuFYZ1S1bDHrPOhcoUlP8wjUMlZS7FNRyotj6E7NeWvXRHpS
 Nq0xHokURMQr3lNofecAHODHOMIiJNoAJ5nJy4P9MfTVKrVHg9mWoOXItsFaFooBOvwt
 dVh9+BS7nuvvtOXaE+a3gKdACWyN6HxOJfOl5VNyvS8EMLeHEB3N0EJdt8cPBpMVIPnO
 QFwQ==
X-Gm-Message-State: AKS2vOz8Pw3qm14kjW7C5CBIz4nfyPmMC34CEdzsOk1fthaJfhzyTRdF
 ab6X+sPmIM3iNr1ljOvAcmt2kY5HZg==
X-Received: by 10.37.11.68 with SMTP id 65mr1898733ybl.94.1497594456967; Thu,
 15 Jun 2017 23:27:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:27:16 -0700 (PDT)
In-Reply-To: <1497364240-14045-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497364240-14045-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:57:16 +0930
X-Google-Sender-Auth: MLpTpJUHMerEbQSq8d_l5PR-umI
Message-ID: <CACPK8XcuST9KigkJgxdt2BLOLU=WnvL260juCeyrh7tZTcyHpw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers: fsi: sbefifo: Fix buffer
 initialization
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 06:27:40 -0000

On Wed, Jun 14, 2017 at 12:00 AM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Flags field wasn't set, leading to inconsistent results.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

> ---
>  drivers/fsi/fsi-sbefifo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index fbc8dc5..52d7a1b 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -156,6 +156,7 @@ static size_t sbefifo_dev_nwwriteable(u32 sts)
>
>  static void sbefifo_buf_init(struct sbefifo_buf *buf)
>  {
> +       WRITE_ONCE(buf->flags, 0);
>         WRITE_ONCE(buf->rpos, buf->buf);
>         WRITE_ONCE(buf->wpos, buf->buf);
>  }
> --
> 1.8.3.1
>
