Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSjMJ1QCFzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 14:21:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjOKaycA"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id r141so145347ita.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zBU5Hy4tZedz5Qb8ZWTwPBKBd1ZqFKZyoNMvXAGqs+Y=;
 b=FjOKaycAJz8R0jVESb8s9tMxWfGXKEr1Yqk3vT85zu/ROfPOoqefqEf1C5RTUpgLsm
 JN8YhoJG8dAN4S7WVcmIZ93X2FrEb04xC7pbL0pkaWBoQIQsRIW05mr0FKcmHBs+bmJD
 SpR+Am1+h7PgjA//SClj8LH7P1UoKNDnCX0KbFSLTLJ9oOmTrFaxqC1D4OzTbWVI4hpp
 QVc82TXHM9HskiC56CpXfcbYwzik4BlA0aRTieCx41DJ4MS3yp3O4cliqqgTTH2AoBmL
 gwXR7MTihxqhCbhcSt8sTw3KuJa9KcIlxZRla3kXIiaTzqYmrZRqRwF2FiKC7vOq1uCE
 9Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zBU5Hy4tZedz5Qb8ZWTwPBKBd1ZqFKZyoNMvXAGqs+Y=;
 b=YhQC6jMpHZYlYVlkckGmpfVRtZjS/Y8oci88Py0OZC0Ju6gWxjkgSaOGIyHLgPOf6u
 UeqTg3vjo1/SIjpaJHgibr67UgGsq0xh0f536s81+mA/Q6cs3FfDTuoW58zSDKM016lU
 6jWWq/7ocI9MvvvBqbMpQhohOVNVhO+JA4SwFvKSXNdWcpbnjP1gfw8/1Rlh0GpUvICT
 BJOmeCWqPA3SThm3Nucd+0fHtk5VVtKPy5WzqS9mxKKyJtxVjVfHcNl3m9olUpVcPS22
 fevq3kxixkwb+XBm79hB0eOl/sOU+rYaUhV3RybhYYzGYa/GMOZrfhnszDOJ/owJgMg9
 okTg==
X-Gm-Message-State: AMke39nrdqeCebJjjxKXNTH+YOtjSQ1KZhUJyFu8i6GBVVb/NKfHDAMh+3veqRy3EptzqUaCfB0zKtWLj/eEhQ==
X-Received: by 10.36.230.3 with SMTP id e3mr309723ith.31.1487733690170; Tue,
 21 Feb 2017 19:21:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Tue, 21 Feb 2017 19:21:29 -0800 (PST)
In-Reply-To: <1487696530-27256-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487696530-27256-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 21 Feb 2017 21:21:29 -0600
Message-ID: <CALLMt=pyX=4FVoqQ_LwuOoG2U1sGTVyKDcYDzU3Ov-x4FRiJbQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Zero out user buffer
 first
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 22 Feb 2017 03:21:32 -0000

On Tue, Feb 21, 2017 at 11:02 AM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Scom data is just bit-wise OR'd with the user buffer, so it needs to be
> set to 0 first.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-scom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index 51b3dc3..ed3b98e 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -85,6 +85,7 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
>         uint32_t result, data;
>         int rc;
>
> +       *value = 0ULL;
>         data = addr;
>         rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
>                                 sizeof(uint32_t));
> --
> 1.8.3.1
>

Looks good!

Acked-by: Andrew Geissler <geissonator@gmail.com>
Tested-by: Andrew Geissler <geissonator@gmail.com>
