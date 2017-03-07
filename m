Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcgmS1CY7zDqY1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 13:37:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HTgMTkOP"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 2so18357876ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=3DvLpq/ElzY1RhBSFulwbVuCmVERWprFxNN51MKtKF0=;
 b=HTgMTkOPSYPb/ZCSPo3uyM/OcMmQCXK+cy7K1+YJYvSickRbIxf8qRCUC7I9PbZyfj
 UjA0DmBpmuiqm7ezD/f7RvT8GvdZIA7NmrCmDYU/hhpCsqmlpKv6VHz0yj2dZNb2fIoW
 6h4wCbtHcZR3IWWJfpMVpEQrEHZqF1JjRFglic7cPa6qlxConxTAArzpSO9iIccO9PGl
 TRe+vXRFO/glukxcjheNRa0EQzG7MKCDCeX44uuKUOlK4DLPzFbuOiIgYfG+VJT2RX+6
 YWXztdrLrI9+Hirg87ayA2w0mce/raO61ntA2VC9kaCEzN81XdfVLLD2mTcORWzIzaBv
 5C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=3DvLpq/ElzY1RhBSFulwbVuCmVERWprFxNN51MKtKF0=;
 b=liUbMqr2uIyPXY5uPjXdyML5QS7uSDxbyb5KWeX0e8vWqNy8LYn4foKbW1cYPoi8Dl
 hcBbrJEmiV+wTiQ/4OU292E3gckx0Hudj1asokMXwpPmjIP8zv7E+qQT1qh1Itaet/fi
 WRRP4dlCphAtKZsl5JVhx8uxh6XMxxG4kK0Hc4VOny6+Pcjzt78EJEVqX2UncW3h1Wid
 JplcdXvGdG6marat1bdZVE0wwYB93UHjS3njgCYNnsE7znorcOJtzW4r+qZZg6gzgpTU
 y+t1rB0C12LKpXrF8gVvO2v5lFBUVZSpLIzKPqnZ/qeaHkPOEE+fBjie7S6E6NnGuM12
 6B8Q==
X-Gm-Message-State: AMke39ncTj9ghfIA9/3D3ThYgHgRfh38cqavgRf2tZBrHms5TzHi8Z6xru1BY1OoabXi14ShWXj1YhJiQSvShw==
X-Received: by 10.37.32.194 with SMTP id g185mr14602703ybg.167.1488854245935; 
 Mon, 06 Mar 2017 18:37:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 6 Mar 2017 18:37:05 -0800 (PST)
In-Reply-To: <20170307005551.33957-1-cbostic@linux.vnet.ibm.com>
References: <20170307005551.33957-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Mar 2017 13:07:05 +1030
X-Google-Sender-Auth: Z-fnxRcVCdBABEtXnZEXko0fAL4
Message-ID: <CACPK8Xe6nNEw4gYBmChq9eJ38PBa4ft-Ytc7tF51Bru2XnTLwQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Remove hub devices during
 master unregister
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 07 Mar 2017 02:37:28 -0000

On Tue, Mar 7, 2017 at 11:25 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
> +static int fsi_unregister_hubs(struct device *dev, void *data)
> +{
> +       struct fsi_master_hub *hub =3D
> +                               (struct fsi_master_hub *)dev_get_drvdata(=
dev);
> +
> +       if (!hub)
> +               return 0;
> +
> +       device_del(dev);
> +       fsi_master_unscan(&hub->master);
> +}

This introduces a warning:

drivers/fsi/fsi-core.c: In function =E2=80=98fsi_unregister_hubs=E2=80=99:
drivers/fsi/fsi-core.c:754:1: warning: control reaches end of non-void
function [-Wreturn-type]
 }
 ^

Did you build test this patch?

Have you boot tested it?

What runtime testing did you perform?

Cheers,

Joel
