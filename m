Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22a; helo=mail-ua0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="p7j5lK+I"; 
 dkim-atps=neutral
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com
 [IPv6:2607:f8b0:400c:c08::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLPrH4GG3zDqR8
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 05:22:05 +1100 (AEDT)
Received: by mail-ua0-x22a.google.com with SMTP id l40so13600275uah.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NZRLei0zjlPG05pxSroU0N5Dw6Uc01FBiVzaZea7khM=;
 b=p7j5lK+IeOsgdbwg8b6BC4mXlVE1XpCfzQlpjL5PUBxHsHMREGJ4zvsmi6VV3i1YYA
 3Mmw4xn5GLWPcOPgRa3c1au40vqlY+4yz61A698sMRDeVKt99a8yigaIylBaM/UcTWyA
 C+ZrE84SVbaU5/r3neSAWbbiIP9jWhfOhpjexazuluStnzu4byO5XUWK4vMBEa5OjfMA
 tBuWQIScRKl8zO+LNiWJx+yvNbxiwABEwGvhkVTscXX4zJnauqSExTCAgp23qLX6xKvP
 FS6I8SacVTLSWu4fKiHnGGsom39Er9AmZB3nx2u0QFWuKVUuBZ9f83HUb4DSEBwrSpMp
 QuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NZRLei0zjlPG05pxSroU0N5Dw6Uc01FBiVzaZea7khM=;
 b=rbO9CRfrznAdRpPOzmM37ptYrZYl1epYj6BjZc/uo17IHMYwqBd7yEenmEnNkZezzM
 cDXaum6hkbRTw9Ocxpt8iOS07Xq5BAh+zcfqtqV1mCaLfFfReunS6pL6WaOQIlimT+Ne
 DN/1EcI1VMZhzsrvNFvDjpP0Xhmjlv44xnNGU+BcRFjhuLeVzyP3OfwrICGoZmsHXgwU
 8FRXshCi/exVBx1cdLHxZv3oI59Bed154Sw5RKt6R9a1M7NJ1THxD7MeWmEXLdLGRkiK
 AcSgqVe6zDFPILt8J6y5BuvG0pkLruA8UtBr34PAHEj67XZrO37wp7hz1/jXn65eWnwJ
 0FZg==
X-Gm-Message-State: AMCzsaVxp5JoOm8aFLTrwFmkQj5Of8wjHgKASoLypBidC31Tf9IX1huT
 FGx+ZqRe26mOa5XuBSg39ndS5AkE3EQEA8tKcZ9VYlZo
X-Google-Smtp-Source: ABhQp+Q/KqexW83FaHSBL5RNLUsAwV6zpmW+6WhdyRwZ4jWcN8kd4fQardvxB5iJRqI9ZQIzeSI48Ikb1elElXdAkHw=
X-Received: by 10.159.63.15 with SMTP id h15mr12092415uaj.156.1508782900088;
 Mon, 23 Oct 2017 11:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Mon, 23 Oct 2017 11:21:19 -0700 (PDT)
In-Reply-To: <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
References: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
 <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 23 Oct 2017 11:21:19 -0700
Message-ID: <CAO=notxp7Ptdx1EMFFv6uW3GfSXZF5pmr-wgN41JMBd=6ug+Ew@mail.gmail.com>
Subject: Re: phoshor-network manager daemon + IPMI
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 23 Oct 2017 18:22:11 -0000
X-List-Received-Date: Mon, 23 Oct 2017 18:22:11 -0000

On Mon, Oct 23, 2017 at 10:18 AM, Dave Cobbley
<david.j.cobbley@linux.intel.com> wrote:
> I have been digging into the network manager as well.
> The link local problem has been popping up on our systems as well.
>
> I'm not sure why linklocaladdress causes our systems to get the 169.XX IP
> Address.
> I suspect is has something to do with the way our DHCP servers are setup on
> the network, systemd-networkd is not recognizing that we do in fact get an
> IP from DHCP.
>
> I'm assuming engineers at IBM are not seeing this behavior since the patch
> was accepted (please correct me if I'm wrong).
> Therefore this is more likely not a bug in systemd, but something strange
> with the configuration of network infrastructure.
> Either way, root cause needs to be identified.
>
> To work around it, simply delete the line linklocaladdress=xxxx from
> /etc/systemd/networkd/00-bmc-ethx.network

I ended up updating the default configuration file writer to not set
that, then found that once it had DHCP=yes in it, it also would crash
on attempt to delete (from the exception it raises when you try)

>
> Let me know if you make any more observations about the strange behavior (it
> would be nice to get past this issue).
>
> Thanks,
> -Dave Cobbley
>
>
> On 10/23/2017 07:48 AM, Patrick Venture wrote:
>
>> I'm curious if anyone has experience using the phosphor-network
>> manager daemon. I've run into some oddities using it for instance, if
>> you don't configure anything it sets up both links as LinkLocal and
>> enables DHCP, etc -- and then even if DHCP fails, it doesn't update it
>> (although it's aware of the failure) -- and when I then go to set the
>> IP address over IPMI to a static IP, I run the two lan channel set
>> commands which work (because they just set the object contents) --
>> when i call "access on" over IPMI, it tries to delete all the dbus
>> objects for the network, which fail because of checks in the network
>> daemon that prevent this, which causes the network daemon to crash.
>>
>> Ultimately I'm going to enable the host ipmi daemon to support
>> multiple channels -- the trick is then to map the channel to an
>> ethernet device...  Some patches will be send up today to reviewing
>> this type of change.
>>
>> I'm going through the uses cases now trying to get it working, and
>> just curious what I should be doing to get it to work.
>>
>> Also of note, when I set the MAC address -- which works :), it doesn't
>> update the configuration for the systemd network file with that
>> information  -- I'll be sending a patch for that today -- but I was
>> curious if that was deliberate, etc.
>>
>> Thanks,
>> Patrick
>
>
