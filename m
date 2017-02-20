Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS0V542zCzDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:39:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q5U35iUZ"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 2so3072140ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mlJFfMXR3c3/45i3hmBpgFL/d0tR5PS8/398WLw8TEY=;
 b=Q5U35iUZO6lu7MmOhSU1Vs0beaWzKpVPV+4+4CNRXyIZfpe9furFqG0A4223ZOonI2
 PW+6hKJchgqFcjP/j87QjCS1lIrMOH51QgzMrky8ZFPO8iizF/T0xqrD4e1BJFH1BSIZ
 3xg1lW5Dm80p8Bg505SPInYQsrU/FpX899eb9JnqLD/sRY3kOCMptt53ppKFWf96p62y
 AdhCs4u331vY3YTREPFSueNlx8OOGRG5T6Q+rCMZa81AxqO6FCkiUoEi/S4iHuTK6Vnp
 D8eV7J32JYafiRBBqm1pBzQg313tBLYtglvuEq7HAGmJmQKxzw2dRmh87g4dal16IC6M
 UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mlJFfMXR3c3/45i3hmBpgFL/d0tR5PS8/398WLw8TEY=;
 b=XVtp725L9z/gYThqZVEF+mwZMBawTMRPE4sSRB2V3DWJ/XYf0ZMc60FMdtDlUxHDlC
 cm0fUV1nLhF0K/TDuMf2QLl+cM6QXhOJj57HIShR5Pk57Y/gG14w1Gh5G88neUGnJ9b5
 B90oI/VUBSQhkQZsw6dlqYTb7W0T1mWQV265wMoOd3Fq19k/kLGC0peWqgMulw8Dtsu0
 2dcQ7CDx61YaTi6FIxmCmWb+W6AgY64Qn7CMT3A7WC8Qz/jSgfyltS8GjrTI7iCpQ+cP
 oCbsJAb5gRXLYGtMpzssmKF9W0asM9kNx5n691H/m4FFxuBI85pdivzlAASwEr5PVTPx
 RRHA==
X-Gm-Message-State: AMke39lIWdGOCnA3AramTRwsxyYnr8PpMydyYqbUZFH9SlcwZUmh15ejqbO3gtbUvtI83gC7aiheZFyCQLxCVA==
X-Received: by 10.129.73.65 with SMTP id w62mr17629984ywa.288.1487633994969;
 Mon, 20 Feb 2017 15:39:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:39:34 -0800 (PST)
In-Reply-To: <1487625445-11892-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487625445-11892-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 10:09:34 +1030
X-Google-Sender-Auth: FxtRcpjGfyZbQKhiuyzlUOOwkho
Message-ID: <CACPK8Xfk-QQ-00wPTfM_DfT=U1XZL8pK+e7j_m=BrjC=VGjqMA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Fix return code for
 putscom
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:39:58 -0000

On Tue, Feb 21, 2017 at 7:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Read/write calls should return the number of bytes read/written on
> success.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-scom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index 2874ea0..51b3dc3 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -156,7 +156,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
>         if (rc)
>                 dev_dbg(dev, "put_scom failed with:%d\n", rc);
>
> -       return rc;
> +       return rc ? rc : len;

I refactored this to be:

 if (rc) {
     dev_dbg(dev, "put_scom failed with:%d\n", rc);
     return rc;
 }

return len;

Are you ok with that?


>  }
>
>  static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
> --
> 1.8.3.1
>
