Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMjhb6csnzDq8t
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 11:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rZCBj5FE"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id w194so4716553ybe.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KZzsO8nJ6clgwnSdEBPBEb2rCkGjZuO+/vv3ZQrAKEM=;
 b=rZCBj5FEoG8JTfSztRlX8N7BMPgkfDu47+Hume8Js09vg5xkR+8Hs+Ns72d+CUCesZ
 BZ7aUXcVO78Phd985KsfHnpuzvZDX3rGZFpfcyMbSzIPKPeOGMLLFUiDw7DiJ8Gdzpov
 INsfzyHci4HPYd+ilE8PtW9C+kV47cCduh9u9y+kTkD7ydgs2vTXq6H5ApbB7wYviS6m
 h3Mss4CLMbV+y1VpEWqNi4lMye7ZblnfFGBm/oNaKJUtHGtW5MQf3Wsfx17M1Ow4KTfE
 rC2Byw28XnmjVojrenfMtyV0Dfc7mJEgnmvjpUoUoC2cDxWTnfY/bCv0MMVqgLvFqPIu
 tnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KZzsO8nJ6clgwnSdEBPBEb2rCkGjZuO+/vv3ZQrAKEM=;
 b=Wc6AkQnNnKduergc5mK9xWXQAFpxHgSRbVScT1qwnLKTN/yU8FuimgYjhMdZddBbWa
 nggqogHHzcntn9IOmlyS184oHNKS0zbnF2S+AqzcB5nYvPyapTOLFVMlfwaOFZ9hYwxQ
 y8cZKzGUCcWlEMoSNKLLi0UXiMJxesVdRfT7lVD2OaYJ7z5CmO2naqhagcJ+vkXWBFQ7
 5pZMAXKGKh2Eyz4kbJYxdHBIuZojpdDh+i4Ky9oHBMYkY6V01XX1Amlhm5hawpoSZPJO
 yqwy54hLeFCXRk9RNKsr2bJUszbSDA5RYHXOzIdwygk3VmcbLYfNez2ffggqpY75t/xT
 vrXQ==
X-Gm-Message-State: AMke39m8aG6v2E5jUeCh2qJFrL1uFj8VBJloDvQK0iGTEr7NrKp4jsgU5SajWiRA8BptIhmf47pSeomz0JWlng==
X-Received: by 10.37.70.66 with SMTP id t63mr19575364yba.196.1487031549339;
 Mon, 13 Feb 2017 16:19:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Mon, 13 Feb 2017 16:18:48 -0800 (PST)
In-Reply-To: <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Feb 2017 10:48:48 +1030
X-Google-Sender-Auth: iz92mJdK1nz1h8GyhMGX8ZcjPjk
Message-ID: <CACPK8Xfx_uhrXkUgOAh7R=j+Tux5vBGvJ47XYZTLxJskar3Xug@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] drivers: fsi: delete device on unscan
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
X-List-Received-Date: Tue, 14 Feb 2017 00:19:12 -0000

On Tue, Feb 14, 2017 at 6:37 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> need to delete device so that client driver "remove" is called.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1e9c5a2..e8a3618 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -512,6 +512,7 @@ static void fsi_master_unscan(struct fsi_master *master)
>                 list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
>                                         &slave->my_engines, link) {
>                         list_del(&fsi_dev->link);
> +                       device_del(&fsi_dev->dev);
>                         put_device(&fsi_dev->dev);

put_device calls kobject_put, but device_del has already called
kobject_del. Are you sure this is what you want to do here?


>                 }
>                 device_unregister(&slave->dev);
> --
> 1.8.3.1
>
