Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eyPWMfql"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42s4Hk6fCDzF3bH
 for <openbmc@lists.ozlabs.org>; Sat, 10 Nov 2018 02:45:53 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id u13-v6so1096222pfm.4
 for <openbmc@lists.ozlabs.org>; Fri, 09 Nov 2018 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hav0deiyI44KgxSH+OLaEec9Q7Cb6QzJHekQOJgkWZw=;
 b=eyPWMfql6CM5+2801DtilDmtTIniWIhwKH1reuRZMD2SNHG+RMYHH5ULWXyDRICatu
 S8j02nPuTYWX3kq3VxY7ZyzUHKnWKfUrftMzMrFpPrx1Wn6MvDW3ARoL6TljhTpP8EYr
 arVIUjVTh3ZGfLQZB//loMFo2jp92EZdQxCdEKlXhz9j83+YrmCO0YPomcpB5kZJO1/a
 1RnVLlyNYHSXYz4pXbqas5ABSKs5en3XLL3uMV6BzjwAQ4j95zUmGoh0b0RgfkET4bvq
 IM5T7hcJwcbYmJj7G/mCVPoOuoU3tCd1IRgg7bxSWj0HZ/+iEGETxpVGXGbo2hVrC9PU
 BxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hav0deiyI44KgxSH+OLaEec9Q7Cb6QzJHekQOJgkWZw=;
 b=MMguUsBVQU7HEBFdPAMAqvUiC+jfSeOf1b0XyJcwZ6iRKOVhqvk2qy/vfYyMMsU8iE
 VAcyArrL+Y75Mv4sAJqZQ7QPgL28/mAEh5NtQSmg7UgyVM6GekVg5vAXXGHo3WTLcphx
 nDiimdyZmkiEIPk12NI8AIp09g/itmLR7OJaAyzwRQ0gqyPtXtB8NXWMp9VEAkg/Y45M
 CfhUJD3mLQRA3FeH74HKWK8FHz+nIE58WWocPqgAhZnolnwt4mgSKLurC51xhLJGwqAB
 VqboksjjTk6LQi7Pa6HKcjmfDAE1UCJaAB0lEj2ZZ0sWFIP0xJtcZyw2zqKbeFCj/eWf
 zOwA==
X-Gm-Message-State: AGRZ1gLerfRT+RJZf/pFwjwSWsJLKLDqCSIGlU8DVBIV0J90Dk8nnpb9
 oBFE927wEigZEkqO1ml12JGyZ/EntQy7RJqxfVy5Jg==
X-Google-Smtp-Source: AJdET5ed/Wr4ZmKxd8zv/ggYzIwEScjLP7DvN1RzuQ7C2/Pnt781GEH9l2zyuevoybFrmKScnpNyas7Jq/UJbYSajGA=
X-Received: by 2002:a63:4d:: with SMTP id 74mr8070516pga.248.1541778351476;
 Fri, 09 Nov 2018 07:45:51 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR02MB4393A3457D05909DB01F6D2292C60@DB7PR02MB4393.eurprd02.prod.outlook.com>
In-Reply-To: <DB7PR02MB4393A3457D05909DB01F6D2292C60@DB7PR02MB4393.eurprd02.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Nov 2018 07:45:40 -0800
Message-ID: <CAO=notwh6fFMxxQ3eoEF44edJkQTw6OqcqDY7jLvNu-HC5M+BA@mail.gmail.com>
Subject: Re: help: OpenBMC phosphor-hwmon-readd support for non-hwmon drivers
 in linux.
To: maheswari.a@atos.net
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 09 Nov 2018 15:45:56 -0000

On Fri, Nov 9, 2018 at 2:48 AM A, Maheswari <maheswari.a@atos.net> wrote:
>
> Hi,
>
>
>
> As of my understanding, we need to add chip specific driver support in linux hwmon feature to list the sensors in OpenBMC webUI.
>
>
>
> 1082 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/pxm1310@XX
>
> 1083 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/ir38163@XX
>
> 1084 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@1c0/mpcie_bmc_temp@XX
>
> 1085 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/pxe1610@XX
>
>
>
> I have added some PMBUS driver to get temp ,input values of VRs and I used exiting lm75 hwmon driver to get temperature sensors.
>
> Added OpenBMC configuration files also.  So, I am able to list some sensors  and its exact values in openbmc WebUI.
>
>
>
> Now,
>
>
>
> I need to add some more temp sensors which is connected to PCA95X chip channel 0,channel 1.
>
> PCA95X driver is already supported in linux/driver/i2c/muxes/.   But NOT listed under hwmon features.  So This chip attributes will NOT be registered as  hwmon sysfs attribute.
>

So if there are temperature sensors beyond an i2c mux, I assume you
need to add the temperature sensors to the device tree as nodes beyond
that mux.

Here's an example of defining nodes behind the mux:

&i2c7 {
    status = "okay";

    /* 0: PSU4
     *    PSU1
     *    PSU3
     *    PSU2
     */
    i2c-switch@70 {
        compatible = "nxp,pca9546";
        reg = <0x70>;
        #address-cells = <1>;
        #size-cells = <0>;

        i2c_psu4: i2c@0 {
            #address-cells = <1>;
            #size-cells = <0>;
            reg = <0>;

            psu@59 {
                compatible = "pmbus";
                reg = <0x59>;
            };
        };
    };
};

>
>
> If I want to add this temperature sensor in OpenBMC webUI
>
> Should I add this PCA95X driver code under hwmon?.  ( with hwmon_register and hwmon_unregister).
>
> Please give your concern , is there any other way to add sensor attribute path to  phosphor-hwmon-readd daemon in OBMC.
>
>
>
> Thanks
>
> Maheswari A
>
>
>
>
>
>
>
>
>
>
