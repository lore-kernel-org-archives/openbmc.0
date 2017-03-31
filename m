Return-Path: <maxims@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvpKq1XTbzDqH6
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 04:25:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fndSuroT"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id 190so15756728itm.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L2EkhwV8h9iiAPNyZj3mDvHuwKiPwQwfEp88REQcM4Y=;
 b=fndSuroT1bbqpoc4vDpXeKqlwYEgyg+B/T8DiiN9RtRJyPD28edeb+ryK1QY7MhiHj
 KmeQhnpYsXmg55PwbzSIeB5tp+MaPucgdp7sd6AWiaF7aDF2b7UKfw3QLanMrWcjRiox
 ncN2l39mE/s1xvekogxhkvQHqahJa0Dyqq+UwpuhS76G1ygnG49cbIkLXwVGq9RwNheI
 NI+EQNhx1ZqTJI0g52i6r8pE7tWBZEf7c+RZYxp3WwjOQj6FnqcqgcNFr5B41XUuVtzf
 mFOFRj0xVmIbmdESdCJzrL75cG0AWkl3uT5UOqUhj9Oxy2PokLwJ/ahiHbq/jOEwidez
 oIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L2EkhwV8h9iiAPNyZj3mDvHuwKiPwQwfEp88REQcM4Y=;
 b=X4VnQdP0JE85MNUz6D5ClIFeWyjPIicPiQbR/hHe0YkALCcRiPA+ZXpn7GxaU3xx9U
 Bq77lQmyIpDgkSwuT+z5DjdJUkotMZEm6GRp6dKfnXjZRSRxjo3adNQ/ik4mKD8FgPUC
 d6LKNxb/9R0G2T+hiEDmvdy0SoiAR7qSVue3hmoH31kgP0ZvFBgbsqoOaxIUcM+e9Ef7
 rRB8fk3Ygi3D8QkaE6r9VL+mSlDL84UfqZRqbFHh+hDjN8XvtvlD9tQlyA8NvZbzVjyh
 0M9RXnFrrwE+aq6g5C3UAnkD7iXqYY+pg2J4RdzWqpw9cLMPehiFD4gY8a/p+M3y8WLZ
 cBsA==
X-Gm-Message-State: AFeK/H0GCL0wzoRqJSPfTVLU4mMs4S4ClEyogOmUw3Itz+OOQ0Qqdppu+6uSDcCJP9dkkywNrGCxZ43A/q4njePy
X-Received: by 10.36.131.201 with SMTP id d192mr4821992ite.60.1490981115424;
 Fri, 31 Mar 2017 10:25:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Fri, 31 Mar 2017 10:25:15 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 31 Mar 2017 10:25:15 -0700
Message-ID: <CAFR_W8or0O0BADTKkF9=PA1GMHQx-_a2GkqLB5+F3nMKHaM4_g@mail.gmail.com>
Subject: iface is not coming back up fully after ifdown
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 31 Mar 2017 17:25:22 -0000

Hi all,

I ran into what I think is a bug with networking interface, but I'm
not sure what exactly is broken.

If you bring the interface down (ifconfig eth1 down) and then try to
bring it up (ifconfig eth1 up) it does not fully recover. That is, it
shows up as RUNNING in ifconfig, you can set up ip/netmask/gw and try
sending packets, but nothing ever shows up at the other end of the
wire.

If you unplug the ethernet cable and then plug it back in (thus
resetting the phy, I believe?), the interface starts working again. I
tried this with Zaius and  EVB (which have different PHYs) and it's
broken like this on both.

I suspect that as part of IFF_UP flag handling the kernel (drivier?)
needs to also reconfigure the link with PHY, but it's not doing that.
I don't know how this works in the kernel though, so I would
appreciate any pointers to where I should start digging.

Thanks!

-- 
Maxim Sloyko
