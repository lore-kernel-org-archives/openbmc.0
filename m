Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W4c37Lrj"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kQxD6c00zDrP3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 07:21:51 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id q4-v6so5832867iob.8
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VGpz0pPFr/WjkfyRARlME8X0Ya2Wf3uXpp6ohQfnPM=;
 b=W4c37LrjNvPQCgQYilDFzG0O8oLm+JNHQCGNUf8pQKD6BP+6x7Qi7GyK454ucjv/Nk
 qywsNQFrgkrWMESCt6lboRCNRNKkmS1Z8cJrZTbFJd+OHwGWPj3SJiLJUcZS0sqrtegH
 yAgQMXwkbhnPlwSP/gJIb8p6ShXmNux73yYHBSc/bstl3lSU6SNeqHmxv1b1xUMFC0HR
 igHFSyQOZ4VfFfjwnCI57ctWiNvRFqHVSElsBzwvZUtdCThRlRq8mozuPBucNFZ89RYp
 hcExpb3r2wwEnvpj0EPpyuFlyD7Z4GrDDYP22dnP6keOSECo56cpt4oMxP2RppBzDzbf
 ttfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VGpz0pPFr/WjkfyRARlME8X0Ya2Wf3uXpp6ohQfnPM=;
 b=Mgch7hntTJ8h/FE6p8y/eMDtQZPaQjeY7IukSc9N25HsuuE7/kPFhgEpfNjmqRdFkF
 bhdSqfwnw1W3kr4K74EKmt+fE+sSQQfr9bOVq3Tngb37jiLEoxrft7pLeyGK8myycjHV
 nI68m90PV4vIqE44+f70Gh1+sTZBBVqDwTF3SWT2qbGOa1m5QJTbhCkOmts8bFgHP/p8
 /pdbFhaNsF7r3KUVYECniboecL6MFV63aKRAwUdj5+ha8aVwNoAMiZz5WKVBY+ngZyqN
 9QiBiqZkP3xI6fnpDrdDEAaDDNH0DahGpSc0Xie1HiI6XJXRfPkQQxOiMdjuKMITYEee
 mZAA==
X-Gm-Message-State: AGRZ1gKgd967be3k2nkCiRE8mkGSIeIZ3lZcu+CX1AxxG+LzjnPV3uo+
 /A6Ov64CGFrUBMPtLrIfqpbh40GcYHek+yT9eqQPZA==
X-Google-Smtp-Source: AJdET5fUXEC2NmSa+EcduL0FzfgvXi28Ovm2vpn0cRzfozolMgWdXTpv3GiqN89phwMbZ6lt08qQKPACTtn5Rb9kVjU=
X-Received: by 2002:a6b:9046:: with SMTP id
 s67-v6mr8927335iod.295.1540844509710; 
 Mon, 29 Oct 2018 13:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20181017222639.254434-1-kunyi@google.com>
 <20181027172833.GA25052@roeck-us.net>
In-Reply-To: <20181027172833.GA25052@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Mon, 29 Oct 2018 13:21:23 -0700
Message-ID: <CAGMNF6Xg28hm05wPXtq9bqssoNmgrzFGQiG4P+vLyXKvzvdJCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hwmon: (adm1275): Allow setting shunt reg value
To: Guenter Roeck <linux@roeck-us.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jdelvare@suse.com,
 corbet@lwn.net, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2018 20:21:54 -0000

On Sat, Oct 27, 2018 at 10:28 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Oct 17, 2018 at 03:26:39PM -0700, Kun Yi wrote:
> > The ADM series of hotswap controllers support extending
> > the current measurement range by using a sensing resistor
> > value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> > sensing resistor doubles the maximal current can be measured.
> >
> > Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> > meaning for other resistor values, hwmon will report scaled
> > current/power measurements. This patch parses device tree parameter
> > "shunt-resistor-micro-ohms", if there is one.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> > Changes in v3:
> > - splitted hwmon and device tree binding patches
> >
> >  Documentation/hwmon/adm1275   |  3 +++
> >  drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
> > index 39033538eb03..5e277b0d91ce 100644
> > --- a/Documentation/hwmon/adm1275
> > +++ b/Documentation/hwmon/adm1275
> > @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
> >  or current scaling. Reported voltages, currents, and power are raw measurements,
> >  and will typically have to be scaled.
> >
> > +The shunt value in micro-ohms can be set via device tree at compile-time. Please
> > +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
> > +if the device tree is used.
> >
> >  Platform data support
> >  ---------------------
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 13600fa79e7f..f569372c9204 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
> >       const struct coefficients *coefficients;
> >       int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
> >       int tindex = -1;
> > +     u32 shunt;
> >
> >       if (!i2c_check_functionality(client->adapter,
> >                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
> > @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
> >       if (!data)
> >               return -ENOMEM;
> >
> > +     if (of_property_read_u32(client->dev.of_node,
> > +                              "shunt-resistor-micro-ohms", &shunt))
> > +             shunt = 1000; /* 1 mOhm if not set via DT */
> > +
> > +     if (shunt == 0)
> > +             return -EINVAL;
> > +
> >       data->id = mid->driver_data;
> >
> >       info = &data->info;
> > @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
> >               info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
> >       }
> >       if (cindex >= 0) {
> > -             info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
> > +             /* Scale current with sense resistor value */
> > +             info->m[PSC_CURRENT_OUT] =
> > +                     coefficients[cindex].m * shunt / 1000;
> >               info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
> >               info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
> >       }
> >       if (pindex >= 0) {
> > -             info->m[PSC_POWER] = coefficients[pindex].m;
> > +             info->m[PSC_POWER] =
> > +                     coefficients[pindex].m * shunt / 1000;
> >               info->b[PSC_POWER] = coefficients[pindex].b;
> >               info->R[PSC_POWER] = coefficients[pindex].R;
> >       }

Thanks!

-- 
Regards,
Kun
