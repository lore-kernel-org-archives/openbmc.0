Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o0UbJEH2"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLwmz0MYBzDqfh
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 01:36:01 +1100 (AEDT)
Received: by mail-ua0-x22c.google.com with SMTP id s41so15468929uab.10
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=r+WVO56DNaBuWHUxTIvbuER6G/YEpV5l6IjZo7kkzY8=;
 b=o0UbJEH2g+y0Qis0mECCd0UOffIo0uhD/Z3CTwaFsfNkah67cnkvm/7AMsNxYqp/oF
 VluKzDcoP1Bcedy/DQpks/8aXcufPVTQtFOj75zgU5Lwh/Gt+G01UNAJNO8adpE+gTyT
 lC2zxW/l9z9B1yA1BPn9U9kjdPPumPdqt1zd+Ez6RuHBgH+FH1MBMRdpED0ISGg77yUV
 OWapo2FotgYG7IU09QSnh8DAhC4XQyxIKgahxNF8+d98Gpng+h33n14dy03XapBPG0ry
 JNBb6v9jo7FzdmNw95/HGyQ5T/YuItIl4ljKJ6O2Vp76wbPk2+Y54WxzXz/F9NrUJbYG
 kNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=r+WVO56DNaBuWHUxTIvbuER6G/YEpV5l6IjZo7kkzY8=;
 b=Dw8nuREjMjmOOb7BZ//bWL9eSD2xB1clQnIjZQ7hpQnYiLAF8ehrY9hhxYFaoHdtVI
 +AW+MEzp9uWwLPfhxE6RJyMVRQ0ol7hn4qy7dyVSQhwQs1AiwGdvwpxc5VUEvpjO+YzL
 48yn5ce92TVrSNw1Ra0Vvs3nH0ek5zxt5dgV67pHinf+MtL2OlBC4Y3HUy0ldqJ64M9h
 YJZXcaWIhmLvQrT3Skjz9lsCs3wDjhu4T06p3qPgl5viNmwfk+LbnfBHdeBuZCafihY1
 BymDOP0Dq+Kc9TVJEem4KCI7mBGNdNst34DN9HkvU/yTyPZdrysLLqjp/iWe2tuDYvY8
 Ox0g==
X-Gm-Message-State: AMCzsaVp3nLS47/vgDdKMMHkDTdsLld+QWwo+ZjRvKUp6ss6mtImQpeI
 fDcsWQZVr6WPnKBmb+7KtRKRCbyKdsaiXJomvLcoeg==
X-Google-Smtp-Source: ABhQp+Taebb8T+dMQNWv+O033zaNxIw03Js0anLzNEwxcbxHNVRynF1wiufAudLBbKY6kfM0RFXVJsWokM06HZzmR6A=
X-Received: by 10.176.65.41 with SMTP id j38mr228762uad.110.1508855758232;
 Tue, 24 Oct 2017 07:35:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Tue, 24 Oct 2017 07:35:37 -0700 (PDT)
In-Reply-To: <OF4AE1F920.ECC72211-ON002581C3.0037DD9F-002581C3.00386F1F@notes.na.collabserv.com>
References: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
 <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
 <OF0B4D03B3.93D53D9F-ON002581C2.00659A8A@LocalDomain>
 <OF4AE1F920.ECC72211-ON002581C3.0037DD9F-002581C3.00386F1F@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 24 Oct 2017 07:35:37 -0700
Message-ID: <CAO=notySUqPv1eO+BPQE=vKVaeK4Y7Vk9EDDn0dWq+sevaQPQQ@mail.gmail.com>
Subject: Re: phoshor-network manager daemon + IPMI
To: Ratan K Gupta <ratagupt@in.ibm.com>
Cc: Dave Cobbley <david.j.cobbley@linux.intel.com>, 
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
X-List-Received-Date: Tue, 24 Oct 2017 14:36:04 -0000

