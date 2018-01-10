Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::241; helo=mail-ot0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9EOMJNR"; 
 dkim-atps=neutral
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGp4L5QWzzF0hJ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 23:20:18 +1100 (AEDT)
Received: by mail-ot0-x241.google.com with SMTP id h2so14101449oti.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wgUhJa4WkncK8fl4rk+i3RV7A2EYEUvIg8HqV4tED40=;
 b=b9EOMJNR2e+ItfcONKyVo7Zj7fGA27LiVFXOyNtI6RDLD3BnZAPai9jgRiUWGm9sqR
 AR0E4ZcdgKzFb5yqNNGpBJ05+rQm+Izh4nfPOn+MYCAASHvrLiPRwJqwOnbZI5IQXRTT
 LQEOeJgRzMdkwR9Kze1v0OM7aJWcnKOVUfU5rRE9ArmyyBhCCAXs4Xfh5ZmyC53ZrAGh
 7AOx55EvU6snNrZQDuK1EO7QbtnL7IWq+7EV91cWqR6mOmvAsWBJ4ra45hPJo+BGuA/q
 LKwS1LsTpyYe2hK++Km4HpB5ELY2W8o3tVHZO4hdmsBOcx1ckECspbIbfoX77YsdWioQ
 jxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wgUhJa4WkncK8fl4rk+i3RV7A2EYEUvIg8HqV4tED40=;
 b=Rpnjwjr1Ko7UjcZwxElSeZvl0e5lqolqN93/2GWg4VRAPOpHkllFgQeQuUrDHD1pd0
 PJP+Q13rzGaNXRT2jTB387xfOXTWJxALf4LpanmDUHVf8oTidRlcM0P0UdoJQ0WPwnZN
 zWdAlPRh2e2FJ6DP9b5MuH51ku61XbnBFHBwpoUmFscB5cBSSQYAaKzXI0/rFHEqN2p7
 36iKg0Nfpoe4EpUtvcj3OIceEmmFCsLz3+gPP3wpHfKQjhha07NLKQCvfZ8yO7Uk+XMV
 AaEFeE02Hp1BcGgfIyEiZ6VxZmQJ29XL6cY3fDunjxDBcGVGQ1j7Hr+dnzaI9xCx4sSf
 MfgA==
X-Gm-Message-State: AKwxytdY//VZJYt+YenUUApc4SEPdfTbF+0EGyuOhPYqvGUHEYTkL0uh
 mGMsgRK8XO6zJgfLPnd8bkb6umlaWhmT4UuCUH0=
X-Google-Smtp-Source: ACJfBouHlOwmj29DFkFf5GqCFKN4ggOWHgl3PpxYjwItSDFFIPHrMIl0qz4HjIWWQ4ep2u/3aZeBROgIfqXbYoFJS5o=
X-Received: by 10.157.67.90 with SMTP id y26mr4653622oti.229.1515586815812;
 Wed, 10 Jan 2018 04:20:15 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.2.226 with HTTP; Wed, 10 Jan 2018 04:20:15 -0800 (PST)
In-Reply-To: <20180109223126.13093-5-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-5-jae.hyun.yoo@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Jan 2018 13:20:15 +0100
X-Google-Sender-Auth: iQxMNcoBbZ6TPA2AyhlCTL-3wfA
Message-ID: <CAK8P3a1qiD1sWj0oQ=WbvpEDhtcYbzCxjg7t1iPs45WamfUVgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 4/6] Documentation: dt-bindings: Add a
 generic PECI hwmon
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 DTML <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 12:20:20 -0000

On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> This commit add a dt-bindings document for a generic PECI hwmon
> driver.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../devicetree/bindings/hwmon/peci-hwmon.txt       | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
> new file mode 100644
> index 0000000..20b86f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
> @@ -0,0 +1,33 @@
> +* Generic PECI (Platform Environment Control Interface) hwmon driver.
> +
> +Dependency:
> +- This driver uses a PECI misc driver as a controller interface so one of PECI
> +  misc drivers which provides compatible ioctls has to be enabled.

The binding should only explain how we describe the hardware in an
operating-system
independent way, but not talk about how an OS is supposed to implement those
drivers.

Having multiple drivers each provide an exported function is not possible
in Linux: it immediately breaks building an 'allyesconfig' kernel, and prevents
you from running the same kernel across multiple implementations, so that
has to be redesigned anyway.

> +Required properties:
> +- compatible: "peci-hwmon"
> +- cpu-id: Should contain CPU socket ID
> +       - 0 ~ 7
> +
> +Optional properties:
> +- show-core: If this protperty is defined, core tmeperature attrubites will be

s/protperty/property/
s/tmeperature/temperature/
s/attrubites/attributes/

> +            enumerated.
> +- dimm-nums: Should contain the number of DIMM slots that attached to each CPU
> +            which is indicated by cpu-id.
> +       0 ~ 16 (default: 16)
> +            In case of 0, DIMM temperature attrubites will not be enumerated.

Is this only an initial list that you expect to be extended in the
future, or is this
a complete list of sensors that can ever be connected to PECI?

Should this be PECI version specific?

      Arnd
