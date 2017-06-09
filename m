Return-Path: <rlippert@google.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkpm62HlgzDqLD
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 03:13:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PaNDvJib"; 
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id c10so83092122qtd.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kwcgSyjIEG782T1e4k8d+Gr0EUh3FYnTU8VHWAYUpd4=;
 b=PaNDvJibaJip9OZE5UPlyOmi11woLIADa12zjNfG26H5S9YoByvmKkSDfguMYjwLoS
 DByxcmThNW5hdlrtuZp++TCtspvA9DNFuCmB2+DKetJNzRYwUIfAlY4GszSx/HuVVOrn
 l4BhIoI6GHe9BXnJ38nzRWWi85Ghd8r8Qzz+WXgpPek4JQLufH4ontUyHubg1rjuc3nw
 TwcuTictSeWGQMfpFTZBw52prjlo4XDeV35F0HaBSUaDGXf8U0wkoEd7oFdGbReSzo2h
 qNjNO2lMtBrcKcqjwQ2q8kIR6bEDIHndFeQ8PNkSNiozUUn8+L+8ZnrEtyymVRD0IiEH
 xGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kwcgSyjIEG782T1e4k8d+Gr0EUh3FYnTU8VHWAYUpd4=;
 b=YWB21yQTr+7PMYFD1oI8cA/eMAWKY1U/ndnIwR7CGgjt4KKb199Vpj4slJbAXicdcY
 t0+NInrJmkkf9O42eDQaND91wiovktCFYYXMHwrQaxUb9IfgDLmJ8yCrQrgQfvLoJLN+
 2dXe6SIIVIIRQX/v+bcHF5tSBhEKHJjKuJcYj0gX4JXjOCgiXyZ7Kgc4UJVugw4BbE6z
 r2p5tnKQ9ZsQNfmKl3xTAlI4ZJ8BkQ3z/XlOEqxb07sCRvGgS1GTV1f9TfQL2zd4xXKV
 FPGe6yEYgCh7hwKtxRREQxAaC6rcTZiqyKl4DpsF6CxeGuTjqWtoBeyUrf1EDRVOWsI0
 e27Q==
X-Gm-Message-State: AODbwcCouWkgBLdIAR2+JK8m7keN3jtbv0to9e8+qdUXsJ/l5Oo9+/OX
 1GERoD4wFTj6zXbJGUPO74NMxnqgtsMc
X-Received: by 10.237.52.99 with SMTP id w90mr30279839qtd.19.1497028418086;
 Fri, 09 Jun 2017 10:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.56.108 with HTTP; Fri, 9 Jun 2017 10:13:17 -0700 (PDT)
In-Reply-To: <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
References: <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
 <1497022202970.71679@rackspace.com>
 <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
From: Rob Lippert <rlippert@google.com>
Date: Fri, 9 Jun 2017 10:13:17 -0700
Message-ID: <CAFRv3wzS2TtJBom-tfSnfOTdc=6rHsvQ5ZJqFbgZUT609i-g2g@mail.gmail.com>
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius
 )
To: Adriana Kobylak <anoo@us.ibm.com>
Cc: Adi Gangidi <adi.gangidi@rackspace.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Adrian Barrera <abarrera@us.ibm.com>,
 Brad DeBauche <brad.debauche@rackspace.com>, 
 Chad Somerlot <chad.somerlot@rackspace.com>,
 Kenneth Wilke <kenneth.wilke@rackspace.com>, ryan.dc.yu@foxconn.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 09 Jun 2017 17:13:43 -0000

On Fri, Jun 9, 2017 at 10:03 AM, Adriana Kobylak <anoo@us.ibm.com> wrote:
> Looping in the community for feedback.
>
>
>
> ----- Original message -----
> From: Adi Gangidi <adi.gangidi@rackspace.com>
> To: "anoo@us.ibm.com" <anoo@us.ibm.com>, Kenneth Wilke
> <kenneth.wilke@RACKSPACE.COM>, Brad DeBauche <brad.debauche@RACKSPACE.COM>,
> Chad Somerlot <chad.somerlot@RACKSPACE.COM>, "abarrera@us.ibm.com"
> <abarrera@us.ibm.com>, "ryan.dc.yu@foxconn.com" <ryan.dc.yu@foxconn.com>,
> "Rob Lippert" <rlippert@google.com>
> Cc:
> Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. (
> Zaius )
> Date: Fri, Jun 9, 2017 10:30 AM
>
> Sorry for couple of typo below, corrected them now.
>
> Please read again if it didn't make sense before.
>
> -Adi
> ________________________________________
> From: Adi Gangidi
> Sent: Friday, June 9, 2017 10:06 AM
> To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerlot;
> abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert
> Subject: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius )
>
> Hi Adriana /.  Ryan ( Foxconn )
>
> Right now on openBMC
> BMC Shared      = eth0
> BMC Dedicated = eth1
>
>
> Instead, Is there a way we can make sure the BMC dedicated comes up as eth0
> and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?
>
>
> In how it works currently . you could have BMC dedicated be eth0 or eth1
> depending upon the hardware config ( Whether or not Broadcom 5719A is popped
> OR de-popped ) . That could confusing to support operators who don't
> understand the nuances .

The eth0 and eth1 on the BMC map to the BMC hardware MAC unit #.  On
Zaius MAC1 is connected to various NC-SI stuff and MAC2 is connected
to the dedicated BMC MAC.

So the eth numbers should not move around even if there is nothing
connected on the other end of eth0.  The only way the dedicated BMC
MAC MAC2 would become eth0 should be if the devtree entry for BMC MAC1
was removed.

-Rob

>
> If you guys are busy with other things to make the change  , can I have your
> thoughts on if this can be changed ? I'm guessing this is a u-boot change .
> Any thoughts on how we could make this change ourselves ?
>
> -Adi
>
>
>
>
>
>
