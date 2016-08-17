Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDVBF1d5jzDr4d
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 10:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bwvlPZnp; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id u13so7756051uau.0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l8Yj2cJS3o0qhfUVPZbhWPZKUgL+1dHpsgP9hSF9TK8=;
 b=bwvlPZnppIYEVE7hX4Oy5XMJWlkw9LFLlK+eE9jBnZjZH6BSZ4RLSR+cI9ZNanGfKk
 b96m+AxP4pnRXiskxok4E5QKwbSS/I+ReX/h2BSpOBqhNHCBsy+LECB9DN4whftxon0x
 +YeIcF+vHnmYE52mLV/J0/rofJeMzw5iawcOMpQVjVsv1k4ono4+h54ppOjb5edaTwQJ
 JdjJfR2qGc5/hoq+n95duEG850qdoW2iZowFR+JRVuZ0WrX9ncXkvoTrLjkjGR6vWS+R
 0BP8fH2O1h/YccyuXGjzSRxwgn9YWxnDfFUHKYDbr3SiKvVGVBOOH0CpsFWfG3hZE43M
 C9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l8Yj2cJS3o0qhfUVPZbhWPZKUgL+1dHpsgP9hSF9TK8=;
 b=GbeU2soERKFfTAuFDA193VR0NUpiligkmePT6yncKKZg8q+D2j5XS02G7n/EKTESwp
 Yx4sU2tILyoNSNWD2Xkp1hwZ1fTyc+0vQpCIbtWa0sOPGvLMgYCGZbmgAjwQTfH1F5Pe
 fkMScpDRZz8m9dHhynUwzmSsxfsTQX4TCWZxyejh/rcocO9TsiV2TMUdnQHOstcErh74
 TaNO+qH8O0GWUV+npVI9tzg9wCau9KfpYljPz+x9xK6O+ouwkMRcvS2vuE2yGdr2uvTG
 UHBhCBE1WEb5f8s+St9jCjR+segi+SmvsmE04LLwJjIS2YSmHqLApPGtaee+q3uQkxdt
 +Cgg==
X-Gm-Message-State: AEkoouvOVOqW61qJvQT441t7+oGx5RWJwzM4RSJ0FzOEWt4II6ThWJ4QEPuypDhOl+dK+yTDCEAQWHhZeV/M6w==
X-Received: by 10.176.0.115 with SMTP id 106mr18352028uai.43.1471392946713;
 Tue, 16 Aug 2016 17:15:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 16 Aug 2016 17:15:26 -0700 (PDT)
In-Reply-To: <79e11c2d-2450-735f-094e-d43e329b4c3f@google.com>
References: <CACPK8XckyWBdN+B+ieudY8FmgOXR7N4RMGaSt2yuOyZ8tCmodg@mail.gmail.com>
 <79e11c2d-2450-735f-094e-d43e329b4c3f@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2016 10:15:26 +1000
X-Google-Sender-Auth: SgMImVcjhJrr4md4U0yu4FaZPUA
Message-ID: <CACPK8XenpYnKWwuEwvbf=ePrNZwkzMZJW=es-Gpu=VgTvD7yGg@mail.gmail.com>
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 00:15:49 -0000

Hey Xo,

On Wed, Aug 17, 2016 at 9:55 AM, Xo Wang <xow@google.com> wrote:
>
>> We need to use a mechanism to tell userspace which device is the
>> vuart. udev? systemd?
>
> I think that's covered by this userspace configuration file:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf

Yeah. Ideally we would have systemd/udev populate this configuration
file. There has been some work in this area; I think there are a few
prerequisites from our systemd setup to land before we can turn that
on.

> It specifies the VUART console device as ttyS5, which doesn't exist using
> our current DTS for the EVB.
>
>> $ ls /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/tty
>> ttyS0
>>
>> We could also set an alias in the device tree?
>
> That's how I did my testing for AST2500 EVB connected to an LPC host. This
> enabled and aliased the vuart for me (please note s/uart6/vuart/g for
> dev-4.7):

I had a similar idea. If we can't think of a better solution then I
will commit a patch to this effect today.

Cheers,

Joel

> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 28b0045..51b032d 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -8,6 +8,7 @@
>
>         aliases {
>                 serial4 = &uart5;
> +               serial5 = &uart6;
>         };
>
>         chosen {
> @@ -39,6 +40,10 @@
>         status = "okay";
>  };
>
> +&uart6 {
> +       status = "okay";
> +};
> +
>  &mac0 {
>         status = "okay";
>  };
>
>
>
>
> cheers
> xo
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
