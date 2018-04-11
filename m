Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bmoRQj0m"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="OSiQOki2"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Lj866mbBzF1RK
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 21:52:22 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id j73so1454954qke.6
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
 b=bmoRQj0mrGyq+dHmo9cnULc57DwCEtae8fKZTvjR1nvOIXGM7K7G/zFIjfu1wMjtoc
 /q2NBCQzjoBZz7QYYUNzUyegu2x8FkrlJ8mORB9YZKGK0XuEAfW/7luMdS6lglZIyolp
 few/sOWReu/YHjtgGeLMoTJQXqaUHWqsVqN5b8HwQbqrDVnPgLUk9tIKl0d0B5syQ0fK
 VPFSsV8OQHXP3HT4mKw/lm4Mn99OL12IHACRk5qiEVvsa+YLnTGoyuXI+lr3lXVbybMG
 m4hv6GwkORVHKSfNAIhlBg0i8bNfCe500RO57OluhUFhQgV1H9k9XaqWj4N4ijGTT00i
 r3fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
 b=OSiQOki2oXk20DpTJYiD+4sVCSFDLGpRXDancjoHG83KuM53RmSAD5NCTsKTqs5bIp
 QbCbHZYf1qDWa9CV+ruoF9MfkIu7ZOi9lZcdd4355i98vv/tO3sRILqW0lgrV52WfuFI
 K3e5fPYdtCraGKvErUsGwSoXofdNN21yKleDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
 b=T63T5Hwa3ErMG4grGLaitFHsqTqsMVYR/0PtGzWaVEULxBdsr3rIKNbkWepOrQ+tVg
 04qJzuiojtLTA54wOqsyc2IaXHa+ANwsuqs/TsibZ3M2TGjthl8/k3zeEUny8+u1uApu
 TwKfm6sC3lgN2yp6Pdfp6jBWCrK/J7xyZADGsGMlc5JMXvc58/WP3dsPmQUhbjd2z94y
 x44Hu9oA+aIwOkv6hJSjfHN0Jq7EKHQkMRqO9Wm6viELnQyEN90Qxpt9fTbx/eh4TSJo
 jX6KbIfpmwvRotkFTFGLN3PHPrcctgwv3Hu9XG2CKUhFoGYhniVrGWqwYiL5ck+yqw6y
 eJ3A==
X-Gm-Message-State: ALQs6tD2DJw8mP+Ruo/gSX1rL0R6yfGiOT+DlhvRCvxk9YFF1DJie/+I
 tiGj3SaNAds87L2SuXHTkutKiCQ2WnBbxmTRxeI=
X-Google-Smtp-Source: AIpwx4/W6HosTJLpgajgov4mosY8NK7oZ+9TfAI+BLxUlxvc2rWUAvg8E5rgTJQwCy96nxxN9Q4nnbl74zsYAq6rK0U=
X-Received: by 10.55.246.26 with SMTP id y26mr6235208qkj.127.1523447540754;
 Wed, 11 Apr 2018 04:52:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Wed, 11 Apr 2018 04:52:00 -0700 (PDT)
In-Reply-To: <20180410183212.16787-2-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-2-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Apr 2018 21:22:00 +0930
X-Google-Sender-Auth: DmTtIusvZxLPm4AV0-klbDdTn2s
Message-ID: <CACPK8XfwVTKfOQSteY8-Dy2=YiC6qjd1qZ2f8n1hTv8w06DWRg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Documentations: dt-bindings: Add documents of
 generic PECI bus, adapter and client drivers
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>, 
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 11 Apr 2018 11:52:23 -0000

Hi Jae,

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds documents of generic PECI bus, adapter and client drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Julia Cartwright <juliac@eso.teric.us>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>

That's a hefty cc list. I can't see Rob Herring though, and he's
usually the person who you need to convince to get your bindings
accepted.

I recommend using ./scripts/get_maintainers.pl to build your CC list,
and then add others you think are relevant.

I'm not sure what the guidelines are for generic bindings, so I'll
defer to Rob for this patch.

Cheers,

Joel

> ---
>  .../devicetree/bindings/peci/peci-adapter.txt      | 23 ++++++++++++++++++++
>  .../devicetree/bindings/peci/peci-bus.txt          | 15 +++++++++++++
>  .../devicetree/bindings/peci/peci-client.txt       | 25 ++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-adapter.txt
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.txt
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-client.txt
>
> diff --git a/Documentation/devicetree/bindings/peci/peci-adapter.txt b/Documentation/devicetree/bindings/peci/peci-adapter.txt
> new file mode 100644
> index 000000000000..9221374f6b11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-adapter.txt
> @@ -0,0 +1,23 @@
> +Generic device tree configuration for PECI adapters.
> +
> +Required properties:
> +- compatible     : Should contain hardware specific definition strings that can
> +                  match an adapter driver implementation.
> +- reg            : Should contain PECI controller registers location and length.
> +- #address-cells : Should be <1>.
> +- #size-cells    : Should be <0>.
> +
> +Example:
> +       peci: peci@10000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10000000 0x1000>;
> +
> +               peci0: peci-bus@0 {
> +                       compatible = "soc,soc-peci";
> +                       reg = <0x0 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.txt b/Documentation/devicetree/bindings/peci/peci-bus.txt
> new file mode 100644
> index 000000000000..90bcc791ccb0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-bus.txt
> @@ -0,0 +1,15 @@
> +Generic device tree configuration for PECI buses.
> +
> +Required properties:
> +- compatible     : Should be "simple-bus".
> +- #address-cells : Should be <1>.
> +- #size-cells    : Should be <1>.
> +- ranges         : Should contain PECI controller registers ranges.
> +
> +Example:
> +       peci: peci@10000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10000000 0x1000>;
> +       };
> diff --git a/Documentation/devicetree/bindings/peci/peci-client.txt b/Documentation/devicetree/bindings/peci/peci-client.txt
> new file mode 100644
> index 000000000000..8e2bfd8532f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-client.txt
> @@ -0,0 +1,25 @@
> +Generic device tree configuration for PECI clients.
> +
> +Required properties:
> +- compatible : Should contain target device specific definition strings that can
> +              match a client driver implementation.
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +              clients is starting from 0x30 based on PECI specification.
> +              <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
> +
> +Example:
> +       peci-bus@0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               < more properties >
> +
> +               function@cpu0 {
> +                       compatible = "device,function";
> +                       reg = <0x30>;
> +               };
> +
> +               function@cpu1 {
> +                       compatible = "device,function";
> +                       reg = <0x31>;
> +               };
> +       };
> --
> 2.16.2
>
