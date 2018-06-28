Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cq1Fh1jP"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AKHLUik8"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRCz22rvzF1Nv;
 Thu, 28 Jun 2018 14:11:11 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id a18-v6so3619204qtj.4;
 Wed, 27 Jun 2018 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=63FjX8/Lp8zUpdTzvr/i4TngrssoilA97lbPMie0R8g=;
 b=cq1Fh1jPnNljPHQ+e5WMzo1XsMlVyOXS3v/URCy34IBQg2rWFw1UrqoZXCSSYmoQnz
 Axq1yD8CxKmRc/OmMFk9wHPgKoU0L6JdLzZKJIvVQhLJNs0nyDASM3eUtE62TY9ahTQ1
 1oaU8/dWvnuQnWxX2A+WI7tw2gGZmvZNTxK7cQJ5GJ8ku5ZjlQOQfIkOGvBQ5HtVtwOR
 sWqMT69amtb2Pt+VpcInZTVyDO4lIm7mEFiPxS6CxWoxFIcEoS9RlbOY6B5ifFr1l+F/
 vqhcXSFyoFss5TeuWMo0xyCEpqkuTfC4Y2In7UQQkzr7jSLG7MHay0w2m5z9oh0OKfws
 tnTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=63FjX8/Lp8zUpdTzvr/i4TngrssoilA97lbPMie0R8g=;
 b=AKHLUik8k5/ZUbkQowLoGTOJfRI7fV21itE3kxcvCYta8xM+kcSE+32b8SuEsx0YtN
 o+vMbd/l67Dn5pWiYF7ELzLmsYSGHPy0r1dX9GbGpK0PNr2+ZzSBLeW/kJ3NrQgVQiGm
 4fAIC+CqXHVk2HsVHrs8JWFLopvZ9dIv2I4eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=63FjX8/Lp8zUpdTzvr/i4TngrssoilA97lbPMie0R8g=;
 b=rebc2C6RwdyCYAQv3JXpdWuEib4vKKM1B/c300/RxkHOeZ7h1LhnhQ/sGX7bakIP7C
 Sa0qAjEqNfVSjmtk1zFEBdXna/hHhoJMfuOiIDqjmfTvwTtRePlZ0RqwMnLLTAAI71id
 wRFCUnzXqsDBiLoyLOKZcKdpcunQGyijV4r8oZSsa1W0iP1O9XvVMv5T3IA19LGDL56/
 KKMUtCknkIHEW1msEO7ZXyXHAK1H8hk20U7SY4Ww8P8DNjbAou9idC9/ZG2A48o/EHUj
 hVauOdIJGAdDzEwhx7eYkMIVNUeBAyJXzZL6t5TX5nVq40mKYIg3Nzb88eiaQtmS+MQN
 NidA==
X-Gm-Message-State: APt69E1X/b/cX6efC7vtNIro359Mu57sXgA3Lg52YbsfeDDm1ADw9oP0
 Ze5Cvi2ZG1EL1T9wJLo4TbvJ0/PjUagJSXsjS64=
X-Google-Smtp-Source: AAOMgpfGXW7ywdV9Ne5HwLCNkYO5UIGU4Mqz6lesJCVez9qUpfwirlxGVuXVZBotu8DbQe6sm9ZerFI4Hu5Tv2TqV+0=
X-Received: by 2002:ac8:322:: with SMTP id
 q34-v6mr8030072qtg.342.1530159068884; 
 Wed, 27 Jun 2018 21:11:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:10:48
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-4-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-4-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:40:48 +0930
X-Google-Sender-Auth: t-uHfmHljyQ0W6N2rwpp_cpC8CA
Message-ID: <CACPK8XdRk+qgomCV3wZfje_SzLEV12jnqfD_idXOwH=qoZOXZg@mail.gmail.com>
Subject: Re: [PATCH 03/14] fsi: Add mechanism to set the tSendDelay and
 tEchoDelay values
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 28 Jun 2018 04:11:12 -0000

On 27 June 2018 at 08:55, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Those values control the amount of "dummy" clocks between commands and
> between a command and its response.
>
> This adds a way to configure them from sysfs (to be later extended to
> defaults in the device-tree). The default remains 16 (the HW default).

We should add these to  Documentation/ABI/testing/sysfs-bus-fsi.

> This is only supported if the backend supports the new link_config()
> callback to configure the generation of those delays.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> ---
>  drivers/fsi/fsi-core.c   | 109 ++++++++++++++++++++++++++++++++-------
>  drivers/fsi/fsi-master.h |   2 +
>  2 files changed, 93 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 2f6f9b8c75e4..1ae5be31b4bf 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -81,6 +81,8 @@ struct fsi_slave {
>         int                     id;
>         int                     link;
>         uint32_t                size;   /* size of slave address space */
> +       u8                      t_send_delay;
> +       u8                      t_echo_delay;
>  };
>
>  #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
> @@ -239,15 +241,15 @@ static inline uint32_t fsi_smode_sid(int x)
>         return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
>  }
>
> -static uint32_t fsi_slave_smode(int id)
> +static uint32_t fsi_slave_smode(int id, u8 t_senddly, u8 t_echodly)

Can I buy you a vowel? :)

>  {
>         return FSI_SMODE_WSC | FSI_SMODE_ECRC
>                 | fsi_smode_sid(id)
> -               | fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
> +               | fsi_smode_echodly(t_echodly - 1) | fsi_smode_senddly(t_senddly - 1)
>                 | fsi_smode_lbcrr(0x8);
>  }
>
