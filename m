Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wppPj72F3zDq8B
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 15:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DxAJ62bd"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id p198so1278574yba.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LlKjS/Av+Z5C2+yn/ubyC4tGHf36A7fYCT9P6e63uQ8=;
 b=DxAJ62bda2D4CWxNtuVUfxQ5Z4f6KrLCB9dXXjLtwiBagSiqS7ljwxiXkU6g9p+y2u
 /LutaRO6gzI1ekgniV7s6u47GY8UUhAHA37wD6QtU3Sp4fL/6aJfCoa9q/enu25MgkZb
 /CPOwKeiixEX4FWk1AslBBlCZTdNvwd+oIIWpCmZK3nQFfTIyPPiBWqtAysIuy1I+uo9
 mJwJxYmV+5ckbpyGstaJ32hzohyNgisuZ5h3r6Vm5OrXsuWlOcCLeUZz0QVVftTjGZhh
 klK3HXnygShaZmRy5aHiHYQjVIVTrkjAFug717kvg8v7ozrAIVZo0ZImFtnEGv7GiftC
 dUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LlKjS/Av+Z5C2+yn/ubyC4tGHf36A7fYCT9P6e63uQ8=;
 b=O5Mgm885Ey0e/ge/qtJIm6s6HNJVbTWX7uab45/MmOBiFdcZQS71DLKTdFZ8eG9m4g
 KNTrygZiU6Nvm10J9s8Q9TKcZ4sihlfDdsRl1jIWwkGJfkj9M8YSGha14jAm6U/kEx+a
 T1MZvnm7FaJfNgXo/2roJkmi6UcRc4SlJOzIw7g7qDA/CLAn0Y87wsVF5/Co15WBpEXQ
 ioZm2dij7bzceBBqWxN2HReS3eDxogNBDZmAPrx5A1+Pq2dd6LeYajv4H5/fCRDCf7kc
 eN8yUig2F9+dDbTLwCTbbsYZKB/WwVq5ax+VXgnwxnCvLlb2NqeaacvUZ8lh7yqn3B1w
 IAUQ==
X-Gm-Message-State: AKS2vOzlbK8JaGBIQ+0cXVkSmkqEuDt1A2MLv7w0PtfQ0W4hN++wOBqk
 dma9aWwd2Mr56K7cbnqDWSvuSvfJfw==
X-Received: by 10.37.88.193 with SMTP id m184mr6803345ybb.39.1497589895443;
 Thu, 15 Jun 2017 22:11:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 22:11:15 -0700 (PDT)
In-Reply-To: <1497031265-29545-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1497031265-29545-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 14:41:15 +0930
X-Google-Sender-Auth: y6vHp6T41ymkLxoZUzuicOSKFEo
Message-ID: <CACPK8XfqLvqiV-tCSoiaVjAfW7-bCkWcmM-kBw4ivo3PST-Puw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/5] drivers: fsi: occ: Fix 1 byte
 response and rc for O_NONBLOCK
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
X-List-Received-Date: Fri, 16 Jun 2017 05:11:38 -0000

On Sat, Jun 10, 2017 at 3:31 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Couple of bug fixes.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

> ---
>  drivers/fsi/occ.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index fc014b6..a1508f2 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -188,7 +188,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>         if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
>                 if (test_bit(CLIENT_NONBLOCKING, &client->flags)) {
> -                       rc = -ERESTARTSYS;
> +                       rc = -EAGAIN;
>                         goto done;
>                 }
>
> @@ -593,11 +593,13 @@ static void occ_worker(struct work_struct *work)
>                 goto done;
>         }
>
> -       /* already got 3 bytes resp, also need 2 bytes checksum */
> -       rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
> -                        resp_data_length - 1);
> -       if (rc)
> -               goto done;
> +       if (resp_data_length > 1) {
> +               /* already got 3 bytes resp, also need 2 bytes checksum */
> +               rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
> +                                resp_data_length - 1);
> +               if (rc)
> +                       goto done;
> +       }
>
>         xfr->resp_data_length = resp_data_length + 7;
>
> --
> 1.8.3.1
>
