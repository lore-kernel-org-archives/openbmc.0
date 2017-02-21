Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS19m45m3zDqCr
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 11:10:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hXQbSGVs"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 2so3106575ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 16:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0F3A2m29zfmWU1BnxeRY+ntkmV9cQEkW9u4BsvhHu+M=;
 b=hXQbSGVsmDeIRPLTohT5HxmaaC4VglNfNXOajKfm3nkycWz0xRW93djDAqRhQIYf2O
 BerVt8r9SOhetXFg8mfUubu9gCVB7yADo5VIoC+KLtOrqHLvB9R1Bq2y1c+u8s3pTj7L
 x1Mkd7kMqgy/TXC6Icn95GVpcK9f+VLYDK4oKJLy+oUle/N5SnunHiCHsrjsAQDdrJby
 Lo3fNm7L3LilmGsEk0pJ5yr4WRDbAclUds5C0ZH3VxRQoH7OHnARgN94j6ZpW1NCKE39
 aEYYlPnnfWoSagXe2Ob0iekU4qT4ylNoifnnyIALBpEdaTcFRkFinuJsyG3NcS5uRI9v
 TgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0F3A2m29zfmWU1BnxeRY+ntkmV9cQEkW9u4BsvhHu+M=;
 b=j6w08w55Jre1qKMBE0Wb6wuCB/PBsfySKjRNLjjNABu1xnduqRjWh/SYjD2nC1FgkE
 i2OJJ1ghgH9fkzAUalRck9WzE6CWZugM4Ee+Zhd9/Y9pP9EFzZPbFZku/K9Ay0tUIzf3
 11JlQQPVB7yi7O8IDbjuopkxKMzMjeUdpuK1F7DoCGAJ1JHXmDL6O6gwFnJfl+/it+ki
 hd7jY1iv2vY/ezQ+61gYFngvglbKg0txdk5KFt7HkQHnYFH0zwmQfz4xmrHSnbzeW5dc
 RDWaEHttQlE92dmWLTijaNoJe2cwpcKRuGfm75CTAYHVMLCbv+Y5NuSCpNfGk1/AdrgV
 SE/Q==
X-Gm-Message-State: AMke39mXA8qyPKwpyQxawlMy+sVCYVUWYISYY2JgB3OnsLU5VDzUbqkClRRzz6Eb3CJGZS91unfnNShior/2+Q==
X-Received: by 10.129.73.65 with SMTP id w62mr17706695ywa.288.1487635850096;
 Mon, 20 Feb 2017 16:10:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 16:10:29 -0800 (PST)
In-Reply-To: <1487631648-4845-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487631648-4845-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 10:40:29 +1030
X-Google-Sender-Auth: 7O-fWu6y4pME2GdAXgEDy3zYCn4
Message-ID: <CACPK8XctvdGHLddsGt0kYjo0LN9F3RakiRfg4xxgxXBpJAHLNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers: fsi: Copy all data out
To: Eddie James <eajames@linux.vnet.ibm.com>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Tue, 21 Feb 2017 00:10:53 -0000

On Tue, Feb 21, 2017 at 9:30 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Driver was only copying 32 bits out to the user-provided data pointer.
>
> since v1:
>  * don't do a for loop... thanks Milton.

Thanks for adding the changelog. Convention is to put it blow the
"--", which means it's not included in the commit log.

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 3ed82ea..8c8a8f4 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -274,7 +274,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
>                         resp <<= bits_remaining;
>                         resp |= response.msg;
>                         bits_received += bits_remaining;
> -                       *((uint32_t *)data) = response.msg;
> +                       memcpy(data, &response.msg, size);

This change looks good. I will apply it as-is. However, we have another issue:

When reviewing I took a look at some of the call sites. The driver does this:

        rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);


So we have:

static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
                        uint8_t size, void *data)
{
...
        struct fsi_gpio_msg response, cmd;
        int bits_remaining = 0, bit_count, response_id, id;

...
                serial_in(master, &response, bit_count);
                response_id = response.msg & 0x3;
...
                switch (response_id) {
                case FSI_GPIO_RESP_ACK:
                        if (expected == FSI_GPIO_RESP_ACKD)
                                bits_remaining = 8 * size;
                        break;
...
                /* Read in the data field if applicable */
                if (bits_remaining) {
                        serial_in(master, &response, bits_remaining);
                        resp <<= bits_remaining;
                        resp |= response.msg;
                        bits_received += bits_remaining;
                        *((uint32_t *)data) = response.msg;
                }

Data is still null, so we now have a null pointer dereference.

Can you or Chris please take a look at this?

Cheers,

Joel



>                 }
>
>                 crc_in = fsi_crc4(0, resp | (0x1ULL << bits_received),
> --
> 1.8.3.1
>
