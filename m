Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vj3Fk5Fz4zDqGb
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 16:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EawZZrTs"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id o4so11827058ywd.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2017 22:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zN5/W777EeQVT0mSbc7jXSkzk1vS8rJ4NOhYzu1Tj4A=;
 b=EawZZrTs4BZUCfvm1Qn3laA+eDOBp6pMq0NEv3pQ/TJHQmEmXz4EabQUt44WqUJxQT
 qfu4qndShAfKB7PLRmHLMTmqIfRM5oPXUlPAsoQbzsvCwseou8ZjknsgrbVmur3o3Q5S
 avJ/oAfZ9QjrTjYZk703dzXgM2FzYd+MWrY5GdR/ucoDj4E1ZgEhXmgoWe/P1zcia5Fu
 D1hPCluAuGPwwCqWlzXwolxV7NJlKLiajQNZX5Xu9v95yEsyV2/LuGxaiMFx+mopjrZu
 Wm/S1VzhDZlwk2Jks2CjxDyyR3OZ7ctrICEqxTUq8q9thFlJ04imp99HZy6Muy0iH8sG
 i/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zN5/W777EeQVT0mSbc7jXSkzk1vS8rJ4NOhYzu1Tj4A=;
 b=rDhMZoDSKLqshbeutjjHV5iw5rs+iyb62web8pceblU640iYUxgu8xUb6AlZCQmw1X
 LdmqmexmZTXFMKS5I91AOVqiokew3Me08V/D8YivxEaR9Be9nU/tUc9fCx9KvzKRPmmo
 b9YjFmL4a2tcqNc9XIYxuqkUVH0hsTUH3VaJL4LyYN7MOh80YRtvl8blhqlFvQQheot0
 9hpXjAcJHxCDXJ2LSUmUuyvs+ov5rerns5ln0yvXR6xCgjeABX48wxVqW9HHFm9j1wnz
 muJ4jbYy+uLxPMKiEso+VHXRp9OrnfciKBegc6/qByQiW96XT7u0MO/Njj7B2xqWHuUL
 ZJBw==
X-Gm-Message-State: AMke39k+4hwoCQD/m1i7aUDnCUelIvOD1n9vp62A0sEAHfK+73TlerO+QJbRep5hpfCzIgC5S38kjYZ/JXP6Mg==
X-Received: by 10.37.70.66 with SMTP id t63mr21036070yba.196.1489469368049;
 Mon, 13 Mar 2017 22:29:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 13 Mar 2017 22:29:07 -0700 (PDT)
In-Reply-To: <20170310122135.29827-1-andrew@aj.id.au>
References: <20170310122135.29827-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Mar 2017 15:59:07 +1030
X-Google-Sender-Auth: L0-QGrMQT-uwZkL3Fdw_zQI_aDs
Message-ID: <CACPK8Xdso8w25fUhRWH3Ww87Gjv+tGKvYu0K9VGpTJVi62kiwg@mail.gmail.com>
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Milton Miller II <miltonm@us.ibm.com>, wghoffa@us.ibm.com, 
 Patrick Williams <patrick@stwcx.xyz>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 14 Mar 2017 05:29:31 -0000

On Fri, Mar 10, 2017 at 10:51 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -2894,16 +2894,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>                                    char read_write, u8 command, int size,
>                                    union i2c_smbus_data *data)
>  {
> -       /* So we need to generate a series of msgs. In the case of writing, we
> -         need to use only one message; when reading, we need two. We initialize
> -         most things with sane defaults, to keep the code below somewhat
> -         simpler. */
> -       unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
> -       unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
> +       /*
> +        * So we need to generate a series of msgs. In the case of writing, we
> +        * need to use only one message; when reading, we need two. We initialize
> +        * most things with sane defaults, to keep the code below somewhat
> +        * simpler.
> +        *
> +        * Also, allocate 256 byte buffers as protection against suspect
> +        * hardware like the UCD90xx, where on occasion the returned block
> +        * length is 0xff[1].
> +        *
> +        * [1] https://github.com/openbmc/openbmc/issues/998
> +        */
> +       unsigned char *msgbuf0 = kmalloc(0x100, GFP_KERNEL);
> +       unsigned char *msgbuf1 = kmalloc(0x100, GFP_KERNEL);

kzalloc?


> @@ -3056,11 +3077,17 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>                         break;
>                 case I2C_SMBUS_BLOCK_DATA:
>                 case I2C_SMBUS_BLOCK_PROC_CALL:
> -                       for (i = 0; i < msgbuf1[0] + 1; i++)
> +                       for (i = 0;
> +                            i < min((size_t)(msgbuf1[0] + 1), sizeof(*data));
> +                            i++)

Lets assume msgbuf1[0] + 1 > sizeof(*data) means junk in the buffer
and return an error instead of a buffer of junk.

If you want to print a debug message there it might be useful for
future debugging.

>                                 data->block[i] = msgbuf1[i];
>                         break;
>                 }
> -       return 0;
> +out:
> +       kfree(msgbuf0);
> +       kfree(msgbuf1);

Do we cleanup in all paths? Is there any value in using devm_ apis?

Cheers,

Joel
