Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rrFh91Yl5zDr0S
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:43:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=r+CA4kwX; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id c2so35821849pfa.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 18:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+v1gqu6AyuxzXoWebN4yokaTdD0481xsfN9Cc5KhK8=;
 b=r+CA4kwXXyY6IM5EEycaDLNf2PE09jF0GPErLuXy13cagYTCt+jNt6mVgTyp40Zs7s
 hCd0UU9UhG8Z2b8gi46l7I6EzUQFN1OcM4PJqzaslkuEwbX/u2jbUlL4zbaaSOTkRuN3
 jv8LDU7umvT8tWsPzNSYqbYnADUeYduo8tYF1p9TgRpODWtT3aCjQlj2CPFqRcKRor7K
 NG1j72gYO1s+gP/++BGJmCbmMpWSk6yZoIxyit74Gu1oELyvpGOiWqsxkHGOXB+HDvlP
 2uW3LO0nEDghAod+R+dxXVIKcvl0YaC+quf1Ybuksusz19vK4BTk/uMNLv2cWvs8dU9J
 WQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:cc:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v+v1gqu6AyuxzXoWebN4yokaTdD0481xsfN9Cc5KhK8=;
 b=FbWIkb3Ek8JpnkuCIue0YDVZ2j75eDaTDb3c9+VCaxjgWsWxQwdMRzk6amNUyagOLI
 D7OfwUgCe8FRm61pxyx9JiVfbbts+5QT+n6bxTqTJgwKj+YZ97J93fQtTuzugsWw9MoR
 oE72+NCi77bmF1W4hEw+FqLAefG/uHY9NK0FmrcL14iE/pzhQ2OIyRVLD/ohzztJ9T++
 QAbeMsC50cnVNleE5qyoMMfMU4//lbZpZRQKLWp/Fl0P18JcHLUjz0itipoKoi8UdW6Z
 6HR8bBIjjlZqNq8Fbh61CJj3kiwBDl4lQGPza9slppRSjpORMyjJ9+T5UoF2zSPjpMS7
 8XyQ==
X-Gm-Message-State: ALyK8tLCbSWcb4WPDuE0/iPX/ma4B+Uy97cRg6/JAqHCF/p62W7FT5YGFIkoc1BoKfwgng==
X-Received: by 10.98.15.68 with SMTP id x65mr17461380pfi.66.1468546982915;
 Thu, 14 Jul 2016 18:43:02 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id zk7sm7472747pac.41.2016.07.14.18.43.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jul 2016 18:43:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1468546975.5679.32.camel@jms.id.au>
Subject: Re: openbmc qemu vs Cedric qemu is different
From: Joel Stanley <joel@jms.id.au>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Cc: Cedric Le Goater <clegoater@fr.ibm.com>
Date: Fri, 15 Jul 2016 11:12:55 +0930
In-Reply-To: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 15 Jul 2016 01:43:05 -0000

Hello Chris,

On Thu, 2016-07-14 at 13:27 -0500, Chris Austen wrote:
> Hi Joel, 
> last night you indicated that our openbmc/qemu had enough for
> networking the palmetto-bmc. I don't think that is 100% true. I
> believe Cedric's repo has some additional changes that should be
> integrated back in to openbmc/qemu. Hopefully you two can figure out
> what commits are needed to get us back to one working repo. 

I don't recall claming that. I think you're confusing me with Andrew.

I'll let Andrew clarify the situation.

Cheers,

Joel

> 
> 
> causten@causten-VirtualBox:~/gitstuff/obmcqemu/build/arm-softmmu
> $ ./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> > -drive file=~/palmetto-qemu/flash-palmetto,format=raw,if=mtd \
> > -net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100 \
> > -net bridge,id=net0,helper=/usr/lib/qemu-bridge-helper,br=virbr0
> qemu-system-arm: Unsupported NIC model: ftgmac100 
> 
> 
> causten@causten-VirtualBox:~/gitstuff/obmcqemu/build/arm-softmmu
> ./qemu-system-arm -m 256 -M palmetto-bmc -nographic -kernel
> ~/palmetto-qemu/cuImage-palmetto.bin -initrd ~/palmetto-qemu/obmc-
> phosphor-image-palmetto.cpio.gz
> ...
> ftgmac100: NCSI interface down
> 
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
> palmetto ttyS4
> 
> palmetto login: root
> Password: 
> root@palmetto:~# ifconfig
> eth0 Link encap:Ethernet HWaddr DA:74:6E:BE:E9:CD 
> UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
> RX packets:0 errors:0 dropped:0 overruns:0 frame:0
> TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
> collisions:0 txqueuelen:1000 
> RX bytes:0 (0.0 B) TX bytes:0 (0.0 B)
> 
> lo Link encap:Local Loopback 
> inet addr:127.0.0.1 Mask:255.0.0.0
> UP LOOPBACK RUNNING MTU:65536 Metric:1
> RX packets:160 errors:0 dropped:0 overruns:0 frame:0
> TX packets:160 errors:0 dropped:0 overruns:0 carrier:0
> collisions:0 txqueuelen:1 
> RX bytes:12160 (11.8 KiB) TX bytes:12160 (11.8 KiB)
> 
> 
> 
> 
> 
> 
> 
> Chris Austen
> POWER Systems Enablement Manager 
> (512) 286-5184 (T/L: 363-5184)
