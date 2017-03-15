Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjY5m5k5mzDqXc
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 11:54:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aAu6M3Cn"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id v198so1569215ywc.2
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 17:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=SuTLyrsguKAj597ClBuj14NcN1qtu0jNKCSmRBggecs=;
 b=aAu6M3CnMpveFIjD3Z1Jbk5IshSMyyRF5bsfwVgQS5DJvlJYCYxLaY3e2qjmXZCUAa
 DdfwFr0pNSvSEX7vtLmsqo9enoQEgFex8+yr/oGVK72GsNq39GodfMeSWGJq6OblypR6
 TUXV/saFVVbhdOsqkvt9ELlTCrayDqIA+rIBNxMBc/2gKJGYBbt8vwqPbI6tTBhyE9Le
 blXdrb4F44kWNr8a6YDgBROWcFZ+xnnX7ALIPFFVxc4TAJDSv9WRcCz+1umzCj8lPTNp
 5tXflX15HWrvzeQGpIm3SqKbLGyDgqd0dAt7rAwzNWW6Bcuy8iDnyB3ZqZpk9MZpGJc2
 oQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=SuTLyrsguKAj597ClBuj14NcN1qtu0jNKCSmRBggecs=;
 b=FcQzDmVOxU7EWyR+SMDOE4r+nwvjf2Lwcf92Buxgoasz3Gk18haE/O3bIpDXB65yRQ
 FkqAjVk7gPPlgFvPospqVqidmRoGyIDqpOlH6kW/mmHlgV6i/h0tj70WqZvGiW3PgMEM
 OFulvtTJzpaaMttKzEduw/oJHeseG/YCMoqUupnR01M9MsRKKpTyzSxvzJhS3gtJTnJ6
 XjSFIXP5b+5Qppfm8/Q6aOCEP6lgCHT7tcBu6zWBrBnHIsAWebD50s9Nmw60KS0VYgKr
 4lVp1MYPy0HEBvcZW9dwRODB3aXEPT4FBl/gQqH2R+PHVNaMLXjGBwumAB0ZYlwzQ4S+
 nWDg==
X-Gm-Message-State: AFeK/H21475r9UGP39aZeoTJQx0HJRXClW7/B7Eqn/yWBXlCeTt34or+zLcTNFwkBhs+TAYlYTWYhjrNrgBytw==
X-Received: by 10.129.71.198 with SMTP id u189mr450217ywa.174.1489539257778;
 Tue, 14 Mar 2017 17:54:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Tue, 14 Mar 2017 17:53:57 -0700 (PDT)
In-Reply-To: <20170314092023.13994-1-andrew@aj.id.au>
References: <20170314092023.13994-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Mar 2017 11:23:57 +1030
X-Google-Sender-Auth: fYWVo1eXwa18jUgebNtOEcYEziQ
Message-ID: <CACPK8Xf4i63C6FUqKKPByNE8UPhbX2Xskg37Kj-dk6qcerBAhA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.{7,
 10} v2] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Milton Miller II <miltonm@us.ibm.com>, wghoffa@us.ibm.com, 
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
X-List-Received-Date: Wed, 15 Mar 2017 00:54:21 -0000

On Tue, Mar 14, 2017 at 7:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

>                 switch (size) {
>                 case I2C_SMBUS_BYTE:
>                         data->byte = msgbuf0[0];
> @@ -3056,11 +3079,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>                         break;
>                 case I2C_SMBUS_BLOCK_DATA:
>                 case I2C_SMBUS_BLOCK_PROC_CALL:
> -                       for (i = 0; i < msgbuf1[0] + 1; i++)
> +                       recvd = msgbuf1[0] + 1;
> +
> +                       if (recvd > sizeof(*data)) {
> +                               dev_warn(&adapter->dev,
> +                                               "SMBus block operation received invalid payload length of %zu\n",
> +                                               recvd);
> +                               return -EIO;

The maiden voyage of Leaky McLeakface.

I changed this to:

ret = -EIO;
goto out;

Aside from your aversion to vowels this looks good to me. Applied to dev-4.7.

I think you should send this upstream. You could send it with just
this snippet, without the dynamic memory allocation. Or the entire
thing.

Cheers,

Joel


> +                       }
> +
> +                       for (i = 0; i < recvd; i++)
>                                 data->block[i] = msgbuf1[i];
> +
>                         break;
>                 }
> -       return 0;
> +       }
> +out:
> +       kfree(msgbuf0);
> +       kfree(msgbuf1);
> +
> +       return ret;
>  }
>
>  /**
> --
> 2.9.3
>
