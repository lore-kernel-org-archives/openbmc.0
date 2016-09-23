Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgMLZ0fP9zDsmt
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 15:27:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZdGcfE95; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id u68so969099uau.0
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 22:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KqvOdbZ8J+Tq5SLmycHEPVzXcfFs/+fJFDmMZLdpyc4=;
 b=ZdGcfE959QVFSc6p0Sj1xOMyAnl7dV5g79/RoURdszpbdwvFpILuRP42NUQ+Y/1wzO
 VnJHqlUxnJ9DT4WP9THBsVU0qmAjZZAZRpjMMjfM9RNAHBwHilz0r4vDn/wP2uxZfFwH
 16o0Ix6zDGfHXC89kRtul7vi1WjfYEdQJSrV8XkayiRiV48juzx7Sj6252wvH7lEuZCc
 uxp6RWXy+0v8cuGoR4mTaJtX0Kt+kQBLGYQzCKmFYJk3CFKkFiaSxJ64gT0tfE+rimy3
 Jq97rrv+xFBQnSnM9h0eevnrdPQY24qxwhzaj3vsf9UcEzXaGPBdZJcwertGCdgQxJ6s
 6C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KqvOdbZ8J+Tq5SLmycHEPVzXcfFs/+fJFDmMZLdpyc4=;
 b=LLLpRgNhW7NZtp6tbyjMSxor0Fi6sUXsugyqbbL06SVNpH4FSgMOJmleZ6u8cEJfca
 0xgTIwYx4CAq2+VsfkBJ1eIyi+VtHyrRG8V+9rNOrPz2hxTb/DmwpoxaI8kFF35bUHee
 63uhZwC1zpcf5Nr/71f6epnL3vuQcwj8EtSba7IjhDWsA2+CrNlutfanVaepjSf9kMI4
 /IH2rOMroXkHAT/HCgyb0ZKK1RowCFZdNV+jFBXGkeirS4LgACjs3C3RB8Hk9/QgC137
 2mEiq/UkWdFh3Sd6+AxNRXsalG5dYf8rhwCcOviPnDdzor6jnu2pMs7bMnV8ZXPlEe+N
 sXqg==
X-Gm-Message-State: AE9vXwPg8iCnM7dnTmRJzeAgKXYOexxZ56IHrK/7CjIRtzgWdOY9cg4dTAw4fgqNcTB4U4I2GACeFzm8IFtKZQ==
X-Received: by 10.159.36.177 with SMTP id 46mr3078433uar.78.1474608436031;
 Thu, 22 Sep 2016 22:27:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 22:26:55 -0700 (PDT)
In-Reply-To: <CAPH-5w4jbigkRRKvOs9hT_kvCyGSMG8bL=j5=z6cyDND52mdYw@mail.gmail.com>
References: <CAPH-5w4jbigkRRKvOs9hT_kvCyGSMG8bL=j5=z6cyDND52mdYw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 14:56:55 +0930
X-Google-Sender-Auth: 5PRPxTMpJlVSykQzsVkZMorfuCo
Message-ID: <CACPK8XeN110qizi9jBRsK643Lp_uJWeUsKEA+paaqgo5Dw7K4A@mail.gmail.com>
Subject: Re: Skeleton power control machine configuration
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 23 Sep 2016 05:27:18 -0000

Hey Xo,

On Fri, Sep 23, 2016 at 10:28 AM, Xo Wang <xow@google.com> wrote:
> Hi folks,
>
> I was adding power sequencing and buttons for our P9 machine and I
> noticed that Firestone, Garrison, and Witherspoon had patches to
> op-pwrctl that replaced the net names on the power pins, added more
> reset complexes, etc.
>
> https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
> https://github.com/openbmc/openbmc/blob/ced4c34ee252d0036b714425eecb0ed8bb528750/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
>
> I didn't want to do the same for our machine. I propose moving machine
> specific options to the Python configuration so we can eliminate the
> skeleton patches.

Great! This was an area of concern for me as well.

I'm not sure what the future plans are for this part of the codebase.
I think that fixing it to remove the out of tree patches and enable
new machines is great for the time being. We should check with Patrick
and Brad as to their plans for the future, so we don't waste time on
code that will be reworked.

>
> I mailed my prototype to the Gerrit that adds a dbus call to
> system_manager, C bindings, and power control logic to handle the
> abstraction. Please take a look.
>
> https://gerrit.openbmc-project.xyz/#/c/605/
> https://gerrit.openbmc-project.xyz/#/c/606/
> https://gerrit.openbmc-project.xyz/#/c/607/
> https://gerrit.openbmc-project.xyz/#/c/608/
>
> I'm planning to also extend the GPIO/net name abstraction to reset and
> power buttons, since they're also using net names directly in their
> sources.

I had a brief look at the patches and they look good to me. I left
some minor comments in gerrit.

In the future we want to ensure that all of the GPIOs are configured
correctly to a known state at BMC boot.

Cheers,

Joel
