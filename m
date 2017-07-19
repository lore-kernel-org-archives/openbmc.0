Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBx6356VzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:46:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T/j/azah"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id v193so2342071ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=zWtbpkW826C9NN1A+vH0PGOSvjoTBXmmg5FinXLlcrA=;
 b=T/j/azahaz0jzh4IBt3wHXahgtn4JC0UUyTgp3z7HL1Ia80HxqlTbpegsdffF+XyES
 qWwxKzNWFLqHD7UqdVmgtjrvEFCuQOZOUwDqvHdr4ORcVFXI5WqAsJAmxp+R/bLHFDTh
 rQJE3rLip/Vqm+1Yraih9M50SlSeqol/219WAMcw1oPNYbqn4cAuzM7SRDGfvzHkTW+P
 oHcUPlIAbf4XqZM3VRYyIdbCfZfcplKZxLOSLK7P2HLmDnHrcbeqptqMJxBCqyZqU52S
 AFZvJ5o3+8qP5Xx85V1mbUxq1U4WJcxTgm+bt234dxDmuqVMmDdy+6zEnKI1iZ6JmO5n
 a+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=zWtbpkW826C9NN1A+vH0PGOSvjoTBXmmg5FinXLlcrA=;
 b=M3FyMlnyeYbwb9SAd1PeH/RYNKkqZ29eN5yTCm9gtrQ1y+G26liFR/3Y9PTTSkhtU/
 dRAyrAQTiJXeJWvNg3eYljNv3n0/iPttcuRDTo3IRLIYUIJnKay483aXWAaVPXQyDvyM
 zOeJi6afHwqkahluoqicRXfB/lXQdH2l1ux5oownQNzpddtdNu7cG1JVWXxcMBC6hnLu
 XGctC8JwgaoTt4tgpo+YpO+R8Q3FU1sK6NR307YW3ryKYxBg1gPPRnRnMMpv8bTta96u
 JwuOEs8x8rXgM+hPU9kcitpK5woxyMq+pUaRUJJYTees7d1eWXvlDQPbzCvAYEmYAHXO
 3rIw==
X-Gm-Message-State: AIVw110w518sYqiYGBREIzr6SfB9RzG/NJiFogCE9MYS82XDX8l7eWYy
 VD4FLU4xnteOZ/PTSOFoMowByCSYkMomAIQ=
X-Received: by 10.129.201.4 with SMTP id o4mr1596846ywi.2.1500457560284; Wed,
 19 Jul 2017 02:46:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:45:39 -0700 (PDT)
In-Reply-To: <20170706064443.16972-1-joel@jms.id.au>
References: <20170706064443.16972-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 19:15:39 +0930
X-Google-Sender-Auth: hxA2THuhsBj-aIb8rp72gxgyhCw
Message-ID: <CACPK8XfxufScBjxK5_V9Hz3aerZLxg6WFvK_eZfhB0nH1NAs1g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] i2c: fsi: Add SMBUS emulation
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames.ibm@gmail.com>, 
 Edward James <eajames@us.ibm.com>, eajames <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:46:02 -0000

On Thu, Jul 6, 2017 at 4:14 PM, Joel Stanley <joel@jms.id.au> wrote:
> Userspace expects this to be enabled. For example, it is required for
> using i2cdetect.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

What do you think Eddie?

> ---
>  drivers/i2c/busses/i2c-fsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index d5135b4bc607..952cf8f392b4 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -467,7 +467,8 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>
>  static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
>  {
> -       return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
> +       return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR
> +               | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
>
>  static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
> --
> 2.13.2
>