On Tue, Oct 24, 2017 at 3:16 AM, Ratan K Gupta <ratagupt@in.ibm.com> wrote:
> Hi Dave,
>
> We have enabled the link local address auto configuration,thats why you are
> noticing the link local address,
> But as a side effect of this,you should not notice this problem that the
> DHCP IP has not get assigned to the
> BMC.
>
> Please try the "ip addr show dev eth0" instead of ifconfig.
>
> Now days kernel supports ip aliasing where a single interface can have
> multiple ip adress,so on a intterface you may see link local address
> as well as DHCP assigned/Static Assigned IP address.
>
> I have tried on our setup and it is working fine.

However, have you tried updating the IP address over IPMI?  As part of
that code, it calls delete on those interfaces and IPs (all of them).
Which fails.  Should there be logic in the ipmi daemon to only delete
non-local-link addresses?  And then, if you try to delete a DHCP
assigned address, it also fails -- so how does one transition from
DHCP to static?  I'd just like to hear how these cases were tested so
I can verify the problem is on my end with my configuration, or
possibly that more work is required before this is working fine.

>
> Regards
> Ratan
>
>
> ----- Original message -----
> From: Patrick Venture <venture@google.com>
> Sent by: "openbmc" <openbmc-bounces+ratagupt=in.ibm.com@lists.ozlabs.org>
> To: Dave Cobbley <david.j.cobbley@linux.intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: phoshor-network manager daemon + IPMI
> Date: Mon, Oct 23, 2017 11:59 PM
>
> On Mon, Oct 23, 2017 at 10:18 AM, Dave Cobbley
> <david.j.cobbley@linux.intel.com> wrote:
>> I have been digging into the network manager as well.
>> The link local problem has been popping up on our systems as well.
>>
>> I'm not sure why linklocaladdress causes our systems to get the 169.XX IP
>> Address.
>> I suspect is has something to do with the way our DHCP servers are setup
>> on
>> the network, systemd-networkd is not recognizing that we do in fact get an
>> IP from DHCP.
>>
>> I'm assuming engineers at IBM are not seeing this behavior since the patch
>> was accepted (please correct me if I'm wrong).
>> Therefore this is more likely not a bug in systemd, but something strange
>> with the configuration of network infrastructure.
>> Either way, root cause needs to be identified.
>>
>> To work around it, simply delete the line linklocaladdress=xxxx from
>> /etc/systemd/networkd/00-bmc-ethx.network
>
> I ended up updating the default configuration file writer to not set
> that, then found that once it had DHCP=yes in it, it also would crash
> on attempt to delete (from the exception it raises when you try)
>
>>
>> Let me know if you make any more observations about the strange behavior
>> (it
>> would be nice to get past this issue).
>>
>> Thanks,
>> -Dave Cobbley
>>
>>
>> On 10/23/2017 07:48 AM, Patrick Venture wrote:
>>
>>> I'm curious if anyone has experience using the phosphor-network
>>> manager daemon. I've run into some oddities using it for instance, if
>>> you don't configure anything it sets up both links as LinkLocal and
>>> enables DHCP, etc -- and then even if DHCP fails, it doesn't update it
>>> (although it's aware of the failure) -- and when I then go to set the
>>> IP address over IPMI to a static IP, I run the two lan channel set
>>> commands which work (because they just set the object contents) --
>>> when i call "access on" over IPMI, it tries to delete all the dbus
>>> objects for the network, which fail because of checks in the network
>>> daemon that prevent this, which causes the network daemon to crash.
>>>
>>> Ultimately I'm going to enable the host ipmi daemon to support
>>> multiple channels -- the trick is then to map the channel to an
>>> ethernet device...  Some patches will be send up today to reviewing
>>> this type of change.
>>>
>>> I'm going through the uses cases now trying to get it working, and
>>> just curious what I should be doing to get it to work.
>>>
>>> Also of note, when I set the MAC address -- which works :), it doesn't
>>> update the configuration for the systemd network file with that
>>> information  -- I'll be sending a patch for that today -- but I was
>>> curious if that was deliberate, etc.
>>>
>>> Thanks,
>>> Patrick
>>
>>
>
>
>
>
>
