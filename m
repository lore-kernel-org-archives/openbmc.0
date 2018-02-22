Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2Z/ouVq"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn1zP68zszF18J
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:46:57 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id n198so4981125qke.7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 20:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4OhqT87DwFjDAx6VWXKS/o50lkfk5nwjGKxdsFroq6w=;
 b=I2Z/ouVqkVYdtGL8s18jWMhUvfLhnVDKezOgip23fwmUq5IyyKk1KRXVGslQGMctAq
 B5Z3rmJtnb1+exJQq3GMCkT+CWYnc1p0w0wn1aeqVTT+tZ+D0s1QQTV2uqN7gZcZ5fEN
 LmglrP+sV5UO0/5Lpr/JYtJsHxkRGPGtPYDcQYsWcjFs1XKKKmyGJSC6RXSLzXs20wLC
 jdgjVAkxQBdZhDOv6RGDLZeNLVFBtW7N0eBj0gK7q7XzFk2hXo8qnzokjkj2TUGUR4SD
 qTKgYjJYoDnM1cGpJM6RUF5R11iiWzIEzcVMJt6lit0jSCWITVrkibKDzLp1hu37t8LH
 ia8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4OhqT87DwFjDAx6VWXKS/o50lkfk5nwjGKxdsFroq6w=;
 b=V/zIKuBYBSwvq84WMnO6BGxbqr54VjH3Ow5o66kc6eUY/4rmABiGnNIP2gtzdJmVto
 pXVuNBlQAu8C2GLXx/YoJORXYAbPLA0AYkvQco3sf6a4jEEM+Hd3h0Og0E2q6DW7g9DO
 BHvNJqkjKDX0tG8VLgcl0wOeErYfWPPmc9v189kBt64PM26IQAmxhjRWMO0IluBIlNQh
 O7blrU+j/2iwJYwSdqUrLxxDksi/nZkTpXF7UmY+mA6+9LIJ5ecvrnDtd7fLwnXn5zV+
 My1K4kJlq7BsawQ+7iyNVjUSwfx/5GhDoFjUryWTe/mm50Z2WCUQtNEKz8Bo5a5einK9
 a7WA==
X-Gm-Message-State: APf1xPBLCMNeWaJg3Mn7XdVtP2HB0SAWULNTIATpRf4xaHZ2lVl0fZy+
 XpkNWBJlIC3fxU7ttZDMkO5xEpN6qSy1S9tKGag=
X-Google-Smtp-Source: AH8x224zGnrzow2qVR2D+S2VXnv7tI2I8TXOaeIEul8z1YkYpMK5mOD2GL0fU/MbwwMx25qyTslydhM5Y+VnA2VKawo=
X-Received: by 10.55.76.206 with SMTP id z197mr8414397qka.143.1519274815079;
 Wed, 21 Feb 2018 20:46:55 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 21 Feb 2018 20:46:34 -0800 (PST)
In-Reply-To: <20180221032554.9852-1-cyrilbur@gmail.com>
References: <20180221032554.9852-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2018 15:16:34 +1030
X-Google-Sender-Auth: Y7SqVe7P7ChxljpltScOMjvLf2Y
Message-ID: <CACPK8XfEQ-qiGMYaPZvtw9VnwWbC=q39k7Pq0drtFN2viatHjg@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] dt-bindings: misc: Add bindings for Aspeed
 ast2400/2500 LPC mbox registers
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 04:46:58 -0000

On Wed, Feb 21, 2018 at 1:55 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> Before I attempt to upstream this again, I thought I would run it
> past this list.
> Joel: I'm quite sure what you're carrying in the tree at the moment
> is the same plus or minus some whitespace. I've made strong use of
> sed to remove any 'mailbox' reference.
> If you could double check, thanks.
>
> When I do upstream I'll have a cover-letter which will explain how
> Aspeed haven't made our naming lives easy by calling these registers
> 'mbox'. It makes it impossible to justify calling this driver
> anything else but it does expose us to the confusion as to why it
> isn't in drivers/mailbox, which really isn't the place for it.
>
>  .../bindings/misc/aspeed,ast2400-mbox.txt          | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt
>
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt b/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt
> new file mode 100644
> index 000000000000..b33276e058d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt

Please add this to
Documentation/devicetree/bindings/mfd/aspeed-lpc.txt under the Host
Node Children header. See this one for an example:

 https://patchwork.kernel.org/patch/10227223/

> @@ -0,0 +1,35 @@
> +* Aspeed MBOX Registers
> +
> +The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> +(BaseBoard Management Controllers) and the MBOX registers can be used

You can lose the part before 'and'.

> +to perform in-band communication with their host.
> +
> +Required properties:
> +
> +- compatible : should be one of
> +       "aspeed,ast2400-mbox"
> +       "aspeed,ast2500-mbox"
> +- reg: physical address and size of the registers
> +- interrupts: interrupt number to use for the device

Make sure this matches the other examples.


> +
> +The mbox registers are attached to the LPC bus on AST2400 and AST2500
> +platforms, as such the mbox node should exist as a child of the LPC
> +node.

You can lose this paragraph too.

> +
> +Example:
> +
> +       lpc@1e789000 {
> +               compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +               reg = <0x1e789000 0x1000>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               ...
> +
> +               mbox@180 {
> +                       compatible = "aspeed,ast2400-mbox";
> +                       reg = <0x180 0x18>;
> +                       interrupts = <46>;
> +               };

Just include the mbox node, drop the lpc bit.

The bindings I have in the dev-4.13 tree have 0x5c as the size.
Looking at the datasheet it looks like 0x5c is correct.

Cheers,

Joel
