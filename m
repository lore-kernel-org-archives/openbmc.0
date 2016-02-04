Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 27BD41A007F
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Za844sOu; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=RcCTckRm; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id x141so257044oia.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2016 16:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=zeCfHql2/GwSrfHq6as6m+7X4yLNZE6kKx52v7NZvO4=;
 b=Za844sOuyYIupaVFRIokw5bkJhk8PU8HuOr90HsJ2w1nManznoN0rAyPUcPh3zicgQ
 WCxkLL7mMyoh3SF6JN/eXW8/71PQmMpmJo+QrNuedJCPujMaHl6cmOHIklENc+DACREs
 sZNd33lHWjM8HFFNYs1xx78F9yhlC3k0doMJyp+rm8nQZtof97DI6akrj3xRtIx3GII/
 XdJ0DA96HzXkQRDBkExBI/M99Aw1fE7I81XI4wQYU5ews8quy6cMLIloSEo4KtAexeA6
 Ecm6M69g+Mtx9hpf9HqTGCDRp5UA/4o4+1UjPKLJCgZxrZRWJeo4J6vZu7M9FPLmQhN7
 8jPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=zeCfHql2/GwSrfHq6as6m+7X4yLNZE6kKx52v7NZvO4=;
 b=RcCTckRmbj0mkr8J461KZPzXXeJ1L/qycsBZ0Bb3ZDNNlre8GPQIxkJxU0lidDOJJ5
 to6444o60CLGkrTPwcHdPpmph//VSX0tORo1C4wDPP7XZB+E/ksNWA3npRgmwz3HUGjX
 4loOyMESSJKxKck6drj7fDrHGl1QLSC18DxZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=zeCfHql2/GwSrfHq6as6m+7X4yLNZE6kKx52v7NZvO4=;
 b=in/xU2ZFgOccpy4JV/sdbhP8pIhLeZ59lzozOBa+rPTrRquCtUAupA3KtDeT3y2w/R
 FO9AMugtstCOHZc+y27Fhp78qbyAJET+qVNRcZAkc7CpMaV1CgTElGmwKnr+uOG2waIv
 W3l5gPI5HgiIQoU4GRuc0t/ipnCFkhnbBs+ScuTNsFftpsZ5p5OYxRUM3/pQPxU7HZzq
 GdbvTInpmTFvvfoGZ9DwIsj7+KztsAA7Lh033jdEUufxnsqGUyWh/EVfInWIgeJuVezF
 4FArtDIzm4HwpAfOCspp3SJ4J1FIBJgZy+S1ldAxiDFsPnemDbJEVtl0WNlr+rW0DgKJ
 ejzQ==
X-Gm-Message-State: AG10YOQxSzoJl1tLdAo0ehBzCgowBpZreQHVkKxfjgYYjzswodYWu5cRxC8cad/04yJM4gvWMu1yjUVSR8+fSQ==
X-Received: by 10.202.58.133 with SMTP id h127mr1218494oia.71.1454545306468;
 Wed, 03 Feb 2016 16:21:46 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Wed, 3 Feb 2016 16:21:27 -0800 (PST)
In-Reply-To: <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454542828-19634-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Feb 2016 11:21:27 +1100
X-Google-Sender-Auth: _EDrArdJqQ_Ub97hb7ZrzAfKQho
Message-ID: <CACPK8XdtDEeK2+CZe+me87DG+sbMSMkz4f=F35-OUE34pA7ryQ@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] Add Set MAC address
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Feb 2016 00:21:50 -0000

On Thu, Feb 4, 2016 at 10:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add Set MAC address parameter command

I notice you posted this patch 40 minutes ago, but had already merged
it. That doesn't give much opportunity for review.

> ---
>  transporthandler.C | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/transporthandler.C b/transporthandler.C
> index dac8fe8..c38adea 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -14,6 +14,7 @@
>  #endif
>
>  // OpenBMC System Manager dbus framework
> +extern sd_bus *bus;

Don't use extern.

We have ipmid_get_sd_bus_connection() to get a pointer to the sd_bus.

>  const char  *app   =  "org.openbmc.NetworkManager";
>  const char  *obj   =  "/org/openbmc/NetworkManager/Interface";
>  const char  *ifc   =  "org.openbmc.NetworkManager";
> @@ -64,6 +65,37 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      {
>          sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
>      }
> +    else if (reqptr->parameter == 5) // MAC
> +    {
> +        char                mac[18];
> +        sd_bus_message *reply = NULL, *m = NULL;
> +        sd_bus_error error = SD_BUS_ERROR_NULL;
> +        int r = 0;

I don't think any of these should be initialised here.

> +
> +        sprintf(mac, "%x:%x:%x:%x:%x:%x",

You want to use snprintf here.

Also, does this work? I would have thought you'd need to do %02x to
ensure leading zeroes are in the string.

> +                reqptr->data[0],
> +                reqptr->data[1],
> +                reqptr->data[2],
> +                reqptr->data[3],
> +                reqptr->data[4],
> +                reqptr->data[5]);
> +
> +        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"SetHwAddress");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
> +            return -1;
> +        }
> +        r = sd_bus_message_append(m, "s", mac);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
> +            return -1;
> +        }
> +        r = sd_bus_call(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
> +            return -1;
> +        }
> +    }
>      else if (reqptr->parameter == 6) // Subnet
>      {
>          sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
> --
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
