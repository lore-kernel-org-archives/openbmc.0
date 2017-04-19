Return-Path: <sjg@google.com>
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com
 [IPv6:2607:f8b0:400c:c08::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WJ057NzDqC4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kBi80gMR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="mkqJUnrf";
 dkim-atps=neutral
Received: by mail-ua0-x22a.google.com with SMTP id q26so5289511uaa.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QugHAREegrAtjfMjcT91Ga4zkC7Y+He4/yb3ifF6EEA=;
 b=kBi80gMRIdWuyppXgCWiiI/lO5J5BvVOO3hkVO60R/Xpsrz9hMa15z01a5HSUUPB5Q
 CcQrgnQUDQkePU2I94Qe57wchZD82ZQXPC3iXvMeSIEw6/dYQI0lgA9yN/L6pQDo4WLd
 dzKEqk14SxMUfcesEuaT/n8pXmxfebFBhEJlocjuYY3PJnHVgz4SkdLs/uI2eQCqS1Hi
 xQdHBnHKMVouCbeuqAsHN2jxHovRu1Y2GW4sZ5/6V1fF89URh3ltpsoB6ALZ8B/Z/PTD
 aNSMygPwktP+uGZFoola3yhF6RADhAMDIhUdxRb34XxDDxkcU9yLjH8rvZE80znyI30c
 49zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QugHAREegrAtjfMjcT91Ga4zkC7Y+He4/yb3ifF6EEA=;
 b=mkqJUnrfQlTAIcxjSi5bmPv4QxZdXQyUTLaWRiC5plK2UcsZId55akkkRHfxo76lsk
 lCERlDwpokE/rfnJi0q2Z3YLItHe8dujGs0Ru9RKpTSgbBDzi7LBB+7ChBuPL4/pgsyb
 UXtU7sVgHPTwzvld/o6KiAZ+5N987FROLSuv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QugHAREegrAtjfMjcT91Ga4zkC7Y+He4/yb3ifF6EEA=;
 b=NlHTOzkkEZCJpDPYvJ4jR0zen8vJw+dkznZmMP5J1j4dUw9KjGiZdSAKaik/krFfkg
 T3XgaEDV7Zk4HRPnb4QkKZdF2/1QleoVqgbtXvvHBOeuexB0d14HWmwBc8PgHOMl+wCx
 V/M4qz5d64pKTvpHppgj7zgleZDsG9JmCZYGrtboVR+AJEl9Sn06KCUAK+sYxc9PzDK8
 fBLV872Q6QJnxBnF6SQx5YksorpXb2z9sEfYJuYVKUtnbRhy4b1LiN4GgwotS7lCYFSe
 wNmjn7P6tZA5kbI2vRLt/0bVZtoWBDLwpuNqELaP9MgOqHevZgahYBk2Hfq79Xy168O2
 2ZGg==
X-Gm-Message-State: AN3rC/4Zr+MWB0g84f5QJES83wQikwvTZX9SjgJ3pNtfH6MG24KwQyvc
 p4p9hWn9PFCAI6AKS1aDu4o9Z2Q5NbxxrcM=
X-Received: by 10.176.4.117 with SMTP id 108mr38618uav.134.1492560745909; Tue,
 18 Apr 2017 17:12:25 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:12:05 -0700 (PDT)
In-Reply-To: <20170417190034.71945-13-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-13-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:12:05 -0600
X-Google-Sender-Auth: GuU_M1Xdi7y3dRjdrjnTcl9Wuvw
Message-ID: <CAPnjgZ2_3vcuoxgy0Y-mjkAwY9nGsUEJ7_ynve=3BDJH5im+jg@mail.gmail.com>
Subject: Re: [PATCH v1 12/15] aspeed: Enable I2C in EVB defconfig
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:28 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Enable I2C driver in ast2500 Eval Board defconfig.
> Also enable i2c command.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  configs/evb-ast2500_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
