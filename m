Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8K7P2K9RzDqJv
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 12:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpcsOFN3"; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id 81so38430171ybp.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 19:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=d4EkRvBYId++ZKvOSGhjAGxuaykgnZcO+SAYEjNNaG4=;
 b=hpcsOFN3ZMc31JpLH2ATWD8o0S3cKSiATjdtuG3c8irC6TFpBeazbfGZ/eayYtMHnz
 VxuQXivqWk8//o2htUsq2LIPmNfuv8avRUp3bpRjIHVmpf++Pd9qSM2IQkN5gPQll/QX
 anjbRidpf6oXA2jm9TXKAmmqu/raOvpxFKUnVJNtvi7FfVfmIrAO04IoLWPiQ8NNrYod
 4MBsLsc/vRfh7EdpZgQ4weaT1EgQTDMOm47eB2jzTVM9w6TxNtc01+55gMKz5b6COJOH
 ELIj6U++zc/Q4j2aTJFvi3kiPON6vgZWaof8bN7l9kRKEjVet+63n2jL/l0BVMpXkROC
 6WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=d4EkRvBYId++ZKvOSGhjAGxuaykgnZcO+SAYEjNNaG4=;
 b=j8uE8rX0dJ/n9RfA/rBCIUgAC8+epvOofNZU+vP3sEcfMuc5DG0YxAJu7wAErJ1K36
 SdIDRkymky3Frwvziuaxo45Te8g5L5Ipj1I/oYM6I19kvXjo52pL0qkYWyARZQnbDPFF
 Dm5ZEoiuOCID92vs5G7LhSCnfX2Y+O9OGF3eNlMmTRc2cGTK9WF69TNSDr80aiA2NIdZ
 atjhu48oNSfFfJVx12UU6mXYUV6bNp9lWdHnhPNOt74Vj2wNadhMKHRn6D31Zy/kTjK2
 xMpGfhCCHFurynb9Og0THI76BQLbaGczFbdh7s9AK/l8q23HjL4w4K8+OUNXI7egdLz+
 Ow1g==
X-Gm-Message-State: AN3rC/7fVjQ7eeJoAi1uxk93kyR8rDOLZR9U1As5okCTWYGwNQbeAE/Q
 qlJfhECs9CSqP07ZnXVptyJF3GXF90YZMUA=
X-Received: by 10.37.2.22 with SMTP id 22mr10033299ybc.167.1492740878019; Thu,
 20 Apr 2017 19:14:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 19:14:17 -0700 (PDT)
In-Reply-To: <86B3586F-7CEC-4389-8CCC-38D5423A4CE7@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492612195.1011.4.camel@aj.id.au>
 <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
 <1492662892.1011.7.camel@aj.id.au>
 <86B3586F-7CEC-4389-8CCC-38D5423A4CE7@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 11:44:17 +0930
X-Google-Sender-Auth: xZdgyKez_-n8fDDUlSNwJ1gLODU
Message-ID: <CACPK8XeecjHPOYGG3mMQXUsxhrXt_Ry=NMTy+ng1pudO5p4+Jg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Apr 2017 02:14:41 -0000

Hi Brad,

On Thu, Apr 20, 2017 at 11:54 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>>> Each gpio will have an application waiting for its state to change.  My
>>> concern was waking up x number of applications every time any gpio chan=
ges
>>> state.  Is that a valid concern?
>>
>> How many applications do we expect to be reading the evdev? What are
>> our expected interrupt rates? What are the worst expected cases?
>
> For Witherspoon/Zaius or any OpenBMC platform?  I obviously can=E2=80=99t=
 say for the
> latter case.  On a bigger/enterprise systems I can see on the order of 10=
 to 100
> applications looking at these.  I don=E2=80=99t have a good sense of how =
often.
>
> On Witherspoon/Zaius, sure, we only have a handful of applications and th=
e
> interrupt rate should be very infrequent.
>
> I think you typically see all the gpio keys mapped to a single device bec=
ause
> the usual thing to do is have a single application (Xorg) treat it like a=
 keyboard.

I've been following the discussion you've been having. I went to merge
the patches today, but first decided to satisfy myself that this was
the right way to go. I didn't arrive at the same conclusion as you and
Andrew.

The userspace use cases you've presented would be served well by a
single node. We have the flexibility to revisit this decision when
someone builds a machine that has 100 GPIOs they want to monitor; in
addition I think we would revisit the decision to have 100 userspace
programs.

By having separate nodes, you're creating a new instance of the kernel
driver for each node.

The driver, and the binding, is designed to support your use case -
multiple key events generated by the hardware.

Finally, I looked at the other machines in the tree. None of them have
separate gpio-keys nodes

arch/arm/boot/dts/armada-xp-netgear-rn2120.dts:

        gpio-keys {
                compatible =3D "gpio-keys";
                pinctrl-0 =3D <&power_button_pin &reset_button_pin>;
                pinctrl-names =3D "default";

                power-button {
                        label =3D "Power Button";
                        linux,code =3D <KEY_POWER>;
                        gpios =3D <&gpio0 27 GPIO_ACTIVE_HIGH>;
                };

                reset-button {
                        label =3D "Reset Button";
                        linux,code =3D <KEY_RESTART>;
                        gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
                };
        };

arch/arm/boot/dts/at91sam9261ek.dts
        gpio_keys {
                compatible =3D "gpio-keys";

                button_0 {
                        label =3D "button_0";
                        gpios =3D <&pioA 27 GPIO_ACTIVE_LOW>;
                        linux,code =3D <256>;
                        wakeup-source;
                };

                button_1 {
                        label =3D "button_1";
                        gpios =3D <&pioA 26 GPIO_ACTIVE_LOW>;
                        linux,code =3D <257>;
                        wakeup-source;
                };

                button_2 {
                        label =3D "button_2";
                        gpios =3D <&pioA 25 GPIO_ACTIVE_LOW>;
                        linux,code =3D <258>;
                        wakeup-source;
                };

                button_3 {
                        label =3D "button_3";
                        gpios =3D <&pioA 24 GPIO_ACTIVE_LOW>;
                        linux,code =3D <259>;
                        wakeup-source;
                };
        };

Cheers,

Joel



>
> We aren=E2=80=99t structured that way so rethinking the usual approach se=
ems reasonable.
> Another reason I went for per gpio devices because it prevents applicatio=
ns from
> reacting to each others events without any special library code.
>
> I=E2=80=99m not saying there aren=E2=80=99t disadvantages to this approac=
h - I just don=E2=80=99t know what
> they are?
>
>>
>> It's hard to judge without knowing the numbers, but considering the
>> chips we run on I agree we should generally favour performance if
>> design is getting in the way. But to make that trade off we should be
>
> Again, what exactly is being traded-off ?
>
>> clear on the performance numbers.
>>
>> Andrew
