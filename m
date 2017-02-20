Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRXZz21pvzDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 16:42:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKz5Wb6/"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 203so2630704ywz.1
 for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2017 21:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=HZb0ZD2bXJvWK2Z3jrkm7eFDmuhyX2oBTu6znYNfCdU=;
 b=WKz5Wb6/0kEScura1CMJZ2ptNbF/urYNETTDo4lk9pW8llWHdhnodurA2HAcOaHeJF
 Hto33vkqi3C98BEvfyCZnCWffEjQykK0qtRmy6NfHuCtfAARWBoXNkk2yfQahtKEIDMh
 asOrRcc4dRy6fddxHu/UiclMyCg/igXDmw++/qF+EP//caxytlC2hr9rMhmANJniESck
 EKc0wzFDq0O72cGAsumPqlyyO7ed6lklwiyP4amG2cUyRkGliJ7WGCh+rKXGtq7tSlZL
 9KuJ/qHs3SFdCdiBwyeluCPmdvCAeuo0yWJEpEKtCspNeGSWtzf4LoZtPDZOkOoNkomL
 HSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=HZb0ZD2bXJvWK2Z3jrkm7eFDmuhyX2oBTu6znYNfCdU=;
 b=bS2IwkrtGtijwSxYk0kurR8tXINqySUdD87+0vFAdByIc5BQrDjdfSpx1YoURbIXA5
 coqWMF2sl3KGqExSQnC+uR2RqLPSK73Jm7FQ5iw/iZ0o6JyD0x9a7UuxjSyd2ydZ3D3U
 cyTzXoc2vlL0XgDF9C/xB5o0Bf5EwXkh6JnGWhS0K7Qpw3r/mgKQpjYHJuMyQCsLIPDv
 memf9Icly/U4UkvuPj74zfJtWcth7EqdzT3E0VH+qlcOAOvd0q09zvXu7UQ+XqsRX4Jy
 GomrsnNRyghgwyugPQOKbLDv0Pr8/XzGUdZ3t6YmjUgoiTPbuoGYA627UUSxumqedQwN
 NDWg==
X-Gm-Message-State: AMke39mBvi0k2h1f31RMc4OcH3yWHBse0F2Lb2dkHGTl94X/ENWREXQrdhtyZeIh0iDzaZLLlmmAiqEb2iemNw==
X-Received: by 10.129.73.65 with SMTP id w62mr14542090ywa.288.1487569351039;
 Sun, 19 Feb 2017 21:42:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Sun, 19 Feb 2017 21:42:10 -0800 (PST)
In-Reply-To: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Feb 2017 16:12:10 +1030
X-Google-Sender-Auth: mW00LoAS8pw2EANdPgjePMiciBE
Message-ID: <CACPK8XfGCTpk5S22kwOFE1cOLgFbg4Wkx3p5bCA8A3Vb1MFGbg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality
 and sysfs interface
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
X-List-Received-Date: Mon, 20 Feb 2017 05:42:36 -0000

On Sat, Feb 18, 2017 at 8:11 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> full reset only

The commit message needs some work. Use full sentences, explain why
the patch is required.

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-scom.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index ff8267b..c73bd91 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -32,7 +32,10 @@
>  #define SCOM_DATA0_REG         0x00
>  #define SCOM_DATA1_REG         0x04
>  #define SCOM_CMD_REG           0x08
> +#define SCOM_FSI2PIB_RESET_REG 0x18
>  #define SCOM_RESET_REG         0x1C
> +#define SCOM_COMP_MASK_REG     0x30
> +#define SCOM_TRUE_MASK_REG     0x34
>
>  #define SCOM_RESET_CMD         0x80000000
>  #define SCOM_WRITE_CMD         0x80000000
> @@ -156,7 +159,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
>         if (rc)
>                 dev_dbg(dev, "put_scom failed with:%d\n", rc);
>
> -       return rc;
> +       return rc ? rc : len;

This looks like an unrelated fix.

>  }
>
>  static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
> @@ -181,6 +184,48 @@ static const struct file_operations scom_fops = {
>         .write  = scom_write,
>  };
>
> +static int scom_reset_fsi2pib(struct fsi_device *fsi_dev)
> +{
> +       int rc;
> +       u32 dummy = 0xFFFFFFFF;
> +
> +       rc = fsi_device_write(fsi_dev, SCOM_FSI2PIB_RESET_REG, &dummy,
> +                             sizeof(u32));
> +       if (rc)
> +               dev_dbg(&fsi_dev->dev,
> +                       "failed to write fsi2pib reset register rc:%d\n", rc);

Is this expected behaviour? If not, use dev_err.

> +
> +       return rc;
> +}
> +
> +static int scom_full_reset(struct fsi_device *fsi_dev)
> +{
> +       int rc = 0;
> +       u32 dummy = 0xFFFFFFFF;
> +
> +       rc = fsi_device_write(fsi_dev, SCOM_RESET_REG, &dummy, sizeof(u32));

sizeof(dummy)

> +       if (rc) {
> +               dev_dbg(&fsi_dev->dev,
> +                       "failed to write scom reset register rc:%d\n", rc);
> +               return rc;
> +       }
> +
> +       return scom_reset_fsi2pib(fsi_dev);
> +}
> +
> +static ssize_t store_reset_register(struct device *dev,
> +                                   struct device_attribute *attr,
> +                                   const char *buf, size_t count)
> +{
> +       int rc;
> +       struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +
> +       rc = scom_full_reset(fsi_dev);
> +
> +       return rc ? rc : count;
> +}
> +DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
> +
>  static int scom_probe(struct device *dev)
>  {
>         struct fsi_device *fsi_dev = to_fsi_dev(dev);
> @@ -200,6 +245,8 @@ static int scom_probe(struct device *dev)
>         scom->mdev.parent = dev;
>         list_add(&scom->link, &scom_devices);
>
> +       device_create_file(dev, &dev_attr_reset);
> +

What is the expected behaviour if two different userspace programs
have the reset and chardev open?

>         return misc_register(&scom->mdev);
>  }
>
> @@ -207,6 +254,8 @@ static int scom_remove(struct device *dev)
>  {
>         struct scom_device *scom, *scom_tmp;
>         struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +
> +       device_remove_file(dev, &dev_attr_reset);
>
>         list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
>                 if (scom->fsi_dev == fsi_dev) {
> --
> 1.8.3.1
>
