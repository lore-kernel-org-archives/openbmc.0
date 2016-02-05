Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 66BF01A0221
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 16:15:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iigO5g4k; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=AQvVOLbw; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id h77so1666046oib.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2016 21:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=cK0prUjl0Kl2jO4A+sGZ8gW83U/RKFsP3uIL3ecmVoE=;
 b=iigO5g4kHbtloESgBXjxSNsKJRyTFvBkGOQOmgA8FDv6c6bQR4Lg0spO+ZUDhJvWNh
 YSn3ZXFOJg94ZbOIDDZJXMaEDKcxCtQyRoYgjXatF6MPHfaKb8WkdaX9VW/P8YlBetSv
 yq0lFtGYbROvYvXXoeAcxaSw77iQNjnoQFgSky+TVfGTSLA2AxNEJBMyBd3vO9/rFyY4
 z2y2Q+R/ccyvgUUbcEG0te8yhn+RVecFoPwEUSTcEmWbaOntrsJXFx06nqbGo6g749HL
 2abyA3j3DqWGf+freNOyQvMohnRlBK8aKRLeulPOG0mGMck+vDdm35x1STjTFBzgukAb
 ET7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=cK0prUjl0Kl2jO4A+sGZ8gW83U/RKFsP3uIL3ecmVoE=;
 b=AQvVOLbw5FE9yaLXxitFbbWyyjU9Slvxh8FIo3xVGZ64DHqUVUMMnVnZrgZGMC0uXp
 0syLnqs679EtC5+9crVAHMDPZ06abD7WOAB31A+HaGIlBbXENJzwfJeD67X4aaJVNGZV
 ueBi9mCpXMZEvLAjxjm5SwB4+fSSV2JxEI9pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=cK0prUjl0Kl2jO4A+sGZ8gW83U/RKFsP3uIL3ecmVoE=;
 b=A+KvUb+dxC1uPJaGfYodW4pRUxfbEzmxYNNkNsTAA6Oyya+PpNxg1lWb4dk1iC/vuG
 rapKpIqL1yr030Cz25tl2qCqZgQBLmNGmqZOQj6I2dMNNzsF94KeSPcp8LRrSrn9DY4B
 NntnhD66fiM/vBzUrvlfKxxUSWdQK8Q90JCqGwnKg421mjLEW+36xGI3dZjxeCySrTDw
 K8YGDBnmWtqLtXVWYrM8vshCHEDGa3drQfSo20/tEWfkcGyLRILxjjFjr/FBAcMYZo9z
 caZRvRNl9rx174GYYY364aCvaIEB8k86xLe9Fx4CTEuC/0y0dyWRBaTJpgmg2iiBn4Y3
 Rd0g==
X-Gm-Message-State: AG10YOTK7VFraStzVLv+5DPGLxsx74/0EOnb/piguM5Ac33Izx35gnUcSIrYZaZ/yZrMDotxuzW7lUji1dgHWg==
X-Received: by 10.202.214.5 with SMTP id n5mr6767630oig.119.1454649299566;
 Thu, 04 Feb 2016 21:14:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Thu, 4 Feb 2016 21:14:40 -0800 (PST)
In-Reply-To: <1454619032-21755-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454619032-21755-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454619032-21755-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Feb 2016 16:14:40 +1100
X-Google-Sender-Auth: 5qFQMJ2s5baEHfTgB9gEHZm1Tpg
Message-ID: <CACPK8XcwNvhsUNgxriM=yaf2bKnhGzAuqfx45vbRPz6UshgfYg@mail.gmail.com>
Subject: Re: [PATCH phosphor-objmgr 1/2] Discard existing interfaces
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@us.ibm.com>
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
X-List-Received-Date: Fri, 05 Feb 2016 05:15:02 -0000

On Fri, Feb 5, 2016 at 7:50 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>
> Avoid the need for syncronization between the mapper and services
> emitting interfaces added signals by discarding interfaces that have
> already been discovered.  This can happen when ia service emits the
> interfaces added signal in quick sucession to the name owner changed
> signal, and the mapper discovers the new interface while handling
> the name owner changed signal.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  phosphor-mapper | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/phosphor-mapper b/phosphor-mapper
> index f5b1def..da4ae63 100644
> --- a/phosphor-mapper
> +++ b/phosphor-mapper
> @@ -70,9 +70,7 @@ class ObjectMapper(dbus.service.Object):
>                         return
>
>                 matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
> -               d = self.cache.setdefault(path, {})
> -               d.setdefault(kw['sender'], []).extend(matches)
> -               self.cache[path] = d
> +               self.add_interfaces(path, kw['sender'], matches)
>
>         def interfaces_removed_handler(self, path, interfaces, **kw):
>                 name = self.bus.get_owned_name(self.bus_match, kw['sender'])
> @@ -130,9 +128,9 @@ class ObjectMapper(dbus.service.Object):
>                         self.process_old_owner(old)
>
>         def add_interfaces(self, path, owner, interfaces):
> -               d = self.cache.setdefault(path, { })
> -               d.setdefault(owner, []).extend(interfaces)
> -               self.cache[path] = d
> +               d = self.cache.setdefault(path, {})
> +               d = d.setdefault(owner, [])
> +               self.cache[path][owner] = list(set(d + interfaces))
>
>         def add_items(self, owner, bus_items):
>                 for x,y in bus_items.iteritems():
> --
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
