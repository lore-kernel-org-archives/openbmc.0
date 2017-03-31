Return-Path: <maxims@google.com>
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvtBs0VQPzDqHG
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 07:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kLAEruwh"; 
 dkim-atps=neutral
Received: by mail-it0-x22a.google.com with SMTP id y18so18165411itc.1
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kg4rHLUy4qD/kaib6pCn2xwE05tI4Fk3VjGTxkGpLTA=;
 b=kLAEruwhptsbx2/UZv5oD9br4rMfA23SGPDTpDW8h4HzCtOyqQx0yo8kJQFVXl0nVx
 gpanyjiwwR/7gG8bfkykYUitCWxcdpLiU3kZ1uuvrAXkOVILW2rg/M6FdIgyPGQBchGq
 z1zeZ7VIJqBNlm6MepqLkvBUoqsbm4H1AdQFaLs1eZxYSajZu6AqRnNUSpQIUffA+hwY
 4a2Mra/hRcLjJIM++YtTp2PEo5ltkzyCcu8vE/8bWSthe1vQ6awxx6XaopZfHiPbbM5+
 v9XF+ESsXAxwQjbyFvx0iGWK/e5bXNzASpfVsH3VMGKIOZZI108uzioemw486X7mCdo1
 ka6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kg4rHLUy4qD/kaib6pCn2xwE05tI4Fk3VjGTxkGpLTA=;
 b=Pj25W4jL5MIGtcpC1p/DFVGK5cciXRYYEDJEcNxlgFKKP3dY8hkt+NJTa7eqOwTk2R
 CQTgpNjdJqrZRm3YRN7OD66OTh2oFi8rED0wku0EBfjhJCPl6H8avqDqUqwFSzixrvpA
 xGarIDfIwu8L0Iz9aG3K90fg10604QtMIZ6BQGDEGhJxqvYP9o+0xfhG5Ra5FnQLutF8
 D+cI3JZ441BpFpWtVj/EXIJ1VttoWik74b/pASmdlcOKku/skaUtjiTpPm2pZCiDi2ke
 NAsE9PzVyfcPcyoF+5NT8Gj8U4jCbBbx6cOrY0jVx8GI9OuFuGEHznejKP9D8LLT4ogU
 saJA==
X-Gm-Message-State: AFeK/H1oq90IPa9V9iopi2LiX8pR73c3oJ3wriEA77XDJ5u90l0SKkTCSXrYjHIUtz8uqTmIrIKs2482fe70K8B8
X-Received: by 10.36.76.11 with SMTP id a11mr6592297itb.60.1490991569525; Fri,
 31 Mar 2017 13:19:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Fri, 31 Mar 2017 13:19:29 -0700 (PDT)
In-Reply-To: <OF3061F1E4.F0B01FFC-ON002580F4.00667FD2-002580F4.00667FD7@notes.na.collabserv.com>
References: <CAFR_W8or0O0BADTKkF9=PA1GMHQx-_a2GkqLB5+F3nMKHaM4_g@mail.gmail.com>
 <OF3061F1E4.F0B01FFC-ON002580F4.00667FD2-002580F4.00667FD7@notes.na.collabserv.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 31 Mar 2017 13:19:29 -0700
Message-ID: <CAFR_W8oEdqPvwaE1Vn3ZbUx_8xAh_LR4QwbwdqAsJo9NEdMCcw@mail.gmail.com>
Subject: Re: iface is not coming back up fully after ifdown
To: Milton Miller II <miltonm@us.ibm.com>
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
X-List-Received-Date: Fri, 31 Mar 2017 20:19:33 -0000

On Fri, Mar 31, 2017 at 11:39 AM, Milton Miller II <miltonm@us.ibm.com> wrote:
> On  03/31/2017 around 12:25PM in some timezone, Maxim Sloyko wrote:
>
>>I ran into what I think is a bug with networking interface, but I'm
>>not sure what exactly is broken.
>>
>>If you bring the interface down (ifconfig eth1 down) and then try to
>>bring it up (ifconfig eth1 up) it does not fully recover. That is, it
>>shows up as RUNNING in ifconfig, you can set up ip/netmask/gw and try
>>sending packets, but nothing ever shows up at the other end of the
>>wire.
>>
>>If you unplug the ethernet cable and then plug it back in (thus
>>resetting the phy, I believe?), the interface starts working again. I
>>tried this with Zaius and  EVB (which have different PHYs) and it's
>>broken like this on both.
>>
>>I suspect that as part of IFF_UP flag handling the kernel (drivier?)
>>needs to also reconfigure the link with PHY, but it's not doing that.
>>I don't know how this works in the kernel though, so I would
>>appreciate any pointers to where I should start digging.
>>
>
> Is this with a real PHY or an NC-SI channel?

This is with a real PHY, I haven't tried this with NC-SI yet.

>
> Do you see messages showing the link coming up after ifconfig up?

Yes, after I run "ifconfig eth1 .... up" I see these messages:

IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
root@zaius:~# IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready


>
> Be aware that for NC-SI attached, the kernel always enables the
> state to running to be able to send and receive MAC frames to
> manage the connection, and there is a secondary interface or
> interface state that reflects the true link state.
>
> Sorry I don't have the experience or resources to help further.
>
> milton
>



-- 
Maxim Sloyko
